package webridge.wbridge.graph.processor;

import webridge.wbridge.graph.SQLGraph;
import webridge.wbridge.graph.SingleTraceSQLGraph;
import webridge.wbridge.storedprocedure.SPDefinition;

import java.util.List;

public class SQLGraphWrapper {
  final SingleTraceSQLGraph newTrace;
  private List<SQLGraph> finalGraphs;
  private List<SingleTraceSQLGraph> traceSubGraph;
  private List<SPDefinition> spDefinitions;

  public SQLGraphWrapper(SingleTraceSQLGraph newTrace) {
    this.newTrace = newTrace;
  }

  @Deprecated
  public SQLGraphWrapper(List<SQLGraph> finalGraphs, SingleTraceSQLGraph newTrace) {
    this.finalGraphs = finalGraphs;
    this.newTrace = newTrace;
  }

  public List<SQLGraph> getFinalGraphs() {
    return finalGraphs;
  }

  public void setBaseGraph(List<SQLGraph> baseGraph) {
    this.finalGraphs = baseGraph;
  }

  public List<SingleTraceSQLGraph> getTraceSubGraphs() {
    return traceSubGraph;
  }

  public void setTraceSubGraph(List<SingleTraceSQLGraph> traceList) {
    this.traceSubGraph = traceList;
  }

  public List<SPDefinition> getSpDefinitions() {
    return spDefinitions;
  }

  public void setSpDefinitions(List<SPDefinition> spDefinitions) {
    this.spDefinitions = spDefinitions;
  }
}
