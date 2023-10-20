package webench.benchmark.client.custom.workers;

import webench.benchmark.client.Client;
import webench.meta.APIEndpoint;
import webench.meta.APIType;
import webench.meta.BenchmarkConfig;
import webench.meta.DbConfig;
import webench.meta.workload.WorkloadConfig;
import java.util.concurrent.Callable;
import java.util.function.Consumer;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ConfigManageWorker extends BaseWorker {
  private static final Logger logger = LogManager.getLogger();

  public ConfigManageWorker(
      Client client,
      BenchmarkConfig config,
      int workerId,
      WorkloadConfig workloadConfig,
      DbConfig dbConfig) {

    super(client, config, workerId, workloadConfig, dbConfig);
    logger.warn("Currently use a fixed id to proceed request for all the APIs of pybbs!");
  }

  @Override
  protected void warmUpCompleteCallback() {}

  @Override
  protected void runOneRound(Consumer<Callable<APIType>> apiInvokeHandler) {
    final APIEndpoint apiEndpoint = nextRandomAPI();
    client.invokeBlocking(apiEndpoint, apiInvokeHandler, getWorkerId() + 1);
  }

  @Override
  protected void finished() {
    logger.info("Worker " + getWorkerId() + " finished.");
  }
}
