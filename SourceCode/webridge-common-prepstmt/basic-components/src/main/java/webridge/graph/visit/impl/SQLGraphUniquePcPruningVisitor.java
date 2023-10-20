package webridge.graph.visit.impl;

import webridge.graph.SQLGraph;
import webridge.graph.SQLGraphHelper;
import webridge.graph.SQLNode;
import webridge.graph.visit.SQLGraphNoDuplicateVisitor;
import webridge.symbc.numeric.Constraint;
import webridge.symbc.string.StringConstraint;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import org.apache.commons.lang3.tuple.Pair;

public class SQLGraphUniquePcPruningVisitor extends SQLGraphNoDuplicateVisitor {
  @Override
  public void visit(SQLNode node, SQLNode prev, SQLGraph graph) {
    super.visit(node, prev, graph);

    // Heuristic 4: prune unique PC if none of its brothers has the same or
    // the negated one.

    List<SQLNode> parents = node.getParentNodes();
    List<SQLNode> brothers =
        parents.stream()
            .map(SQLNode::getChildNodes)
            .flatMap(List::stream)
            .filter(child -> child != node)
            .collect(Collectors.toList());

    if (brothers.size() == 0) {
      return;
    }

    Pair<Set<Constraint>, Set<StringConstraint>> unique =
        SQLGraphHelper.findUniqueConstraints(node, brothers);
    node.setPrunedSQLCondition(
        SQLGraphHelper.pruneConstraints(
            node.getPrunedSQLCondition().getConstraint(),
            node.getPrunedSQLCondition().getStringConstraint(),
            unique));
  }
}