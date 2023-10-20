package webridge.wbridge.graph.impl;

import webridge.wbridge.graph.processor.utils.CommonPcExtractor;
import webridge.wbridge.sql.SymSQL;
import webridge.wbridge.sql.types.SQLVarType;
import webridge.wbridge.storedprocedure.utils.SQLPCUtil;
import webridge.wbridge.symbc.numeric.PathCondition;
import java.util.*;
import java.util.stream.Collectors;
import org.apache.commons.lang3.tuple.Pair;
import webridge.wbridge.graph.*;

public class SQLGraphImpl implements SQLGraph {

  protected SQLNode rootNode;
  protected int traceN;
  protected List<SQLGraph> parents;
  protected List<SQLGraph> children;
  protected SQLCondition entryPc;
  protected boolean containsCommitBefore;

  public SQLGraphImpl(SQLNode rootNode) {
    this.rootNode = rootNode;
    this.traceN = 1;
    this.parents = new ArrayList<>();
    this.children = new ArrayList<>();
    this.entryPc = null;
  }

  @Override
  public void setRootNode(SQLNode node) {
    this.rootNode = node;
  }

  @Override
  public SQLNode getRootNode() {
    return this.rootNode;
  }

  @Override
  public void merge(SingleTraceSQLGraph trace) {
    // 1 findLongestEqualSubSQLSeq
    List<Pair<SQLNode, SQLNode>> commonSQLList =
        SQLGraphHelper.findLongestEqualSubSQLSeq(this, trace);
    // 2 merge unequal nodes from trace to graph
    // TODO: what if two graphs does not have any common SQL?
    assert !commonSQLList.isEmpty();

    Pair<SQLNode, SQLNode> firstCommon = commonSQLList.get(0);
    SQLNode firstCommonInGraph = firstCommon.getLeft();
    SQLNode firstCommonInTrace = firstCommon.getRight();

    if (!firstCommonInTrace.getParentNodes().isEmpty()) {
      SQLNode parent = firstCommonInTrace.getParentNodes().get(0);
      parent.removeChildren();
      firstCommonInGraph.addParentNode(parent);
    }

    for (int i = 0; i < commonSQLList.size() - 1; i++) {
      Pair<SQLNode, SQLNode> currentCommon = commonSQLList.get(i);
      Pair<SQLNode, SQLNode> nextCommon = commonSQLList.get(i + 1);

      SQLNode currentCommonInGraph = currentCommon.getLeft();
      SQLNode currentCommonInTrace = currentCommon.getRight();
      SQLNode nextCommonInGraph = nextCommon.getLeft();
      SQLNode nextCommonInTrace = nextCommon.getRight();

      if (currentCommonInTrace.getChildNodes().contains(nextCommonInTrace)) {
        currentCommonInGraph.addChildNode(nextCommonInGraph);
        continue;
      }

      SQLNode child = currentCommonInTrace.getChildNodes().get(0);
      child.removeParents();
      currentCommonInGraph.addChildNode(child);

      SQLNode parent = nextCommonInTrace.getParentNodes().get(0);
      parent.removeChildren();
      nextCommonInGraph.addParentNode(parent);
    }

    Pair<SQLNode, SQLNode> lastCommon = commonSQLList.get(commonSQLList.size() - 1);
    SQLNode lastCommonInGraph = lastCommon.getLeft();
    SQLNode lastCommonInTrace = lastCommon.getRight();

    if (!lastCommonInTrace.getChildNodes().isEmpty()) {
      SQLNode child = lastCommonInTrace.getChildNodes().get(0);
      child.removeParents();
      lastCommonInGraph.addChildNode(child);
    }
    // 3 merge equal nodes
    for (Pair<SQLNode, SQLNode> nodePair : commonSQLList) {
      SQLNode nodeInGraph = nodePair.getLeft();
      SQLNode nodeInTrace = nodePair.getRight();
      nodeInGraph.merge(nodeInTrace);
    }

    this.setTraceN(this.getTraceN() + 1);
    this.addChildren(trace.getChildren());
    this.addParents(trace.getParents());
    trace.removeAllChildren();
    trace.removeAllParents();
  }

  @Override
  public Iterator<SQLNode> getTopologicalSortedNodes() {
    List<SQLNode> sortedNodes = new ArrayList<>();
    Queue<SQLNode> zeroInDegreeNodes = new LinkedList<>();
    zeroInDegreeNodes.add(rootNode);
    Set<SQLNode> visitedNodes = new HashSet<>();
    while (!zeroInDegreeNodes.isEmpty()) {
      SQLNode node = zeroInDegreeNodes.poll();
      sortedNodes.add(node);
      visitedNodes.add(node);
      for (SQLNode child : node.getChildNodes()) {
        boolean hasParentNotVisit =
            child.getParentNodes().stream().anyMatch(p -> !visitedNodes.contains(p));
        if (!hasParentNotVisit) {
          zeroInDegreeNodes.add(child);
        }
      }
    }
    return sortedNodes.iterator();
  }

  @Override
  public int getTraceN() {
    return traceN;
  }

  @Override
  public void setTraceN(int traceN) {
    this.traceN = traceN;
  }

  @Override
  public Iterator<SymSQL> getSymSQLList() {
    Iterator<SQLNode> sortedNodes = getTopologicalSortedNodes();
    return new Iterator<SymSQL>() {
      @Override
      public boolean hasNext() {
        return sortedNodes.hasNext();
      }

      @Override
      public SymSQL next() {
        return sortedNodes.next();
      }
    };
  }

  @Override
  public Map<String, SQLVarType> extractDependentVariables() {
    Map<String, SQLVarType> dependentVariables = new HashMap<>();
    final Set<String> existing = new HashSet<>();
    final Map<String, PathCondition> concentratedPc =
        (Map<String, PathCondition>) getAttribute(CommonPcExtractor.CONCENTRATED_PC);
    if (concentratedPc != null) {
      // collect dependent variables from concentrated pcs
      final Set<String> commonPcVarNamesUsedInSp = new HashSet<>();
      getTopologicalSortedNodes()
          .forEachRemaining(
              sqlNode -> {
                final SQLCondition prunedSQLCondition = sqlNode.getPrunedSQLCondition();
                final List<String> commonPcVarsUsed =
                    prunedSQLCondition.getConstraintVariables().keySet().stream()
                        .filter(CommonPcExtractor::startsWithCommonPcVarName)
                        .collect(Collectors.toList());
                commonPcVarNamesUsedInSp.addAll(commonPcVarsUsed);
              });

      commonPcVarNamesUsedInSp.forEach(
          varName -> {
            final PathCondition pc = Objects.requireNonNull(concentratedPc.get(varName));
            // exclude pcs that should not considered as dependent
            existing.add(varName);
            Map<String, SQLVarType> depVars = new HashMap<>();
            SQLPCUtil.collectConstraintVariables(pc.header, depVars);
            dependentVariables.putAll(depVars);
          });
    }

    Iterator<SQLNode> sortedNodes = getTopologicalSortedNodes();

    sortedNodes.forEachRemaining(
        sqlNode -> {
          // collect dependent variables from pc
          final SQLCondition condition = sqlNode.getPrunedSQLCondition();
          if (condition != null) {
            dependentVariables.putAll(condition.getConstraintVariables());
          }
          // collect dependent variables from param
          sqlNode.getParameterSymbolics().stream()
              .filter(Objects::nonNull)
              .forEach(expr -> SQLPCUtil.collectExpressionVariable(expr, dependentVariables));

          // collect dependent variables from return value
          final List<List<String>> retSymbolicNames = sqlNode.getRetSymbolicNames();
          retSymbolicNames.forEach(existing::addAll);
          existing.add(sqlNode.getRowCountVarName());
        });

    existing.forEach(dependentVariables::remove);
    return dependentVariables;
  }

  @Override
  public List<SQLGraph> getParents() {
    return this.parents;
  }

  @Override
  public void addParent(SQLGraph parent) {
    if (this.parents.contains(parent)) return;
    this.parents.add(parent);
    parent.addChild(this);
  }

  @Override
  public void addParents(List<SQLGraph> parents) {
    for (SQLGraph parent : parents) {
      addParent(parent);
    }
  }

  @Override
  public void removeParent(SQLGraph parent) {
    if (!this.parents.contains(parent)) return;
    this.parents.remove(parent);
    parent.removeChild(this);
  }

  @Override
  public void removeParents(List<SQLGraph> parents) {
    for (SQLGraph parent : new ArrayList<>(parents)) {
      removeParent(parent);
    }
  }

  @Override
  public void removeAllParents() {
    for (SQLGraph parent : new ArrayList<>(this.parents)) {
      removeParent(parent);
    }
  }

  @Override
  public List<SQLGraph> getChildren() {
    return this.children;
  }

  @Override
  public void addChild(SQLGraph child) {
    if (this.children.contains(child)) return;
    this.children.add(child);
    child.addParent(this);
  }

  @Override
  public void addChildren(List<SQLGraph> children) {
    for (SQLGraph child : children) {
      addChild(child);
    }
  }

  @Override
  public void removeChild(SQLGraph child) {
    if (!this.children.contains(child)) return;
    this.children.remove(child);
    child.removeParent(this);
  }

  @Override
  public void removeChildren(List<SQLGraph> children) {
    for (SQLGraph child : new ArrayList<>(children)) {
      removeChild(child);
    }
  }

  @Override
  public void removeAllChildren() {
    for (SQLGraph child : new ArrayList<>(this.children)) {
      removeChild(child);
    }
  }

  @Override
  public SQLCondition getEntryPc() {
    if (entryPc == null) {
      throw new RuntimeException("Entry PC has not been calculated!");
    }
    return entryPc;
  }

  @Override
  public void setEntryPc(SQLCondition entryPc) {
    this.entryPc = entryPc;
  }

  @Override
  public void addCommitBefore() {
    this.containsCommitBefore = true;
  }

  @Override
  public boolean isContainsCommitBefore() {
    return containsCommitBefore;
  }

  private final Map<String, Object> attrs = new HashMap<>();

  @Override
  public Object getAttribute(String name) {
    return attrs.get(name);
  }

  @Override
  public void setAttribute(String name, Object value) {
    attrs.put(name, value);
  }

  @Override
  public int hashCode() {
    return Objects.hash(rootNode, traceN, children, entryPc, containsCommitBefore);
    //    return Objects.hash(rootNode, traceN, children, containsCommitBefore);
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj) return true;
    if (!(obj instanceof SQLGraphImpl)) return false;
    SQLGraphImpl other = (SQLGraphImpl) obj;
    return traceN == other.getTraceN()
        && rootNode.equals(other.getRootNode())
        && entryPc.equals(other.getEntryPc())
        && children.equals(other.getParents())
        && containsCommitBefore == other.isContainsCommitBefore();
  }
}
