package webridge.wbridge.storedprocedure.invocation;

import com.mysql.jdbc.JDBC42PreparedStatement;
import com.mysql.jdbc.ServerPreparedStatement;
import webridge.wbridge.storedprocedure.SPConfig;
import webridge.wbridge.storedprocedure.utils.SPUtils;
import java.lang.reflect.Proxy;
import java.math.BigDecimal;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.commons.lang3.tuple.Triple;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import webridge.common.utils.NamedStopWatch;
import webridge.wbridge.sql.SQLFormatter;

public class SPSQLValidator {
  protected static final Log logger = LogFactory.getLog(SPSQLValidator.class);

  private static final SPSQLValidator validator = new SPSQLValidator();

  public static SPSQLValidator getInstance() {
    return validator;
  }

  private SPSQLValidator() {}

  // sql template cache manager. key: raw template, value: formatted template
  private static final SQLCanonicalTemplateManager SQL_CANONICAL_TEMPLATE_MANAGER =
      SQLCanonicalTemplateManager.getInstance();

  public enum ValidateFlag {
    OK,
    TemplateMismatch,
    ParamMismatch
  }

  public static class ValidateResult {
    public ValidateFlag flag;
    public String executedSqlTemplate;
    public String incomingSqlTemplate;

    public ValidateResult(
        ValidateFlag flag, String executedSqlTemplate, String incomingSqlTemplate) {
      this.flag = flag;
      this.executedSqlTemplate = executedSqlTemplate;
      this.incomingSqlTemplate = incomingSqlTemplate;
    }
  }

  public static Triple<String, byte[][], int[]> parsePreparedStatement(PreparedStatement invokingPs)
      throws SQLException {
    final SQLCanonicalTemplateManager mgr = SQL_CANONICAL_TEMPLATE_MANAGER;
    final String incomingSQLTemplate;
    final byte[][] incomingParams;
    final int[] incomingParamTypes;
    if (invokingPs instanceof ServerPreparedStatement) {
      final ServerPreparedStatement serverPs = (ServerPreparedStatement) invokingPs;
      incomingSQLTemplate = serverPs.getNonRewrittenSql();
      incomingParams = null;
      throw new RuntimeException("Not handled " + invokingPs);
    } else if (invokingPs instanceof Proxy
        || invokingPs
            .getClass()
            .getCanonicalName()
            .equals("com.zaxxer.hikari.pool.HikariProxyPreparedStatement")
    || invokingPs instanceof JDBC42PreparedStatement) {
      try {
        final SPUtils.PrepareStmtMeta parsingResult = SPUtils.parseIncomingPreparedStmt(invokingPs);
        incomingParamTypes = parsingResult.paramTypes;
        incomingParams = parsingResult.parameters;
        final String incomingRawTemplate = parsingResult.sqlTemplate;
        incomingSQLTemplate = mgr.get(incomingRawTemplate);
      } catch (Exception e) {
        throw new RuntimeException(e);
      }
    } else throw new RuntimeException("Unexpected ps type:" + invokingPs);
    return Triple.of(incomingSQLTemplate, incomingParams, incomingParamTypes);
  }

  public ValidateResult validateSQLTemplateAndParam(
      PreparedStatement invokingPs,
      String sqlTemplateInSp,
      List<Pair<Integer, Object>> executedParams)
      throws SQLException {
    final String executedSQLTemplate = SQL_CANONICAL_TEMPLATE_MANAGER.get(sqlTemplateInSp);
    NamedStopWatch.begin("validate-sql-prepare");
    // get incoming sql template info
    Triple<String, byte[][], int[]> pstmsMeta = parsePreparedStatement(invokingPs);
    final String incomingSQLTemplate = pstmsMeta.getLeft();
    final byte[][] incomingParams = pstmsMeta.getMiddle();
    final int[] incomingParamTypes = pstmsMeta.getRight();

    ValidateResult validateResult =
        new ValidateResult(ValidateFlag.OK, executedSQLTemplate, incomingSQLTemplate);
    if (SPConfig.EXPERIMENT_PREFETCH) {
      NamedStopWatch.end("validate-sql-prepare");
      return validateResult;
    }
    // FIXME: formatting SQL for validation during runtime may incur high overhead
    // The formatting is used due to a bug in Shopizer, that template acquired from JPF
    // uses `db_name`.`tbl_name` instead of `tbl_name`, and the formatter removes the `db_name`.
    NamedStopWatch.end("validate-sql-prepare");

    NamedStopWatch.begin("validate-sql-format");
    //    logger.warn(
    //        String.format(
    //            "[Validation] Expected:\n %s\nActual:\n %s",
    //            formatSQL(incomingSQLTemplate).replace("\n", " "),
    //            formatSQL(executedSQLTemplate).replace("\n", " ")));
    if (!SQLFormatter.formatSQL(incomingSQLTemplate).equals(SQLFormatter.formatSQL(executedSQLTemplate))) {
      validateResult.flag = ValidateFlag.TemplateMismatch;
      return validateResult;
    }
    NamedStopWatch.end("validate-sql-format");
    NamedStopWatch.begin("validate-sql-param");
    boolean res =
        validateParameters(
            executedParams,
            incomingParams,
            incomingParamTypes,
            invokingPs.getParameterMetaData(),
            incomingSQLTemplate);
    NamedStopWatch.end("validate-sql-param");
    if (!res) {
      validateResult.flag = ValidateFlag.ParamMismatch;
      return validateResult;
    }
    return validateResult;
  }

  private static boolean validateParameters(
      List<Pair<Integer, Object>> actualParams,
      byte[][] expectedParams,
      int[] expectedParamTypes,
      ParameterMetaData parameterMetaData,
      String expectedSqlTemplate)
      throws SQLException {
    int incomingParameterCount = parameterMetaData.getParameterCount();
    assert incomingParameterCount == expectedParamTypes.length;
    if (actualParams.size() != incomingParameterCount)
      throw new RuntimeException("Unmatched number of SQL parameters!");

    boolean res = true;

    for (int i = 0; i < incomingParameterCount; i++) {
      int actualParamType = actualParams.get(i).getLeft();
      Object actualParamVal = actualParams.get(i).getRight();

      int expectedParamType = expectedParamTypes[i];
      String expectedParamVal;
      byte[] expectedParamBytes = expectedParams[i];
      if (expectedParamBytes[0] != '\'') expectedParamVal = new String(expectedParamBytes);
      else expectedParamVal = new String(expectedParamBytes, 1, expectedParamBytes.length - 2);

      // check parameter type
      //      if (actualParamType != expectedParamType) {
      //        boolean specialCase =
      //            (actualParamType == Types.CHAR && expectedParamType == Types.VARCHAR)
      //                || (actualParamType == Types.VARCHAR && expectedParamType == Types.CHAR)
      //                || (expectedParamType == Types.NULL);
      //        if (!specialCase) {
      //          System.err.printf(
      //              "Parameter type mismatch! IncomingType=%s, actualType=%s, sqlTemplate=%ss%n",
      //              expectedParamType, actualParamType, SPUtils.densify(incomingSQLTemplate));
      //          res = false;
      //        }
      //      }

      // check defered paramaeters
      //      int colId = i + 1;
      //      String spName = invokedSpName.get();
      //      Map<Integer, Set<Integer>> deferParamByQueryId =
      // deferedParameterMeta.get().get(spName);
      //      if (deferParamByQueryId != null) {
      //        Set<Integer> deferParamsByColId = deferParamByQueryId.get(queryId);
      //        if (deferParamsByColId != null) {
      //          if (deferParamsByColId.contains(colId)) {
      //            System.err.println(
      //                String.format(
      //                    "Ignore defered parameters at %d, type %d, for query %d in sp %s",
      //                    colId, actualParamType, queryId, spName));
      //            storeParam(String.format(DEFER_PARAM_KEY, spName, queryId, colId),
      // actualParamVal);
      //            continue;
      //          }
      //        }
      //      }

      // check equality of of parameters
      boolean valid;
      if (actualParamVal instanceof BigDecimal) { // remove trailing zeros
        valid = ((BigDecimal) actualParamVal).compareTo(new BigDecimal(expectedParamVal)) == 0;
      } else if (actualParamVal instanceof Boolean) { // convert to bit representation
        valid =
            (Boolean) actualParamVal
                ? ("1".equals(expectedParamVal))
                : ("0".equals(expectedParamVal));
      } else if (actualParamType == expectedParamType && actualParamType == Types.TIMESTAMP) {
        // ignore timestamp comparison
        valid = true;
      } else if (actualParamType == expectedParamType
          && actualParamType == Types.BIGINT
          && actualParamVal != null
//          && Math.abs((Long) actualParamVal - System.currentTimeMillis()) < 1000 * 1000
      ) {
        // use system-interceptor to intercept currentTimeMillis result and uncomment the above line
        assert expectedSqlTemplate.contains("BLC_ORDER_LOCK")
            || expectedSqlTemplate.contains("blc_order_lock");
        // this is a unix timestamp
        valid = true;
      } else if (actualParamType == expectedParamType && actualParamType == Types.VARCHAR) {
        expectedParamVal = expectedParamVal.replace("\\", "");
        valid = expectedParamVal.equals(String.valueOf(actualParamVal));
      } else {
        valid = expectedParamVal.equals(String.valueOf(actualParamVal));
        if (!valid
            && NumberUtils.isCreatable(expectedParamVal)
            && NumberUtils.isCreatable(String.valueOf(actualParamVal))) {
          valid =
              Double.valueOf(expectedParamVal)
                  .equals(Double.valueOf(String.valueOf(actualParamVal)));
        }
      }
      if (!valid) {
        logger.error(
            String.format(
                "Parameter mismatch at position %d! expected=%s, executed=%s, sqlTemplate=%s%n",
                i, expectedParamVal, actualParamVal, SPUtils.densify(expectedSqlTemplate)));
        res = false;
      }
    }
    if (SPConfig.PRINT_SQL_MATCH_INFO)
      logger.info(String.format("matched SQL! %s%n", SPUtils.densify(expectedSqlTemplate)));
    return res;
  }

  public ValidateResult validateTxnControlSQL(String incomingSQL, String executedSQL) {
    incomingSQL = SQL_CANONICAL_TEMPLATE_MANAGER.get(incomingSQL);
    executedSQL = SQL_CANONICAL_TEMPLATE_MANAGER.get(executedSQL);
    //    logger.warn(
    //        String.format(
    //            "[Validation] Expected:\n %s\nActual:\n %s",
    //            formatSQL(incomingSQL).replace("\n", " "), formatSQL(executedSQL).replace("\n", "
    // ")));

    ValidateResult validateResult = new ValidateResult(ValidateFlag.OK, executedSQL, incomingSQL);
    if (!incomingSQL.equals(executedSQL)) {
      validateResult.flag = ValidateFlag.TemplateMismatch;
    }
    return validateResult;
  }
}
