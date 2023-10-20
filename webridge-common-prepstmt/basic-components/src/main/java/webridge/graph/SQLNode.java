package webridge.graph;

import webridge.graph.impl.SQLConditionImpl;
import webridge.graph.impl.SQLNodeImpl;
import webridge.graph.visit.SQLGraphNoDuplicateVisitor;
import webridge.graph.visit.SQLGraphVisitor;
import webridge.sql.SymSQL;
import webridge.sql.SymbolicSQLTemplate;
import webridge.symbc.numeric.Expression;
import webridge.symbc.numeric.PathCondition;

import java.io.Serializable;
import java.util.List;

/**
 * Represents the SQL node(SN) in SQL dependency graph(SDG). Each trace corresponds a SDG, the SN in
 * SDG contains the metadata of the query, including template, path condition and parameter
 * expressions.
 *
 * <p>Two SN can be merged into one if their template and parameter expressions are equal. For a
 * merged SN, it stored ALL path conditions for the two nodes to be merged.
 */
public interface SQLNode extends Serializable, SymSQL {

  static SQLNode of(SymbolicSQLTemplate symbolicSQL) {
    final PathCondition pc = symbolicSQL.getOriginalPc();
    final SQLCondition sqlCondition =
        new SQLConditionImpl(pc.header, pc.count(), pc.spc.header, pc.spc.count());

    final SQLNodeImpl sqlNode =
        new SQLNodeImpl(
            symbolicSQL.getConnNo(),
            symbolicSQL.getSqlType(),
            sqlCondition,
            symbolicSQL.getSqlTemplate(),
            symbolicSQL.getConcreteSql(),
            symbolicSQL.getParameterExprs(),
            symbolicSQL.getParameterSymbolics(),
            symbolicSQL.getParameterTypes(),
            symbolicSQL.getRetSymbolicNames(),
            symbolicSQL.getRetValTypes(),
            symbolicSQL.getRetValNames(),
            symbolicSQL.getRetValAlias(),
            symbolicSQL.getRowCountVarName());
    sqlNode.setSqlNo(symbolicSQL.getSqlNo());
    return sqlNode;
  }

  List<SQLNode> getParentNodes();

  /** add parent node, and add this to its child */
  void addParentNode(SQLNode parent);

  /** remove all parents */
  void removeParents();

  /** remove a single parent */
  void removeParent(SQLNode parent);

  List<SQLNode> getChildNodes();

  /** add child node, and add this to its parent */
  void addChildNode(SQLNode child);

  /** remove all children */
  void removeChildren();

  /** remove a single child */
  void removeChild(SQLNode child);

  /** deep clone the node */
  SQLNode deepClone(boolean includeFamilyNode);

  /** whether the node can be merged with 'other' node */
  boolean canMerge(SQLNode other);

  /**
   * merge current node with another node, all path constraints are preserved. return true if merged
   * successfully
   */
  boolean merge(SQLNode other);

  /** whether the node is a merged one */
  boolean isMergedNode();

  boolean equalsIgnoreConditionAndHierarchy(SQLNode other);

  List<Expression> getParameterSymbolics();

  SQLCondition getSQLCondition();

  /** return the pruned path condition, which is used to translated to SQL expression */
  SQLCondition getPrunedSQLCondition();

  /** set pruned path condition */
  void setPrunedSQLCondition(SQLCondition pc);

  /**
   * all path constraints for nodes before the merge are preserved.
   *
   * <pre>
   * Node n1, n2, n3;
   * n3 = n1.merge(n2);
   * conditions = n3.getMergedSQLCondition();
   * assert conditions.size() == 2;
   * assert conditions.get(0).equals(n1.getSQLCondition());
   * assert conditions.get(1).equals(n2.getSQLCondition())
   * </pre>
   *
   * @return merged pc
   */
  List<SQLCondition> getAllSQLConditions();

  void accept(SQLGraphVisitor visitor, SQLGraph graph, SQLNode prev);

  void accept(SQLGraphNoDuplicateVisitor visitor, SQLGraph graph, SQLNode prev);

  void setParameterExprs(List<String> parameterExprs);

  void setParameterSymbolics(List<Expression> parameterSymbolics);

  void setOriginalPc(List<SQLCondition> originalPc);

  void setRetSymNames(List<List<String>> retSymNames);

  void setRowCountVarName(String rowCountVarName);
}
