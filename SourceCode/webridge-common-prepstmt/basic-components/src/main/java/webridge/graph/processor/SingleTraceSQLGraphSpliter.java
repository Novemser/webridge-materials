package webridge.graph.processor;

import webridge.graph.SQLGraphHelper;
import webridge.graph.SQLNode;
import webridge.graph.SingleTraceSQLGraph;
import webridge.graph.visit.impl.SQLGraphSingleTraceSubgraphGenerationVisitor;
import webridge.symbc.numeric.Expression;
import webridge.symbc.string.StringExpression;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.commons.lang3.tuple.Triple;

public class SingleTraceSQLGraphSpliter implements SQLGraphProcessor {

  /**
   * Divide a single trace sql graph into list of sub-graph. Split the graph upon a SQLNode that 1)
   * contains inconvertible parameters (e.g., non-deterministic) or path conditions; or 2) is a
   * commit of a transaction that contains write SQL; or 3) contains SQL issued on a different
   * connection compared with its parent SQLNode
   */
  @Override
  public void process(SQLGraphWrapper graphWrapper) {
    List<SingleTraceSQLGraph> subgraphList = new ArrayList<>();
    SQLNode entryNode = graphWrapper.newTrace.getRootNode();
    SingleTraceSQLGraph lastSubGraph = null;
    boolean shouldCommitFirstInNextGraph = false;

    while (entryNode != null) {
      Triple<SingleTraceSQLGraph, SQLNode, Boolean> result =
          getSubgraph(entryNode, graphWrapper.newTrace);
      SingleTraceSQLGraph subgraph = result.getLeft();
      if (shouldCommitFirstInNextGraph) {
        subgraph.addCommitBefore();
      }
      subgraphList.add(subgraph);
      if (lastSubGraph != null) {
        lastSubGraph.addChild(subgraph);
      }
      lastSubGraph = subgraph;
      entryNode = result.getMiddle();
      shouldCommitFirstInNextGraph = result.getRight();
    }
    graphWrapper.setTraceSubGraph(subgraphList);
  }

  private Triple<SingleTraceSQLGraph, SQLNode, Boolean> getSubgraph(
      SQLNode entryNode, SingleTraceSQLGraph originalGraph) {
    Pair<List<Expression>, List<StringExpression>> pair =
        SQLGraphHelper.extractExpressionsLeadingToBreak(entryNode);
    // If later SQLNodes contains more expressions (which may lead to sp break) than
    // knownNumericExpressions and knownStringExpressions, then that node should break
    List<Expression> knownNumericExpressions = pair.getLeft();
    List<StringExpression> knownStringExpressions = pair.getRight();

    SQLGraphSingleTraceSubgraphGenerationVisitor visitor =
        new SQLGraphSingleTraceSubgraphGenerationVisitor(
            knownNumericExpressions, knownStringExpressions);
    entryNode.accept(visitor, originalGraph, null);
    SingleTraceSQLGraph subgraph = visitor.getSubgraph();
    SQLNode newEntryNode = visitor.getNextEntryNode();
    boolean shouldCommitFirstInNextGraph = visitor.isShouldCommitFirstInNextGraph();
    return Triple.of(subgraph, newEntryNode, shouldCommitFirstInNextGraph);
  }
}
