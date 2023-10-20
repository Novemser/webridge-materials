package webench.benchmark.client.custom.workers;

import webench.benchmark.client.Client;
import webench.database.DBHelper;
import webench.meta.APIEndpoint;
import webench.meta.APIType;
import webench.meta.BenchmarkConfig;
import webench.meta.DbConfig;
import webench.meta.perf.DBTestingUtils;
import webench.meta.perf.WorkerStatistics;
import webench.meta.perf.pojo.ApiDbStatistics;
import webench.meta.workload.WorkloadConfig;
import java.sql.Connection;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.function.Consumer;

import org.apache.commons.math3.distribution.EnumeratedDistribution;
import org.apache.commons.math3.util.Pair;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.Configurator;

public abstract class BaseWorker extends Worker {
  private static final Logger logger = LogManager.getLogger();

  static {
    Configurator.setLevel(logger.getName(), Level.WARN);
  }

  private long beginTime;
  private long endTime;
  private long rounds;
  private long errors;
  protected final WorkloadConfig workloadConfig;
  protected final EnumeratedDistribution<APIEndpoint> apiEndpointEnumeratedDistribution;
  private final WorkerStatistics workerStatistics;
  private final Connection perfConn;
  private final boolean enableDbProfile;

  public BaseWorker(
      Client client,
      BenchmarkConfig config,
      int workerId,
      WorkloadConfig workloadConfig,
      DbConfig dbConfig) {
    super(client, config, workerId);
    this.workloadConfig = workloadConfig;
    final List<APIEndpoint> endpoints = Objects.requireNonNull(workloadConfig.getEndpoints());
    assert !endpoints.isEmpty();
    final List<Pair<APIEndpoint, Double>> dis = new ArrayList<>();
    for (APIEndpoint endpoint : endpoints) {
      final double ratio = endpoint.getRatio();
      dis.add(Pair.create(endpoint, ratio));
    }
    apiEndpointEnumeratedDistribution = new EnumeratedDistribution<>(dis);
    workerStatistics = new WorkerStatistics(config.getPeriodTime() * 1000_000_000L);

    enableDbProfile = config.isEnableDbProfile();
    if (enableDbProfile) {
      perfConn = DBHelper.initializeMySQLConnection(dbConfig);
      try {
        DBTestingUtils.enableMysqlProfiling(perfConn);
      } catch (Throwable e) {
        throw new RuntimeException(e);
      }
    } else {
      perfConn = null;
    }
  }

  protected abstract void warmUpCompleteCallback();

  protected abstract void runOneRound(Consumer<Callable<APIType>> apiInvokeHandler);

  protected abstract void finished();

  private Consumer<Callable<APIType>> getWarmUpApiInvokeHandler() {
    return api -> {
      try {
        api.call();
      } catch (Throwable e) {
        logger.warn("Error during warmup in worker " + workerId + ", abort", e);
        if (workloadConfig.isFailFast()) throw new RuntimeException(e);
      }
    };
  }

  private Consumer<Callable<APIType>> getApiInvokeHandler() {
    return api -> {
      try {
        if (enableDbProfile) {
          DBTestingUtils.truncateProfilingLog(perfConn);
          DBTestingUtils.markBegin(perfConn, 0);
        }
        final long apiBeginTime = currentTime();
        APIType apiType = api.call();
        final long apiEndTime = currentTime();
        if (enableDbProfile) {
          DBTestingUtils.markEnd(perfConn, 0);
          ApiDbStatistics apiDbStatistics = DBTestingUtils.getDbSummary(perfConn, true);
          workerStatistics.add(
              apiType, apiBeginTime - beginTime, apiEndTime - apiBeginTime, apiDbStatistics);
        } else {
          workerStatistics.add(apiType, apiBeginTime - beginTime, apiEndTime - apiBeginTime, null);
        }
      } catch (Throwable e) {
        logger.warn("Error during executing round " + rounds + " in worker " + workerId, e);
        if (workloadConfig.isFailFast()) throw new RuntimeException(e);
        errors++;
      }
    };
  }

  @Override
  public final void run() {
    final Consumer<Callable<APIType>> warmUpApiInvokeHandler = getWarmUpApiInvokeHandler();
    while (true) {
      if (isWarmUpComplete()) {
        beginTime = currentTime();
        break;
      }
      try {
        runOneRound(warmUpApiInvokeHandler);
      } catch (Throwable e) {
        logger.warn("Error during warmup in worker " + workerId + ", abort", e);
        if (workloadConfig.isFailFast()) throw new RuntimeException(e);
      }
    }
    warmUpCompleteCallback();
    final Consumer<Callable<APIType>> apiInvokeHandler = getApiInvokeHandler();
    while (true) {
      if (isStopped()) {
        endTime = currentTime();
        break;
      }
      try {
        runOneRound(apiInvokeHandler);
      } catch (Throwable e) {
        logger.warn("Error during executing round " + rounds + " in worker " + workerId, e);
        if (workloadConfig.isFailFast()) throw new RuntimeException(e);
        errors++;
      }
      rounds++;
    }

    finished();
  }

  public WorkerStatistics getWorkerStatistics() {
    return workerStatistics;
  }

  protected APIEndpoint nextRandomAPI() {
    return apiEndpointEnumeratedDistribution.sample();
  }
}
