package webridge.wbridge.sql.ast;

import com.alibaba.druid.sql.SQLUtils;
import com.alibaba.druid.sql.dialect.mysql.visitor.MySqlSchemaStatVisitor;
import com.alibaba.druid.util.JdbcConstants;
import webridge.wbridge.util.FileUtils;
import java.io.File;
import java.io.PrintStream;
import org.apache.commons.lang3.StringUtils;

public abstract class SqlVisitorUtils {

  public static final String CREATE_CUSTOMER_TABLE =
      "CREATE TABLE `BLC_CUSTOMER` (\n"
          + "  `CUSTOMER_ID` bigint NOT NULL,\n"
          + "  `CREATED_BY` bigint DEFAULT NULL,\n"
          + "  `DATE_CREATED` datetime DEFAULT NULL,\n"
          + "  `DATE_UPDATED` datetime DEFAULT NULL,\n"
          + "  `UPDATED_BY` bigint DEFAULT NULL,\n"
          + "  `CHALLENGE_ANSWER` varchar(255) DEFAULT NULL,\n"
          + "  `DEACTIVATED` bit(1) DEFAULT NULL,\n"
          + "  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,\n"
          + "  `EXTERNAL_ID` varchar(255) DEFAULT NULL,\n"
          + "  `FIRST_NAME` varchar(255) DEFAULT NULL,\n"
          + "  `IS_TAX_EXEMPT` bit(1) DEFAULT NULL,\n"
          + "  `LAST_NAME` varchar(255) DEFAULT NULL,\n"
          + "  `PASSWORD` varchar(255) DEFAULT NULL,\n"
          + "  `PASSWORD_CHANGE_REQUIRED` bit(1) DEFAULT NULL,\n"
          + "  `IS_PREVIEW` bit(1) DEFAULT NULL,\n"
          + "  `RECEIVE_EMAIL` bit(1) DEFAULT NULL,\n"
          + "  `IS_REGISTERED` bit(1) DEFAULT NULL,\n"
          + "  `TAX_EXEMPTION_CODE` varchar(255) DEFAULT NULL,\n"
          + "  `USER_NAME` varchar(255) DEFAULT NULL,\n"
          + "  `CHALLENGE_QUESTION_ID` bigint DEFAULT NULL,\n"
          + "  `LOCALE_CODE` varchar(255) DEFAULT NULL,\n"
          + "  PRIMARY KEY (`CUSTOMER_ID`),\n"
          + "  KEY `CUSTOMER_CHALLENGE_INDEX` (`CHALLENGE_QUESTION_ID`),\n"
          + "  KEY `CUSTOMER_EMAIL_INDEX` (`EMAIL_ADDRESS`),\n"
          + "  KEY `FK4utjhbg9600iwhb05m40wspj1` (`LOCALE_CODE`),\n"
          + "  CONSTRAINT `FK4utjhbg9600iwhb05m40wspj1` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `BLC_LOCALE` (`LOCALE_CODE`),\n"
          + "  CONSTRAINT `FKsgsex6rdheq2nm6pl23gggtqs` FOREIGN KEY (`CHALLENGE_QUESTION_ID`) REFERENCES `BLC_CHALLENGE_QUESTION` (`QUESTION_ID`)\n"
          + ");";

  public static final String CREATE_LOCALE_TABLE =
      "CREATE TABLE `BLC_LOCALE` (\n"
          + "  `LOCALE_CODE` varchar(255) NOT NULL,\n"
          + "  `DEFAULT_FLAG` bit(1) DEFAULT NULL,\n"
          + "  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,\n"
          + "  `USE_IN_SEARCH_INDEX` bit(1) DEFAULT NULL,\n"
          + "  `CURRENCY_CODE` varchar(255) DEFAULT NULL,\n"
          + "  PRIMARY KEY (`LOCALE_CODE`),\n"
          + "  KEY `FK6gs37rhrtyd5ei2oqspxxrc3x` (`CURRENCY_CODE`),\n"
          + "  CONSTRAINT `FK6gs37rhrtyd5ei2oqspxxrc3x` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`)\n"
          + ");";

  public static final String CREATE_CURRENCY_TABLE =
      "CREATE TABLE `BLC_CURRENCY` (\n"
          + "  `CURRENCY_CODE` varchar(255) NOT NULL,\n"
          + "  `DEFAULT_FLAG` bit(1) DEFAULT NULL,\n"
          + "  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,\n"
          + "  PRIMARY KEY (`CURRENCY_CODE`)\n"
          + ");";

  public static void populateVisitorWithSchemaInfo(
      MySqlSchemaStatVisitor visitor, String schemaFilePath) {
    if (StringUtils.isNotEmpty(schemaFilePath)) {
      // disable the logging to stderr temporally to avoid verbose log during SQL schema parsing
      final PrintStream err = System.err;
      try {
        System.setErr(new PrintStream("/dev/null"));
        final String contentsAsString = FileUtils.getContentsAsString(new File(schemaFilePath));
        SQLUtils.parseStatements(contentsAsString, JdbcConstants.MYSQL)
            .forEach(s -> s.accept(visitor));
      } catch (Exception e) {
        throw new RuntimeException(e);
      } finally {
        System.setErr(err);
      }
    } else {
      System.err.println(
          "[ Warning ] No schema file found, only partial schema info loaded for broadleaf, may encounter SQL extraction issue!");
      SQLUtils.parseSingleStatement(CREATE_CUSTOMER_TABLE, JdbcConstants.MYSQL).accept(visitor);
      SQLUtils.parseSingleStatement(CREATE_LOCALE_TABLE, JdbcConstants.MYSQL).accept(visitor);
      SQLUtils.parseSingleStatement(CREATE_CURRENCY_TABLE, JdbcConstants.MYSQL).accept(visitor);
    }
  }
}
