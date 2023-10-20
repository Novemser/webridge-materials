package webridge.graph.visit.impl;

import webridge.graph.SQLGraph;
import webridge.graph.SQLNode;
import webridge.graph.impl.SQLConditionImpl;
import webridge.graph.visit.SQLGraphNoDuplicateVisitor;

public class SQLGraphMergedNodePcPruningVisitor extends SQLGraphNoDuplicateVisitor {
  @Override
  public void visit(SQLNode node, SQLNode prev, SQLGraph graph) {
    super.visit(node, prev, graph);

    // Heuristic 2: if a SQLNode exists in every path, then its entire PC can be pruned
    if (node.getAllSQLConditions().size() == graph.getTraceN()) {
      node.setPrunedSQLCondition(new SQLConditionImpl(null, 0, null, 0));
    }
  }
}
