package webridge.wbridge.graph.visit.impl;

import webridge.wbridge.graph.SQLGraph;
import webridge.wbridge.graph.SQLNode;
import webridge.wbridge.graph.impl.SQLConditionImpl;
import webridge.wbridge.graph.visit.SQLGraphNoDuplicateVisitor;

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
