package webench.meta.perf;

import webench.meta.APIType;
import webench.meta.perf.pojo.ApiDbStatistics;
import java.util.*;
import java.util.stream.Collectors;

public abstract class Statistics {
  protected final long periodTime;
  // api -> (period -> latency)
  protected final Map<APIType, List<List<Long>>> durations = new HashMap<>();
  protected Map<APIType, List<ApiDbStatistics>> dbStatistics = new HashMap<>();

  public Statistics(long periodTime) {
    this.periodTime = periodTime;
  }

  public List<Double> getThroughput() {
    final List<Double> throughput = new ArrayList<>();
    final int totPeriods =
        durations.values().stream().map(List::size).min(Integer::compareTo).get()
            - 1; // The last period may be not complete
    for (int i = 0; i < totPeriods; i++) {
      int finalI = i;
      int numRequests =
          durations.values().stream().map(v -> v.get(finalI).size()).reduce(Integer::sum).get();
      throughput.add((double) (numRequests) / (periodTime / 1_000_000_000));
    }
    return throughput;
  }

  public Map<APIType, List<Long>> getPeriodLatency(int percentile) {
    final Map<APIType, List<Long>> latency = new HashMap<>();
    for (Map.Entry<APIType, List<List<Long>>> entry : durations.entrySet()) {
      APIType apiType = entry.getKey();
      List<List<Long>> apiDurations = entry.getValue();
      List<Long> apiLatency =
          apiDurations.stream()
              .map(
                  periodDurations -> {
                    List<Long> aPeriodDurations = new ArrayList<>(periodDurations);
                    Collections.sort(aPeriodDurations);
                    if (aPeriodDurations.isEmpty()) {
                      return 0L;
                    } else {
                      return aPeriodDurations.get(aPeriodDurations.size() * percentile / 100);
                    }
                  })
              .collect(Collectors.toList());
      latency.put(apiType, apiLatency);
    }
    return latency;
  }

  public Map<APIType, Long> getOverallLatency(int percentile) {
    return durations.entrySet().stream()
        .collect(
            Collectors.toMap(
                Map.Entry::getKey,
                e -> {
                  List<Long> durations =
                      e.getValue().stream()
                          .flatMap(List::stream)
                          .sorted()
                          .collect(Collectors.toList());
                  if (durations.isEmpty()) {
                    return 0L;
                  } else {
                    return durations.get(durations.size() * percentile / 100);
                  }
                }));
  }

  public Map<APIType, Long> getOverallDbLatency(int percentile) {
    return dbStatistics.entrySet().stream()
        .collect(
            Collectors.toMap(
                Map.Entry::getKey,
                e -> {
                  List<Long> durations =
                      e.getValue().stream()
                          .map(ApiDbStatistics::getDbTime)
                          .sorted()
                          .collect(Collectors.toList());
                  if (durations.isEmpty()) {
                    return 0L;
                  } else {
                    return durations.get(durations.size() * percentile / 100);
                  }
                }));
  }

  public Map<APIType, Integer> getRoundTrip(int percentile) {
    return dbStatistics.entrySet().stream()
        .collect(
            Collectors.toMap(
                Map.Entry::getKey,
                e -> {
                  List<Integer> durations =
                      e.getValue().stream()
                          .map(apiDbStatistics -> apiDbStatistics.roundtrip)
                          .sorted()
                          .collect(Collectors.toList());
                  if (durations.isEmpty()) {
                    return 0;
                  } else {
                    return durations.get(durations.size() * percentile / 100);
                  }
                }));
  }

  public Map<APIType, List<ApiDbStatistics>> getDbStatistics() {
    return dbStatistics;
  }
}
