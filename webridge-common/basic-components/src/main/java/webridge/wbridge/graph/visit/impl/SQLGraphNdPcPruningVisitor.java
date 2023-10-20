package webridge.wbridge.graph.visit.impl;

import webridge.wbridge.graph.SQLGraph;
import webridge.wbridge.graph.SQLGraphHelper;
import webridge.wbridge.graph.SQLNode;
import webridge.wbridge.graph.visit.SQLGraphNoDuplicateVisitor;
import webridge.wbridge.symbc.numeric.Constraint;
import webridge.wbridge.symbc.string.StringConstraint;
import java.util.Set;
import org.apache.commons.lang3.tuple.Pair;

public class SQLGraphNdPcPruningVisitor extends SQLGraphNoDuplicateVisitor {
  @Override
  public void visit(SQLNode node, SQLNode prev, SQLGraph graph) {
    super.visit(node, prev, graph);

    Pair<Set<Constraint>, Set<StringConstraint>> ndConstraints =
        SQLGraphHelper.findNdConstraints(node);

    node.setPrunedSQLCondition(
        SQLGraphHelper.pruneConstraints(
            node.getPrunedSQLCondition().getConstraint(),
            node.getPrunedSQLCondition().getStringConstraint(),
            ndConstraints));
  }
}
