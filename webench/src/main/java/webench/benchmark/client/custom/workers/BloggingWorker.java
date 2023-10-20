package webench.benchmark.client.custom.workers;

import webench.benchmark.client.Client;
import webench.meta.APIEndpoint;
import webench.meta.APIType;
import webench.meta.BenchmarkConfig;
import webench.meta.DbConfig;
import webench.meta.workload.WorkloadConfig;
import java.util.concurrent.Callable;
import java.util.function.Consumer;

import org.apache.commons.lang3.NotImplementedException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class BloggingWorker extends BaseWorker {
  private static final Logger logger = LogManager.getLogger();

  public BloggingWorker(
      Client client,
      BenchmarkConfig config,
      int workerId,
      WorkloadConfig workloadConfig,
      DbConfig dbConfig) {

    super(client, config, workerId, workloadConfig, dbConfig);
    logger.warn("Currently use a fixed id to proceed request for all the APIs of Blogging!");
  }

  protected String generateId(APIType apiType, WorkloadConfig config) {
    Integer totBlogs = config.getTotalNumRecords().get("Blog");
    String id = String.valueOf(random.nextInt(totBlogs));
    switch (apiType) {
      case EDITPOST:
      case CREATEPROJECT:
      case SHOWBLOGS:
        // CreateProject API does not require any id
        break;
      case EDITPROJECT:
        id = "platform";
        break;
      case GETBLOG:
      case EDITBLOG:
      case GETINDEX:
        return id;
      default:
        logger.error("Bloging API" + apiType.name() + "not implement yet!");
        break;
    }
    return id;
  }

  @Override
  protected void warmUpCompleteCallback() {}

  @Override
  protected void runOneRound(Consumer<Callable<APIType>> apiInvokeHandler) {
    final APIEndpoint apiEndpoint = nextRandomAPI();
    final String appName = workloadConfig.getAppName();
    final boolean isSagan = appName.equals("sagan");
    final boolean isMyBlog = appName.equals("myblog");
    if (isMyBlog) {
      switch (apiEndpoint.getApiType()) {
        case EDITPROJECT:
          apiEndpoint.setApiType(APIType.GETBLOG);
          break;
        case CREATEPROJECT:
          apiEndpoint.setApiType(APIType.GETINDEX);
          break;
        case EDITPOST:
          apiEndpoint.setApiType(APIType.EDITBLOG);
          break;
      }
    } else if (isSagan) {
      switch (apiEndpoint.getApiType()) {
        case EDITPROJECT:
        case CREATEPROJECT:
        case EDITPOST:
        case SHOWBLOGS:
          break;
      }
    } else {
      throw new NotImplementedException(appName);
    }

    client.invokeBlocking(
        apiEndpoint, apiInvokeHandler, generateId(apiEndpoint.getApiType(), workloadConfig));
  }

  @Override
  protected void finished() {
    logger.info("Worker " + getWorkerId() + " finished.");
  }
}
