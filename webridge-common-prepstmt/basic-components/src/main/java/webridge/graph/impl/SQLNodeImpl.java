package webridge.graph.impl;

import webridge.graph.SQLCondition;
import webridge.graph.SQLGraph;
import webridge.graph.SQLNode;
import webridge.graph.exception.InvalidSQLNodeOpException;
import webridge.graph.visit.SQLGraphNoDuplicateVisitor;
import webridge.graph.visit.SQLGraphVisitor;
import webridge.sql.types.SQLVarType;
import webridge.sql.types.SqlType;
import webridge.storedprocedure.utils.SQLPCUtil;
import webridge.symbc.numeric.Expression;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import org.apache.commons.lang3.SerializationUtils;
import org.apache.commons.lang3.StringUtils;

public class SQLNodeImpl implements SQLNode {

  private final List<SQLNode> parents = new ArrayList<>();
  private final List<SQLNode> children = new ArrayList<>();

  // belows are the meta info of current SQLNode
  private int sqlNo = -1;
  private final int connNo; // connection id
  private final SqlType sqlType;
  private SQLCondition prunedPc;
  private List<SQLCondition> originalPc;
  private final String sqlTemplate;
  private final String concreteSql;
  // following four are related to parameters
  private List<String> parameterExprs;
  private List<Expression> parameterSymbolics;
  private final List<SQLVarType> paramType;
  // following five are related to return values
  private List<List<String>> retSymNames; // For SELECT, it can have multiple rows.
  private final List<SQLVarType> retSymTypes;
  private final List<String> retValNames; // variable name in the sql statement
  private final List<String> retValAlias; // alias in the sql statement
  private String rowCountVarName;
  // following one is the name of savepoint, null if no savepoint
  private String savePointName = null;

  public SQLNodeImpl(
      int connNo,
      SqlType sqlType,
      List<SQLCondition> pcs,
      String sqlTemplate,
      String concreteSql,
      List<String> parameterExprs,
      List<Expression> parameterSymbolics,
      List<SQLVarType> paramSqlType,
      List<List<String>> retSymNames,
      List<SQLVarType> retSymTypes,
      List<String> retValNames,
      List<String> retValAlias,
      String rowCntVarName) {
    this.connNo = connNo;
    this.sqlType = sqlType;
    this.originalPc = new ArrayList<>(pcs);
    this.sqlTemplate = sqlTemplate;
    this.concreteSql = concreteSql;
    this.parameterExprs = Collections.unmodifiableList(parameterExprs);
    this.parameterSymbolics = Collections.unmodifiableList(parameterSymbolics);
    this.paramType = Collections.unmodifiableList(paramSqlType);
    this.retSymNames = Collections.unmodifiableList(retSymNames);
    this.retSymTypes = Collections.unmodifiableList(retSymTypes);
    this.retValNames = Collections.unmodifiableList(retValNames);
    this.retValAlias = Collections.unmodifiableList(retValAlias);
    this.rowCountVarName = rowCntVarName;
  }

  public SQLNodeImpl(
      int connNo,
      SqlType sqlType,
      SQLCondition originalPc,
      String sqlTemplate,
      String concreteSql,
      List<String> parameterExprs,
      List<Expression> parameterSymbolics,
      List<SQLVarType> paramSqlType,
      List<List<String>> retSymNames,
      List<SQLVarType> retSymTypes,
      List<String> retValNames,
      List<String> retValAlias,
      String rowCntVarName) {
    this.connNo = connNo;
    this.sqlType = sqlType;
    this.originalPc = new ArrayList<>();
    this.originalPc.add(originalPc);
    this.sqlTemplate = sqlTemplate;
    this.concreteSql = concreteSql;
    this.parameterExprs = Collections.unmodifiableList(parameterExprs);
    this.parameterSymbolics = Collections.unmodifiableList(parameterSymbolics);
    this.paramType = Collections.unmodifiableList(paramSqlType);
    this.retSymNames = Collections.unmodifiableList(retSymNames);
    this.retSymTypes = Collections.unmodifiableList(retSymTypes);
    this.retValNames = Collections.unmodifiableList(retValNames);
    this.retValAlias = Collections.unmodifiableList(retValAlias);
    this.rowCountVarName = rowCntVarName;
  }

  @Deprecated
  public SQLNodeImpl(
      String sqlTemplate,
      List<String> parameterExprs,
      List<Expression> parameterSymbolics,
      List<SQLCondition> pcs) {
    this.connNo = -1;
    this.sqlType = SqlType.SELECT;
    this.originalPc = new ArrayList<>(pcs);
    this.sqlTemplate = sqlTemplate;
    this.concreteSql = sqlTemplate;
    this.parameterExprs = Collections.unmodifiableList(parameterExprs);
    this.parameterSymbolics = Collections.unmodifiableList(parameterSymbolics);
    this.paramType = Collections.emptyList();
    this.retSymNames = Collections.emptyList();
    this.retSymTypes = Collections.emptyList();
    this.retValNames = Collections.emptyList();
    this.retValAlias = Collections.emptyList();
    this.rowCountVarName = null;
  }

  @Deprecated
  public SQLNodeImpl(
      String sqlTemplate,
      List<String> parameterExprs,
      List<Expression> parameterSymbolics,
      SQLCondition pc) {
    this.connNo = -1;
    this.sqlType = SqlType.SELECT;
    this.originalPc = new ArrayList<>();
    this.originalPc.add(pc);
    this.sqlTemplate = sqlTemplate;
    this.concreteSql = sqlTemplate;
    this.parameterExprs = Collections.unmodifiableList(parameterExprs);
    this.parameterSymbolics = Collections.unmodifiableList(parameterSymbolics);
    this.paramType = Collections.emptyList();
    this.retSymNames = Collections.emptyList();
    this.retSymTypes = Collections.emptyList();
    this.retValNames = Collections.emptyList();
    this.retValAlias = Collections.emptyList();
    this.rowCountVarName = null;
  }

  @Override
  public List<SQLNode> getParentNodes() {
    return this.parents;
  }

  @Override
  public void addParentNode(SQLNode parent) {
    if (this.parents.contains(parent)) return;
    this.parents.add(parent);
    parent.addChildNode(this);
  }

  @Override
  public void removeParents() {
    for (SQLNode parent : new ArrayList<>(this.parents)) {
      removeParent(parent);
    }
  }

  @Override
  public void removeParent(SQLNode parent) {
    if (this.parents.contains(parent)) {
      this.parents.remove(parent);
      parent.removeChild(this);
    }
  }

  @Override
  public List<SQLNode> getChildNodes() {
    return this.children;
  }

  @Override
  public void addChildNode(SQLNode child) {
    if (this.children.contains(child)) return;
    this.children.add(child);
    child.addParentNode(this);
  }

  @Override
  public void removeChildren() {
    for (SQLNode child : new ArrayList<>(this.children)) {
      removeChild(child);
    }
  }

  @Override
  public void removeChild(SQLNode child) {
    if (this.children.contains(child)) {
      this.children.remove(child);
      child.removeParent(this);
    }
  }

  @Override
  public SQLNode deepClone(boolean includeFamilyNode) {
    if (includeFamilyNode) {
      return SerializationUtils.clone(this);
    }

    final List<String> newParamExprs = new ArrayList<>(parameterExprs);

    final List<Expression> newParamSymbolics = new ArrayList<>();
    for (Expression expr : parameterSymbolics) {
      newParamSymbolics.add(SerializationUtils.clone(expr));
    }

    final List<SQLVarType> newParamType = new ArrayList<>();
    for (SQLVarType varType : paramType) {
      newParamType.add(SerializationUtils.clone(varType));
    }

    final List<List<String>> newRetSymNames = new ArrayList<>();
    for (List<String> rowRetSymNames : retSymNames) {
      List<String> newRowRetSymNames = new ArrayList<>(rowRetSymNames);
      newRetSymNames.add(newRowRetSymNames);
    }

    final List<SQLVarType> newRetSymTypes = new ArrayList<>();
    for (SQLVarType retSymType : retSymTypes) {
      newRetSymTypes.add(SerializationUtils.clone(retSymType));
    }

    final List<String> newRetValNames = new ArrayList<>(retValNames);
    final List<String> newRetValAlias = new ArrayList<>(retValAlias);

    final List<SQLCondition> newPc = new ArrayList<>();
    for (SQLCondition condition : originalPc) {
      newPc.add(SerializationUtils.clone(condition));
    }
    SQLNode node =
        new SQLNodeImpl(
            connNo,
            sqlType,
            newPc,
            sqlTemplate,
            concreteSql,
            newParamExprs,
            newParamSymbolics,
            newParamType,
            newRetSymNames,
            newRetSymTypes,
            newRetValNames,
            newRetValAlias,
            rowCountVarName);
    node.setSqlNo(sqlNo);
    node.setPrunedSQLCondition(SerializationUtils.clone(prunedPc));
    node.setSavePointName(savePointName);
    return node;
  }

  @Override
  public boolean canMerge(SQLNode other) {
    return connNo == other.getConnNo()
        && sqlTemplate.equals(other.getSqlTemplate())
        && parameterExprs.equals(other.getParameterExprs());
  }

  @Override
  public boolean merge(SQLNode other) {
    if (!canMerge(other)) return false;
    this.originalPc.addAll(other.getAllSQLConditions());
    if (this.retSymNames.size() < other.getRetSymbolicNames().size()) {
      this.retSymNames = other.getRetSymbolicNames();
    }
    return true;
  }

  @Override
  public boolean isMergedNode() {
    return originalPc.size() > 1;
  }

  @Override
  public boolean equalsIgnoreConditionAndHierarchy(SQLNode other) {
    boolean equal =
        sqlType == other.getSqlType()
            && connNo == other.getConnNo()
            && sqlTemplate.equals(other.getSqlTemplate())
            && parameterExprs.equals(other.getParameterExprs())
            && parameterSymbolics.equals(other.getParameterSymbolics())
            && retSymNames.equals(other.getRetSymbolicNames())
            && retSymTypes.equals(other.getRetValTypes())
            && retValAlias.equals(other.getRetValAlias())
            && retValNames.equals(other.getRetValNames())
            && StringUtils.equals(rowCountVarName, other.getRowCountVarName())
            && StringUtils.equals(savePointName, other.getSavePointName())
            && paramType.equals(other.getParameterTypes());
    if (!equal) return false;

    // check parameter symbolic expressions
    for (int i = 0; i < parameterSymbolics.size(); ++i) {
      if (parameterSymbolics.get(i) == null && other.getParameterSymbolics().get(i) == null) {
        continue;
      } else if ((parameterSymbolics.get(i) == null)
          != (other.getParameterSymbolics().get(i) == null)) {
        return false;
      }
      if (!SQLPCUtil.expandExpression(parameterSymbolics.get(i))
          .equals(SQLPCUtil.expandExpression(other.getParameterSymbolics().get(i)))) {
        return false;
      }
    }
    return true;
  }

  @Override
  public String getSqlTemplate() {
    return sqlTemplate;
  }

  @Override
  public String getConcreteSql() {
    return concreteSql;
  }

  @Override
  public List<Expression> getParameterSymbolics() {
    return parameterSymbolics;
  }

  @Override
  public SQLCondition getSQLCondition() {
    if (originalPc.size() > 1) throw new InvalidSQLNodeOpException("This is a merged SQLNode!");
    return originalPc.size() == 1 ? originalPc.get(0) : null;
  }

  @Override
  public SQLCondition getPrunedSQLCondition() {
    return prunedPc;
  }

  @Override
  public void setPrunedSQLCondition(SQLCondition pc) {
    this.prunedPc = pc;
  }

  @Override
  public List<SQLCondition> getAllSQLConditions() {
    return this.originalPc;
  }

  @Override
  public void accept(SQLGraphVisitor v, SQLGraph graph, SQLNode prev) {
    v.preVisit(this, prev, graph);
    v.visit(this, prev, graph);
    for (SQLNode child : this.getChildNodes()) {
      child.accept(v, graph, this);
    }
    v.postVisit(this, prev, graph);
  }

  @Override
  public void accept(SQLGraphNoDuplicateVisitor v, SQLGraph graph, SQLNode prev) {
    if (!v.hasVisited(this)) {
      v.preVisit(this, prev, graph);
      v.visit(this, prev, graph);
      for (SQLNode child : this.getChildNodes()) {
        child.accept(v, graph, this);
      }
      v.postVisit(this, prev, graph);
    }
  }

  @Override
  public SqlType getSqlType() {
    return this.sqlType;
  }

  @Override
  public String getPathConditionStr() {
    return this.prunedPc.expandConstraints();
  }

  @Override
  public List<String> getParameterExprs() {
    return parameterExprs;
  }

  @Override
  public List<SQLVarType> getParameterTypes() {
    return paramType;
  }

  @Override
  public List<SQLVarType> getRetValTypes() {
    return retSymTypes;
  }

  @Override
  public List<String> getRetValNames() {
    return retValNames;
  }

  @Override
  public List<String> getRetValAlias() {
    return retValAlias;
  }

  @Override
  public List<List<String>> getRetSymbolicNames() {
    return retSymNames;
  }

  @Override
  public String getRowCountVarName() {
    return rowCountVarName;
  }

  @Override
  public int getConnNo() {
    return connNo;
  }

  @Override
  public String getSavePointName() {
    return savePointName;
  }

  @Override
  public void setSavePointName(String savePointName) {
    this.savePointName = savePointName;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    SQLNodeImpl sqlNode = (SQLNodeImpl) o;
    boolean equal =
        equalsIgnoreConditionAndHierarchy(sqlNode)
            && connNo == sqlNode.connNo
            && sqlType == sqlNode.sqlType
            && Objects.equals(prunedPc, sqlNode.prunedPc)
            && originalPc.equals(sqlNode.originalPc)
            && children.size() == sqlNode.getChildNodes().size();
    if (!equal) return false;
    // only need to compare children to avoid infinite loop of 'equals' call
    for (int i = 0; i < children.size(); ++i) {
      if (!children.get(i).equals(sqlNode.getChildNodes().get(i))) return false;
    }
    return true;
  }

  @Override
  public int hashCode() {
    return Objects.hash(
        children, // only need children
        connNo,
        sqlType,
        prunedPc,
        originalPc,
        sqlTemplate,
        parameterExprs,
        parameterSymbolics,
        paramType,
        retSymNames,
        retSymTypes,
        retValNames,
        retValAlias,
        rowCountVarName,
        savePointName);
  }

  @Override
  public String toString() {
    StringBuilder paramPrintStr = new StringBuilder();
    printOutList(paramPrintStr, parameterExprs, paramType);
    StringBuilder retValsPrintStr = new StringBuilder();
    printOutList(retValsPrintStr, retValNames, retSymTypes);

    return "SQLNode {\n"
        + "    sqlTemplate='"
        + sqlTemplate
        + '\''
        + ",\n    parameters="
        + paramPrintStr
        + ",\n    retVals="
        + retValsPrintStr
        + "\n}\n";
  }

  private void printOutList(StringBuilder printStr, List<String> names, List<SQLVarType> types) {
    printStr.append("{");
    for (int i = 0; i < names.size(); i++) {
      final String retValName = names.get(i);
      final String retValTp = types.get(i).name();
      printStr.append(retValName).append(":").append(retValTp);
      if (i != names.size() - 1) printStr.append(", ");
    }
    printStr.append("}");
  }

  @Override
  public void setParameterExprs(List<String> parameterExprs) {
    this.parameterExprs = parameterExprs;
  }

  @Override
  public void setParameterSymbolics(List<Expression> parameterSymbolics) {
    this.parameterSymbolics = parameterSymbolics;
  }

  @Override
  public void setOriginalPc(List<SQLCondition> originalPc) {
    this.originalPc = originalPc;
  }

  @Override
  public void setRetSymNames(List<List<String>> retSymNames) {
    this.retSymNames = retSymNames;
  }

  @Override
  public void setRowCountVarName(String rowCountVarName) {
    this.rowCountVarName = rowCountVarName;
  }

  public void setSqlNo(int sqlNo) {
    this.sqlNo = sqlNo;
  }

  @Override
  public int getSqlNo() {
    return sqlNo;
  }
}
