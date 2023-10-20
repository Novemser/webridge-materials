package webridge.common.offline.compiler.config;

import webridge.wbridge.symbc.Constants;

public class ConfigTemplate {
  public static final String BASE_CONTENT =
      "target=dummy\n"
          + "sp.baseDir=${spdefDir}\n"
          + Constants.SPDEFS_PATH_KEY
          + "=${sp.baseDir}/sql/${apiName}\n"
          + Constants.SP_PATH_KEY
          + "=${sp.baseDir}/sql/${apiName}\n"
          + Constants.SPCONTEXT_PATH_KEY
          + "=${sp.baseDir}/sql/context/${apiName}\n"
          + Constants.SQL_GRAPH_PATH_KEY
          + "=${sp.baseDir}/sql/graph/${apiName}\n"
          + "sptracehash.path=/tmp/trace\n"
          + Constants.SCHEMA_DEF_FILE_KEY
          + "=${schemaSql}\n"
          + Constants.API_NAME_KEY
          + "=${apiName}";
}
