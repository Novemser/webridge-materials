package webench.data.custom.ecommerce;

import webench.data.TableGenerator;
import webench.meta.Schema;
import webench.meta.workload.WorkloadConfig;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

import org.apache.ibatis.jdbc.ScriptRunner;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.Configurator;

public abstract class ECommerceGenerator implements TableGenerator {
  private static final Logger logger = LogManager.getLogger(ECommerceGenerator.class);
  protected final Random random;

  static {
    Configurator.setLevel(logger.getName(), Level.INFO);
  }

  public ECommerceGenerator() {
    random = new Random(42);
  }

  @Override
  public void prepareSchema(Connection connection, WorkloadConfig workloadConfig)
      throws SQLException {
    final Map<String, Integer> totalNumRecords =
        Objects.requireNonNull(workloadConfig.getTotalNumRecords());
    if (logger.isDebugEnabled()) {
      logger.debug("Preparing schema for eCommerce application");
    }
    assert totalNumRecords.size() > 0;

    // TODO we need to have a schema mapping in configuration.
    //  Currently just manually do this by a initialization script
    final ScriptRunner scriptRunner = new ScriptRunner(connection);
    try {
      final Reader reader =
          new BufferedReader(new FileReader(workloadConfig.getSchemaDefinitionFileLocation()));
      scriptRunner.setLogWriter(new PrintWriter("/dev/null"));
      logger.info("Running application specific schema initialization script");
      scriptRunner.runScript(reader);
    } catch (FileNotFoundException e) {
      logger.error("Configuration of the schema definition file is invalid", e);
      throw new RuntimeException(e);
    }
  }

  @Override
  public void populateData(Connection connection, WorkloadConfig workloadConfig)
      throws SQLException {
    final Map<String, Integer> totalNumRecords =
        Objects.requireNonNull(workloadConfig.getTotalNumRecords());
    if (logger.isDebugEnabled()) {
      logger.debug("Populating database for eCommerce application");
    }
    assert totalNumRecords.size() > 0;

    // TODO we need to have a schema mapping in configuration.
    //  Currently just manually do this for each application
    final Integer numUsers = Objects.requireNonNull(totalNumRecords.get(Schema.TABLE_USER));
    final Integer numCategory = Objects.requireNonNull(totalNumRecords.get(Schema.TABLE_CATEGORY));
    final Integer numProduct = Objects.requireNonNull(totalNumRecords.get(Schema.TABLE_PRODUCT));
    final Integer numBrand = Objects.requireNonNull(totalNumRecords.get(Schema.TABLE_BRAND));
    // Step 1: raw data
    // user
    populateUser(connection, numUsers);
    // category
    populateCategory(connection, numCategory);
    // product
    populateProduct(
        connection, numProduct, numBrand, workloadConfig.getProductsPercentilePerBrand());

    // Step 2: the relations
    // product & category
    populateCategoryForEachProduct(
        connection, numProduct, numCategory, workloadConfig.getProductPercentilePerCategory());
    // commit the pending writes when all data population finished
    connection.commit();
  }

  public abstract void populateCategoryForEachProduct(
      Connection connection,
      Integer numProduct,
      Integer numCategory,
      List<Double> productPercentilePerCategory)
      throws SQLException;

  public abstract void populateCategory(Connection connection, Integer numCategory)
      throws SQLException;

  public abstract void populateProduct(
      Connection connection,
      Integer numProduct,
      Integer numBrands,
      List<Double> productsPercentilePerBrand)
      throws SQLException;

  public abstract void populateUser(Connection connection, Integer numUsers) throws SQLException;

  protected void validateDistribution(List<Double> distribution) {
    final Optional<Double> result = distribution.stream().reduce(Double::sum);
    assert result.isPresent();
    assert result.get() - 100 < 1e-2 || 100 - result.get() < 1e-2
        : "result does not sum to 100:" + result.get();
  }

  protected void logAndExecuteBatch(PreparedStatement pstmt, int productId) throws SQLException {
    if (logger.isInfoEnabled()) {
      logger.info(
          String.format("executing batch of size %d, index at %d", getBatchWriteSize(), productId));
    }
    pstmt.executeBatch();
  }
}
