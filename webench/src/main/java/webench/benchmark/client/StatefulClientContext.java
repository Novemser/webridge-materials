package webench.benchmark.client;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import lombok.Data;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.http.client.protocol.HttpClientContext;

@Data
public class StatefulClientContext {
  private HttpClientContext clientContext;
  private Pair<String, String> authorizationHeader;
  private Set<Integer> addedItemIds;
  private long cartId = Long.MIN_VALUE;
  private final String userName;
  private final String password;
  private volatile boolean isInitialized;
  private final Map<String, Object> attributes = new ConcurrentHashMap<>();

  public void setAttribute(String key, Object val) {
    attributes.put(key, val);
  }

  public String getStringAttribute(String key) {
    if (attributes.containsKey(key)) return (String) attributes.get(key);
    return null;
  }

  public Long getLongAttribute(String key) {
    if (attributes.containsKey(key)) return (Long) attributes.get(key);
    return null;
  }
}
