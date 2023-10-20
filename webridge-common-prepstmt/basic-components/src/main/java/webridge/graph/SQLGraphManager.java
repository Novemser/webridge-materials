package webridge.graph;

import webridge.graph.impl.SingleTraceGraphImpl;
import webridge.graph.processor.*;

import java.util.ArrayList;
import java.util.List;

public abstract class SQLGraphManager {

  private static SingleTraceSQLGraph CURRENT_GRAPH;

  public static SingleTraceSQLGraph getCurrentGraph() {
    return CURRENT_GRAPH;
  }

  public static void addSQLNodeToCurrentGraph(SQLNode node) {
    if (CURRENT_GRAPH == null) {
      CURRENT_GRAPH = new SingleTraceGraphImpl(node);
    } else {
      CURRENT_GRAPH.appendNewNode(node);
    }
  }

  public static void reset() {
    CURRENT_GRAPH = null;
  }

  public static void generateStoredProcedure(SingleTraceSQLGraph newTrace) {
    List<SQLGraphProcessor> graphProcessors = new ArrayList<>();
    graphProcessors.add(new SQLGraphRestorer());
    graphProcessors.add(new SQLGraphSavepointGenBeforeSplit()); // process before spliting graph
    graphProcessors.add(new SingleTraceSQLGraphSpliter());
    graphProcessors.add(new SQLGraphSavepointGenAfterSplit()); // process after spliting graph
    graphProcessors.add(new ExpressionRenameProcessor());
    graphProcessors.add(new SQLGraphMerger());
    graphProcessors.add(new SQLGraphEntryPCGenerator()); // set entry pc before pc pruning
    graphProcessors.add(new SQLGraphPCPruner());
    graphProcessors.add(new SQLGraphSPDefBuilder());
    graphProcessors.add(new SQLGraphRecorder());

    SQLGraphWrapper graphWrapper = new SQLGraphWrapper(newTrace);
    graphProcessors.forEach(processor -> processor.process(graphWrapper));
  }
}
