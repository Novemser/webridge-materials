package webridge.graph.visit.impl;

import webridge.exception.NotImplementedException;
import webridge.graph.SQLGraph;
import webridge.graph.SQLGraphHelper;
import webridge.graph.SQLNode;
import webridge.graph.SingleTraceSQLGraph;
import webridge.graph.impl.SingleTraceGraphImpl;
import webridge.graph.visit.SQLGraphVisitor;
import webridge.storedprocedure.SPConfig;
import webridge.symbc.numeric.Expression;
import webridge.symbc.string.StringExpression;
import java.util.*;
import org.apache.commons.lang3.tuple.Pair;

public class SQLGraphSingleTraceSubgraphGenerationVisitor extends SQLGraphVisitor {

  private final List<Expression> knownNumericExpressions;
  private final List<StringExpression> knownStringExpressions;
  private SQLNode currentEntryNode = null;
  private SQLNode nextEntryNode = null;
  private SingleTraceSQLGraph subgraph = null;
  private final Stack<Pair<SQLNode, SQLNode>> visitingNodes = new Stack<>();
  private final Map<SQLNode, SQLNode> originalAndClonedNodes = new IdentityHashMap<>();
  private boolean shouldCommitFirstInNextGraph = false;

  public SQLGraphSingleTraceSubgraphGenerationVisitor(
      List<Expression> knownNumericExpressions, List<StringExpression> knownStringExpressions) {
    this.knownNumericExpressions = knownNumericExpressions;
    this.knownStringExpressions = knownStringExpressions;
  }

  @Override
  public void visit(SQLNode node, SQLNode prev, SQLGraph graph) {
    if (nextEntryNode == null) {
      // We haven't reach a new entry node until now
      if (shouldBreak(node, prev, knownNumericExpressions, knownStringExpressions)) {
        if (shouldSkip(node, prev, knownNumericExpressions, knownStringExpressions)) {
          assert !node.getChildNodes().isEmpty();
          nextEntryNode = node.getChildNodes().get(0);
          shouldCommitFirstInNextGraph = true;
        } else {
          nextEntryNode = node;
          if (node.getConcreteSql().equals("commit")) {
            if (currentEntryNode == null) {
              // the commit query forms a single stored procedure
              currentEntryNode = getClonedNode(node);
              subgraph = new SingleTraceGraphImpl(currentEntryNode);
              // continue processing on next nodes
              SQLNode nextAutoCommitNode = node.getChildNodes().get(0);
              if (!nextAutoCommitNode.getConcreteSql().equals("set autocommit=1")) {
                throw new NotImplementedException("Unexpected transaction commit sequence");
              }
              currentEntryNode.addChildNode(getClonedNode(nextAutoCommitNode));
              nextEntryNode = nextAutoCommitNode.getChildNodes().get(0);
            }
          }
        }
      } else {
        SQLNode clonedNode = getClonedNode(node);
        if (currentEntryNode == null) {
          currentEntryNode = clonedNode;
          subgraph = new SingleTraceGraphImpl(currentEntryNode);
        } else {
          originalAndClonedNodes.get(prev).addChildNode(clonedNode);
        }
      }
    }
    super.visit(node, prev, graph);
  }

  public SingleTraceSQLGraph getSubgraph() {
    return subgraph;
  }

  public SQLNode getNextEntryNode() {
    return nextEntryNode;
  }

  public boolean isShouldCommitFirstInNextGraph() {
    return shouldCommitFirstInNextGraph;
  }

  private SQLNode getClonedNode(SQLNode node) {
    originalAndClonedNodes.putIfAbsent(node, node.deepClone(false));
    return originalAndClonedNodes.get(node);
  }

  private boolean shouldBreak(
      SQLNode node,
      SQLNode prev,
      List<Expression> knownNumericExpressions,
      List<StringExpression> knownStringExpressions) {
    if (SPConfig.EXPERIMENT_PREFETCH && prev != null) return true;
    // 1. Contains new nd expressions, etc. in param or pc
    Pair<List<Expression>, List<StringExpression>> pair =
        SQLGraphHelper.extractExpressionsLeadingToBreak(node);

    List<Expression> currentNumericExpressions = pair.getLeft();
    List<StringExpression> currentStringExpressions = pair.getRight();
    currentNumericExpressions.removeAll(knownNumericExpressions);
    currentStringExpressions.removeAll(knownStringExpressions);

    if (node.getConcreteSql().equals("commit")) {
      return true;
    }

    if (!currentNumericExpressions.isEmpty() || !currentStringExpressions.isEmpty()) {
      return true;
    }

    if (prev != null && node.getConnNo() != prev.getConnNo()) {
      return true;
    }

    // TODO other conditions
    return false;
  }

  private boolean shouldSkip(
      SQLNode node,
      SQLNode prev,
      List<Expression> knownNumericExpressions,
      List<StringExpression> knownStringExpressions) {
    if (node.getConcreteSql().equals("commit")) {
      if (SPConfig.EXPERIMENT_PREFETCH) {
        // do not piggyback commit in prefetch mode
        return true;
      }
      // if the next following transaction contains write/select for update, do not skip(piggback)
      // this commit
      // because it might cause deadlock among application server and database. Find more details
      // here http://10.0.0.103:8080/projects/webridge/work_packages/292/activity
      return !nextTxnAcquiresXLock(node) || !prevTxnAcquiresXLock(node);
    }

    return false;
  }

  private boolean nextTxnAcquiresXLock(SQLNode currentNode) {
    List<SQLNode> childNodes = Objects.requireNonNull(currentNode).getChildNodes();
    if (currentNode.getConcreteSql().equals("commit")) {
      if (childNodes.size() != 1) throw new NotImplementedException();
      SQLNode nextChild = childNodes.get(0);
      if (nextChild.getConcreteSql().equals("set autocommit=1")) {
        // forward the current node to next transaction
        currentNode = nextChild;
      }
    }
    Queue<SQLNode> nodes = new LinkedList<>(currentNode.getChildNodes());
    boolean containsXLock = false;
    while (!nodes.isEmpty()) {
      SQLNode node = nodes.poll();
      String query = node.getConcreteSql().toLowerCase(Locale.ROOT);

      if (query.contains("for update")) {
        containsXLock = true;
      }

      if (query.equals("commit") || query.equals("set autocommit=1")) {
        // end of txn
        continue;
      }
      nodes.addAll(node.getChildNodes());
    }
    return containsXLock;
  }

  private boolean prevTxnAcquiresXLock(SQLNode currentNode) {
    Queue<SQLNode> nodes = new LinkedList<>(currentNode.getParentNodes());
    boolean containsXLock = false;
    while (!nodes.isEmpty()) {
      SQLNode node = nodes.poll();
      String query = node.getConcreteSql().toLowerCase(Locale.ROOT);

      if (query.contains("for update")) {
        containsXLock = true;
      }

      if (query.equals("commit") || query.equals("set autocommit=1")) {
        // end of txn
        continue;
      }
      nodes.addAll(node.getParentNodes());
    }
    return containsXLock;
  }
}
