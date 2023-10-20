package webridge.wbridge.storedprocedure.invocation.prefetch;

import webridge.wbridge.storedprocedure.SPConfig;
import webridge.wbridge.storedprocedure.SPDefinition;
import webridge.wbridge.storedprocedure.invocation.SPResultBuffer;
import webridge.wbridge.storedprocedure.invocation.WrongSQLException;
import java.sql.PreparedStatement;
import java.util.*;
import java.util.concurrent.BlockingQueue;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PrefetchProgressMonitor {
  private static final ThreadLocal<PrefetchProgressMonitor> PREFETCH_PROGRESS_MONITOR =
      ThreadLocal.withInitial(PrefetchProgressMonitor::new);
  private static final ThreadLocal<Map<String, ParameterState>> SP_PARAM_AVAILABLE_STATE =
      ThreadLocal.withInitial(HashMap::new);
  protected static final Log logger = LogFactory.getLog(PrefetchProgressMonitor.class);

  private TreeMap<String, boolean[]>
      spReadyStatus; // [whether parameters are ready, whether parent is executed]
  private Map<String, SPDefinition> spDefs;
  private SPResultBuffer buffer;
  //  private ExecutorService listenerService = Executors.newSingleThreadExecutor();

  public static void clear() {}

  public static PrefetchProgressMonitor getPrefetchProgressMonitor() {
    return PREFETCH_PROGRESS_MONITOR.get();
  }

  public static Map<String, ParameterState> getSpParamAvailableState() {
    return SP_PARAM_AVAILABLE_STATE.get();
  }

  public void init(Map<String, SPDefinition> sps, SPResultBuffer buffer, String firstSpName) {
    // Here we use TreeMap to guarantee the order of the spDefinition, therefore, you must make sure
    // the name of sp has the right string order yourself
    spReadyStatus = new TreeMap<>();
    sps.forEach(
        (name, spDefinition) -> {
          final ParameterState state = ParameterState.of(spDefinition);
          final boolean hasNoParam = state.hasNoParam();
          if (firstSpName.equals(name)) {
            spReadyStatus.put(name, new boolean[] {hasNoParam, true});
          } else {
            spReadyStatus.put(name, new boolean[] {hasNoParam, false});
          }
          final Map<String, ParameterState> spParamStateMap =
              PrefetchProgressMonitor.getSpParamAvailableState();
          spParamStateMap.put(name, state);
        });
    final Map<String, BlockingQueue<PreparedStatement>> prefetchSpContext =
        AsyncPrefetcher.getPrefetchSpContext();
    // register parameter buffer to listen for prefetch
    buffer.setStoreParamCallBack(
        pair -> onStoreParameter(pair.getLeft(), pair.getRight(), prefetchSpContext));
    this.spDefs = new HashMap<>(sps);
    this.buffer = buffer;

    if (SPConfig.EXPERIMENT_PREFETCH) {
      // b4 the first transaction commits & no writes happen,
      // all queries can be prefetched at the same time
      makeNextTransactionReadyToPrefetch(spDefs, firstSpName);
    }

    checkAndPrefetch(prefetchSpContext);
  }

  public void onSpFinished(
      SPDefinition spDef, Map<String, BlockingQueue<PreparedStatement>> prefetchSpContext) {
    if (!AsyncPrefetcher.enabled()) return;
    Objects.requireNonNull(spReadyStatus, "Uninitialized monitor");
    spDef
        .getChildrenSpNames()
        .forEach(
            spName -> {
              boolean[] readyStatus = spReadyStatus.get(spName);
              if (readyStatus == null) {
                return;
              }
              readyStatus[1] = true;
              if (logger.isDebugEnabled()) {
                logger.debug(
                    String.format(
                        "Setting ready status for SP[%s] with %s",
                        spName, readyStatus[0] + "," + readyStatus[1]));
              }
              if (spDefs.get(spName).isContainsCommitBefore() && SPConfig.EXPERIMENT_PREFETCH) {
                makeNextTransactionReadyToPrefetch(spDefs, spName);
              }
            });

    if (logger.isDebugEnabled()) {
      logger.debug(
          String.format("SP %s finished, checking next sp to prefetch", spDef.getSpName()));
    }

    checkAndPrefetch(prefetchSpContext);
  }

  private void makeNextTransactionReadyToPrefetch(
      Map<String, SPDefinition> spDefs, String currentSpName) {
    final SPDefinition spDef = spDefs.get(currentSpName);
    Queue<SPDefinition> sps = new LinkedList<>();
    sps.add(spDef);
    while (!sps.isEmpty()) {
      SPDefinition sp = sps.remove();
      boolean[] readyStats = spReadyStatus.get(sp.getSpName());
      if (readyStats == null) {
        throw new RuntimeException("Invalid ReadyStatus");
      }
      readyStats[1] = true;
      sp.getChildrenSpNames()
          .forEach(
              name -> {
                SPDefinition nextSpDef = spDefs.get(name);
                // stop when another transaction begins
                if (nextSpDef.isContainsCommitBefore()) return;
                // do not prefetch write queries
                try {
                  String sql = nextSpDef.getSqlTemplateAt(0);
                  if (sql.regionMatches(true, 0, "insert", 0, 6)
                      || sql.regionMatches(true, 0, "update", 0, 6)) {
                    // String sql = nextSpDef.getSqlTemplateAt(0).toLowerCase();
                    // if (sql.contains("insert") || sql.contains("update")) {
                    return;
                  }
                } catch (WrongSQLException e) {
                  throw new RuntimeException(e);
                }
                sps.add(nextSpDef);
              });
    }
  }

  public void onStoreParameter(
      String name, Object value, Map<String, BlockingQueue<PreparedStatement>> prefetchSpContext) {
    // If using AsyncPrefetcher
    if (!AsyncPrefetcher.enabled()) return;
    getSpParamAvailableState()
        .forEach(
            (spName, parameterState) -> {
              final boolean paramReady = parameterState.store(name, value);
              if (!paramReady) return;
              spReadyStatus.get(spName)[0] = true;
            });

    checkAndPrefetch(prefetchSpContext);
  }

  private void checkAndPrefetch(Map<String, BlockingQueue<PreparedStatement>> prefetchSpContext) {
    while (true) {
      String spName = nextSpToPrefetch();
      if (spName == null) return;
      // got a new sp to fetch
      AsyncPrefetcher.invokeSPAsync(
          Objects.requireNonNull(spDefs.get(spName)), buffer, prefetchSpContext);
    }
  }

  public String nextSpToPrefetch() {
    Set<Map.Entry<String, boolean[]>> entries = spReadyStatus.entrySet();
    String candidate = null;
    for (Map.Entry<String, boolean[]> entry : entries) {
      boolean[] value = entry.getValue();
      if (logger.isDebugEnabled()) {
        logger.debug(
            "[Async] Checking nextSpToPrefetch("
                + entry.getKey()
                + ") status:"
                + value[0]
                + "|"
                + value[1]);
      }
      if (value[0] && value[1]) {
        candidate = entry.getKey();
        break;
      }
    }

    try {
      if (candidate != null) spReadyStatus.remove(candidate);
      if (logger.isDebugEnabled()) {
        logger.debug("spReadyStatus size after check:" + spReadyStatus.size());
      }
    } catch (Exception e) {
      logger.error(e);
    }
    // spReadyStatus.remove(candidate);
    // if (logger.isDebugEnabled()) {
    //   logger.debug("spReadyStatus size after check:" + spReadyStatus.size());
    // }
    return candidate;
  }
}
