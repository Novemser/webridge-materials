package webridge.wbridge.storedprocedure.invocation;

import com.mysql.fabric.jdbc.ErrorReportingExceptionInterceptor;
import com.mysql.jdbc.*;
import webridge.wbridge.storedprocedure.SPConfig;
import webridge.wbridge.storedprocedure.SPDefinition;
import webridge.wbridge.storedprocedure.invocation.prefetch.AsyncPrefetcher;
import webridge.wbridge.storedprocedure.invocation.prefetch.PrefetchProgressMonitor;
import webridge.wbridge.storedprocedure.utils.SPUtils;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import webridge.common.utils.NamedStopWatch;

/**
 * Context of a single stored procedure invocation, it mainly contains following functions: <br>
 * 1. temporarily buffer all returned result sets, and <br>
 * 2. stored query parameters used for validation. <br>
 */
public class SPInvocationContext {

  private static final Map<String, ResultSetMetaData> RESULT_SET_METADATA_CACHE =
      new ConcurrentHashMap<>();
  protected static final Log logger = LogFactory.getLog(SPInvocationContext.class);

  private final PreparedStatement spStmt; // the sp invocation statement
  private final SPDefinition spDef;
  private final Map<Integer, ResultSet> spResultSets;
  private final List<Integer> spQueryIds;
  private final int updateCount;
  // query parameters, used for validation. queryId -> <colType, colVal>
  private final Map<Integer, List<Pair<Integer, Object>>> spQueryParams;
  private int queryIdIdx = 0; // the idx of curSpQueryIds
  private static Method getInstanceMth;
  private static Field rsMetaFld;
  private static Field delegateFld;

  static {
    try {
      getInstanceMth =
          ResultSetImpl.class.getDeclaredMethod(
              "getInstance",
              String.class,
              com.mysql.jdbc.Field[].class,
              RowData.class,
              MySQLConnection.class,
              StatementImpl.class,
              boolean.class);
      getInstanceMth.setAccessible(true);

      rsMetaFld = com.mysql.jdbc.ResultSetMetaData.class.getDeclaredField("fields");
      rsMetaFld.setAccessible(true);

      delegateFld =
          Class.forName("com.zaxxer.hikari.pool.ProxyConnection").getDeclaredField("delegate");
      delegateFld.setAccessible(true);
    } catch (NoSuchMethodException | NoSuchFieldException | ClassNotFoundException e) {
      logger.warn(e);
    }
  }

  public int getUpdateCount() {
    return updateCount;
  }

  public SPInvocationContext(PreparedStatement spStmt, SPDefinition spDef) {
    this.spStmt = spStmt;
    this.spDef = spDef;
    this.spResultSets = new HashMap<>();
    this.spQueryIds = new ArrayList<>();
    this.spQueryParams = new HashMap<>();
    try {
      this.updateCount = Objects.requireNonNull(this.spStmt).getUpdateCount();
      this.bufferResultSetOfSp(spDef, spStmt);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public SPInvocationContext(List<ResultSet> resultSets, SPDefinition spDef) {
    this.spStmt = null;
    this.spDef = spDef;
    this.spResultSets = new HashMap<>();
    this.spQueryIds = new ArrayList<>();
    this.spQueryParams = new HashMap<>();
    this.updateCount = 0;
    try {
      this.bufferResultSetOfSp(spDef, resultSets);
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public int getCurrentQueryId() {
    return spQueryIds.get(queryIdIdx);
  }

  public SPDefinition getSpDefinition() {
    return spDef;
  }

  public String getCurrentSavepointName() {
    return spDef.getSavePointAt(getCurrentQueryId());
  }

  public boolean isEmpty() {
    boolean isEmpty = (queryIdIdx == -1);
    assert !isEmpty || (spResultSets.isEmpty() && spQueryParams.isEmpty() && spQueryIds.isEmpty());
    return isEmpty;
  }

  // stored procedure might produce ResultSets with special format(e.g.
  // cursor related query ResultSet are flatten). Transform it to normal
  // ResultSet that the upper application can use.
  @SuppressWarnings("all")
  public ResultSet getSelectSQLResultSet(PreparedStatement invokedPs)
      throws SQLException, WrongSQLException {
    validateSQL(invokedPs);
    int queryId = getCurrentQueryId();

    ResultSet rsFromSp = spResultSets.get(queryId);
    // CAUTION: invoking rs.next() will move the cursor to the next row!
    if (AsyncPrefetcher.enabled() || !rsFromSp.next()) return rsFromSp;

    final String columnName = rsFromSp.getMetaData().getColumnName(1);
    if (!columnName.startsWith(
        SPConfig.CURSOR_RS_INDICATOR_PREFIX)) { // No need to transform normal ResultSets
      rsFromSp.beforeFirst();
      return rsFromSp;
    }

    // here, we construct a ResultSet object from incoming prepared statement's metadata
    // the underling data is retrieved from a 'flattened' ResultSet from stored procedure
    ResultSet transformRs;
    try {
      NamedStopWatch.begin("transform-parse-ps");
      final ResultSetMetaData metaData =
          resolveMetadata(invokedPs, SPUtils.parseIncomingPreparedStmt(invokedPs));
      NamedStopWatch.end("transform-parse-ps");

      int columnsPerRow = metaData.getColumnCount();
      final int totalDataColumnsRetrieved = rsFromSp.getMetaData().getColumnCount();

      int accumulatedRowCount = 0;
      int accumulatedColumnCount = 0;
      final List<ResultSetRow> rswList = new ArrayList<>();
      final RowData rowData = new RowDataStatic(rswList);
      final int rsRowCount = rsFromSp.getInt(1);

      ResultSetRow oneRow = null;
      // the position where the real underling data begins
      // skip the first column since it is an indicator of
      // how many rows the 'flattened' ResultSet contains
      final int startOffset = 2;
      NamedStopWatch.begin("transform-loop-set-colval");
      for (int i = startOffset; i <= totalDataColumnsRetrieved; i++) {
        if (accumulatedColumnCount++ % columnsPerRow == 0) {
          accumulatedRowCount++;
          if (accumulatedRowCount > rsRowCount) {
            break;
          }

          oneRow = // new Row
              new ByteArrayRow(new byte[columnsPerRow][], new ErrorReportingExceptionInterceptor());
          rswList.add(oneRow);
        }
        final String val = rsFromSp.getString(i);
        Objects.requireNonNull(oneRow, "Unexpected NPE!")
            .setColumnValue((i - startOffset) % columnsPerRow, val == null ? null : val.getBytes());
      }
      NamedStopWatch.end("transform-loop-set-colval");

      if (accumulatedRowCount < rsRowCount) {
        // The actual path has `rsRowCount` rows, while the optimized path has only
        // `accumulatedRowCount` rows
        // This means a new path needs to be optimized for handling more rows
        throw new WrongSQLException("Too few rows in the ResultSet");
      }

      Connection conn = invokedPs.getConnection();
      if (conn.getClass()
          .getCanonicalName()
          .equals("com.zaxxer.hikari.pool.HikariProxyConnection")) {
        conn = (Connection) delegateFld.get(conn);
      }
      NamedStopWatch.begin("transform-getInstance");
      transformRs =
          (ResultSet)
              getInstanceMth.invoke(
                  null,
                  metaData.getCatalogName(1),
                  rsMetaFld.get(metaData),
                  rowData,
                  conn,
                  null,
                  false);
      NamedStopWatch.end("transform-getInstance");
    } catch (WrongSQLException e) {
      throw e;
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
    return transformRs;
  }

  public int getUpdateSQLRet(PreparedStatement invokedPs) throws SQLException, WrongSQLException {
    validateSQL(invokedPs);
    // TODO assert invokedPs is an update
    int queryId = getCurrentQueryId();
    ResultSet rsFromSp = spResultSets.get(queryId);
    rsFromSp.next();
    int res = rsFromSp.getInt(1);
    rsFromSp.close();
    return res; // update_count
  }

  public void doSetAutoCommit(boolean autoCommit) throws WrongSQLException {
    validateSQL(autoCommit ? "set autocommit=1" : "set autocommit=0");
  }

  public void clear() throws SQLException {
    // To close a invoked prepared statement, calling closeOnComletion here is not possible,
    // since the ResultSet returned by the prepared statement has owningStatement == null and
    // will not trigger automatic closing of the statement(see. ResultSetImpl.java:6671)
    //    if (spStmt != null) {
    //      spStmt.closeOnCompletion();
    //    }
    queryIdIdx = -1;
    spResultSets.clear();
    spQueryIds.clear();
    spQueryParams.clear();
  }

  public void bufferResultSetOfSp(SPDefinition spDef, List<ResultSet> tempResultSets)
      throws SQLException {
    int currentTempRsIdx = 0;
    if (AsyncPrefetcher.enabled()) {
      bufferResultSetsFromTmpResultSets(spDef, tempResultSets);
      return;
    }

    // initialize query parameters
    final ResultSet parametersRs = tempResultSets.get(tempResultSets.size() - 1);
    if (parametersRs.next()) {
      tempResultSets.remove(parametersRs);

      // parse the parameters for each query
      final ResultSetMetaData metaData = parametersRs.getMetaData();
      final int columnCount = metaData.getColumnCount();
      Integer queryId = null;
      boolean ignoreColumn = false;

      for (int colId = 1; colId <= columnCount; colId++) {
        final String colName = metaData.getColumnName(colId);
        final int colType = metaData.getColumnType(colId);
        final Object colVal = parametersRs.getObject(colId);

        if (colName.startsWith(SPConfig.QUERY_ID_TEMPLATE)) {
          if (colVal == null) {
            // this query has not been executed
            ignoreColumn = true;
            continue;
          } else {
            ignoreColumn = false;
          }
          final String[] decomposition = colName.split("_");
          assert decomposition.length == 3 || decomposition.length == 4
              : "Incorrect query identifier:" + colName;
          assert decomposition.length != 4 || decomposition[3].equals("TXN");

          queryId = Integer.parseInt(decomposition[2]);
          spQueryIds.add(queryId);
          if (decomposition.length == 3) {
            // Not TXN related SQL
            try {
              spResultSets.put(queryId, tempResultSets.get(currentTempRsIdx));
            } catch (Exception e) {
              throw new RuntimeException(e);
            }
            currentTempRsIdx++;
          }
        } else {
          if (ignoreColumn) {
            continue;
          }
          assert queryId != null;
          spQueryParams.compute(
              queryId,
              (integer, pairs) -> {
                if (pairs == null) pairs = new ArrayList<>();
                pairs.add(Pair.of(colType, colVal));
                return pairs;
              });
        }
      }

      Collections.sort(spQueryIds);

      if (spQueryIds.size() == 0) {
        throw new RuntimeException(
            "No result set retrieved from " + spDef.getApiName() + " - " + spDef.getSpName());
      }
    }
  }

  private void bufferResultSetsFromTmpResultSets(
      SPDefinition spDef, List<ResultSet> tempResultSets) {
    if (logger.isInfoEnabled()) {
      logger.info(
          String.format(
              "Configuring %d result sets for sp %s", tempResultSets.size(), spDef.getSpName()));
    }

    spQueryIds.add(0);
    // prefetch mode, only one SQL is executed/sp
    // if transaction commit/write sql, no result set is returned
    if (tempResultSets.isEmpty()) return;
    // otherwise only a single result set is returned
    if (tempResultSets.size() != 1) {
      throw new RuntimeException("Unexpected number of result sets returned");
    }
    spResultSets.put(0, tempResultSets.get(0));
  }

  public void bufferResultSetOfSp(SPDefinition spDef, PreparedStatement spStmt)
      throws SQLException {
    // a successful call to sp must return at least one ResultSet (parameters)
    List<ResultSet> tempResultSets = new ArrayList<>();
    tempResultSets.add(spStmt.getResultSet());
    while (spStmt.getMoreResults(Statement.KEEP_CURRENT_RESULT))
      tempResultSets.add(spStmt.getResultSet());
    bufferResultSetOfSp(spDef, tempResultSets);
  }

  /**
   * Increment query id, if not the last, return true, else return false
   *
   * @return
   */
  public int advanceQueryId() {
    assert queryIdIdx < spQueryIds.size();
    int res = spQueryIds.get(queryIdIdx);
    queryIdIdx++;
    return res;
  }

  public void checkFinished() throws SQLException {
    if (queryIdIdx == spQueryIds.size()) {
      clear();
      //      NamedStopWatch.end(spDef.getSpName() + "-lifecycle");
      NamedStopWatch.begin("async-callback-spfinish");
      PrefetchProgressMonitor.getPrefetchProgressMonitor()
          .onSpFinished(spDef, AsyncPrefetcher.getPrefetchSpContext());
      NamedStopWatch.end("async-callback-spfinish");
    }
  }

  private ResultSetMetaData resolveMetadata(
      PreparedStatement invokingPs, SPUtils.PrepareStmtMeta prepareStmtMeta) {
    return RESULT_SET_METADATA_CACHE.compute(
        prepareStmtMeta.sqlTemplate,
        (sql, val) -> {
          if (val != null) return val;
          try {
            return invokingPs.getMetaData();
          } catch (SQLException e) {
            throw new RuntimeException(e);
          }
        });
  }

  private void validateSQL(PreparedStatement invokedPs) throws WrongSQLException {
    NamedStopWatch.begin("validate-sql");
    final String sqlTemplateInSp = spDef.getSqlTemplateAt(getCurrentQueryId());
    List<Pair<Integer, Object>> executedParams = spQueryParams.get(getCurrentQueryId());
    try {
      if (executedParams == null) {
        executedParams = new ArrayList<>();
      }
      SPSQLValidator.ValidateResult result =
          SPSQLValidator.getInstance()
              .validateSQLTemplateAndParam(invokedPs, sqlTemplateInSp, executedParams);
      if (result.flag != SPSQLValidator.ValidateFlag.OK) {
        final String msg =
            "Type: "
                + result.flag.toString()
                + "\nExpected template: "
                + result.incomingSqlTemplate
                + "\nExecuted template: "
                + result.executedSqlTemplate;
        throw new WrongSQLException(msg);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally {
      NamedStopWatch.end("validate-sql");
    }
  }

  private void validateSQL(String txnControlSQLStmt) throws WrongSQLException {
    final String sqlTemplateInSp = spDef.getSqlTemplateAt(getCurrentQueryId());
    SPSQLValidator.ValidateResult result =
        SPSQLValidator.getInstance().validateTxnControlSQL(txnControlSQLStmt, sqlTemplateInSp);
    if (result.flag != SPSQLValidator.ValidateFlag.OK) {
      final String msg =
          "Type: "
              + result.flag.toString()
              + "\nExpected template: "
              + result.incomingSqlTemplate
              + "\nExecuted template: "
              + result.executedSqlTemplate;
      throw new WrongSQLException(msg);
    }
  }

  public void close() throws SQLException {
    if (spStmt != null && !spStmt.isClosed()) spStmt.close();
  }
}
