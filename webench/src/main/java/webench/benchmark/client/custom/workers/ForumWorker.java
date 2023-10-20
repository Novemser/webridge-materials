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

public class ForumWorker extends BaseWorker {
  private static final Logger logger = LogManager.getLogger();
  private int apiIndex;

  public ForumWorker(
      Client client,
      BenchmarkConfig config,
      int workerId,
      WorkloadConfig workloadConfig,
      DbConfig dbConfig) {

    super(client, config, workerId, workloadConfig, dbConfig);
    logger.warn("Currently use a fixed id to proceed request for all the APIs of pybbs!");
  }

  protected String generateId(APIType apiType, WorkloadConfig config) {
    int maxUserId = config.getTotalNumRecords().get("User") - 1;
    String id = "user" + String.valueOf(random.nextInt(maxUserId));
    switch (apiType) {
      case GETAPIINDEX:
        id = "";
        break;
      case GETUSER:
        break;
      case GETTOP100:
        id = "";
        break;
      default:
        id = "";
        logger.error("Forum API " + apiType.name() + " not implement yet!");
        break;
    }
    return id;
  }

  @Override
  protected void warmUpCompleteCallback() {}

  @Override
  protected void runOneRound(Consumer<Callable<APIType>> apiInvokeHandler) {
    final APIEndpoint apiEndpoint = nextRandomAPI();
    client.invokeBlocking(
        apiEndpoint, apiInvokeHandler, generateId(apiEndpoint.getApiType(), workloadConfig));
  }

  @Override
  protected void finished() {
    logger.info("Worker " + getWorkerId() + " finished.");
  }
}
