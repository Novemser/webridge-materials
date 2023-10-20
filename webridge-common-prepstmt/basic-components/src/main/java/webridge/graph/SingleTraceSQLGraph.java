package webridge.graph;

public interface SingleTraceSQLGraph extends SQLGraph {
  /** add a new node to the tail of the execution context */
  void appendNewNode(SQLNode node);
}
