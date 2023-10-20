package webridge.wbridge.storedprocedure.invocation;

import static webridge.wbridge.storedprocedure.invocation.prefetch.PrefetchUtils.initializePrefetch;

import com.google.common.base.Joiner;
import webridge.wbridge.sql.ResultSetHolder;
import webridge.wbridge.storedprocedure.SPConfig;
import webridge.wbridge.storedprocedure.SPDefinition;
import webridge.wbridge.storedprocedure.invocation.prefetch.AsyncPrefetcher;
import webridge.wbridge.storedprocedure.utils.SPUtils;
import webridge.wbridge.symbc.numeric.SymbolicPlaceHolder;
import webridge.wbridge.util.reflect.ReflectionUtils;
import java.lang.reflect.Field;
import java.sql.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Collectors;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.commons.lang3.tuple.Triple;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import webridge.common.utils.NamedStopWatch;

public class SPInvokeManager {
  public static boolean enableQueryTimer = false;
  protected static final Log logger = LogFactory.getLog(SPInvokeManager.class);

  private static final ThreadLocal<SPResultBuffer> SP_BUFFER =
      ThreadLocal.withInitial(SPResultBuffer::new);
  private static final ThreadLocal<SpApiState> SP_API_STATE = new ThreadLocal<>();
  private static final ThreadLocal<SQLResultSetRecorder> SQL_RESULT_SET_RECORDER =
      new ThreadLocal<>();
  private static final ThreadLocal<SPInvocationContext> SINGLE_SP_INVOCATION_CTX =
      new ThreadLocal<>();
  private static final ThreadLocal<Boolean> USING_RECORDED_RESULT_SET =
      ThreadLocal.withInitial(() -> false);

  public static void setUsingRecordedRs(boolean value) {
    USING_RECORDED_RESULT_SET.set(value);
  }

  public static boolean isUsingRecordedRs() {
    return USING_RECORDED_RESULT_SET.get();
  }

  private static ResultSet disableSpAndQueryNormal(PreparedStatement invokedPs, String msg)
      throws SQLException {
    SPInvokeManager.setInvokingSp(false);
    ResultSet resultSet = invokedPs.executeQuery();
    logger.error(msg + SP_API_STATE.get().getApiName() + ", " + invokedPs);
    return resultSet;
  }

  private static int disableSpAndUpdateNormal(PreparedStatement invokedPs, String msg)
      throws SQLException {
    SPInvokeManager.setInvokingSp(false);
    logger.error(msg + SP_API_STATE.get().getApiName() + ", " + invokedPs);
    return invokedPs.executeUpdate();
  }

  private static void disableSpAndSetAutocommit(Connection conn, boolean autoCommit, String msg)
      throws SQLException {
    SPInvokeManager.setInvokingSp(false);
    logger.error(msg + SP_API_STATE.get().getApiName() + ", set autoCommit=" + autoCommit);
    conn.setAutoCommit(autoCommit);
  }

  private static ResultSet nextResultSetFromSpCtx(
      SPInvocationContext ctx, PreparedStatement invokedPs) throws SQLException, WrongSQLException {
    NamedStopWatch.begin("invokeMngr-query-transform");
    final ResultSet resultSet = ctx.getSelectSQLResultSet(invokedPs);
    NamedStopWatch.end("invokeMngr-query-transform");
    // NamedStopWatch.begin("invokeMngr-query-storebuffer");
    SP_BUFFER
        .get()
        .storeSelectRsToBuffer(ctx.getCurrentQueryId(), resultSet, ctx.getSpDefinition());
    ctx.advanceQueryId();
    ctx.checkFinished();
    // NamedStopWatch.end("invokeMngr-query-storebuffer");
    return resultSet;
  }

  private static int nextUpdateResFromSpCtx(SPInvocationContext ctx, PreparedStatement invokedPs)
      throws SQLException, WrongSQLException {
    final int res;
    if (AsyncPrefetcher.enabled()) {
      res = ctx.getUpdateCount();
    } else {
      res = ctx.getUpdateSQLRet(invokedPs);
    }

    SP_BUFFER.get().storeUpdateRsToBuffer(ctx.getCurrentQueryId(), res, ctx.getSpDefinition());
    ctx.advanceQueryId();
    ctx.checkFinished();
    return res;
  }

  private static void nextAutoCommitFromSpCtx(
      SPInvocationContext ctx, Connection conn, boolean autoCommit)
      throws SQLException, WrongSQLException, IllegalAccessException {
    ctx.doSetAutoCommit(autoCommit);
    ctx.advanceQueryId();
    ctx.checkFinished();
    SPUtils.setProxyConnAutoCommit(conn, autoCommit);
    if (conn.getAutoCommit() != autoCommit) throw new RuntimeException("illegal autocommit state");
  }

  /**
   * If invokingSp flag is not set, execute the query as narmal. Otherwise, find a sp to invoke and
   * get result from the sp result.
   *
   * <p>The returned result is recorded if enabled.
   */
  public static ResultSet doExecuteQuery(PreparedStatement invokedPs) throws SQLException {
    ResultSet resultSet = null;
    SPInvocationContext ctx = null;
    boolean fromSp = false; // whether this resultset is returned from sp
    long begin = 0;
    if (enableQueryTimer) begin = System.nanoTime();

    try {
      NamedStopWatch.begin("invokeMngr-query");
      // If !isInvokingSp(), using no prefetch
      if (!isInvokingSp()) {
        if (USING_RECORDED_RESULT_SET.get()) {
          Triple<String, byte[][], int[]> pstmtMeta =
              SPSQLValidator.parsePreparedStatement(invokedPs);
          final String expectedSql = pstmtMeta.getLeft();
          logger.info(
              "Using cached result for "
                  + expectedSql.substring(0, Math.min(expectedSql.length(), 15)));
          // this if for convience of openjdk-concolic to parse a prepared statement
          // openjdk-concolic currently only handles MySQL.prepared statement impl
          Class<? extends PreparedStatement> pstmtClz = invokedPs.getClass();
          if (pstmtClz.getName().equals("com.zaxxer.hikari.pool.HikariProxyPreparedStatement")) {
            Field delegateFld = ReflectionUtils.findField(pstmtClz, "delegate");
            delegateFld.setAccessible(true);
            invokedPs = (PreparedStatement) delegateFld.get(invokedPs);
          }
          return resultSet = ResultSetHolder.executeQuery(expectedSql);
        } else {
          return resultSet = invokedPs.executeQuery();
        }
      }
      // Else using prefetch
      if (shouldCallNextSp()) {
        assert SP_API_STATE.get() != null;
        NamedStopWatch.begin("invokeMngr-query-getNextSp");
        final String spName = getNextSp(invokedPs, SP_API_STATE.get(), SP_BUFFER.get());
        NamedStopWatch.end("invokeMngr-query-getNextSp");
        if (StringUtils.isEmpty(spName))
          return resultSet =
              disableSpAndQueryNormal(invokedPs, "[No next sp] A new path need to compile: ");

        final SPDefinition spDef = SP_API_STATE.get().getSpDefOfCurrentApi(spName);
        // storeNdParamsIfNecessary(spDef, invokedPs, SP_BUFFER.get());
        NamedStopWatch.begin("invokeMngr-query-invoke");
        final boolean invokeSuccess = invokeSP(invokedPs.getConnection(), spDef, SP_BUFFER.get());
        NamedStopWatch.end("invokeMngr-query-invoke");
        if (!invokeSuccess)
          return resultSet =
              disableSpAndQueryNormal(
                  invokedPs,
                  "[Invocation failure] Invoke sp failed, fallback to normal execution:");
      }

      resultSet = nextResultSetFromSpCtx(ctx = SINGLE_SP_INVOCATION_CTX.get(), invokedPs);
      fromSp = true;
      return resultSet;
    } catch (WrongSQLException e) {
      SPInvokeManager.setInvokingSp(false); // disable sp for following sqls
      if (!StringUtils.isEmpty(ctx.getCurrentSavepointName())) {
        //        boolean success =
        doExecutePartialRollback(invokedPs.getConnection(), ctx.getCurrentSavepointName());
        //        assert success;
      } else {
        logger.info("No savepoint for this SELECT. It must be a read-only txn.");
      }
      e.printStackTrace();
      HitRateCounter.onException(ctx.getSpDefinition().getApiName());
      return resultSet =
          disableSpAndQueryNormal(invokedPs, "[WrongSQL] A new path need to compile: ");
    } catch (Throwable e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    } finally {
      if (enableQueryTimer) {
        logger.error("Last query used " + (System.nanoTime() - begin) * 1.0 / 1_000_000 + " ms");
      }
      NamedStopWatch.begin("invokeMngr-query-record");
      assert resultSet != null;
      tryRecordResultSet(invokedPs, resultSet, fromSp);
      NamedStopWatch.end("invokeMngr-query-record");
      NamedStopWatch.end("invokeMngr-query");
    }
  }

  public static boolean doExecute(PreparedStatement invokedPs) {
    return true;
  }

  public static int doExecuteUpdate(PreparedStatement invokedPs) throws SQLException {
    return doExecuteUpdate(invokedPs, false);
  }

  public static int doExecuteUpdate(PreparedStatement invokedPs, boolean getUpdateCount) throws SQLException {
    int res = -1;
    SPInvocationContext ctx = null;
    boolean fromSp = false;
    long begin = 0;
    if (enableQueryTimer) begin = System.nanoTime();

    try {
      NamedStopWatch.begin("invokeMngr-update");
      if (!isInvokingSp()) {
        Triple<String, byte[][], int[]> parsedPreparedStatement = SPSQLValidator.parsePreparedStatement(invokedPs);
        if (USING_RECORDED_RESULT_SET.get()) {
          Triple<String, byte[][], int[]> pstmtMeta =
                  parsedPreparedStatement;
          final String expectedSql = pstmtMeta.getLeft();
          logger.info(
              "Using cached result for "
                  + expectedSql.substring(0, Math.min(expectedSql.length(), 15)));
          // this if for convience of openjdk-concolic to parse a prepared statement
          // openjdk-concolic currently only handles MySQL.prepared statement impl
          Class<? extends PreparedStatement> pstmtClz = invokedPs.getClass();
          if (pstmtClz.getName().equals("com.zaxxer.hikari.pool.HikariProxyPreparedStatement")) {
            Field delegateFld = ReflectionUtils.findField(pstmtClz, "delegate");
            delegateFld.setAccessible(true);
            invokedPs = (PreparedStatement) delegateFld.get(invokedPs);
          }
          return res = ResultSetHolder.executeUpdate(expectedSql);
        } else {
          if (getUpdateCount) {
            String selString = parsedPreparedStatement.getLeft();
            if (selString.startsWith("select") || selString.startsWith("SELECT")) {
              return res = invokedPs.getUpdateCount();
            }
          }
          // FIXME: handle when executing multiple getUpdateCount() for write SQL
          return res = invokedPs.executeUpdate();
        }
      } else if (getUpdateCount) {
        Triple<String, byte[][], int[]> parsedPreparedStatement = SPSQLValidator.parsePreparedStatement(invokedPs);
        String selString = parsedPreparedStatement.getLeft();
        if (selString.startsWith("select") || selString.startsWith("SELECT")) {
          // 1. when using preparedStatement.execute() API for select, the ORM framework (mybatis)
          // will invoke getUpdateCount() after executing a select statement. In
          // this case, we should return with normal operation.
          return res;
        }
        // 2. when using preparedStatement.execute() API for update/insert, the SPManager
        // should invoke corresponding sp invocation logics
      }

      if (shouldCallNextSp()) {
        assert SP_API_STATE.get() != null;
        final String spName = getNextSp(invokedPs, SP_API_STATE.get(), SP_BUFFER.get());
        if (StringUtils.isEmpty(spName))
          return res =
              disableSpAndUpdateNormal(invokedPs, "[No next sp] A new path need to compile: ");

        final SPDefinition spDef = SP_API_STATE.get().getSpDefOfCurrentApi(spName);
        // storeNdParamsIfNecessary(spDef, invokedPs, SP_BUFFER.get());

        NamedStopWatch.begin("invokeMngr-update-invoke");
        boolean invokeSucceed = invokeSP(invokedPs.getConnection(), spDef, SP_BUFFER.get());
        NamedStopWatch.end("invokeMngr-update-invoke");
        if (!invokeSucceed)
          return res =
              disableSpAndUpdateNormal(
                  invokedPs, "Invoking sp " + spName + " failed, fallback to normal execution");
      }

      ctx = SINGLE_SP_INVOCATION_CTX.get();
      res = nextUpdateResFromSpCtx(ctx, invokedPs);
      fromSp = true;
      return res;
    } catch (WrongSQLException e) {
      SPInvokeManager.setInvokingSp(false); // disable sp for following sqls
      if (!StringUtils.isEmpty(ctx.getCurrentSavepointName())) {
        doExecutePartialRollback(invokedPs.getConnection(), ctx.getCurrentSavepointName());
      }
      HitRateCounter.onException(ctx.getSpDefinition().getApiName());
      return res =
          disableSpAndUpdateNormal(invokedPs, "[Wrong SQL] Executed wrong sql: [" + e + "]");
    } catch (Throwable e) {
      logger.error(e);
      throw new RuntimeException(e);
    } finally {
      if (enableQueryTimer) {
        logger.error("Last update used " + (System.nanoTime() - begin) * 1.0 / 1_000_000 + " ms");
      }
      if (res != -1) tryRecordUpdate(invokedPs, res, fromSp);
      NamedStopWatch.end("invokeMngr-update");
    }
  }

  public static void doSetAutoCommit(Connection conn, boolean autoCommit) throws SQLException {
    SPInvocationContext ctx = null;
    boolean fromSp = false;
    long begin = 0;
    if (enableQueryTimer) begin = System.nanoTime();

    try {
      NamedStopWatch.begin("invokeMngr-autocommit");
      final String sql = autoCommit ? "set autocommit=1" : "set autocommit=0";
      if (!isInvokingSp()) {
        if (USING_RECORDED_RESULT_SET.get()) {
          logger.info("Using cached result for " + sql);
          // for the convinent of openjdk-concolic, adjust 1st local variable to the underling jdbc
          // connection
          conn = SPUtils.resolveConnectionFromProxy(conn);
          ResultSetHolder.doTxnRelatedSQL(sql);
          SPUtils.setProxyConnAutoCommit(conn, autoCommit);
          return;
        }
        conn.setAutoCommit(autoCommit);
        return;
      }

      ctx = SINGLE_SP_INVOCATION_CTX.get();
      if (ctx == null || ctx.isEmpty()) {
        assert SP_API_STATE.get() != null;
        final String spName = getNextSp(sql, SP_API_STATE.get(), SP_BUFFER.get());
        if (StringUtils.isEmpty(spName)) {
          disableSpAndSetAutocommit(conn, autoCommit, "[No next sp] A new path need to compile: ");
          return;
        }
        if (SPConfig.FORCE_AUTOCOMMIT_USE_SQL_THAN_SP) {
          // skip the sp starting with autocommit SQL, use this when
          // next SP only has one SQL statement
          SP_API_STATE.get().setLastInvokedSp(spName);
          conn.setAutoCommit(autoCommit);
          return;
        }

        final SPDefinition spDef = SP_API_STATE.get().getSpDefOfCurrentApi(spName);
        NamedStopWatch.begin("invokeMngr-autocommit-invoke");
        final boolean invokeSuccess = invokeSP(conn, spDef, SP_BUFFER.get());
        NamedStopWatch.end("invokeMngr-autocommit-invoke");
        if (!invokeSuccess) {
          conn.setAutoCommit(autoCommit);
          return;
        }
      }

      ctx = SINGLE_SP_INVOCATION_CTX.get();
      assert ctx != null;
      nextAutoCommitFromSpCtx(ctx, conn, autoCommit);
      fromSp = true;
    } catch (WrongSQLException e) {
      SPInvokeManager.setInvokingSp(false); // disable sp for following sqls
      if (!StringUtils.isEmpty(ctx.getCurrentSavepointName())) {
        doExecutePartialRollback(conn, ctx.getCurrentSavepointName());
        //        assert success;
        conn.setAutoCommit(autoCommit);
      } else {
        logger.error("No savepoint for this SELECT. It must be a read-only txn.");
      }
      HitRateCounter.onException(ctx.getSpDefinition().getApiName());

    } catch (Throwable e) {
      logger.error(e);
      throw new RuntimeException(e);
    } finally {
      if (enableQueryTimer) {
        logger.error(
            "Last set autocommit["
                + autoCommit
                + "] used "
                + (System.nanoTime() - begin) * 1.0 / 1_000_000
                + " ms");
      }
      tryRecordAutoCommit(autoCommit, fromSp);
      NamedStopWatch.end("invokeMngr-autocommit");
    }
  }

  public static void doCommit(Connection conn) throws SQLException {
    long begin = 0;
    if (enableQueryTimer) begin = System.nanoTime();

    try {
      NamedStopWatch.begin("invokeMngr-commit");
      if (!isInvokingSp() || SPConfig.EXPERIMENT_PREFETCH || SPConfig.FORCE_COMMIT_AT_COMMIT_SP) {
        NamedStopWatch.begin("invokeMngr-commit-branch-if");
        if (USING_RECORDED_RESULT_SET.get()) {
          logger.info("Using cached result for commit");
          try {
            // for the convinent of openjdk-concolic, adjust 1st local variable to the underling
            // jdbc connection, do not modify this if you don't know how this works!
            conn = SPUtils.resolveConnectionFromProxy(conn);
          } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
          }
          ResultSetHolder.doTxnRelatedSQL("commit");
          return;
        }
        conn.commit();
        NamedStopWatch.end("invokeMngr-commit-branch-if");
      } else {
        // Actual commit can be deferred to next sp's beginning
        NamedStopWatch.begin("invokeMngr-commit-branch-else");
        if (shouldCallNextSp()) {
          SpApiState spApiState = SP_API_STATE.get();
          assert spApiState != null;
          final String spName =
              SPInvocationUtils.getNextSp("commit", spApiState, SP_BUFFER.get(), false);
          if (!StringUtils.isEmpty(spName)) {
            final SPDefinition spDef = spApiState.getSpDefOfCurrentApi(spName);
            // the next sp should only contain the single commit statement
            final boolean invokeSuccess = invokeSP(conn, spDef, SP_BUFFER.get());
            assert invokeSuccess;
            if (!invokeSuccess) {
              conn.commit();
              logger.error("Unable to commit transaction in stored procedure " + spName);
              return;
            }
            SINGLE_SP_INVOCATION_CTX.get().advanceQueryId();
            spApiState.setRequireCommitLater(false);
          } else {
            spApiState.setRequireCommitLater(true);
          }
        }
        NamedStopWatch.end("invokeMngr-commit-branch-else");
      }
      if (SQL_RESULT_SET_RECORDER.get() != null) {
        SQL_RESULT_SET_RECORDER.get().storeTxnSQLToJPF("commit");
      }
    } finally {
      if (enableQueryTimer) {
        logger.error("Last query used " + (System.nanoTime() - begin) * 1.0 / 1_000_000 + " ms");
      }
      NamedStopWatch.end("invokeMngr-commit");
    }
  }

  public static void beginApi(String apiName) {
    Pair<Map<String, SPDefinition>, String> spDefInfo =
        SPMetadataContainer.getInstance().getSpDefinitions(apiName);
    if (!SPInvocationUtils.initializeSPState(apiName, spDefInfo, SP_API_STATE)) return;
    if (AsyncPrefetcher.enabled()) initializePrefetch(spDefInfo, SP_BUFFER.get());
  }

  public static void endApi() throws SQLException {
    if (logger.isDebugEnabled()) {
      SpApiState spApiState = SP_API_STATE.get();
      logger.debug(String.format("Ending api %s", spApiState == null ? "NULL" : spApiState.getApiName()));
    }
    SP_BUFFER.get().clear();
//    SP_BUFFER.remove();
    SP_API_STATE.set(null);
    final SPInvocationContext spInvocationContext = SINGLE_SP_INVOCATION_CTX.get();
    if (spInvocationContext != null) spInvocationContext.close();
    SINGLE_SP_INVOCATION_CTX.set(null);
  }

  public static void startRecording() {
    if (SQL_RESULT_SET_RECORDER.get() == null) SQL_RESULT_SET_RECORDER.set(new SQLResultSetRecorder());
    else if (logger.isDebugEnabled())
      logger.debug("Might calling start recording consequently multiple times, recorded SQL result set might be lost");
  }

  public static void endRecording() {
    SPInvocationUtils.endRecording(SQL_RESULT_SET_RECORDER);
  }

  public static List<Pair<String, Object>> getRecordedSqlAndResultSets() {
    SQLResultSetRecorder recorder = SQL_RESULT_SET_RECORDER.get();
    if (recorder != null && recorder.isNeedCompile()) {
      return recorder.getRecordedSqlAndResultSets();
    }
    return null;
  }

  public static boolean isInvokingSp() {
    return SP_API_STATE.get() != null && SP_API_STATE.get().isInvokingSp();
  }

  public static void setInvokingSp(boolean invokingSp) {
    if (logger.isDebugEnabled()) logger.debug("Set invoking sp to " + invokingSp);
    if (SP_API_STATE.get() != null) {
      SP_API_STATE.get().setInvokingSp(invokingSp);
    }
  }

  private static void tryRecordResultSet(
      PreparedStatement invokedPs, ResultSet resultSet, boolean fromSp) {
    SQLResultSetRecorder recorder = SQL_RESULT_SET_RECORDER.get();
    if (recorder != null) {
      recorder.storeSQLAndRsForJPF(invokedPs, resultSet);
      if (!fromSp) recorder.setNeedCompile(true);
    }
  }

  private static void tryRecordUpdate(PreparedStatement invokedPs, int res, boolean fromSp) {
    SQLResultSetRecorder recorder = SQL_RESULT_SET_RECORDER.get();
    if (recorder != null) {
      recorder.storeUpdateSQLToJPF(invokedPs, res);
      if (!fromSp) recorder.setNeedCompile(true);
    }
  }

  private static void tryRecordAutoCommit(boolean autoCommit, boolean fromSp) {
    SQLResultSetRecorder recorder = SQL_RESULT_SET_RECORDER.get();
    if (recorder != null) {
      recorder.storeTxnSQLToJPF(autoCommit ? "set autocommit=1" : "set autocommit=0");
      if (!fromSp) recorder.setNeedCompile(true);
    }
  }

  private static boolean shouldCallNextSp() {
    SPInvocationContext spInvocationContext = SINGLE_SP_INVOCATION_CTX.get();
    return spInvocationContext == null || spInvocationContext.isEmpty();
  }

  public static void storeParam(String varName, Object value) {
    SP_BUFFER.get().storeParam(varName, value);
  }

  private static void SPInvocationFinished(
      PreparedStatement ps, SPDefinition spDef, SPInvocationContext providedCtx)
      throws SQLException {
    final SPInvocationContext spInvocationContext = SINGLE_SP_INVOCATION_CTX.get();
    if (spInvocationContext != null) {
      spInvocationContext.close();
      spInvocationContext.clear();
      SINGLE_SP_INVOCATION_CTX.set(null);
    }
    SPInvocationContext spInvocationStatus =
        providedCtx == null ? new SPInvocationContext(ps, spDef) : providedCtx;
    SINGLE_SP_INVOCATION_CTX.set(spInvocationStatus);
    SP_API_STATE.get().setLastInvokedSp(spDef.getSpName());
    if (logger.isDebugEnabled()) {
      logger.debug("SetLastInvokedSp to " + spDef.getSpName());
    }
    SP_API_STATE.get().setRequireCommitLater(false);
  }

  public static boolean doExecutePartialRollback(Connection conn, String savepointName)
      throws SQLException {
    final String partialRollback = String.format("ROLLBACK TO %s", savepointName);
    NamedStopWatch.begin("prepareStmt-doExecutePartialRollback");
    PreparedStatement ps = conn.prepareStatement(partialRollback);
    NamedStopWatch.end("prepareStmt-doExecutePartialRollback");
    logger.warn("Partial rollback with " + partialRollback);
    try {
      return ps.execute();
    } catch (Exception e) {
      logger.warn("Error executing partial rollback", e);
      return false;
    }
  }

  /**
   * Invoke a stored procedure
   *
   * @param conn
   * @param spDefinition
   * @param spBuffer
   * @return true if sp is successfully invoked
   * @throws SQLException
   */
  private static boolean invokeSP(
      Connection conn, SPDefinition spDefinition, SPResultBuffer spBuffer) throws SQLException {
    if (AsyncPrefetcher.enabled()) {
      // wait for the next prefetch context to be ready
      NamedStopWatch.begin("getPrefetchedCtx");
      final SPInvocationContext ctx = getPrefetchedCtx(spDefinition);
      NamedStopWatch.end("getPrefetchedCtx");
      NamedStopWatch.begin("async-setNewSPInvocation");
      SPInvocationFinished(null, spDefinition, ctx);
      NamedStopWatch.end("async-setNewSPInvocation");
      return true;
    }

    boolean prevReadOnly = conn.isReadOnly();
    conn.setReadOnly(false);
    String callSpStatement = spDefinition.getCallSpStatement();
    NamedStopWatch.begin("prepareStmt-invokeSP");
    final PreparedStatement ps = conn.prepareStatement(callSpStatement);
    NamedStopWatch.end("prepareStmt-invokeSP");

    SPUtils.unlinkResourceManager(ps, conn);
    final List<Object> args =
        spDefinition.getParameterVars().stream()
            .map(
                var -> {
                  if (var.contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX)) {
                    return System.currentTimeMillis();
                  } else {
                    return spBuffer.getParam(var);
                  }
                })
            .collect(Collectors.toList());
    for (int i = 0; i < args.size(); i++) {
      ps.setObject(i + 1, args.get(i));
    }

    if (logger.isDebugEnabled()) {
      logger.debug(
          String.format(
              "API %s call sp: call %s(%s)%n",
              spDefinition.getApiName(),
              spDefinition.getSpName(),
              Joiner.on(",").useForNull("null").join(args)));
    }
    final boolean autoCommit = conn.getAutoCommit();
    try {
      NamedStopWatch.begin("async-wait-ctx-" + spDefinition.getSpName());
      NamedStopWatch.begin("sp-invocation");
      long begin = 0;
      if (enableQueryTimer) {
        begin = System.nanoTime();
      }
      boolean execRes = ps.execute();
      if (enableQueryTimer) {
        logger.error(
            String.format(
                "Invoking %s used %s ms",
                spDefinition.getSpName(), (System.nanoTime() - begin) * 1.0 / 1_000_000));
      }
      NamedStopWatch.end("sp-invocation");
      NamedStopWatch.end("async-wait-ctx-" + spDefinition.getSpName());
      //      NamedStopWatch.begin(spDefinition.getSpName() + "-lifecycle");
      assert execRes;
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
        doExecutePartialRollback(conn, savepointName);
        conn.setAutoCommit(autoCommit);
        //        if (!rollbackRes) throw new RuntimeException("Rollback to " + savepointName + "
        // failure");
      }
      return false;
    }
    SPInvocationFinished(ps, spDefinition, null);
    ps.closeOnCompletion();
    conn.setReadOnly(prevReadOnly);
    return true;
  }

  private static SPInvocationContext getPrefetchedCtx(SPDefinition spDefinition) {
    Map<String, BlockingQueue<PreparedStatement>> spPrefetchResQueue =
        AsyncPrefetcher.getPrefetchSpContext();
    final SPInvocationContext ctx;
    try {
      NamedStopWatch.begin("async-wait-ctx-" + spDefinition.getSpName());
      // timer
      // SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss:SSSS z");
      // Date date = new Date(System.currentTimeMillis());

      // logger.error(
      //     String.format(
      //         "%s Main thread wait for %s from ctxQueue",
      //         formatter.format(date), spDefinition.getSpName()));

      ctx =
          new SPInvocationContext(
              spPrefetchResQueue.get(spDefinition.getSpName()).take(), spDefinition);
      // end

      // date = new Date(System.currentTimeMillis());

      // logger.error(
      //     String.format(
      //         "%s Main thread got %s from ctxQueue",
      //         formatter.format(date), spDefinition.getSpName()));

      NamedStopWatch.end("async-wait-ctx-" + spDefinition.getSpName());
    } catch (InterruptedException e) {
      throw new RuntimeException(e);
    }
    return ctx;
  }

  /**
   * choose next sp based on 1) entryPc and 2) the first SQL statement
   *
   * @return name of the stored procedure to invoke
   */
  private static String getNextSp(String firstSQL, SpApiState apiState, SPResultBuffer spBuffer) {
    return SPInvocationUtils.getNextSp(firstSQL, apiState, spBuffer, true);
  }

  private static String getNextSp(
      PreparedStatement firstSQL, SpApiState apiState, SPResultBuffer spBuffer) {
    try {
      return getNextSp(SPUtils.parseIncomingPreparedStmt(firstSQL).sqlTemplate, apiState, spBuffer);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  private static void storeNdParamsIfNecessary(
      SPDefinition spDef, PreparedStatement invokedPs, SPResultBuffer spBuffer) {
    List<Pair<Integer, String>> firstSqlParamsToCollect = spDef.getFirstSqlParamsToCollect();
    try {
      final SPUtils.PrepareStmtMeta parsingResult = SPUtils.parseIncomingPreparedStmt(invokedPs);
      firstSqlParamsToCollect.forEach(
          pair -> {
            int colIdx = pair.getLeft();
            String varNameToStore = pair.getRight();
            String valStr = new String(parsingResult.parameters[colIdx]);
            if (valStr.startsWith("'") && valStr.endsWith("'")) {
              valStr = valStr.substring(1, valStr.length() - 1);
            }
            // TODO the valStr is a calculated value, i.e, we need to reverse the parameter
            // expression to get the original variable needed by sp
            spBuffer.storeParam(varNameToStore, valStr);
          });
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
  }
}
