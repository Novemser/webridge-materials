package webridge.wbridge.storedprocedure.invocation.prefetch;

import webridge.wbridge.storedprocedure.SPDefinition;
import webridge.wbridge.storedprocedure.invocation.SPResultBuffer;
import java.util.Map;
import org.apache.commons.lang3.tuple.Pair;

public abstract class PrefetchUtils {
  public static void initializePrefetch(
          Pair<Map<String, SPDefinition>, String> spDefInfo, SPResultBuffer buffer) {
    AsyncPrefetcher.init(spDefInfo.getLeft(), buffer, spDefInfo.getRight());
  }
}
