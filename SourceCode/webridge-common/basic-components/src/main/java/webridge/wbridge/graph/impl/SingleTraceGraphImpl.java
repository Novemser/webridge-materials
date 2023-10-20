package webridge.wbridge.graph.impl;

import webridge.wbridge.graph.SQLNode;
import webridge.wbridge.graph.SingleTraceSQLGraph;
import webridge.wbridge.graph.exception.InvalidSQLNodeOpException;

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
