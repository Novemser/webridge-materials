package webench.meta.perf;

import webench.meta.APIType;
import webench.meta.perf.pojo.ApiDbStatistics;
import webench.meta.perf.pojo.SQL;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.stream.Collectors;
import org.apache.commons.io.FileUtils;

public class StatisticsPrintHelper {

  public static void writeThroughputToFile(String baseDir, Statistics statistics) {
    StringBuilder content = new StringBuilder();
    content.append("Time,").append("Throughput\n");
    List<Double> throughput = statistics.getThroughput();
    for (int i = 0; i < throughput.size(); i++) {
      content
          .append(i * (statistics.periodTime / 1_000_000_000))
          .append(",")
          .append(throughput.get(i))
          .append("\n");
    }
    writeToFile(baseDir + "/throughput.csv", content.toString());
  }

  public static void writeLatencyToFile(
      String baseDir, Statistics statistics, List<Integer> percentiles) {
    for (APIType apiType : statistics.durations.keySet()) {
      StringBuilder content = new StringBuilder();
      content.append("Time,");
      for (int percentile : percentiles) {
        content.append(apiType).append("-P").append(percentile).append(",");
      }
      content.append("\n");

      List<List<Long>> latencies =
          percentiles.stream()
              .map(percentile -> statistics.getPeriodLatency(percentile).get(apiType))
              .collect(Collectors.toList());
      for (int i = 0; i < latencies.get(0).size(); i++) {
        content.append(i * (statistics.periodTime / 1_000_000_000)).append(",");
        for (List<Long> latency : latencies) {
          content.append(latency.get(i)).append(",");
        }
        content.append("\n");
      }

      content.append("overall,");
      for (int percentile : percentiles) {
        content.append(statistics.getOverallLatency(percentile).get(apiType)).append(",");
      }
      content.append("\n");

      content.append("db,");
      for (int percentile : percentiles) {
        content.append(statistics.getOverallDbLatency(percentile).get(apiType)).append(",");
      }
      content.append("\n");

      content.append("roundtrip,");
      for (int percentile : percentiles) {
        content.append(statistics.getRoundTrip(percentile).get(apiType)).append(",");
      }
      content.append("\n");
      writeToFile(baseDir + "/latency-" + apiType + ".csv", content.toString());
    }
  }

  public static void writeDbStatisticsToFile(String baseDir, Statistics statistics) {
    for (APIType apiType : statistics.getDbStatistics().keySet()) {
      StringBuilder content = new StringBuilder();
      content.append("SQL,").append("Time\n");
      for (ApiDbStatistics apiDbStatistics : statistics.getDbStatistics().get(apiType)) {
        for (SQL sql : apiDbStatistics.sql) {
          content.append("\"").append(sql.sqlString).append("\",").append(sql.time).append("\n");
        }
        content.append("\n");
      }

      writeToFile(baseDir + "/DB-" + apiType + ".csv", content.toString());
    }
  }

  private static void writeToFile(String fname, String content) {
    File f = new File(fname);
    f.getParentFile().mkdirs();
    try {
      FileUtils.writeStringToFile(f, content, StandardCharsets.UTF_8);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
