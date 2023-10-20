package webridge.storedprocedure.invocation.prefetch;

import webridge.storedprocedure.SPDefinition;
import java.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ParameterState {
  protected static final Log logger = LogFactory.getLog(ParameterState.class);

  private final Set<String> parameterNames;
  private final int expectedNumOfParameters;
  private final Map<String, Object> parameterValues;
  private final String spName;

  public ParameterState(List<String> parameters, String spName) {
    this.parameterNames = new HashSet<>(parameters);
    this.parameterValues = new HashMap<>();
    int ndParamCnt = ndParamCnt(parameters);
    this.expectedNumOfParameters = parameters.size() - ndParamCnt;
    this.spName = spName;
    // if (logger.isErrorEnabled()) {
    //   logger.error(
    //       String.format("#params=%d, #ND param=%d, sp:%s", parameters.size(), ndParamCnt,
    // spName));
    // }
  }

  public static ParameterState of(SPDefinition spDefinition) {
    List<String> parameterVars = spDefinition.getParameterVars();
    return new ParameterState(parameterVars, spDefinition.getSpName());
  }

  public static ParameterState empty() {
    return new ParameterState(Collections.emptyList(), null);
  }

  // returns whether the sp had all required parameters set
  public boolean store(String name, Object value) {
    if (!parameterNames.contains(name)) return false;
    //    if (parameterValues.containsKey(name)) {
    //      throw new RuntimeException("Duplicate stored parameter [" + name + "," + value + "]");
    //    }

    parameterValues.put(name, value);
    //    logger.info(
    //        spName
    //            + " prefetch state -- ParamValsSize:"
    //            + parameterValues.size()
    //            + ", expected:"
    //            + expectedNumOfParameters);
    //    logger.info("parameterValues:" + parameterValues);
    return parameterValues.size() == expectedNumOfParameters;
  }

  public boolean parametersReady() {
    return parameterValues.size() == expectedNumOfParameters;
  }

  public boolean hasNoParam() {
    return expectedNumOfParameters == 0;
  }

  private int ndParamCnt(List<String> paramList) {
    return Math.toIntExact(
        paramList.stream().filter(s -> s.contains("__nd__func__currentTimeMs__42__")).count());
  }
}
