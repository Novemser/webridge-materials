package webridge.graph.impl;

import webridge.graph.SQLNode;
import webridge.graph.SingleTraceSQLGraph;
import webridge.graph.exception.InvalidSQLNodeOpException;

public class SingleTraceGraphImpl extends SQLGraphImpl implements SingleTraceSQLGraph {

  private SQLNode tailNode;

  public SingleTraceGraphImpl(SQLNode rootNode) {
    super(rootNode);
    this.tailNode = rootNode;
  }

  @Override
  public void appendNewNode(SQLNode node) {
    if (tailNode.getChildNodes().size() > 0)
      throw new InvalidSQLNodeOpException("Each node should have only one child while appending.");
    tailNode.addChildNode(node);
    this.tailNode = node;
  }
}
