package webridge.wbridge.sql.result;

import webridge.wbridge.storedprocedure.SPConfig;
import webridge.wbridge.symbc.Constants;

import java.io.*;
import java.util.*;
import org.apache.commons.lang3.StringUtils;

public class QueryCounterManager {
  private static int nextCounter = 0;
  private static final int traceId;

  static {
    final String path = SPConfig.getConfig().getString(Constants.SQL_GRAPH_PATH_KEY);
    if (StringUtils.isEmpty(path)) {
      throw new RuntimeException("Miss sql graph dump file location config!");
    }
    final File parentDir = new File(path);

    final String PREFIX = "ver-";
    traceId =
        (!parentDir.exists()
                ? -1
                : Arrays.stream(Objects.requireNonNull(parentDir.listFiles()))
                    .filter(File::isFile)
                    .map(File::getName)
                    .filter(name -> name.startsWith(PREFIX))
                    .map(name -> Integer.valueOf(name.substring(PREFIX.length())))
                    .max(Integer::compareTo)
                    .orElse(-1))
            + 1;
  }

  public static int nextQueryId() {
    return ++nextCounter;
  }

  public static int getTraceId() {
    return traceId;
  }
}
