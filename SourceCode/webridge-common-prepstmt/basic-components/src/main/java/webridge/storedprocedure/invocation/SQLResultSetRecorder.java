package webridge.storedprocedure.invocation;

import webridge.sql.result.MultipleRowResultSetImpl;
import webridge.storedprocedure.utils.SPUtils;
import java.lang.reflect.Field;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SQLResultSetRecorder {
  protected static final Log logger = LogFactory.getLog(SQLResultSetRecorder.class);

  // [template, param, rs (for get) / rowCount (for update) / null (for setAutoCommit or commit)]
  private final List<Pair<String, Object>> recordedSqlAndResultSets = new ArrayList<>();
  private boolean needCompile =
      false; // if all sql result is returned by sp, then we don't need to compile this trace

  public long selectRecordTime = 0L;
  public long updateRecordTime = 0L;
  public long txnRecordTime = 0L;

  public boolean isNeedCompile() {
    return needCompile;
  }

  public void setNeedCompile(boolean needCompile) {
    this.needCompile = needCompile;
  }

  List<Pair<String, Object>> getRecordedSqlAndResultSets() {
    return recordedSqlAndResultSets;
  }

  public void storeSQLAndRsForJPF(PreparedStatement ps, ResultSet resultSet) {
    long beginTime = System.nanoTime();
    try {
      // 1. Extract SQL from prepared statement
      final SPUtils.PrepareStmtMeta psMeta = SPUtils.parseIncomingPreparedStmt(ps);
      final String template = psMeta.sqlTemplate;
      final String sql =
          String.format(
              template.replace("?", "%s"),
              Arrays.stream(psMeta.parameters).map(String::new).toArray());

      // 2. Transform MySQL ResultSet into the form that JPF needs
      final MultipleRowResultSetImpl transformedRs = new MultipleRowResultSetImpl();
      final ResultSetMetaData metaData = resultSet.getMetaData();
      final int columnCount = metaData.getColumnCount();

      final List<String> columnNameList = new ArrayList<>();
      final List<String> columnNameAliasList = new ArrayList<>();
      final List<List<Object>> twoDimentionValue = new ArrayList<>();
      Field field = metaData.getClass().getDeclaredField("fields");
      field.setAccessible(true);
      com.mysql.jdbc.Field[] fields = (com.mysql.jdbc.Field[]) field.get(metaData);
      for (int i = 0; i < columnCount; i++) {
        columnNameList.add(
            fields[i].getTableName() + "." + fields[i].getNameNoAliases().toLowerCase());
        columnNameAliasList.add(fields[i].getName());
      }
      transformedRs.setColumnNameList(columnNameList);
      transformedRs.setColumnNameAliasList(columnNameAliasList);

      while (resultSet.next()) {
        final List<Object> rowValue = new ArrayList<>();
        for (int i = 1; i <= columnCount; i++) {
          rowValue.add(resultSet.getObject(i));
        }
        twoDimentionValue.add(rowValue);
      }
      transformedRs.setColumnValueList(twoDimentionValue);

      // 3. Store collected information
      // FIXME: Record using SQL with parameters instead of template
      //  NORMAL_API_STATE.get().getRecordedSqlAndResultSets().add(Pair.of(sql, transformedRs));
      if (logger.isDebugEnabled())
        logger.debug("Recorder[" + hashCode() + "] recording query with:" + sql);
      this.recordedSqlAndResultSets.add(Pair.of(template, transformedRs));

      // 4. Rewind rs cursor as if nothing has happened
      resultSet.beforeFirst();
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
    selectRecordTime += System.nanoTime() - beginTime;
  }

  public void storeUpdateSQLToJPF(PreparedStatement ps, int rowCount) {
    long beginTime = System.nanoTime();
    try {
      // 1. Extract SQL from prepared statement
      final SPUtils.PrepareStmtMeta psMeta = SPUtils.parseIncomingPreparedStmt(ps);
      final String template = psMeta.sqlTemplate;
      final String sql =
          String.format(
              template.replace("?", "%s"),
              Arrays.stream(psMeta.parameters).map(String::new).toArray());

      // 2. Store collected information
      // FIXME: Record using SQL with parametes instead of template
      //  NORMAL_API_STATE.get().getRecordedSqlAndResultSets().add(Pair.of(sql, rowCount));
      this.recordedSqlAndResultSets.add(Pair.of(template, rowCount));
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
    updateRecordTime += System.nanoTime() - beginTime;
  }

  public void storeTxnSQLToJPF(String sql) {
    long beginTime = System.nanoTime();
    this.recordedSqlAndResultSets.add(Pair.of(sql, null));
    txnRecordTime += System.nanoTime() - beginTime;
  }
}
