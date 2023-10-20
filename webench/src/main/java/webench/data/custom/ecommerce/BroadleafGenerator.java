package webench.data.custom.ecommerce;

import static webench.database.DBHelper.truncateTable;

import webench.data.IdGenerator;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.Configurator;

public class BroadleafGenerator extends ECommerceGenerator {
  private static final Logger logger = LogManager.getLogger(BroadleafGenerator.class);

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
    truncateTable(connection, "BLC_CATEGORY_PRODUCT_XREF");
    logger.info("Populating category/product relation table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` "
                + "(CATEGORY_PRODUCT_ID, DISPLAY_ORDER, "
                + "CATEGORY_ID, PRODUCT_ID) VALUES (?,?,?,?)")) {
      for (int productId = 0; productId < numProduct; productId++) {
        int catId =
            IdGenerator.nextIntByDistribution(numCategory, (productPercentilePerCategory), random);
        pstmt.setLong(1, productId);
        pstmt.setBigDecimal(2, new BigDecimal(productId % 100 + 1));
        pstmt.setLong(3, catId);
        pstmt.setLong(4, productId);
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
  }

  public void populateUser(Connection connection, Integer numUsers) throws SQLException {
    truncateTable(connection, "BLC_CUSTOMER");
    logger.info("Populating table user");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "insert into `BLC_CUSTOMER` (CUSTOMER_ID, EMAIL_ADDRESS, FIRST_NAME, LAST_NAME, PASSWORD, USER_NAME, IS_REGISTERED, DEACTIVATED) values (?,?,?,?,?,?,true,false)")) {
      for (int userId = 0; userId < numUsers; userId++) {
        pstmt.setLong(1, userId);
        pstmt.setString(2, userId + "@school.edu");
        pstmt.setString(3, userId + ".first");
        pstmt.setString(4, userId + ".lase");
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
  }

  public void populateProduct(
      Connection connection,
      Integer numProduct,
      Integer numBrands,
      List<Double> productsPercentilePerBrand)
      throws SQLException {
    validateDistribution(productsPercentilePerBrand);
    truncateTable(connection, "BLC_PRODUCT");
    truncateTable(connection, "BLC_PRODUCT_ATTRIBUTE");
    truncateTable(connection, "BLC_SKU");
    truncateTable(connection, "BLC_PRODUCT_OPTION");
    truncateTable(connection, "BLC_PRODUCT_OPTION_XREF");
    truncateTable(connection, "BLC_PRODUCT_OPTION_VALUE");
    truncateTable(connection, "BLC_SKU_MEDIA_MAP");
    logger.info("Populating products table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `BLC_PRODUCT` VALUES (?,NULL,NULL,NULL,NULL,_binary '\\0','ABCD',NULL,NULL,NULL,_binary '\\0',?,NULL,NULL,?)")) {
      for (int productId = 0; productId < numProduct; productId++) {
        pstmt.setLong(1, productId);
        pstmt.setString(2, IdGenerator.productUrlFromId(productId));
        pstmt.setLong(3, productId); // sku
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

    logger.info("Populating product attribute table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `BLC_PRODUCT_ATTRIBUTE` "
                + "(PRODUCT_ATTRIBUTE_ID, NAME, VALUE, PRODUCT_ID) VALUES (?,'heatRange',?,?)")) {
      for (int attrId = 0; attrId < numProduct; attrId++) {
        pstmt.setLong(1, attrId);
        pstmt.setString(2, String.valueOf(random.nextInt(5)));
        pstmt.setLong(3, attrId);
        pstmt.addBatch();
        if (attrId % getBatchWriteSize() == 0) {
          logAndExecuteBatch(pstmt, attrId);
        }
      }
      if (logger.isInfoEnabled()) {
        logger.info(
            String.format("executing batch of size %d, index at the end", getBatchWriteSize()));
      }
      pstmt.executeBatch();
    }

    logger.info("Populating product brands in attribute table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `BLC_PRODUCT_ATTRIBUTE` "
                + "(PRODUCT_ATTRIBUTE_ID, NAME, VALUE, PRODUCT_ID) VALUES (?,'Brand',?,?)")) {
      int attrIdBegin = numProduct;
      final int threshold = numBrands / productsPercentilePerBrand.size();
      for (int attrId = numProduct; attrIdBegin < numProduct * 2; attrIdBegin++) {
        final int brandId =
            IdGenerator.nextIntByDistribution(numBrands, productsPercentilePerBrand, random);
        // the first number in productsPercentilePerBrand indicates the percentile of products
        // that does not have a brand.
        if (brandId <= threshold) {
          continue;
        }
        pstmt.setLong(1, attrId);
        pstmt.setString(2, "BRAND_" + brandId);
        pstmt.setLong(3, numProduct * 2 - attrId);
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

    logger.info("Populating skus table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `BLC_SKU` (SKU_ID, ACTIVE_START_DATE, COST, "
                + "DISCOUNTABLE_FLAG, DESCRIPTION, NAME, "
                + "RETAIL_PRICE, TAXABLE_FLAG, DEFAULT_PRODUCT_ID) VALUES "
                + "(?,'1995-11-06 00:00:00',3.99,'Y',?,?,5.99,'Y',?)")) {
      for (int productId = 0; productId < numProduct; productId++) {
        pstmt.setLong(1, productId);
        pstmt.setString(2, "DESCRIPTION_" + productId);
        pstmt.setString(3, "SKU_" + productId);
        pstmt.setLong(4, productId);
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
  }

  public void populateCategory(Connection connection, Integer numCategory) throws SQLException {
    truncateTable(connection, "BLC_CATEGORY");
    logger.info("Populating category table");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO `BLC_CATEGORY` (CATEGORY_ID, ACTIVE_START_DATE, DESCRIPTION, NAME) VALUES "
                + "(?,'1995-03-12 00:00:00',?,?)")) {
      for (int categoryId = 0; categoryId < numCategory; categoryId++) {
        pstmt.setLong(1, categoryId);
        pstmt.setString(2, "DESCRIPTION_" + categoryId);
        pstmt.setString(3, "NAME_" + categoryId);
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
  }
}
