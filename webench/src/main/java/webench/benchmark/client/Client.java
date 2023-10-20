package webench.benchmark.client;

import webench.meta.APIEndpoint;
import webench.meta.APIType;

import java.util.concurrent.Callable;
import java.util.function.Consumer;

public interface Client {
  /**
   * @param endpoint
   * @param args
   */
  void invokeBlocking(
          final APIEndpoint endpoint, Consumer<Callable<APIType>> apiInvokeHandler, Object... args);
}
