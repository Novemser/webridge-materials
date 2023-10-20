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

public class SQLGraphCommonPcPruningVisitor extends SQLGraphNoDuplicateVisitor {
  @Override
  public void visit(SQLNode node, SQLNode prev, SQLGraph graph) {
    super.visit(node, prev, graph);

    // Heuristic 3: prune common PC with its brothers. As each node may have
    // multiple parents, we need to determine for each brother, what is the
    // common PC, and what we can prune is the intersection

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

    Pair<Set<Constraint>, Set<StringConstraint>> common =
        SQLGraphHelper.findCommonConstraints(node, brothers);
    node.setPrunedSQLCondition(
        SQLGraphHelper.pruneConstraints(
            node.getPrunedSQLCondition().getConstraint(),
            node.getPrunedSQLCondition().getStringConstraint(),
            common));
  }
}
