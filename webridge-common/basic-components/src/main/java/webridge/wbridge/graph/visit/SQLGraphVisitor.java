package webridge.wbridge.graph.visit;

import webridge.wbridge.graph.SQLGraph;
import webridge.wbridge.graph.SQLNode;

public abstract class SQLGraphVisitor {

  public void preVisit(SQLNode node, SQLNode prev, SQLGraph graph) {}

  public void visit(SQLNode node, SQLNode prev, SQLGraph graph) {}

  public void postVisit(SQLNode node, SQLNode prev, SQLGraph graph) {}
}
