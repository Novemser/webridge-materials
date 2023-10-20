package webridge.wbridge.graph.processor;

import webridge.wbridge.graph.SQLGraph;
import webridge.wbridge.graph.visit.impl.*;

public class SQLGraphPCPruner implements SQLGraphProcessor {

  private static final boolean PRUNE_PC = true;

  @Override
  public void process(SQLGraphWrapper graphWrapper) {
    graphWrapper.getFinalGraphs().forEach(this::pruneOneGraph);
  }

  private void pruneOneGraph(SQLGraph sqlGraph) {
    // 2.1 create initial prunedPC for each SQLNode
    sqlGraph.getRootNode().accept(new SQLGraphInitialPCGeneratorVisitor(), sqlGraph, null);
    // 2.2 eliminate SQL-Unrelated constraints
    // TODO: First see how much PC the following heuristics can prune, then decide whether to
    //  implement the first
    if (!PRUNE_PC) return;
    // 2.3 eliminate constraints on merged node
    sqlGraph.getRootNode().accept(new SQLGraphMergedNodePcPruningVisitor(), sqlGraph, null);
    // 2.4 eliminate common constraints for unequal nodes
    sqlGraph.getRootNode().accept(new SQLGraphCommonPcPruningVisitor(), sqlGraph, null);
    // 2.5 eliminate unique constraints for unequal nodes
    sqlGraph.getRootNode().accept(new SQLGraphUniquePcPruningVisitor(), sqlGraph, null);
    // 2.6 prune nd pc
    sqlGraph.getRootNode().accept(new SQLGraphNdPcPruningVisitor(), sqlGraph, null);
  }
}
