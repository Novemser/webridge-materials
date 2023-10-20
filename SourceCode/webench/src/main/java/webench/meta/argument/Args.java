package webench.meta.argument;

import webench.meta.BenchmarkConfig;
import webench.meta.DbConfig;
import com.beust.jcommander.Parameter;
import lombok.*;

@Data
public class Args {
  @Parameter(
      names = {"--workload", "-w"},
      description = "the workload type for the workload generator to generate",
      validateWith = WorkloadTypeValidator.class)
  private String workloadType = "ecommerce";

  @Parameter(
      names = {"--threads", "-th"},
      description = "number of worker threads to issue requests")
  private int numThreads = 1;

  @Parameter(
      names = {"--warmup"},
      description = "warmup time in seconds")
  private int warmUpTime = 0;

  @Parameter(
      names = {"--time"},
      description = "workload running time in seconds")
  private int benchmarkTime = 10;

  @Parameter(
      names = {"--period"},
      description = "period for statistics")
  private int periodTime = 60;

  @Parameter(
      names = {"--populateDb"},
      description = "whether to create the tables and populate data before the benchmark")
  private boolean populateDatabase = false;

  @Parameter(
      names = {"--onlyPopulateDb"},
      description = "whether to create the tables and populate data without running the benchmark")
  private boolean onlyPopulateDatabase = false;

  @Parameter(
      names = {"--scale"},
      description = "the scale factor",
      validateWith = ScaleValidator.class)
  private double scale = 1.0d;

  @Parameter(
      names = {"--schema"},
      description = "the application schema definition SQL file location",
      validateWith = FileValidator.class)
  private String applicationSpecificSchemaDefinition;

  // database connection related configs
  @Parameter(
      names = {"--host"},
      description = "MySQL server host name")
  private String host = "localhost";

  @Parameter(
      names = {"--database"},
      description = "MySQL database instance name")
  private String database = "broadleaf_react";

  @Parameter(
      names = {"--username"},
      description = "MySQL server host name")
  private String username = "root";

  @Parameter(
      names = {"--password"},
      description = "MySQL server password")
  private String password = "admin";

  @Parameter(
      names = {"--port"},
      description = "MySQL server port")
  private int port = 3306;

  @Parameter(
      names = {"--app"},
      description = "The application name, valid names:broadleaf,shopizer")
  private String appName = "broadleaf";

  @Parameter(
      names = {"--web-host"},
      description = "Web server port")
  private String webHost = "http://localhost:3000";

  @Parameter(
      names = {"--perf-base-dir"},
      description = "Base directory to store perf result")
  private String perfBaseDir = "/tmp";

  @Parameter(
      names = {"--enable-db-profile"},
      description =
          "Whether enable database profile, if enabled, will get statistics from DB. "
              + "Only valid in single thread benchmark")
  private boolean enableDbProfile = false;

  @Parameter(
      names = {"--distribution-base-dir"},
      description = "Access distribution base directory")
  private String distBaseDir = "data/eCommerce";

  public BenchmarkConfig getBenchmarkConfig() {
    return new BenchmarkConfig(
        numThreads,
        benchmarkTime,
        warmUpTime,
        periodTime,
        perfBaseDir,
        enableDbProfile,
        distBaseDir);
  }

  public DbConfig getDbConfig() {
    return new DbConfig(host, database, username, password, port);
  }
}
