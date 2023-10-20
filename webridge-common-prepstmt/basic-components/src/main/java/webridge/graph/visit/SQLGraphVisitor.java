package webridge.graph.visit;

import webridge.graph.SQLGraph;
import webridge.graph.SQLNode;

public abstract class SQLGraphVisitor {

  public void preVisit(SQLNode node, SQLNode prev, SQLGraph graph) {}

  public void visit(SQLNode node, SQLNode prev, SQLGraph graph) {}

  public void postVisit(SQLNode node, SQLNode prev, SQLGraph graph) {}
}
