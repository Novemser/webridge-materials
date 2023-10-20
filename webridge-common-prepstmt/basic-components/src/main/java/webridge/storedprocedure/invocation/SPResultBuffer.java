package webridge.storedprocedure.invocation;

import webridge.storedprocedure.SPDefinition;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import webridge.common.utils.NamedStopWatch;

/** thread-unsafe implementation of a buffer to store ResultSet of SP */
public class SPResultBuffer {
  protected static final Log logger = LogFactory.getLog(SPResultBuffer.class);

  private final ConcurrentHashMap<String, ArrayBlockingQueue<Object>> paramBuffer;
  private Consumer<Pair<String, Object>> storeParamCallBack;
//  private final ExecutorService asyncPool;
  private final AtomicInteger workerCounter;
  private volatile boolean cleared;

  SPResultBuffer() {
    this.paramBuffer = new ConcurrentHashMap<String, ArrayBlockingQueue<Object>>();
    this.workerCounter = new AtomicInteger(0);
//    this.asyncPool = Executors.newFixedThreadPool(2);
    this.cleared = false;
  }

  public void setStoreParamCallBack(Consumer<Pair<String, Object>> storeParamCallBack) {
    this.storeParamCallBack = storeParamCallBack;
  }

  public Object getParam(String varName) {
    // wait until the parameters are ready
    //    while (workerCounter.get() != 0) {}
    if (varName.startsWith("__nd__func__currentTimeMs__42__")) {
      final String remaining = varName.substring("__nd__func__currentTimeMs__42__".length());
      return System.currentTimeMillis() + Long.parseLong(remaining);
    }
    if (varName.endsWith("__hashCode")) {
      Object res;
      while (true) {
        if (paramBuffer.containsKey(varName.substring(0, varName.indexOf("__hashCode")))) {
          res = paramBuffer.get(varName.substring(0, varName.indexOf("__hashCode"))).peek();
          break;
        }
      }
      // Object res = paramBuffer.get(varName.substring(0, varName.indexOf("__hashCode")));
      if (res != null) return res.hashCode();
      return res;
    }
    Object res;
    while (true) {
      if (paramBuffer.containsKey(varName)) {
        res = paramBuffer.get(varName).peek();
        break;
      }
    }
    return res;
  }

  public Object storeParam(String varName, Object value) {
    NamedStopWatch.begin("async-callback-param");
    if (varName.equals("RS_q48_r1_col5")) {
      value = 0; // FIXME: check whether this is for shopizer
    }
    final Object finalValue = value;
    //    workerCounter.incrementAndGet();
//    asyncPool.execute(
//        () ->
        {
//          if (cleared) {
//            // when the stored procedure ends, do not add old pending new parameters to the buffer
//            return;
//          }
          ArrayBlockingQueue<Object> q = new ArrayBlockingQueue<Object>(1);
          if (finalValue != null) {
            boolean res = q.offer(finalValue);
            if (!res) throw new RuntimeException("Should not fail!");
          }
          paramBuffer.put(varName, q);
          //          workerCounter.decrementAndGet();
        }
//        );
    if (logger.isDebugEnabled())
      logger.debug(
          String.format(
              "Storing param: %s = %s", varName, value == null ? "NULL" : value.toString()));
    if (storeParamCallBack != null) {
      storeParamCallBack.accept(Pair.of(varName, value));
    }
    NamedStopWatch.end("async-callback-param");
    return value;
  }

  void clear() {
    //    while (workerCounter.get() != 0) {}
//    cleared = true;
    paramBuffer.clear();
//    if (!asyncPool.isShutdown()) asyncPool.shutdown();
    //    workerCounter.set(0);
  }

  void storeSelectRsToBuffer(int queryId, ResultSet rs, SPDefinition spDef)
      throws SQLException, WrongSQLException {
    final List<List<String>> spNamingMapping = spDef.getSqlSelectColumnVarNames(queryId);
    assert spNamingMapping != null;
    if (spNamingMapping.isEmpty()) {
      if (logger.isInfoEnabled()) logger.info("No need to store the ResultSet for " + spDef.getSpName());
      return;
    }
    if (logger.isDebugEnabled()) logger.debug("Storing select rs from sp " + spDef.getSpName());

    int rowNum = 0;
    NamedStopWatch.begin("store-buffer-rs-next");
    while (rs.next()) {
      final ResultSetMetaData metaData = rs.getMetaData();
      int columnCount = metaData.getColumnCount();
      // TODO handle case where the actual return #rows is larger than spNamingMapping.size()

      if (rs.getRow() > spNamingMapping.size()) {
        logger.warn(
            String.format(
                "More rows(%d) retrieved than expected(%d) for %s",
                rs.getRow(), spNamingMapping.size(), spDef.getSqlTemplateAt(queryId)));
        break;
      }
      List<String> namingMapping = spNamingMapping.get(rs.getRow() - 1);
      NamedStopWatch.begin("store-buffer-loop");
      for (int i = 1; i <= columnCount; i++) {
        String columnName;
        NamedStopWatch.begin("store-buffer-loop-meta");
        if (namingMapping == null) {
          columnName = metaData.getColumnName(i);
        } else if (i - 1 < namingMapping.size()) {
          columnName = namingMapping.get(i - 1);
        } else {
          // for 'select t.* from t', the column names are not in the namingMapping table
          columnName = metaData.getColumnName(i);
        }
        NamedStopWatch.end("store-buffer-loop-meta");
        NamedStopWatch.begin("store-buffer-getObj");
        Object object = rs.getObject(i);
        NamedStopWatch.end("store-buffer-getObj");
        storeParam(columnName, object);
      }
      NamedStopWatch.end("store-buffer-loop");
      rowNum++;
    }
    NamedStopWatch.end("store-buffer-rs-next");
    if (logger.isDebugEnabled())
      logger.debug("A total of " + rowNum + " rows stored for " + spDef.getSpName());
    // assert rowNum <= spNamingMapping.size();
    // if (rowNum < spNamingMapping.size()) {
    //   throw new WrongSQLException("Few rows retrieved than expected");
    // }

    // store #rows into local buffer
    String retNumVar = spDef.getSqlRetCntVarName(queryId);
    storeParam(retNumVar, rowNum);
    rs.beforeFirst(); // unwind to the first row's index
  }

  void storeUpdateRsToBuffer(int queryId, int res, SPDefinition spDef) {
    String updateRetVar = spDef.getSqlRetCntVarName(queryId);
    this.storeParam(updateRetVar, res);
  }
}
