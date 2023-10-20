package webridge.storedprocedure.invocation.prefetch;

import com.google.common.base.Joiner;
import com.sun.rowset.CachedRowSetImpl;
import webridge.storedprocedure.SPDefinition;
import webridge.storedprocedure.SPDefinitionForPrefetch;
import webridge.storedprocedure.invocation.PCEvaluator;
import webridge.storedprocedure.invocation.SPResultBuffer;
import webridge.storedprocedure.invocation.WrongSQLException;
import webridge.storedprocedure.utils.SPUtils;
import webridge.symbc.numeric.Expression;
import webridge.symbc.numeric.SymbolicPlaceHolder;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.*;
import java.util.stream.Collectors;
import javax.sql.DataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import webridge.storedprocedure.SPConfig;
import webridge.storedprocedure.invocation.*;
import webridge.common.utils.NamedStopWatch;

public class AsyncPrefetcher {
  protected static final Log logger = LogFactory.getLog(AsyncPrefetcher.class);
  private static DataSource dataSource;
  private static Connection conn;
  private static boolean enabled;

  private static final ExecutorService asyncService = Executors.newFixedThreadPool(1);
  private static final ThreadLocal<Map<String, BlockingQueue<PreparedStatement>>>
      PREFETCH_SP_CONTEXT = ThreadLocal.withInitial(ConcurrentHashMap::new);

  public static void setDataSource(DataSource dataSource) {
    AsyncPrefetcher.dataSource = dataSource;
    try {
      if (conn == null) {
        conn = Objects.requireNonNull(getDataSource().getConnection());
      }
    } catch (SQLException e) {
      //      NamedStopWatch.end("async-create-statement");
      throw new RuntimeException(e);
    }
  }

  public static DataSource getDataSource() {
    return dataSource;
  }

  public static void init(
          Map<String, SPDefinition> sps, SPResultBuffer buffer, String firstSpName) {
    Map<String, BlockingQueue<PreparedStatement>> prefetchSpContext = getPrefetchSpContext();
    sps.forEach(
        (spName, spDefinition) -> prefetchSpContext.put(spName, new LinkedBlockingQueue<>()));
    PrefetchProgressMonitor.getPrefetchProgressMonitor().init(sps, buffer, firstSpName);
  }

  public static void clear() {
    PREFETCH_SP_CONTEXT.get().clear();
  }

  public static void enable() {
    enabled = true;
  }

  public static boolean enabled() {
    return enabled;
  }

  public static Map<String, BlockingQueue<PreparedStatement>> getPrefetchSpContext() {
    return PREFETCH_SP_CONTEXT.get();
  }

  public static void invokeSPAsync(
      SPDefinition spDefinition,
      SPResultBuffer spBuffer,
      Map<String, BlockingQueue<PreparedStatement>> prefetchSpContext) {
    if (logger.isDebugEnabled()) {
      logger.debug(
          String.format(
              "Submitting prefetch job for sp %s, prefetchCtxSize:%d",
              spDefinition.getSpName(), prefetchSpContext.size()));
    }
    NamedStopWatch.begin("async-invokeSPAsync");
    asyncService.execute(
        () -> {
          try {
            //            NamedStopWatch.begin("async-invokeSPAsync0");
            invokeSPAsync0(spDefinition, spBuffer, prefetchSpContext);
          } finally {
            //            NamedStopWatch.end("async-invokeSPAsync0");
          }
        });
    NamedStopWatch.end("async-invokeSPAsync");
  }

  /**
   * Invoke the SQL query defined in SP asynchronously. The result is stored in the ctxQueue as a
   * prepared statement. The prepared statement serves like a cursor that points to the data fetched
   * from database. Use the ctxQueue to get the prepared statement and fetch data from it.
   *
   * @param spDefinition the SP definition
   * @param spBuffer the SP result buffer
   * @param ctxQueue the context queue
   */
  public static void invokePureSQLAsync0(
      SPDefinitionForPrefetch spDefinition,
      SPResultBuffer spBuffer,
      Map<String, BlockingQueue<PreparedStatement>> ctxQueue) {
    if (logger.isDebugEnabled())
      logger.debug(
          String.format(
              "[Async] Prefetcher received request from API %s.%s",
              spDefinition.getApiName(), spDefinition.getSpName()));

    // get SQL statement from spDef
    final String templateStr;
    try {
      templateStr = spDefinition.getSqlTemplateAt(0);
      Objects.requireNonNull(templateStr, "Should contains at least one SQL");
    } catch (WrongSQLException e) {
      throw new RuntimeException(e);
    }
    // evaluate parameters from spDef
    final List<Expression> queryParameterExpressions = spDefinition.getQueryParameterExpressions();
    //    NamedStopWatch.begin("async-eval-parameters");
    final PCEvaluator pcEvaluator = new PCEvaluator(spBuffer);
    final List<Object> args =
        queryParameterExpressions.stream()
            .map(pcEvaluator::getExpressionValue)
            .collect(Collectors.toList());
    //    NamedStopWatch.end("async-eval-parameters");

    NamedStopWatch.begin("async-create-statement");

    final PreparedStatement ps;
    try {
      ps = conn.prepareStatement(templateStr);
      SPUtils.unlinkResourceManager(ps, conn);
    } catch (SQLException e) {
      //      NamedStopWatch.end("async-create-statement");
      throw new RuntimeException(e);
    }
    NamedStopWatch.end("async-create-statement");

    for (int i = 0; i < args.size(); i++) {
      try {
        ps.setObject(i + 1, args.get(i));
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }
    }

    // SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss:SSSS z");
    // Date date = new Date(System.currentTimeMillis());

    // logger.error(String.format("AsyncPrefetcher send %s to MySQL", spDefinition.getSpName()));

    // use ps.executeUpdate() if the templateStr starts with the literal "update"
    boolean hasResult = SPInvocationUtils.executeQueryOrUpdateBasedOnSQL(templateStr, ps);

    // date = new Date(System.currentTimeMillis());
    // logger.error(
    //     String.format("%s AsyncPrefetcher get result of %s from MySQL",
    // spDefinition.getSpName()));

    if (logger.isDebugEnabled())
      logger.debug("Sp " + spDefinition.getSpName() + " got " + hasResult + " result");

    if (logger.isInfoEnabled())
      logger.info(
          String.format(
              "[Async] API %s prefetch sql %s in sp %s, args %s",
              spDefinition.getApiName(),
              templateStr,
              spDefinition.getSpName(),
              Joiner.on(",").useForNull("null").join(args)));

    boolean offerRes = ctxQueue.get(spDefinition.getSpName()).offer(ps);

    // date = new Date(System.currentTimeMillis());

    // logger.error(
    //     String.format(
    //         "%s AsyncPrefetcher already put %s into ctxQueue",
    //         formatter.format(date), spDefinition.getSpName()));

    if (!offerRes) throw new RuntimeException("Should not fail here");

    // try {

    //   ps.closeOnCompletion();
    // } catch (SQLException e) {
    //   System.out.println("Caught exception caused by spName: " + spDefinition.getSpName());
    //   throw new RuntimeException(e);
    // } finally {
    //   if (logger.isDebugEnabled())
    //     logger.debug(
    //         String.format(
    //             "[Async] Prefetcher finished request from API %s.%s",
    //             spDefinition.getApiName(), spDefinition.getSpName()));
    // }

    // try {
    //   conn.close();
    // } catch (SQLException e) {
    //   throw new RuntimeException(e);
    // }
  }

  public static void invokeSPAsync0(
      SPDefinition spDefinition,
      SPResultBuffer spBuffer,
      Map<String, BlockingQueue<PreparedStatement>> ctxQueue) {
    if (SPConfig.PREFETCH_PURE_SQL_MODE) {
      invokePureSQLAsync0((SPDefinitionForPrefetch) spDefinition, spBuffer, ctxQueue);
      return;
    }

    Connection conn = null;
    boolean autoCommit = false;
    try {
      conn = Objects.requireNonNull(getDataSource().getConnection());
      final PreparedStatement ps = conn.prepareStatement(spDefinition.getCallSpStatement());
      SPUtils.unlinkResourceManager(ps, conn);
      final List<Object> args =
          spDefinition.getParameterVars().stream()
              .map(
                  var -> {
                    if (var.contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX)) {
                      assert var.contains("currentTimeMs"); // TODO: use intercepted value instead
                      return System.currentTimeMillis();
                    } else {
                      return spBuffer.getParam(var);
                    }
                  })
              .collect(Collectors.toList());
      for (int i = 0; i < args.size(); i++) {
        ps.setObject(i + 1, args.get(i));
      }

      logger.info(
          String.format(
              "[Async] API %s call sp: call %s(%s)%n",
              spDefinition.getApiName(),
              spDefinition.getSpName(),
              Joiner.on(",").useForNull("null").join(args)));

      autoCommit = conn.getAutoCommit();

      // SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss:SSSS z");
      // Date date = new Date(System.currentTimeMillis());

      // logger.error(
      //     String.format(
      //         "%s AsyncPrefetcher send %s to MySQL",
      //         formatter.format(date), spDefinition.getSpName()));

      boolean execRes = ps.execute();
      // timer

      // date = new Date(System.currentTimeMillis());

      // logger.error(
      //     String.format(
      //         "%s AsyncPrefetcher get result of %s from MySQL",
      //         formatter.format(date), spDefinition.getSpName()));

      logger.info(
          String.format(
              "[Async] API %s call sp %s res: %b",
              spDefinition.getApiName(), spDefinition.getSpName(), execRes));
      assert execRes;
      //      final SPInvocationContext ctx =
      //          new SPInvocationContext(cachedResultSetsFromPs(ps), spDefinition);
      if (logger.isTraceEnabled()) {
        logger.trace(
            String.format(
                "[Async] API %s enqueuing sp %s, current ctxQueue.size()=%s",
                spDefinition.getApiName(),
                spDefinition.getSpName(),
                Joiner.on(",")
                    .join(
                        ctxQueue.entrySet().stream()
                            .map(e -> e.getKey() + "|" + e.getValue().size())
                            .collect(Collectors.toList()))));
      }
      // timer
      boolean offerRes = ctxQueue.get(spDefinition.getSpName()).offer(ps);
      // // timer

      // date = new Date(System.currentTimeMillis());

      // logger.error(
      //     String.format(
      //         "%s AsyncPrefetcher already put result of %s to ctxQueue",
      //         formatter.format(date), spDefinition.getSpName()));

      if (logger.isTraceEnabled()) {
        logger.trace(
            String.format(
                "[Async] API %s enqueued sp %s, current ctxQueue.size()=%s",
                spDefinition.getApiName(),
                spDefinition.getSpName(),
                Joiner.on(",")
                    .join(
                        ctxQueue.entrySet().stream()
                            .map(e -> e.getKey() + "|" + e.getValue().size())
                            .collect(Collectors.toList()))));
      }
      if (!offerRes) throw new RuntimeException();
      ps.closeOnCompletion();
      conn.close();
    } catch (Exception e) {
      logger.error("Error executing stored procedure:" + spDefinition.getSpName(), e);
      if (spDefinition.containsSavepoint()) {
        try {
          // if auto commit is true, we cannot perform rollback
          // however if a sp contains savepoint, it must contains
          // txns that wrap the write ops. In hibernate, this means
          // the autoCommit = false in the underling database set by sp,
          // in which JVM is not aware of
          if (autoCommit) SPUtils.setProxyConnAutoCommit(conn, false);
        } catch (IllegalAccessException illegalAccessException) {
          throw new RuntimeException(illegalAccessException);
        }
        logger.error("Rollback read-write ongoing transactions in " + spDefinition.getSpName());
        final String savepointName = spDefinition.getSavePointAt(0);
        try {
          SPInvokeManager.doExecutePartialRollback(Objects.requireNonNull(conn), savepointName);
          conn.setAutoCommit(autoCommit);
        } catch (SQLException ex) {
          throw new RuntimeException(ex);
        }
      }
    }
  }

  @Deprecated
  private static List<ResultSet> cachedResultSetsFromPs(PreparedStatement ps) throws Exception {
    final List<ResultSet> result = new ArrayList<>();

    ResultSet resultSet = ps.getResultSet();
    result.add(cacheResultSet(resultSet));
    while (ps.getMoreResults()) {
      result.add(cacheResultSet(ps.getResultSet()));
    }

    return result;
  }

  @Deprecated
  public static ResultSet cacheResultSet(ResultSet resultSet) throws Exception {
    CachedRowSetImpl cachedRowSet = new FixedCachedRowSetImpl();
    cachedRowSet.populate(resultSet);
    return cachedRowSet;
  }
}
