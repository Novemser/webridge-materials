package webench.data.custom.ecommerce;

import webench.data.IdGenerator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import webench.database.DBHelper;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.Configurator;

public class ShopizerGenerator extends ECommerceGenerator {
  private static final Logger logger = LogManager.getLogger(ShopizerGenerator.class);

  private final int DEFAULT_STORE_ID = 1;
  private final String DEFAULT_DATE = "'1995-03-12 00:00:00'";

  static {
    Configurator.setLevel(logger.getName(), Level.INFO);
  }

  public void populateCategoryForEachProduct(
      Connection connection,
      Integer numProduct,
      Integer numCategory,
      List<Double> productPercentilePerCategory)
      throws SQLException {
    validateDistribution(productPercentilePerCategory);
    DBHelper.truncateTable(connection, "PRODUCT_CATEGORY");
    logger.info("Populating category/product relation table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `PRODUCT_CATEGORY` " + "(CATEGORY_ID, PRODUCT_ID) VALUES (?,?)")) {
      for (int productId = 0; productId < numProduct; productId++) {
        int catId =
            IdGenerator.nextIntByDistribution(numCategory, (productPercentilePerCategory), random);
        pstmt.setLong(1, catId);
        pstmt.setLong(2, productId);
        pstmt.addBatch();
        if (productId % getBatchWriteSize() == 0) {
          logAndExecuteBatch(pstmt, productId);
        }
      }
      if (logger.isInfoEnabled()) {
        logger.info(
            String.format("executing batch of size %d, index at the end", getBatchWriteSize()));
      }
      pstmt.executeBatch();
    }
    DBHelper.optimizeTable(connection, "PRODUCT_CATEGORY");
  }

  public void populateUser(Connection connection, Integer numUsers) throws SQLException {
    DBHelper.truncateTable(connection, "CUSTOMER");
    logger.info("Populating table user");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "insert into `CUSTOMER` (CUSTOMER_ID, CUSTOMER_EMAIL_ADDRESS, "
                + "BILLING_FIRST_NAME, BILLING_LAST_NAME, CUSTOMER_PASSWORD, BILLING_COUNTRY_ID, "
                + "LANGUAGE_ID, MERCHANT_ID, BILLING_ZONE_ID, CUSTOMER_NICK, CUSTOMER_ANONYMOUS) values (?,?,?,?,?,13,1,1,9,?,0)")) {
      for (int userId = 0; userId < numUsers; userId++) {
        pstmt.setLong(1, userId);
        pstmt.setString(2, userId + "@abcdefg.abc");
        pstmt.setString(3, userId + ".first");
        pstmt.setString(4, userId + ".last");
        pstmt.setString(5, IdGenerator.userPasswordFromId(userId));
        pstmt.setString(6, IdGenerator.userNameFromId(userId));
        pstmt.addBatch();
        if (userId % getBatchWriteSize() == 0) {
          logAndExecuteBatch(pstmt, userId);
        }
      }
      if (logger.isInfoEnabled()) {
        logger.info(
            String.format("executing batch of size %d, index at the end", getBatchWriteSize()));
      }
      pstmt.executeBatch();
    }
    DBHelper.optimizeTable(connection, "CUSTOMER");
  }

  public void populateProduct(
      Connection connection,
      Integer numProduct,
      Integer numBrands,
      List<Double> productsPercentilePerBrand)
      throws SQLException {
    validateDistribution(productsPercentilePerBrand);
    DBHelper.truncateTable(connection, "PRODUCT");
    DBHelper.truncateTable(connection, "PRODUCT_AVAILABILITY");
    DBHelper.truncateTable(connection, "PRODUCT_PRICE");
    DBHelper.truncateTable(connection, "PRODUCT_PRICE_DESCRIPTION");
    DBHelper.truncateTable(connection, "PRODUCT_TYPE");
    DBHelper.truncateTable(connection, "PRODUCT_DESCRIPTION");
    logger.info("Populating products table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `PRODUCT` (PRODUCT_ID, MERCHANT_ID, SKU, SORT_ORDER, "
                + "DATE_CREATED, DATE_MODIFIED, "
                + "AVAILABLE, PREORDER, PRODUCT_VIRTUAL, PRODUCT_SHIP, PRODUCT_FREE) "
                + "VALUES (?,?,?,0,'1995-03-12 00:00:00','1995-03-12 00:00:00', 1, 0, 0, 0, 0)")) {
      for (int productId = 0; productId < numProduct; productId++) {
        pstmt.setLong(1, productId);
        pstmt.setInt(2, DEFAULT_STORE_ID);
        pstmt.setString(3, "SKU_" + productId); // sku
        pstmt.addBatch();
        if (productId % getBatchWriteSize() == 0) {
          logAndExecuteBatch(pstmt, productId);
        }
      }
      if (logger.isInfoEnabled()) {
        logger.info(
            String.format("executing batch of size %d, index at the end", getBatchWriteSize()));
      }
      pstmt.executeBatch();
    }

    logger.info("Populating products description table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `PRODUCT_DESCRIPTION` (DESCRIPTION_ID, PRODUCT_ID, "
                + "NAME, LANGUAGE_ID, "
                + "DATE_CREATED, DATE_MODIFIED) "
                + "VALUES (?,?,?,1,'1995-03-12 00:00:00','1995-03-12 00:00:00')")) {
      for (int productId = 0; productId < numProduct; productId++) {
        pstmt.setLong(1, productId);
        pstmt.setLong(2, productId);
        pstmt.setString(3, "PRODUCT_NAME_" + productId); // sku
        pstmt.addBatch();
        if (productId % getBatchWriteSize() == 0) {
          logAndExecuteBatch(pstmt, productId);
        }
      }
      if (logger.isInfoEnabled()) {
        logger.info(
            String.format("executing batch of size %d, index at the end", getBatchWriteSize()));
      }
      pstmt.executeBatch();
    }

    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `PRODUCT_AVAILABILITY` (PRODUCT_AVAIL_ID, MERCHANT_ID, "
                + "PRODUCT_ID, QUANTITY, QUANTITY_ORD_MAX, QUANTITY_ORD_MIN,"
                + "DATE_CREATED, DATE_MODIFIED, DATE_AVAILABLE, "
                + "STATUS, FREE_SHIPPING, REGION) "
                + "VALUES (?,?,"
                + "?,?,0,0,"
                + "'1995-03-12 00:00:00','1995-03-12 00:00:00', '2020-12-21',"
                + "1, 0, '*')")) {
      for (int productId = 0; productId < numProduct; productId++) {
        pstmt.setLong(1, productId);
        pstmt.setInt(2, DEFAULT_STORE_ID);
        pstmt.setInt(3, productId);
        pstmt.setInt(4, Integer.MAX_VALUE);

        pstmt.addBatch();
        if (productId % getBatchWriteSize() == 0) {
          logAndExecuteBatch(pstmt, productId);
        }
      }
      if (logger.isInfoEnabled()) {
        logger.info(
            String.format("executing batch of size %d, index at the end", getBatchWriteSize()));
      }
      pstmt.executeBatch();
    }

    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `PRODUCT_PRICE` (PRODUCT_PRICE_ID, PRODUCT_PRICE_CODE,"
                + "PRODUCT_AVAIL_ID, PRODUCT_PRICE_AMOUNT, PRODUCT_PRICE_TYPE, DEFAULT_PRICE) "
                + "VALUES (?,'base',"
                + "?,1.99,'ONE_TIME', 0)")) {
      for (int productId = 0; productId < numProduct; productId++) {
        pstmt.setLong(1, productId);
        pstmt.setLong(2, productId);
        pstmt.addBatch();
        if (productId % getBatchWriteSize() == 0) {
          logAndExecuteBatch(pstmt, productId);
        }
      }
      if (logger.isInfoEnabled()) {
        logger.info(
            String.format("executing batch of size %d, index at the end", getBatchWriteSize()));
      }
      pstmt.executeBatch();
    }

    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `PRODUCT_PRICE_DESCRIPTION` (DESCRIPTION_ID, NAME, LANGUAGE_ID, PRODUCT_PRICE_ID) "
                + "VALUES (?, 'Base Price', 1, ?)")) {
      for (int productId = 0; productId < numProduct; productId++) {
        pstmt.setLong(1, productId);
        pstmt.setLong(2, productId);
        pstmt.addBatch();
        if (productId % getBatchWriteSize() == 0) {
          logAndExecuteBatch(pstmt, productId);
        }
      }
      if (logger.isInfoEnabled()) {
        logger.info(
            String.format("executing batch of size %d, index at the end", getBatchWriteSize()));
      }
      pstmt.executeBatch();
    }

    logger.info("Populating product brands in PRODUCT_TYPE table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `PRODUCT_TYPE` "
                + "(PRODUCT_TYPE_ID, PRD_TYPE_CODE, MERCHANT_ID, PRD_TYPE_ADD_TO_CART) "
                + "VALUES (?,?,?,1)")) {
      int attrIdBegin = 0;
      final int threshold = numBrands / productsPercentilePerBrand.size();
      for (int attrId = 0; attrIdBegin < numProduct; attrIdBegin++) {
        final int brandId =
            IdGenerator.nextIntByDistribution(numBrands, productsPercentilePerBrand, random);
        // the first number in productsPercentilePerBrand indicates the percentile of products
        // that does not have a brand.
        if (brandId <= threshold) {
          continue;
        }
        pstmt.setLong(1, attrId);
        pstmt.setString(2, "BRAND_" + brandId);
        pstmt.setLong(3, DEFAULT_STORE_ID);
        pstmt.addBatch();
        if (attrId % getBatchWriteSize() == 0) {
          logAndExecuteBatch(pstmt, attrId);
        }
        attrId++;
      }
      if (logger.isInfoEnabled()) {
        logger.info(
            String.format("executing batch of size %d, index at the end", getBatchWriteSize()));
      }
      pstmt.executeBatch();
    }
    DBHelper.optimizeTable(connection, "PRODUCT");
    DBHelper.optimizeTable(connection, "PRODUCT_AVAILABILITY");
    DBHelper.optimizeTable(connection, "PRODUCT_PRICE");
    DBHelper.optimizeTable(connection, "PRODUCT_PRICE_DESCRIPTION");
    DBHelper.optimizeTable(connection, "PRODUCT_TYPE");
    DBHelper.optimizeTable(connection, "PRODUCT_DESCRIPTION");
  }

  public void populateCategory(Connection connection, Integer numCategory) throws SQLException {
    DBHelper.truncateTable(connection, "CATEGORY");
    DBHelper.truncateTable(connection, "CATEGORY_DESCRIPTION");
    logger.info("Populating category table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `CATEGORY` (CATEGORY_ID, CODE, MERCHANT_ID, DATE_CREATED, DATE_MODIFIED, "
                + "VISIBLE, CATEGORY_STATUS, FEATURED, SORT_ORDER) VALUES "
                + "(?,?,?,'1995-03-12 00:00:00','1995-03-12 00:00:00', 0, 0, 0, 0)")) {
      for (int categoryId = 0; categoryId < numCategory; categoryId++) {
        pstmt.setLong(1, categoryId);
        pstmt.setString(2, "CODE_" + categoryId);
        pstmt.setInt(3, DEFAULT_STORE_ID);

        pstmt.addBatch();
        if (categoryId % getBatchWriteSize() == 0) {
          logAndExecuteBatch(pstmt, categoryId);
        }
      }
      if (logger.isInfoEnabled()) {
        logger.info(
            String.format("executing batch of size %d, index at the end", getBatchWriteSize()));
      }
      pstmt.executeBatch();
    }
    DBHelper.optimizeTable(connection, "CATEGORY");
    DBHelper.optimizeTable(connection, "CATEGORY_DESCRIPTION");
  }
}
