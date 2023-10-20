package webench.benchmark.client.custom.workers;

import webench.benchmark.client.Client;
import webench.data.IdGenerator;
import webench.meta.workload.WorkloadConfig;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.function.Consumer;

import webench.meta.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ECommerceWorker extends BaseWorker {
  private static final Logger logger = LogManager.getLogger();

  public ECommerceWorker(
      Client client,
      BenchmarkConfig config,
      int workerId,
      WorkloadConfig workloadConfig,
      DbConfig dbConfig) {
    super(client, config, workerId, workloadConfig, dbConfig);
  }

  @Override
  protected void warmUpCompleteCallback() {}

  @Override
  protected void runOneRound(Consumer<Callable<APIType>> apiInvokeHandler) {
    final APIEndpoint apiEndpoint = nextRandomAPI();
    client.invokeBlocking(
        apiEndpoint,
        apiInvokeHandler,
        generateNextProductId(apiEndpoint.getApiType(), workloadConfig),
        generateNextUserId(apiEndpoint.getApiType(), workloadConfig));
  }

  @Override
  protected void finished() {
    logger.info("Worker " + getWorkerId() + " finished.");
  }

  protected int generateNextUserId(APIType apiType, WorkloadConfig config) {
    // getUserId by ApiType
    // generate user id with the distribution
    final List<Double> distributions;
    switch (apiType) {
      case ADD:
      case REMOVE:
        distributions = config.getAddsPercentilePerUser();
        break;
      case PURCHASE:
        distributions = config.getPurchasesPercentilePerUser();
        break;
      case VIEW:
        distributions = config.getViewsPercentilePerUser();
        break;
      default:
        throw new IllegalStateException();
    }
    return IdGenerator.nextIntByDistribution(
        config.getTotalNumRecords().get(Schema.TABLE_USER), distributions, random);
  }

  protected int generateNextProductId(APIType apiType, WorkloadConfig config) {
    // getProductId by ApiType
    final List<Double> distributions;
    switch (apiType) {
      case ADD:
      case REMOVE:
        distributions = config.getAddsPercentilePerProduct();
        break;
      case PURCHASE:
        distributions = config.getPurchasesPercentilePerProduct();
        break;
      case VIEW:
        distributions = config.getViewsPercentilePerProduct();
        break;
      default:
        throw new IllegalStateException();
    }
    return IdGenerator.nextIntByDistribution(
        config.getTotalNumRecords().get(Schema.TABLE_PRODUCT), distributions, random);
  }
}
