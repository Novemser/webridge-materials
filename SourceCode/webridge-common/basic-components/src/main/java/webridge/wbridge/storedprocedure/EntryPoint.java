package webridge.wbridge.storedprocedure;

import webridge.wbridge.symbc.Constants;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;


public class EntryPoint implements Serializable {
  private static int ENTRY_POINT_COUNTER = 1;
  private static final String SP_DEFER_NAME_TEMPLATE = "%s_sp_%d_nd";

  private final String className;
  private final String method;
  private String spName;
  private final int lineNumber;
  private final List<String> symbolicInputs;
  private final List<String> symbolicInputsTypes;
  private final int curCounter;
  private String stackTrace;

  public static String API_NAME;

  public EntryPoint(
      String className,
      String method,
      int lineNumber,
      List<String> symbolicInputs,
      List<String> symbolicInputsTypes,
      String stackTrace) {
    this.className = className;
    this.method = method;
    this.lineNumber = lineNumber;
    this.curCounter = ENTRY_POINT_COUNTER++;
    this.spName = String.format(SPConfig.SP_NAME_TEMPLATE, API_NAME, curCounter, 0);
    this.symbolicInputs = new ArrayList<>(symbolicInputs);
    this.symbolicInputsTypes = new ArrayList<>(symbolicInputsTypes);
    this.stackTrace = stackTrace;
  }

  public static void initApiName() {
    String name = SPConfig.getConfig().getString(Constants.API_NAME_KEY);
    if (StringUtils.isNotEmpty(name)) {
      API_NAME = name;
      return;
    }

    API_NAME = "UNDEFINED";
  }

  public void resetSpName(int id) {
    this.spName = String.format(SPConfig.SP_NAME_TEMPLATE, API_NAME, id, 0);
  }

  public void resetDefferSpName(int id) {
    this.spName = String.format(SP_DEFER_NAME_TEMPLATE, API_NAME, id);
  }

  public void clearStackTrace() {
    this.stackTrace = "";
  }

  public int getSpIdCounter() {
    return curCounter;
  }

  public String getSpName() {
    return spName;
  }

  public List<String> getSymbolicInputsTypes() {
    return symbolicInputsTypes;
  }

  public String getClassName() {
    return className;
  }

  public String getMethod() {
    return method;
  }

  public int getLineNumber() {
    return lineNumber;
  }

  public List<String> getSymbolicInputs() {
    return symbolicInputs;
  }

  public String getStackTrace() {
    return stackTrace;
  }

  @Override
  public String toString() {
    return "EntryPoint{"
        + "className='"
        + className
        + '\''
        + ", method='"
        + method
        + '\''
        + ", lineNumber="
        + lineNumber
        + ", inputVars="
        + symbolicInputs
        + '}';
  }
}
