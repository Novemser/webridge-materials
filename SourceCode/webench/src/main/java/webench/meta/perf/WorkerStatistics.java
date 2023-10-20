package webench.meta.perf;

import webench.meta.APIType;
import webench.meta.perf.pojo.ApiDbStatistics;
import java.util.ArrayList;

public class WorkerStatistics extends Statistics {

  public WorkerStatistics(long periodTime) {
    super(periodTime);
  }

  public void add(APIType apiType, long startTime, long duration, ApiDbStatistics apiDbStatistics) {
    int periodN = (int) (startTime / periodTime);
    durations.putIfAbsent(apiType, new ArrayList<>());
    while (durations.get(apiType).size() <= periodN) {
      durations.get(apiType).add(new ArrayList<>());
    }
    durations.get(apiType).get(periodN).add(duration);
    if (apiDbStatistics != null) {
      dbStatistics.putIfAbsent(apiType, new ArrayList<>());
      dbStatistics.get(apiType).add(apiDbStatistics);
    }
  }
}
