package webridge.common.spring.filter;

import webridge.wbridge.storedprocedure.invocation.HitRateCounter;
import webridge.wbridge.storedprocedure.invocation.SPInvokeManager;
import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.ReentrantLock;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import webridge.common.utils.BufferedServletRequestWrapper;
import webridge.common.utils.WeBridgeWebRequestUtils;

@Component("storedProcedureControlFilter")
public class StoredProcedureControlFilter extends OncePerRequestFilter implements Ordered {

  @Value("${webridge.use.sp:false}")
  private boolean enableSp;

  @Value("${webridge.use.sp.warmup:15}")
  private int warmUp;

  @Value("${webridge.profile.hit_rate:false}")
  private boolean profileHitRate;

  // For each thread, due to implementation issue, the first trace that access stored procedure has
  // to be serialized
  // see Bug#292
  private final ThreadLocal<Set<String>> apiAccessed = ThreadLocal.withInitial(HashSet::new);
  //    private ThreadLocal<Integer> reqCounter = ThreadLocal.withInitial(() -> 0);
  private final Map<String, AtomicInteger> reqCounter = new ConcurrentHashMap<>();
  private final ReentrantLock accessMutex = new ReentrantLock();
  @Autowired private WeBridgeWebRequestUtils utils;

  @Override
  public int getOrder() {
    return FilterOrders.of(getClass());
  }

  @Override
  protected void doFilterInternal(
      HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
      throws ServletException, IOException {
    if (!WeBridgeWebRequestUtils.isSpURI(request) || !enableSp) {
      // prepareSPParam could cause SQL issued to database, to ensure normal execution & sp
      // execution have
      // the same set of SQLs issued to DB, force invoke prepareSPParam here. TODO: check whether it
      // is correct
      //            utils.prepareSPParam(request);
      filterChain.doFilter(request, response);
      return;
    }

    final String apiName = WeBridgeWebRequestUtils.getSPDefApi(request);
    AtomicInteger reqCnt =
        reqCounter.compute(
            apiName,
            (ignored, counter) -> {
              if (counter == null) counter = new AtomicInteger(0);
              return counter;
            });

    if (reqCnt.incrementAndGet() < warmUp) {
      filterChain.doFilter(request, response);
      return;
    }

    try {
      if (!apiAccessed.get().contains(apiName)) {
        accessMutex.lock();
        if (apiAccessed.get().contains(apiName)) {
          accessMutex.unlock();
        } else if (logger.isDebugEnabled()) {
          logger.debug(
              String.format("[mutex.lock] Serialize access to API %s [only once/thread]", apiName));
        }
      }
      // we need wrapper the request, to enable read request body input stream multiple times
      final BufferedServletRequestWrapper requestWrapper =
          WeBridgeWebRequestUtils.bufferRequestBody(request);
      //      SPMetadataContainer.getInstance().forceRefresh();
      if (profileHitRate) {
        HitRateCounter.beginCounting(apiName);
      }
      SPInvokeManager.beginApi(apiName);
      SPInvokeManager.setInvokingSp(true);
      utils.prepareSPParam(requestWrapper);
      filterChain.doFilter(requestWrapper, response);
    } catch (Throwable e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    } finally {
      if (!apiAccessed.get().contains(apiName)) {
        apiAccessed.get().add(apiName);
        accessMutex.unlock();
        if (logger.isDebugEnabled()) {
          logger.debug(
              String.format(
                  "[mutex.unlock] Serialize access to API %s [only once/thread]", apiName));
        }
      }
      try {
        SPInvokeManager.endApi();
        if (profileHitRate) {
          HitRateCounter.endCounting(apiName);
          int totalNumTraces = HitRateCounter.getTotalNumTraces();
          int numTracesHit = HitRateCounter.getNumTracesHit();
          logger.info(
              String.format(
                  "#totalTraces:%d,#hitTraces:%d,hitRate:%f,API[%s]hitRate:%f",
                  totalNumTraces,
                  numTracesHit,
                  1.0 * numTracesHit / totalNumTraces,
                  apiName,
                  HitRateCounter.getHitRate(apiName)));
        }
      } catch (Throwable e) {
        e.printStackTrace();
        throw new RuntimeException(e);
      }
    }
  }
}
