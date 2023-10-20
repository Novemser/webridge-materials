package webench.meta;

import lombok.Data;

@Data
public class BenchmarkConfig {
  private final int numberOfThreads;
  private final int benchmarkTime;
  private final int warmupTime;
  private final int periodTime;
  private final String perfBaseDir;
  private final boolean enableDbProfile;
  private final String distBaseDir;
}
