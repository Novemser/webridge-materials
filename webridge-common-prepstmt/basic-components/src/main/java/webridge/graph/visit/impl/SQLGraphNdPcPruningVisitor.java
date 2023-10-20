package webridge.graph.visit.impl;

import webridge.graph.SQLGraph;
import webridge.graph.SQLGraphHelper;
import webridge.graph.SQLNode;
import webridge.graph.visit.SQLGraphNoDuplicateVisitor;
import webridge.symbc.numeric.Constraint;
import webridge.symbc.string.StringConstraint;
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
