package webridge.common.spring.filter;

import com.google.common.base.Joiner;
import webridge.sql.result.MultipleRowResultSetImpl;
import webridge.storedprocedure.invocation.SPInvokeManager;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.tuple.Pair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import webridge.common.utils.WeBridgeWebRequestUtils;

@Component("resultSetTracerFilter")
public class ResultSetTracerFilter extends OncePerRequestFilter implements Ordered {
  private final Map<String, Map<String, Integer>> traceCounterHistogram = new ConcurrentHashMap<>();
  private final AtomicInteger counter = new AtomicInteger(0);

  @Value("${trace.sql.enable:false}")
  private boolean enableTracing;

  @Value("${webridge.offline.compiler.enable:false}")
  private boolean enableOfflineCompiler;

  static String buildKeyFromResults(List<Pair<String, Object>> recordedResulset) {
    final StringBuilder builder = new StringBuilder();
    for (Pair<String, Object> pair : recordedResulset) {
      final String template = pair.getLeft();
      final Object right = pair.getRight();
      builder.append(template);
      if (right instanceof MultipleRowResultSetImpl) {
        builder.append("_").append(((MultipleRowResultSetImpl) right).getNumOfRows());
      } else if (right instanceof Integer) {
        builder.append("_").append(right);
      }
      // append \n for human-readability
      builder.append("\n");
    }
    String res = builder.toString();
    if (LOGGER.isInfoEnabled()) {
      LOGGER.info(
          String.format("Built key[%s] by %d SQL", res.hashCode(), recordedResulset.size()));
    }
    return res;
  }

  @Override
  public int getOrder() {
    return FilterOrders.of(getClass());
  }

  @Override
  protected void doFilterInternal(
      HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
      throws ServletException, IOException {
    if (!WeBridgeWebRequestUtils.isSpURI(request)
        || !enableTracing
        || SPInvokeManager.isUsingRecordedRs()) {
      filterChain.doFilter(request, response);
      return;
    }

    final String apiName = WeBridgeWebRequestUtils.getSPDefApi(request);
    SPInvokeManager.startRecording();
    filterChain.doFilter(request, response);
    List<Pair<String, Object>> recordedResulsets = SPInvokeManager.getRecordedSqlAndResultSets();
    if (recordedResulsets == null) {
      // no need to track since the trace is already compiled
      if (!enableOfflineCompiler) {
        // discards recorded SQL result set when following filters will not use them
        SPInvokeManager.endRecording();
      }
      return;
    }
    validateRecordedResultSet(recordedResulsets);
    String key = buildKeyFromResults(recordedResulsets);
    updateTraceCounter(key, apiName);
    tryPrintTrace();
    if (!enableOfflineCompiler) {
      // discards recorded SQL result set when following filters will not use them
      SPInvokeManager.endRecording();
    }
  }

  private static final Logger LOGGER = LoggerFactory.getLogger(ResultSetTracerFilter.class);

  private void tryPrintTrace() {
    if (counter.get() % 100 != 0) {
      return;
    }

    traceCounterHistogram.forEach(
        (api, cntMap) -> {
          LOGGER.info(String.format("#Total Traces for %s:%d", api, cntMap.size()));
          List<String> countLst = new ArrayList<>();
          cntMap.forEach((ignoredKey, cnt) -> countLst.add(ignoredKey.hashCode() + ":" + cnt));
          //            countLst.sort(Integer::compareTo);
          LOGGER.info(Joiner.on("|").join(countLst));
        });
  }

  private void updateTraceCounter(String key, String api) {
    counter.incrementAndGet();
    traceCounterHistogram.compute(
        api,
        (s, cntMap) -> {
          if (cntMap == null) cntMap = new HashMap<>();
          cntMap.compute(
              key,
              (k, count) -> {
                if (count == null) count = 0;
                return count + 1;
              });
          return cntMap;
        });
  }

  // sanity check
  private void validateRecordedResultSet(List<Pair<String, Object>> recordedResulset) {
    for (int index = 0, next = index + 1;
        index < recordedResulset.size() && next < recordedResulset.size();
        next++, index++) {
      final Pair<String, Object> prev = recordedResulset.get(index);
      final Pair<String, Object> nextRes = recordedResulset.get(next);
      String sqlStr = nextRes.getLeft();
      if (prev.getLeft().equalsIgnoreCase("commit")) {
        if (!sqlStr.equalsIgnoreCase("set autocommit=1")) {
          logger.error("Invalid sql sequence");
          throw new RuntimeException("Incorrectly recorded resultset, missing autocommit");
        }
      }
    }
  }

  public Map<String, Map<String, Integer>> getTraceCounterHistogram() {
    return Collections.unmodifiableMap(traceCounterHistogram);
  }
}
