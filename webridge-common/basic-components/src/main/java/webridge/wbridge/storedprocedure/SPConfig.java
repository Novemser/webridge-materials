package webridge.wbridge.storedprocedure;

import org.apache.commons.configuration2.Configuration;
import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.commons.configuration2.builder.fluent.Configurations;
import org.apache.commons.configuration2.ex.ConfigurationException;

import java.io.File;
import java.util.Iterator;
import java.util.Objects;

public class SPConfig {
  public static final boolean ENABLE_VALIDATION = false;
  // check the consistency between SQLs in web and SQLs in sp, which is useful for
  // debugging when ENABLE_VALIDATION is false
  public static final boolean ENABLE_SQL_CHECK = true;
  public static final boolean ALLOW_UNMATCHED_READ = false;
  public static final boolean ENABLE_DEFER_EXECUTION = false;
  // if enabled, each predicate is the path condition is checked
  public static final boolean SP_DEBUG = false;

  public static final boolean PRINT_SQL_MATCH_INFO = false;
  public static final boolean CHECK_ND_PARAM = true;
  public static final boolean EXPERIMENT_PREFETCH = false;
  public static final boolean FORCE_COMMIT_AT_COMMIT_SP = EXPERIMENT_PREFETCH;
//  public static final boolean FORCE_AUTOCOMMIT_USE_SQL_THAN_SP = !EXPERIMENT_PREFETCH;
  public static final boolean FORCE_AUTOCOMMIT_USE_SQL_THAN_SP = false;
  public static final boolean PREFETCH_PURE_SQL_MODE =
      EXPERIMENT_PREFETCH; // use SQL rather than SP to prefetch

  public static final String CSRF_TOKEN_NAME = "csrfToken";
  public static final String SESSION_PARAM_PREFIX = "SESSION_";
  public static final String REQUEST_PARAM_PREFIX = "REQUEST_PARAM_";
  public static final String REQUEST_PATH_PARAM_PREFIX = "REQUEST_PATH_";
  public static final String REQUEST_HEADER_PARAM_PREFIX = "REQUEST_HEADER_";
  public static final String REQUEST_BODY_PARAM_PREFIX = "REQUEST_BODY_";
  public static final String REQUEST_TOKEN_PARAM_PREFIX = "REQUEST_TOKEN_";
  public static final String FIELD_SEPARATOR = "_FIELD_";
  public static final String QUERY_ID_TEMPLATE = "QUERY_ID_";
  public static final String CURSOR_RS_INDICATOR_PREFIX = "cursor_cnt";
  public static final Integer INITIAL_STATE_QUERY_ID = -1;

  public static final String SP_NAME_TEMPLATE = "%s_sp_%d_ver%d";
  public static final String SP_DEF_FILE_SUFFIX = "SpDef.data";

  private static final Configurations configs = new Configurations();
  private static Configuration config;

  public static Configuration getConfig() {
    if (config == null) throw new RuntimeException("The configuration file is not properly initialized");
    return config;
  }

  public synchronized static void addConfig(File file) {
    try {
      PropertiesConfiguration properties = configs.properties(file);
      if (config == null) {
        config = properties;
        return;
      }

      // append all configs
      for (Iterator<String> it = properties.getKeys(); it.hasNext(); ) {
        String key = it.next();
        addConfig(key, properties.getString(key));
      }
    } catch (ConfigurationException e) {
      throw new RuntimeException(e);
    }
  }

  public synchronized static void addConfig(String key, Object value) {
    config.setProperty(key, value);
  }
}
