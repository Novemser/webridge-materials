package webridge.graph.visit;

import webridge.graph.SQLGraph;
import webridge.graph.SQLNode;

import java.util.ArrayList;
import java.util.List;

public abstract class SQLGraphNoDuplicateVisitor extends SQLGraphVisitor {

  private List<SQLNode> visitedNodes = new ArrayList<>();

  public boolean hasVisited(SQLNode node) {
    return visitedNodes.contains(node);
  }

  @Override
  public void preVisit(SQLNode node, SQLNode prev, SQLGraph graph) {}

  @Override
  public void visit(SQLNode node, SQLNode prev, SQLGraph graph) {
    visitedNodes.add(node);
  }

  @Override
  public void postVisit(SQLNode node, SQLNode prev, SQLGraph graph) {}
}
