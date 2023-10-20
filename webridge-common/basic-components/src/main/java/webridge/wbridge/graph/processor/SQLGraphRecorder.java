package webridge.wbridge.graph.processor;

import com.google.common.base.Joiner;
import webridge.wbridge.graph.SQLGraph;
import webridge.wbridge.graph.SQLNode;
import webridge.wbridge.graph.SingleTraceSQLGraph;
import webridge.wbridge.sql.SymSQL;
import webridge.wbridge.storedprocedure.SPConfig;
import webridge.wbridge.storedprocedure.SPDefinition;
import webridge.wbridge.symbc.Constants;
import webridge.wbridge.util.FileUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.nio.file.Paths;
import java.util.*;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** record the final SQLGraph to file if necessary */
public class SQLGraphRecorder implements SQLGraphProcessor {
  private int version;
  private static final Logger logger = LoggerFactory.getLogger(SQLGraphRecorder.class);

  @Override
  public void process(SQLGraphWrapper graphWrapper) {
    //    if (alreadyCompiled(graphWrapper)) {
    //      logger.warn(
    //          "Current path " + QueryCounterManager.getTraceId() + " already compiled,
    // skipping...");
    //      return;
    //    }
    //    if (true) return;
    recordSQLGraphToFile(graphWrapper.getFinalGraphs());

    recordSQLTemplatesToFile(graphWrapper.getFinalGraphs());
    recordSpSQLToFile(graphWrapper.getSpDefinitions());
    recordSpDefsToFile(graphWrapper.getSpDefinitions());
    recordTraceHashToFile(graphWrapper.getTraceSubGraphs());
    recordSpDefsTopologicOrderToFile(graphWrapper.getSpDefinitions());
  }

//  private boolean alreadyCompiled(SQLGraphWrapper graphWrapper) {
//    final String path = SPConfig.getConfig().getString(Constants.SP_TRACE_HASH_KEY);
//    if (StringUtils.isEmpty(path)) {
//      throw new RuntimeException("Miss sp trace hash dump file location config!");
//    }
//    final File parentDir = new File(path);
//    FileUtils.ensureDirs(parentDir, true);
//
//    final String PREFIX = "ver-";
//    final File[] hashes = parentDir.listFiles((dir, name) -> name.startsWith(PREFIX));
//    final byte[] hash = getTraceHash(graphWrapper.getTraceSubGraphs());
//    assert hashes != null;
//    for (File file : hashes) {
//      try {
//        final byte[] existing = Files.readAllBytes(file.toPath());
//        final boolean equals = Arrays.equals(existing, hash);
//        if (equals) return true;
//      } catch (IOException e) {
//        logger.error(e);
//        throw new RuntimeException(e);
//      }
//    }
//
//    return false;
//  }

  private void recordSpDefsTopologicOrderToFile(List<SPDefinition> spDefinitions) {
    final String path = SPConfig.getConfig().getString(Constants.SQL_GRAPH_PATH_KEY);
    if (StringUtils.isEmpty(path)) {
      throw new RuntimeException("Miss sql graph dump file location config!");
    }
    final String PREFIX = "ver-";
    final StringBuilder builder = new StringBuilder();
    Objects.requireNonNull(spDefinitions)
        .forEach(
            def ->
                builder
                    .append("spName:")
                    .append(def.getSpName())
                    .append(", children:")
                    .append(Joiner.on("|").join(def.getChildrenSpNames()))
                    .append(", pcEntry:")
                    .append(def.getEntryPc())
                    .append(", paramVars:")
                    .append(def.getParameterVars())
                    .append("\n"));
    try (final FileOutputStream fos =
        new FileOutputStream(String.format("%s/dependency-%s%d", path, PREFIX, version))) {
      fos.write(builder.toString().getBytes());
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void recordSQLGraphToFile(List<SQLGraph> graphs) {
    final String path = SPConfig.getConfig().getString(Constants.SQL_GRAPH_PATH_KEY);
    if (StringUtils.isEmpty(path)) {
      throw new RuntimeException("Miss sql graph dump file location config!");
    }
    final File parentDir = new File(path);
    FileUtils.ensureDirs(parentDir, true);

    final String PREFIX = "ver-";
    version = getMaxVerInDir(parentDir, PREFIX) + 1;

    try (ObjectOutputStream oos =
        new ObjectOutputStream(
            new FileOutputStream(String.format("%s/%s%d", path, PREFIX, version)))) {
      oos.writeObject(graphs);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  protected static Integer getMaxVerInDir(File parentDir, String PREFIX) {
    return Arrays.stream(Objects.requireNonNull(parentDir.listFiles()))
        //        .filter(File::isFile)
        .map(File::getName)
        .filter(name -> name.startsWith(PREFIX))
        .map(name -> Integer.valueOf(name.substring(PREFIX.length())))
        .max(Integer::compareTo)
        .orElse(-1);
  }

  private void recordSQLTemplatesToFile(List<SQLGraph> graphs) {
    final String path = SPConfig.getConfig().getString(Constants.SP_PATH_KEY);
    if (StringUtils.isEmpty(path)) {
      throw new RuntimeException("Miss sp output file location config!");
    }
    final File baseDir = new File(path);
    FileUtils.ensureDirs(baseDir, true);

    StringBuilder concreteSqls = new StringBuilder();
    StringBuilder sqlTemplates = new StringBuilder();
    final String PREFIX = "ver-";
    final String extendedLocation = Paths.get(path, PREFIX + version).toString();
    FileUtils.ensureDirs(new File(extendedLocation), true);

    //    int sqlIdx = 1;
    for (int cnt = 0; cnt < graphs.size(); ++cnt) {
      SQLGraph graph = graphs.get(cnt);
      Iterator<SymSQL> sqlIterator = graph.getSymSQLList();
      assert sqlIterator.hasNext();
      StringBuilder sb = new StringBuilder();
      while (sqlIterator.hasNext()) {
        SymSQL s = sqlIterator.next();
        sb.append("SqlNo=").append(s.getSqlNo()).append("\n").append(s.toString());
        sqlTemplates.append("SqlNo=").append(s.getSqlNo()).append("\n").append(s.toString());
        //        sqlIdx++;
        concreteSqls.append(s.getConcreteSql()).append("\n");
      }
      sqlTemplates
          .append("\n")
          .append("======================================================")
          .append("\n");
      FileUtils.writeBytesToFile(
          sb.toString().getBytes(),
          String.format("%s/graph-SQLTemplate-%d-ver%d.sql", path, cnt + 1, version));
      FileUtils.writeBytesToFile(
          sb.toString().getBytes(),
          String.format("%s/graph-SQLTemplate-%d-ver%d.sql", extendedLocation, cnt + 1, version));
    }
    FileUtils.writeBytesToFile(
        sqlTemplates.toString().getBytes(),
        String.format("%s/graph-SQLTemplate-all-ver%d.sql", path, version));
    FileUtils.writeBytesToFile(
        concreteSqls.toString().getBytes(),
        String.format("%s/graph-ConcreteSQL-ver%d.sql", path, version));

    FileUtils.writeBytesToFile(
        sqlTemplates.toString().getBytes(),
        Paths.get(extendedLocation, String.format("graph-SQLTemplate-all-ver%d.sql", version))
            .toString());
    FileUtils.writeBytesToFile(
        concreteSqls.toString().getBytes(),
        Paths.get(extendedLocation, String.format("/graph-ConcreteSQL-ver%d.sql", version))
            .toString());
  }

  private void recordSpSQLToFile(List<SPDefinition> spDefinitions) {
    final String path = SPConfig.getConfig().getString(Constants.SP_PATH_KEY);
    if (StringUtils.isEmpty(path)) {
      throw new RuntimeException("Miss sp output file location config!");
    }
    final File baseDir = new File(path);
    FileUtils.ensureDirs(baseDir, true);

    final String PREFIX = "ver-";
    final String extendedLocation = Paths.get(path, PREFIX + version).toString();
    FileUtils.ensureDirs(new File(extendedLocation), true);
    spDefinitions.forEach(
        spDef -> {
          String outputSpName = spDef.getSpName();
          FileUtils.writeBytesToFile(
              spDef.getSpSQL().getBytes(), String.format("%s/graph-SP-%s.sql", path, outputSpName));
          FileUtils.writeBytesToFile(
              spDef.getSpSQL().getBytes(),
              String.format("%s/graph-SP-%s.sql", extendedLocation, outputSpName));
        });

    FileUtils.writeBytesToFile(
        FUNCTION_SQL.getBytes(), String.format("%s/graph-SP-function.sql", path));
    FileUtils.writeBytesToFile(
        FUNCTION_SQL.getBytes(), String.format("%s/graph-SP-function.sql", extendedLocation));
  }

  private void recordSpDefsToFile(List<SPDefinition> spDefinitions) {
    final String path = SPConfig.getConfig().getString(Constants.SPDEFS_PATH_KEY);
    if (StringUtils.isEmpty(path)) {
      throw new RuntimeException("Miss SpDef output file location config!");
    }
    final File parentDir = new File(path);
    FileUtils.ensureDirs(parentDir, true);
    if (spDefinitions == null || spDefinitions.isEmpty()) return;
    String spName = spDefinitions.get(0).getSpName();

    try (ObjectOutputStream oos =
        new ObjectOutputStream(
            new FileOutputStream(String.format("%s/graph-%s-SpDef.data", path, spName)))) {
      oos.writeObject(spDefinitions);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void recordTraceHashToFile(List<SingleTraceSQLGraph> traceList) {
    final String path = SPConfig.getConfig().getString(Constants.SP_TRACE_HASH_KEY);
    if (StringUtils.isEmpty(path)) {
      throw new RuntimeException("Miss sp trace hash dump file location config!");
    }
    final File parentDir = new File(path);
    FileUtils.ensureDirs(parentDir, true);

    final String PREFIX = "ver-";

    try (FileOutputStream fos =
        new FileOutputStream(String.format("%s/%s%d", path, PREFIX, version))) {
      final byte[] hash = getTraceHash(traceList);
      fos.write(hash);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private byte[] getTraceHash(List<SingleTraceSQLGraph> traceList) {
    SQLNode node = traceList.get(traceList.size() - 1).getRootNode();
    while (!node.getChildNodes().isEmpty()) {
      node = node.getChildNodes().get(0);
    }
    final byte[] hash = node.getAllSQLConditions().get(0).toString().getBytes();
    return hash;
  }

  private static final String FUNCTION_SQL =
      "DROP FUNCTION IF EXISTS c_decimal;\n"
          + "DELIMITER $$\n"
          + "CREATE FUNCTION c_decimal(i BIGINT, s INT) RETURNS DECIMAL(19, 5)\n"
          + "BEGIN\n"
          + "RETURN i / POWER(10, s);\n"
          + "END$$\n"
          + "DELIMITER ;\n"
          + "\n"
          + "DROP FUNCTION IF EXISTS get_int_compact;\n"
          + "DELIMITER $$\n"
          + "CREATE FUNCTION get_int_compact(d CHAR(19)) RETURNS INT\n"
          + "BEGIN\n"
          + "RETURN CONVERT(REPLACE(d, '.', ''), SIGNED);\n"
          + "END$$\n"
          + "DELIMITER ;\n"
          + "\n"
          + "DROP FUNCTION IF EXISTS get_scale;\n"
          + "DELIMITER $$\n"
          + "CREATE FUNCTION get_scale(d CHAR(19)) RETURNS INT\n"
          + "BEGIN\n"
          + "IF NOT POSITION('.' in d) THEN\n"
          + "RETURN 0;\n"
          + "END IF;\n"
          + "RETURN CHAR_LENGTH(d) - POSITION('.' in d);\n"
          + "END$$\n"
          + "DELIMITER ;\n"
          + "\n"
          + "DROP FUNCTION IF EXISTS u_rshift;\n"
          + "DELIMITER $$\n"
          + "CREATE FUNCTION u_rshift(n BIGINT, s BIGINT) RETURNS BIGINT\n"
          + "BEGIN\n"
          + "IF n > 0 THEN\n"
          + "RETURN n >> s;\n"
          + "END IF;\n"
          + "RETURN (n >> s) + (2 << ~s);\n"
          + "END$$\n"
          + "DELIMITER ;\n"
          + "\n"
          + "DROP FUNCTION IF EXISTS index_of;\n"
          + "DELIMITER $$\n"
          + "CREATE FUNCTION index_of(long_str CHAR(255), short_str CHAR(255)) RETURNS INT\n"
          + "BEGIN\n"
          + "RETURN POSITION(short_str IN long_str) - 1;\n"
          + "END$$\n"
          + "DELIMITER ;\n"
          + "\n"
          + "DROP FUNCTION IF EXISTS last_index_of_char_from;\n"
          + "DELIMITER $$\n"
          + "CREATE FUNCTION last_index_of_char_from(long_str CHAR(255), ch INT, from_pos INT) RETURNS INT\n"
          + "BEGIN\n"
          + "DECLARE considered_long_str CHAR(255);\n"
          + "DECLARE reversed_considered_long_str CHAR(255);\n"
          + "SET considered_long_str = SUBSTRING(long_str, 1, 1 + from_pos);\n"
          + "SET reversed_considered_long_str = REVERSE(considered_long_str);\n"
          + "IF POSITION(CHAR(ch) IN reversed_considered_long_str) = 0 THEN\n"
          + "RETURN -1;\n"
          + "ELSE\n"
          + "RETURN LENGTH(considered_long_str) - POSITION(CHAR(CH) IN reversed_considered_long_str);\n"
          + "END IF;\n"
          + "END$$\n"
          + "DELIMITER ;\n"
          + "\n"
          + "\n"
          + "DROP FUNCTION IF EXISTS Convert_ext;\n"
          + "DELIMITER $$\n"
          + "CREATE FUNCTION Convert_ext(str CHAR(255)) RETURNS INT\n"
          + "BEGIN\n"
          + "IF STRCMP(str, \"true\") = 0 THEN\n"
          + "RETURN 1;\n"
          + "ELSE IF STRCMP(str, \"false\") = 0 THEN\n"
          + "RETURN 0;\n"
          + "END IF;\n"
          + "END IF;\n"
          + "RETURN (CONVERT(str, SIGNED));\n"
          + "END$$\n"
          + "DELIMITER ;";
}
