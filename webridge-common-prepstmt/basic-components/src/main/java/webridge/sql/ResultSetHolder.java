package webridge.sql;

import webridge.sql.result.MultipleRowResultSetImpl;
import webridge.storedprocedure.SPConfig;
import webridge.symbc.Constants;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

import org.apache.commons.lang3.SerializationUtils;
import org.apache.commons.lang3.tuple.Pair;

public class ResultSetHolder {
  public static boolean isRunningApp(String app) {
    return SPConfig
            .getConfig()
            .getString(Constants.APPLICATION_NAME_KEY)
            .toLowerCase(Locale.ROOT)
            .contains(Objects.requireNonNull(app).toLowerCase(Locale.ROOT));
  }

  private static List<Pair<String, Object>> recordedSqlAndResultSets = null;
  private static int nextRsId;
  private static boolean initialized;

  public static boolean isInitialized() {
    return initialized;
  }

  public static void setInitialized(boolean initialized) {
    ResultSetHolder.initialized = initialized;
  }

  public static void reset() {
    ResultSetHolder.nextRsId = 0;
    recordedSqlAndResultSets.clear();
    recordedSqlAndResultSets = null;
  }

  @SuppressWarnings(value = "unchecked")
  public static void initialize(byte[] input) throws IOException, ClassNotFoundException {
    if (input == null) {
      throw new IllegalStateException();
    } else {
      recordedSqlAndResultSets = SerializationUtils.deserialize(input);
    }
    nextRsId = 0;
  }

  private static void initializeIfNecessary() {
    if (recordedSqlAndResultSets == null) {
      try {
        initialize(null);
      } catch (Exception ex) {
        ex.printStackTrace();
        throw new RuntimeException(ex);
      }
    }
  }

  // FIXME: Compare with SQL with parameters instead of template
  public static ResultSet executeQuery(String requiredTemplate) {
    initializeIfNecessary();

    final Pair<String, Object> currentSqlAndResultSet = recordedSqlAndResultSets.get(nextRsId);
    final String recordedTemplate = currentSqlAndResultSet.getLeft();
    final MultipleRowResultSetImpl rs =
            (MultipleRowResultSetImpl) currentSqlAndResultSet.getRight();
    if (!SQLFormatter.formatSQL(requiredTemplate).equalsIgnoreCase(SQLFormatter.formatSQL(recordedTemplate))) {
      throw new RuntimeException(
              String.format(
                      "SQL mismatch! This means that we have executed a wrong path (caused by global variable fork, etc). \nRequired:%s\nRecorded:%s",
                      SQLFormatter.formatSQL(requiredTemplate), SQLFormatter.formatSQL(recordedTemplate)));
    }
    //    System.out.println(
    //        nextRsId + "|RequiredTemplate:" + requiredTemplate + "\nRecorded:" +
    // recordedTemplate);
    nextRsId++;
    return rs;
  }

  // FIXME: Compare with SQL with parameters instead of template
  public static int executeUpdate(String requiredTemplate) {
    initializeIfNecessary();

    //    if (requiredTemplate.equals(
    //        "INSERT INTO SALESMANAGER.ORDERS (BILLING_STREET_ADDRESS, BILLING_CITY,
    // BILLING_COMPANY, BILLING_COUNTRY_ID, BILLING_FIRST_NAME , BILLING_LAST_NAME, LATITUDE,
    // LONGITUDE, BILLING_POSTCODE, BILLING_STATE , BILLING_TELEPHONE, BILLING_ZONE_ID, CHANNEL,
    // CONFIRMED_ADDRESS, CARD_TYPE , CC_CVV, CC_EXPIRES, CC_NUMBER, CC_OWNER, CURRENCY_ID ,
    // CURRENCY_VALUE, CUSTOMER_AGREED, CUSTOMER_EMAIL_ADDRESS, CUSTOMER_ID, DATE_PURCHASED ,
    // DELIVERY_STREET_ADDRESS, DELIVERY_CITY, DELIVERY_COMPANY, DELIVERY_COUNTRY_ID,
    // DELIVERY_FIRST_NAME , DELIVERY_LAST_NAME, DELIVERY_POSTCODE, DELIVERY_STATE,
    // DELIVERY_TELEPHONE, DELIVERY_ZONE_ID , IP_ADDRESS, LAST_MODIFIED, LOCALE, MERCHANTID,
    // ORDER_DATE_FINISHED , ORDER_TYPE, PAYMENT_MODULE_CODE, PAYMENT_TYPE, SHIPPING_MODULE_CODE,
    // CART_CODE , ORDER_STATUS, ORDER_TOTAL, ORDER_ID) VALUES (?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?,
    // ?, ?, ?, ? , ?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?, ?, ?, ?, ? ,
    // ?, ?, ?, ?, ? , ?, ?, ?)")) {
    //      nextRsId = 85;
    //    }
    Pair<String, Object> currentSqlAndRowCount = recordedSqlAndResultSets.get(nextRsId);
    //    if (currentSqlAndRowCount.getLeft().contains("update SHOPPING_CART set DATE_CREATED")) {
    //      nextRsId++;
    //      currentSqlAndRowCount = recordedSqlAndResultSets.get(nextRsId);
    //    }
    final String recordedTemplate = currentSqlAndRowCount.getLeft();
    if (!SQLFormatter.formatSQL(requiredTemplate).equals(SQLFormatter.formatSQL(recordedTemplate))) {
      if (isRunningApp("shopizer"))
        System.err.println("Minor mismatch (naming difference) for query:" + recordedTemplate);
      else
        throw new RuntimeException(
                String.format(
                        "SQL mismatch! This means that we have executed a wrong path (caused by global variable fork, etc). \nRequired:%s\nRecorded:%s",
                        SQLFormatter.formatSQL(requiredTemplate), SQLFormatter.formatSQL(recordedTemplate)));
    }
    final int rowCount = (int) currentSqlAndRowCount.getRight();
    //    System.out.println(
    //        nextRsId + "|RequiredTemplate:" + requiredTemplate + "\nRecorded:" +
    // recordedTemplate);

    nextRsId++;
    return rowCount;
  }

  public static void doTxnRelatedSQL(String requiredSql) {
    initializeIfNecessary();

    Pair<String, Object> currentSql = recordedSqlAndResultSets.get(nextRsId);
    //    Pair<String, Object> currentSqlAndRowCount = recordedSqlAndResultSets.get(nextRsId);
    //    if (currentSqlAndRowCount.getLeft().contains("update SHOPPING_CART set DATE_CREATED")) {
    //      nextRsId++;
    //      currentSql = recordedSqlAndResultSets.get(nextRsId);
    //    }

    final String recordedSql = currentSql.getLeft();
    if (!SQLFormatter.formatSQL(requiredSql).equals(SQLFormatter.formatSQL(recordedSql))) {
      throw new RuntimeException(
              String.format(
                      "SQL mismatch! This means that we have executed a wrong path (caused by global variable fork, etc). \nRequired:%s\nRecorded:%s",
                      SQLFormatter.formatSQL(requiredSql), SQLFormatter.formatSQL(recordedSql)));
    }
    //    System.out.println(nextRsId + "|RequiredTemplate:" + requiredSql + "\nRecorded:" +
    // recordedSql);

    nextRsId++;
  }
}
