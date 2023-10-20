package webridge.storedprocedure.invocation;

import com.google.common.base.Joiner;
import webridge.storedprocedure.SPDefinition;
import java.sql.PreparedStatement;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.commons.lang3.tuple.Triple;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public abstract class SPInvocationUtils {
  private static final SQLCanonicalTemplateManager SQL_CANONICAL_TEMPLATE_MANAGER =
      SQLCanonicalTemplateManager.getInstance();
  private static final Log logger = LogFactory.getLog(SPInvocationUtils.class);

  // returns false if the current API is not enabled for SP execution
  public static boolean initializeSPState(
      String apiName,
      Pair<Map<String, SPDefinition>, String> spDefInfo,
      ThreadLocal<SpApiState> threadLocalApiState) {
    if (spDefInfo == null
        || spDefInfo.getLeft().isEmpty()
        || StringUtils.isEmpty(spDefInfo.getRight())) {
        threadLocalApiState.remove();
      return false;
    }
    threadLocalApiState.set(new SpApiState(apiName, spDefInfo));
    return true;
  }

  public static Triple<Long, Long, Long> getRecordingTime(
      ThreadLocal<SQLResultSetRecorder> SQL_RESULT_SET_RECORDER) {
    return Triple.of(
        SQL_RESULT_SET_RECORDER.get().selectRecordTime,
        SQL_RESULT_SET_RECORDER.get().updateRecordTime,
        SQL_RESULT_SET_RECORDER.get().txnRecordTime);
  }

  public static void endRecording(ThreadLocal<SQLResultSetRecorder> SQL_RESULT_SET_RECORDER) {
    SQL_RESULT_SET_RECORDER.remove();
  }

  public static String getNextSp(
      String firstSQL, SpApiState apiState, SPResultBuffer spBuffer, boolean enableHitRateCounter) {
    List<String> candidates =
        apiState.getLastInvokedSp() == null
            ? Collections.singletonList(apiState.getFirstSpName())
            : apiState.getSpDefOfCurrentApi(apiState.getLastInvokedSp()).getChildrenSpNames();
    if (candidates.isEmpty()) {
      if (enableHitRateCounter) {
        logger.warn("No next child candidate sp available");
        HitRateCounter.onException(apiState.getApiName());
      }
      return null;
    }

    PCEvaluator pcEvaluator = new PCEvaluator(spBuffer);

    candidates =
        candidates.stream()
            .filter(
                spName -> {
                  String requiredTemplate = null;
                  try {
                    requiredTemplate = apiState.getSpDefOfCurrentApi(spName).getSqlTemplateAt(0);
                    if (logger.isDebugEnabled())
                      logger.debug("1st requiredTemplate for " + spName + ":" + requiredTemplate);
                  } catch (WrongSQLException e) {
                    // should not reach here
                    logger.error("Should not reach here");
                    HitRateCounter.onException(apiState.getApiName());
                    throw new RuntimeException(e);
                  }
                  String incomingTemplate = firstSQL;
                  if (logger.isDebugEnabled())
                    logger.debug("1st incomingTemplate for " + spName + ":" + incomingTemplate);
                  requiredTemplate = SQL_CANONICAL_TEMPLATE_MANAGER.get(requiredTemplate);
                  incomingTemplate = SQL_CANONICAL_TEMPLATE_MANAGER.get(incomingTemplate);
                  final boolean templateEquals = requiredTemplate.equals(incomingTemplate);
                  if (logger.isDebugEnabled())
                    logger.debug(
                        "SP:"
                            + spName
                            + ", templateEquals:"
                            + templateEquals
                            + ", firstSQL:"
                            + firstSQL);
                  return templateEquals;
                })
            .filter(
                spName -> {
                  boolean res =
                      pcEvaluator.evaluate(apiState.getSpDefOfCurrentApi(spName).getEntryPc());
                  ;
                  if (logger.isDebugEnabled())
                    logger.debug("Evaluating pcs in " + spName + " results in: " + res);
                  return res;
                })
            .collect(Collectors.toList());

    if (candidates.isEmpty()) {
      if (enableHitRateCounter) {
        logger.warn("No candidate sp available");
        HitRateCounter.onException(apiState.getApiName());
      }
      return null;
    }
    //    assert candidates.size() == 1 : "Multiple sp!";

    if (candidates.size() != 1) {
      logger.warn(
          "Multiple candidate sp, the entry pc migh not be correct. Use the first candidate sp as default");
    }
    assert apiState.isRequireCommitLater()
        == apiState.getSpDefOfCurrentApi(candidates.get(0)).isContainsCommitBefore();
    if (logger.isDebugEnabled()) {
      logger.debug(String.format("Got candidate sp list:%s", Joiner.on(",").join(candidates)));
    }
    return candidates.get(0);
  }

  public static boolean isUpdateOrInsertSQL(String sql) {
    final String s = sql;
    return s.regionMatches(true, 0, "insert", 0, 6) || s.regionMatches(true, 0, "update", 0, 6);
    // final String s = sql.toLowerCase();
    // return s.startsWith("insert") || s.startsWith("update");
  }

  public static boolean executeQueryOrUpdateBasedOnSQL(String query, PreparedStatement ps) {
    try {
      if (isUpdateOrInsertSQL(query)) {
        int updated = ps.executeUpdate();
        if (logger.isInfoEnabled()) {
          logger.info(
              String.format(
                  "SQL %s Updated %d rows, ps.getUpdateCount=%d for ps at location %d",
                  query, updated, ps.getUpdateCount(), ps.hashCode()));
        }
        // update and insert SQL does not return result set
        return false;
      } else {
        return ps.execute();
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
