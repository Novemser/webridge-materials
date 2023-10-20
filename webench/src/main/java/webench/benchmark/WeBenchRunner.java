package webench.benchmark;

import static webench.database.DBHelper.disableFKCheck;
import static webench.database.DBHelper.enableFKCheck;

import webench.benchmark.client.Client;
import webench.benchmark.client.custom.blogging.MyBlogClient;
import webench.benchmark.client.custom.blogging.SaganClient;
import webench.benchmark.client.custom.config_manage.ApolloClient;
import webench.benchmark.client.custom.ecommerce.BroadleafClient;
import webench.benchmark.client.custom.ecommerce.ShopizerClient;
import webench.benchmark.client.custom.forum.PybbsClient;
import webench.data.TableGenerator;
import webench.data.custom.blogging.MyBlogGenerator;
import webench.data.custom.blogging.SaganGenerator;
import webench.data.custom.confmanage.ApolloGenerator;
import webench.data.custom.ecommerce.BroadleafGenerator;
import webench.data.custom.ecommerce.ShopizerGenerator;
import webench.data.custom.forum.PybbsGenerator;
import webench.database.DBHelper;
import webench.meta.BenchmarkConfig;
import webench.meta.DbConfig;
import webench.meta.Schema;
import webench.meta.argument.Args;
import webench.meta.perf.OverallStatistics;
import webench.meta.perf.StatisticsPrintHelper;
import webench.meta.perf.WorkerStatistics;
import webench.meta.workload.WorkloadConfig;
import webench.meta.workload.WorkloadHelper;
import webench.meta.workload.WorkloadType;
import com.beust.jcommander.JCommander;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import webench.benchmark.client.custom.workers.*;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.NotImplementedException;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.Configurator;

@RequiredArgsConstructor
public class WeBenchRunner implements AutoCloseable {
  private static final Logger logger = LogManager.getLogger();

  static {
    Configurator.setLevel(logger.getName(), Level.INFO);
  }
  // this connection is only used to populate database
  @Getter @NonNull private final Connection connection;

  public static void main(String[] args) throws SQLException {
    final Args argument = new Args();
    JCommander.newBuilder().addObject(argument).build().parse(args);
    final WorkloadConfig workloadConfig = WorkloadHelper.getWorkloadConfig(argument);
    switch (WorkloadType.valueOf(argument.getWorkloadType().toUpperCase())) {
      case ECOMMERCE:
      case BLOGGING:
      case CONFIG_MANAGE:
      case FORUM:
        try (final WeBenchRunner weBenchRunner =
            new WeBenchRunner(DBHelper.initializeMySQLConnection(argument.getDbConfig()))) {
          if (argument.isPopulateDatabase() || argument.isOnlyPopulateDatabase()) {
            weBenchRunner.populateDatabase(workloadConfig);
            if (argument.isOnlyPopulateDatabase()) {
              logger.info("OnlyPopulateDatabase=true, exit");
              return;
            }
          }
          weBenchRunner.run(workloadConfig, argument.getBenchmarkConfig(), argument.getDbConfig());
        } catch (Exception e) {
          throw new RuntimeException(e);
        }
        break;
      default:
        throw new IllegalStateException();
    }
  }

  public void populateDatabase(final WorkloadConfig workloadConfig) throws SQLException {
    final TableGenerator generator;
    switch (workloadConfig.getWorkloadType()) {
      case FORUM:
        switch (workloadConfig.getAppName()) {
          case "pybbs":
            generator = new PybbsGenerator();
            break;
          case "sagan":
            generator = new SaganGenerator();
            break;
          default:
            throw new NotImplementedException(workloadConfig.getAppName());
        }
        break;
      case BLOGGING:
        switch (workloadConfig.getAppName()) {
          case "sagan":
            //
            //            generator = new ShopizerGenerator();
            generator = new SaganGenerator();
            break;
          case "myblog":
            generator = new MyBlogGenerator();
            break;
          default:
            throw new NotImplementedException(workloadConfig.getAppName());
        }
        break;
      case ECOMMERCE:
        switch (workloadConfig.getAppName()) {
          case "broadleaf":
            generator = new BroadleafGenerator();
            break;
          case "shopizer":
            generator = new ShopizerGenerator();
            break;
          default:
            throw new NotImplementedException(workloadConfig.getAppName());
        }
        break;
      case CONFIG_MANAGE:
        switch (workloadConfig.getAppName()) {
          case "apollo":
            generator = new ApolloGenerator();
            break;
          default:
            throw new NotImplementedException(workloadConfig.getAppName());
        }
        break;
      default:
        throw new NotImplementedException(workloadConfig.getAppName());
    }
    populateDBInternal(workloadConfig, generator);
    //    checkDatabase(workloadConfig);
  }

  private void checkDatabase(WorkloadConfig workloadConfig) {
    // TODO check the populated database is in valid state
    final Map<String, Integer> totalNumRecords = workloadConfig.getTotalNumRecords();
    DBHelper.checkNumOfRecords(connection, "BLC_CUSTOMER", totalNumRecords.get(Schema.TABLE_USER));
    DBHelper.checkNumOfRecords(
        connection, "BLC_PRODUCT", totalNumRecords.get(Schema.TABLE_PRODUCT));
    DBHelper.checkNumOfRecords(connection, "BLC_SKU", totalNumRecords.get(Schema.TABLE_PRODUCT));
    //    DBHelper.checkNumOfRecords(
    //        connection, "BLC_PRODUCT_ATTRIBUTE", totalNumRecords.get(Schema.TABLE_PRODUCT));
    DBHelper.checkNumOfRecords(
        connection, "BLC_CATEGORY", totalNumRecords.get(Schema.TABLE_CATEGORY));
    DBHelper.checkNumOfRecords(
        connection, "BLC_CATEGORY_PRODUCT_XREF", totalNumRecords.get(Schema.TABLE_PRODUCT));
  }

  private void populateDBInternal(WorkloadConfig workloadConfig, TableGenerator generator)
      throws SQLException {
    try {
      disableFKCheck(connection);
      generator.prepareSchema(connection, workloadConfig);
      generator.populateData(connection, workloadConfig);
    } finally {
      enableFKCheck(connection);
    }
  }

  public void run(
      final WorkloadConfig workloadConfig,
      final BenchmarkConfig benchmarkConfig,
      final DbConfig dbConfig) {
    final int numberOfThreads = benchmarkConfig.getNumberOfThreads();
    final List<Worker> workers = new ArrayList<>(numberOfThreads);
    logger.info("initialize " + numberOfThreads + " workers");
    for (int tid = 0; tid < numberOfThreads; tid++) {
      final Worker worker;
      final Client client;
      switch (workloadConfig.getAppName().toLowerCase()) {
        case "broadleaf":
          client = new BroadleafClient(workloadConfig.getWebHost());
          break;
        case "shopizer":
          client = new ShopizerClient(workloadConfig.getWebHost());
          break;
        case "sagan":
          //  the http client that used to invoke API requests, refer to
          client = new SaganClient(workloadConfig.getWebHost());
          break;
        case "pybbs":
          client = new PybbsClient(workloadConfig.getWebHost());
          break;
        case "apollo":
          client = new ApolloClient(workloadConfig.getWebHost());
          break;
        case "myblog":
          client = new MyBlogClient(workloadConfig.getWebHost());
          break;
        default:
          throw new NotImplementedException(workloadConfig.getAppName() + " not adapted!");
      }
      switch (workloadConfig.getWorkloadType()) {
        case BLOGGING:
          // the client worker that issues different kinds of requests, refer to
          // @ECommerceWorker
          worker = new BloggingWorker(client, benchmarkConfig, tid, workloadConfig, dbConfig);
          break;
        case ECOMMERCE:
          worker = new ECommerceWorker(client, benchmarkConfig, tid, workloadConfig, dbConfig);
          break;
        case FORUM:
          worker = new ForumWorker(client, benchmarkConfig, tid, workloadConfig, dbConfig);
          break;
        case CONFIG_MANAGE:
          worker = new ConfigManageWorker(client, benchmarkConfig, tid, workloadConfig, dbConfig);
          break;
        default:
          throw new IllegalStateException();
      }
      workers.add(worker);
    }

    for (Worker worker : workers) {
      worker.start();
    }

    // warmup
    logger.info("Begin warmup");
    try {
      Thread.sleep(benchmarkConfig.getWarmupTime() * 1000L);
    } catch (InterruptedException e) {
      throw new RuntimeException(e);
    }

    for (Worker worker : workers) {
      worker.completeWarmUp();
    }
    logger.info("Finish warmup");

    // run
    logger.info("Start running");
    try {
      Thread.sleep(benchmarkConfig.getBenchmarkTime() * 1000L);
    } catch (InterruptedException e) {
      throw new RuntimeException(e);
    }

    for (Worker worker : workers) {
      worker.completeBenchmark();
    }

    for (Worker worker : workers) {
      try {
        worker.join();
      } catch (InterruptedException e) {
        throw new RuntimeException(e);
      }
    }

    logger.info("All threads stopped running");

    final List<WorkerStatistics> workerStatisticsList =
        workers.stream().map(Worker::getWorkerStatistics).collect(Collectors.toList());

    final OverallStatistics overallStatistics =
        OverallStatistics.fromWorkerStatistics(workerStatisticsList);

    StatisticsPrintHelper.writeThroughputToFile(
        benchmarkConfig.getPerfBaseDir(), overallStatistics);
    StatisticsPrintHelper.writeLatencyToFile(
        benchmarkConfig.getPerfBaseDir(), overallStatistics, Arrays.asList(50, 90, 99));
    StatisticsPrintHelper.writeDbStatisticsToFile(
        benchmarkConfig.getPerfBaseDir(), overallStatistics);
  }

  @Override
  public void close() throws Exception {
    connection.close();
  }
}
