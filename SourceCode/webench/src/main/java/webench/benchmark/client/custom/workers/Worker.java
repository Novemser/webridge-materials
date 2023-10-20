package webench.benchmark.client.custom.workers;

import webench.benchmark.client.Client;
import webench.meta.BenchmarkConfig;
import webench.meta.perf.WorkerStatistics;
import java.util.Random;

import lombok.Getter;

@Getter
public abstract class Worker extends Thread implements Runnable {
  protected final Client client;
  protected final BenchmarkConfig config;
  protected final int workerId;
  protected boolean isWarmUpComplete;
  protected boolean isStopped;
  protected Random random;

  public void completeWarmUp() {
    isWarmUpComplete = true;
  }

  public void completeBenchmark() {
    isStopped = true;
  }

  public Worker(Client client, BenchmarkConfig config, int workerId) {
    this.client = client;
    this.config = config;
    this.workerId = workerId;
    // TODO: fix the seed for experiment reproduction
    this.random = new Random(workerId);
  }

  protected long currentTime() {
    return System.nanoTime();
  }

  public abstract WorkerStatistics getWorkerStatistics();
}
