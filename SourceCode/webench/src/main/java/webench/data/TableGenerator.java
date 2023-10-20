package webench.data;

import webench.meta.workload.WorkloadConfig;
import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public interface TableGenerator {
  Logger logger = LogManager.getLogger(TableGenerator.class);

  default void prepareSchema(final Connection connection, WorkloadConfig config)
      throws SQLException {
    final ScriptRunner scriptRunner = new ScriptRunner(connection);
    try {
      final Reader reader =
          new BufferedReader(new FileReader(config.getSchemaDefinitionFileLocation()));
      scriptRunner.setLogWriter(new PrintWriter("/dev/null"));
      logger.info("Running application specific schema initialization script");
      scriptRunner.runScript(reader);
    } catch (FileNotFoundException e) {
      logger.error("Configuration of the schema definition file is invalid", e);
      throw new RuntimeException(e);
    }
  }

  void populateData(final Connection connection, WorkloadConfig config) throws SQLException;

  default int getBatchWriteSize() {
    return 10000;
  }
}
