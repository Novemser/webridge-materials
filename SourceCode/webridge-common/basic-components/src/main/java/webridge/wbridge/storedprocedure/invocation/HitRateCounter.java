package webridge.wbridge.storedprocedure.invocation;

import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class HitRateCounter {
  private static class Counter {
    AtomicInteger totalTraces;
    AtomicInteger missedTraces;

    public Counter() {
      totalTraces = new AtomicInteger(0);
      missedTraces = new AtomicInteger(0);
    }

    private void incTotal() {
      totalTraces.incrementAndGet();
    }

    private void incMissed() {
      missedTraces.incrementAndGet();
    }

    public int getMissedTraces() {
      return missedTraces.get();
    }

    public int getTotalTraces() {
      return totalTraces.get();
    }

    public void reset() {
      totalTraces.set(0);
      missedTraces.set(0);
    }
  }

  private static final Map<String, Counter> counters = new ConcurrentHashMap<>();
  private static final ThreadLocal<Boolean> enabled = ThreadLocal.withInitial(() -> false);

  public static void beginCounting(String apiName) {
    enabled.set(true);
    counters.compute(
        apiName,
        (s, counter) -> {
          if (counter == null) counter = new Counter();
          return counter;
        });
  }

  public static void endCounting(String apiName) {
    enabled.set(false);
    Objects.requireNonNull(counters.get(apiName)).incTotal();
  }

  public static void onException(String apiName) {
    if (!enabled.get()) return;
    Objects.requireNonNull(counters.get(apiName), "Counter is not properly initialized")
        .incMissed();
  }

  public static double getTotalHitRate() {
    return 1.0 * getNumTracesHit() / getTotalNumTraces();
  }

  public static double getHitRate(String apiName) {
    final Counter counter = counters.get(apiName);
    if (counter == null) return 0;
    return 1 - 1.0 * counter.getMissedTraces() / counter.getTotalTraces();
  }

  public static int getTotalNumTraces() {
    return counters.values().stream().mapToInt(Counter::getTotalTraces).sum();
  }

  public static int getNumTracesHit() {
    return getTotalNumTraces() - getNumTracesMissed();
  }

  public static int getNumTracesMissed() {
    return counters.values().stream().mapToInt(Counter::getMissedTraces).sum();
  }
}
