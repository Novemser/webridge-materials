package webridge.graph.processor;

import webridge.graph.SQLGraph;
import webridge.storedprocedure.SPConfig;
import webridge.symbc.Constants;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import org.apache.commons.lang3.StringUtils;

/** restore the base SQLGraph from file */
public class SQLGraphRestorer implements SQLGraphProcessor {
  @Override
  @SuppressWarnings("unchecked")
  public void process(SQLGraphWrapper graphWrapper) {
    final String path = SPConfig.getConfig().getString(Constants.SQL_GRAPH_PATH_KEY);
    List<SQLGraph> baseGraph;
    if (StringUtils.isEmpty(path)) {
      throw new RuntimeException("Miss sql graph dump file location config!");
    }
    final File parentDir = new File(path);

    final String PREFIX = "ver-";
    final int prevVersion =
        !parentDir.exists()
            ? -1
            : Arrays.stream(Objects.requireNonNull(parentDir.listFiles()))
                .filter(File::isFile)
                .map(File::getName)
                .filter(name -> name.startsWith(PREFIX))
                .map(name -> Integer.valueOf(name.substring(PREFIX.length())))
                .max(Integer::compareTo)
                .orElse(-1);
    if (prevVersion == -1) {
      baseGraph = new ArrayList<>();
    } else {
      try {
        final FileInputStream fis =
            new FileInputStream(String.format("%s/%s%d", path, PREFIX, prevVersion));
        final ObjectInputStream ois = new ObjectInputStream(new BufferedInputStream(fis));
        baseGraph = (List<SQLGraph>) ois.readObject();
      } catch (IOException | ClassNotFoundException e) {
        throw new RuntimeException(e);
      }
    }
    graphWrapper.setBaseGraph(baseGraph);
  }
}
