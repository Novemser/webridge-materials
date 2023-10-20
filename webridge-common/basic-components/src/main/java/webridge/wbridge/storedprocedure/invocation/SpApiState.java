package webridge.wbridge.storedprocedure.invocation;

import webridge.wbridge.storedprocedure.SPDefinition;
import java.util.Map;
import org.apache.commons.lang3.tuple.Pair;

public class SpApiState {
  private boolean invokingSp = true;
  private final String apiName;
  private final String firstSpName;
  private final Map<String, SPDefinition> spDefMaps; // <spName, spDef>
  private String lastInvokedSp = null;
  private boolean requireCommitLater = false;

  public SpApiState(String apiName, Pair<Map<String, SPDefinition>, String> spDefMaps) {
    this.apiName = apiName;
    this.spDefMaps = spDefMaps.getLeft();
    this.firstSpName = spDefMaps.getRight();
  }

  public boolean isInvokingSp() {
    return invokingSp;
  }

  public void setInvokingSp(boolean invokingSp) {
    this.invokingSp = invokingSp;
  }

  String getApiName() {
    return apiName;
  }

  String getLastInvokedSp() {
    return lastInvokedSp;
  }

  void setLastInvokedSp(String lastInvokedSp) {
    this.lastInvokedSp = lastInvokedSp;
  }

  public String getFirstSpName() {
    return firstSpName;
  }

  public SPDefinition getSpDefOfCurrentApi(String spName) {
    return spDefMaps.get(spName);
  }

  public boolean isRequireCommitLater() {
    return requireCommitLater;
  }

  public void setRequireCommitLater(boolean requireCommitLater) {
    this.requireCommitLater = requireCommitLater;
  }
}
