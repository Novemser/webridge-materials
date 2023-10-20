package webridge.storedprocedure;

import webridge.graph.SQLCondition;
import webridge.storedprocedure.invocation.WrongSQLException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;
import org.apache.commons.lang3.tuple.Pair;

public class SPDefinition implements Serializable {
  private final String apiName;
  private final String spName;
  private final transient String spSQL;
  // following three are used for invoking next sp
  private SQLCondition entryPc;
  private final List<String> childrenSpNames; // candidate sp after finishing calling this
  private final List<String> parameterVars;
  // following one is used for validation
  private final List<String> sqlTemplates;
  // following one is used for partial rollback.
  // savePoint name corresponding to sqlTemplates, null indicates no savepoint for the sql.
  private final List<String> savePointNames;
  // following two mapping are used for storing SQL ResultSet into local buffer
  private final Map<Integer, String> sqlRetCntVarNamesMap; // sqlId -> varName
  private final Map<Integer, List<List<String>>>
      sqlSelectColumnVarNamesMap; // sqlId -> var name of each rows
  private List<Pair<Integer, String>> firstSqlParamsToCollect; // (paramId, paramName)
  private boolean containsCommitBefore;

  public SPDefinition(String apiName, String spName, String spSQL) {
    this.apiName = apiName;
    this.spName = spName;
    this.spSQL = spSQL;
    this.childrenSpNames = new ArrayList<>();
    this.parameterVars = new ArrayList<>();
    this.sqlTemplates = new ArrayList<>();
    this.savePointNames = new ArrayList<>();
    this.sqlRetCntVarNamesMap = new HashMap<>();
    this.sqlSelectColumnVarNamesMap = new HashMap<>();
    this.firstSqlParamsToCollect = new ArrayList<>();
  }

  public String getCallSpStatement() {
    StringBuilder result = new StringBuilder("call " + spName + "(");
    IntStream.range(0, parameterVars.size())
        .forEach(
            i -> {
              result.append("?");
              if (i != parameterVars.size() - 1) {
                result.append(", ");
              }
            });
    result.append(")");
    return result.toString();
  }

  public boolean containsSavepoint() {
    return !savePointNames.isEmpty();
  }

  public String getApiName() {
    return apiName;
  }

  public String getSpName() {
    return spName;
  }

  public String getSpSQL() {
    return spSQL;
  }

  public SQLCondition getEntryPc() {
    return entryPc;
  }

  public void setEntryPc(SQLCondition entryPc) {
    this.entryPc = entryPc;
  }

  public List<String> getChildrenSpNames() {
    return childrenSpNames;
  }

  public void addChildSpName(String childSpName) {
    this.childrenSpNames.add(childSpName);
  }

  public List<String> getParameterVars() {
    return parameterVars;
  }

  public void addParameterVar(String paramVar) {
    this.parameterVars.add(paramVar);
  }

  public String getSqlTemplateAt(int sqlIdx) throws WrongSQLException {
    if (sqlIdx >= sqlTemplates.size()) throw new WrongSQLException("Index out of bound");
    return sqlTemplates.get(sqlIdx);
  }

  public String getSavePointAt(int sqlIdx) {
    if (sqlIdx >= savePointNames.size()) return "";
    return savePointNames.get(sqlIdx);
  }

  public void addSqlTemplates(String sqlTemplate) {
    this.sqlTemplates.add(sqlTemplate);
  }

  public void addSavePointName(String savePointName) {
    this.savePointNames.add(savePointName);
  }

  public String getSqlRetCntVarName(int sqlId) {
    return sqlRetCntVarNamesMap.get(sqlId);
  }

  public void putSqlRetCntVarNames(int sqlId, String retCntVarName) {
    this.sqlRetCntVarNamesMap.put(sqlId, retCntVarName);
  }

  public List<List<String>> getSqlSelectColumnVarNames(int sqlId) {
    return sqlSelectColumnVarNamesMap.get(sqlId);
  }

  public void putSqlSelectColumnVarNames(int sqlId, List<List<String>> selectColumnVarNames) {
    this.sqlSelectColumnVarNamesMap.put(sqlId, selectColumnVarNames);
  }

  public void setFirstSqlParamsToCollect(List<Pair<Integer, String>> firstSqlParamsToCollect) {
    this.firstSqlParamsToCollect = firstSqlParamsToCollect;
  }

  public List<Pair<Integer, String>> getFirstSqlParamsToCollect() {
    return firstSqlParamsToCollect;
  }

  public boolean isContainsCommitBefore() {
    return containsCommitBefore;
  }

  public void setContainsCommitBefore(boolean containsCommitBefore) {
    this.containsCommitBefore = containsCommitBefore;
  }
}
