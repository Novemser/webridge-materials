package webridge.common.spring.filter;

import com.google.common.collect.ImmutableMap;
import java.util.Map;
import java.util.Objects;
import org.springframework.core.Ordered;

public abstract class FilterOrders {
  private static final int HI = Ordered.HIGHEST_PRECEDENCE;

  private static final Map<Class<?>, Integer> filterOrders =
      ImmutableMap.of(
          BenchmarkTimingFilter.class, HI + 10,
          StoredProcedureControlFilter.class, HI + 2,
          ResultSetTracerFilter.class, HI + 1,
          TraceRecordingFilter.class, HI,
          ConcolicEntryPointFilter.class, HI);

  public static int of(Class<?> filterClass) {
    return Objects.requireNonNull(filterOrders.get(filterClass));
  }
}
