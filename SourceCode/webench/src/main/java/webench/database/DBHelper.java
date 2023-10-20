package webench.database;

import webench.meta.DbConfig;
import java.sql.*;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public abstract class DBHelper {
  private static final Logger logger = LogManager.getLogger();

  public static Connection initializeMySQLConnection(DbConfig dbConfig) {
    try {
      Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      throw new RuntimeException(e);
    }
    final String dbUrl =
        String.format(
            "jdbc:mysql://%s:%d/%s?useUnicode=true&characterEncoding=utf8&useSSL=false&useLocalSessionState=true&rewriteBatchedStatements=true",
            dbConfig.getHost(), dbConfig.getPort(), dbConfig.getDatabase());

    logger.info("Connecting to database with url:" + dbUrl);
    try {
      return DriverManager.getConnection(dbUrl, dbConfig.getUsername(), dbConfig.getPassword());
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public static void disableFKCheck(Connection connection) throws SQLException {
    try (final Statement statement = connection.createStatement()) {
      statement.execute("SET foreign_key_checks = 0");
    }
  }

  public static void enableFKCheck(Connection connection) throws SQLException {
    try (final Statement statement = connection.createStatement()) {
      statement.execute("SET foreign_key_checks = 1");
    }
  }

  public static void optimizeTable(Connection connection, String tableName) {
    logger.info("optimizing table " + tableName);
    try (final Statement statement = connection.createStatement()) {
      statement.execute("optimize table `" + tableName + "`");
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public static void truncateTable(Connection connection, String tableName) {
    logger.info("truncating table " + tableName);
    try (final Statement statement = connection.createStatement()) {
      statement.execute("truncate `" + tableName + "`");
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public static void checkNumOfRecords(
      Connection connection, String tableName, Integer numberOfRecords) {
    try (final Statement statement = connection.createStatement()) {
      final ResultSet resultSet =
          statement.executeQuery("select count(1) from `" + tableName + "`");
      resultSet.next();
      final int actual = resultSet.getInt(1);
      if (actual != numberOfRecords)
        throw new RuntimeException(
            "Table "
                + tableName
                + " has invalid number of records:"
                + " Expected["
                + numberOfRecords
                + "],Actual["
                + actual
                + "]");
    } catch (SQLException e) {
      logger.error("Error executing Count Table SQL for " + tableName);
      throw new RuntimeException(e);
    }
  }
}
