package webridge.graph.processor;

import webridge.graph.SQLCondition;
import webridge.graph.SQLGraph;
import webridge.graph.SQLGraphHelper;
import webridge.graph.SQLNode;
import webridge.graph.impl.SQLConditionImpl;
import webridge.graph.visit.impl.SQLGraphInitialPCGeneratorVisitor;
import webridge.symbc.numeric.Constraint;
import webridge.symbc.string.StringConstraint;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import org.apache.commons.lang3.tuple.Pair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SQLGraphEntryPCGenerator implements SQLGraphProcessor {
  private static final Logger logger = LoggerFactory.getLogger(SQLGraphEntryPCGenerator.class);

  @Override
  public void process(SQLGraphWrapper graphWrapper) {
    graphWrapper
        .getFinalGraphs()
        .forEach(
            graph ->
                graph.getRootNode().accept(new SQLGraphInitialPCGeneratorVisitor(), graph, null));

    graphWrapper.getFinalGraphs().forEach(this::generateEntryPc);
    graphWrapper.getFinalGraphs().forEach(this::adjustBrotherNodesPc);
  }

  private void adjustBrotherNodesPc(SQLGraph graph) {
    final List<SQLGraph> parents = graph.getParents();
    final List<SQLGraph> brothers =
        parents.stream()
            .map(SQLGraph::getChildren)
            .flatMap(List::stream)
            .filter(child -> child != graph)
            .collect(Collectors.toList());

    final List<SQLNode> brotherRootNodes =
        brothers.stream().map(SQLGraph::getRootNode).collect(Collectors.toList());

    if (!brotherRootNodes.isEmpty()) {
      final SQLCondition entryPc = graph.getEntryPc();
      final boolean allPcNull =
          (entryPc.isTrueConstraint())
              && brothers.stream().allMatch(g -> g.getEntryPc().isTrueConstraint());
      // if all pcs in each brother graph are 'true', that means we over pruned the pcs and we try
      // to add some pcs back
      if (allPcNull) {
        // 1) add unique constraints back, it might be helpful to distinguish
        // 2 paths. e.g. path1.pc{true}, path2.pc{x>0}. if the unique pc x>0
        // is preserved, then only path1 could be selected when x>0.
        Pair<Set<Constraint>, Set<StringConstraint>> commonConstraints =
            SQLGraphHelper.findCommonConstraints(graph.getRootNode(), brotherRootNodes);
        Pair<Set<Constraint>, Set<StringConstraint>> ndConstraints =
            SQLGraphHelper.findNdConstraints(graph.getRootNode());

        Set<Constraint> numericConstraintsToPrune = new HashSet<>(commonConstraints.getLeft());
        numericConstraintsToPrune.addAll(ndConstraints.getLeft());

        Set<StringConstraint> stringConstraintsToPrune =
            new HashSet<>(commonConstraints.getRight());
        stringConstraintsToPrune.addAll(ndConstraints.getRight());

        Pair<Set<Constraint>, Set<StringConstraint>> constraintsToPrune =
            Pair.of(numericConstraintsToPrune, stringConstraintsToPrune);

        final SQLCondition pc =
            SQLGraphHelper.pruneConstraints(
                graph.getRootNode().getPrunedSQLCondition().getConstraint(),
                graph.getRootNode().getPrunedSQLCondition().getStringConstraint(),
                constraintsToPrune);
        graph.setEntryPc(pc);
        logger.info(
            "Nd constraints size:"
                + ndConstraints.getLeft().size()
                + ","
                + ndConstraints.getRight().size());
        logger.warn("Empty pcs among brothers found, setting to " + pc);
      }
    }
  }

  private void generateEntryPc(SQLGraph graph) {
    List<SQLGraph> parents = graph.getParents();
    List<SQLGraph> brothers =
        parents.stream()
            .map(SQLGraph::getChildren)
            .flatMap(List::stream)
            .filter(child -> child != graph)
            .collect(Collectors.toList());

    List<SQLNode> brotherRootNodes =
        brothers.stream().map(SQLGraph::getRootNode).collect(Collectors.toList());

    SQLCondition entryPc;

    if (!brotherRootNodes.isEmpty()) {
      Pair<Set<Constraint>, Set<StringConstraint>> commonConstraints =
          SQLGraphHelper.findCommonConstraints(graph.getRootNode(), brotherRootNodes);
      Pair<Set<Constraint>, Set<StringConstraint>> uniqueConstraints =
          SQLGraphHelper.findUniqueConstraints(graph.getRootNode(), brotherRootNodes);
      Pair<Set<Constraint>, Set<StringConstraint>> ndConstraints =
          SQLGraphHelper.findNdConstraints(graph.getRootNode());

      Set<Constraint> numericConstraintsToPrune = new HashSet<>(commonConstraints.getLeft());
      numericConstraintsToPrune.addAll(uniqueConstraints.getLeft());
      numericConstraintsToPrune.addAll(ndConstraints.getLeft());

      Set<StringConstraint> stringConstraintsToPrune = new HashSet<>(commonConstraints.getRight());
      stringConstraintsToPrune.addAll(uniqueConstraints.getRight());
      stringConstraintsToPrune.addAll(ndConstraints.getRight());

      Pair<Set<Constraint>, Set<StringConstraint>> constraintsToPrune =
          Pair.of(numericConstraintsToPrune, stringConstraintsToPrune);

      entryPc =
          SQLGraphHelper.pruneConstraints(
              graph.getRootNode().getPrunedSQLCondition().getConstraint(),
              graph.getRootNode().getPrunedSQLCondition().getStringConstraint(),
              constraintsToPrune);
    } else {
      entryPc = new SQLConditionImpl(null, 0, null, 0);
    }
    graph.setEntryPc(entryPc);
  }
}
