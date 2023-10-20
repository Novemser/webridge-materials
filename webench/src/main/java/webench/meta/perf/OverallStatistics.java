package webench.meta.perf;

import webench.meta.APIType;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OverallStatistics extends Statistics {

  private OverallStatistics(long periodTime) {
    super(periodTime);
  }

  public static OverallStatistics fromWorkerStatistics(
      List<WorkerStatistics> workerStatisticsList) {
    assert !workerStatisticsList.isEmpty();
    final OverallStatistics statistics =
        new OverallStatistics(workerStatisticsList.get(0).periodTime);

    for (WorkerStatistics workerStatistics : workerStatisticsList) {
      for (Map.Entry<APIType, List<List<Long>>> entry : workerStatistics.durations.entrySet()) {
        APIType apiType = entry.getKey();
        List<List<Long>> apiDurations = entry.getValue();
        for (int period = 0; period < apiDurations.size(); period++) {
          statistics.durations.putIfAbsent(apiType, new ArrayList<>());
          while (statistics.durations.get(apiType).size() <= period) {
            statistics.durations.get(apiType).add(new ArrayList<>());
          }
          statistics.durations.get(apiType).get(period).addAll(apiDurations.get(period));
        }
      }
    }

    if (workerStatisticsList.size() != 1) {
      if (!workerStatisticsList.stream()
          .allMatch(
              workerStatistics ->
                  workerStatistics.dbStatistics.values().stream().allMatch(List::isEmpty))) {
        throw new IllegalArgumentException(
            "Currently db statistics can only be calculated under single thread benchmark");
      }
    }
    statistics.dbStatistics = workerStatisticsList.get(0).dbStatistics;
    return statistics;
  }
}
