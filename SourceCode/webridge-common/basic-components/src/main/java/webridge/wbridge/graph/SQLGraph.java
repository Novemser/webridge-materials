package webridge.wbridge.graph;

import webridge.wbridge.storedprocedure.SPContext;
import java.util.Iterator;
import java.util.List;

/** Processing context for the computations on graph. */
public interface SQLGraph extends SPContext {

  void setRootNode(SQLNode node);

  SQLNode getRootNode();

  /** merge the current graph with another graph */
  void merge(SingleTraceSQLGraph context);

  Iterator<SQLNode> getTopologicalSortedNodes();

  int getTraceN();

  void setTraceN(int traceN);

  List<SQLGraph> getParents();

  void addParent(SQLGraph parent);

  void addParents(List<SQLGraph> parents);

  void removeParent(SQLGraph parent);

  void removeParents(List<SQLGraph> parents);

  void removeAllParents();

  List<SQLGraph> getChildren();

  void addChild(SQLGraph child);

  void addChildren(List<SQLGraph> children);

  void removeChild(SQLGraph child);

  void removeChildren(List<SQLGraph> children);

  void removeAllChildren();

  SQLCondition getEntryPc();

  void setEntryPc(SQLCondition entryPc);

  void addCommitBefore();

  boolean isContainsCommitBefore();

  // aux helper attributes to store other information
  Object getAttribute(String name);

  void setAttribute(String name, Object value);
}
