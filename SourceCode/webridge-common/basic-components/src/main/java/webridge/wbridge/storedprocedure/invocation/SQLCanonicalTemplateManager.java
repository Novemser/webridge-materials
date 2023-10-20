package webridge.wbridge.storedprocedure.invocation;

import webridge.wbridge.sql.SQLFormatter;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

class SQLCanonicalTemplateManager {
  private static final SQLCanonicalTemplateManager manager;

  static {
    manager = new SQLCanonicalTemplateManager();
  }

  static SQLCanonicalTemplateManager getInstance() {
    return manager;
  }

  // sql template cache. key: raw template, value: formatted template
  private static final Map<String, String> cache = new ConcurrentHashMap<>();

  private SQLCanonicalTemplateManager() {}

  String get(String template) {
    if (cache.containsKey(template)) {
      return cache.get(template);
    }
    String canonical = SQLFormatter.formatSQL(template);
    cache.put(template, canonical);
    return canonical;
  }
}
