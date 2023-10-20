package webridge.graph.processor;

import webridge.graph.visit.impl.SQLGraphExpressionRenameVisitor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.tuple.Pair;
import webridge.graph.SQLGraph;
import webridge.graph.SQLGraphHelper;
import webridge.graph.SQLNode;
import webridge.graph.SingleTraceSQLGraph;

public class ExpressionRenameProcessor implements SQLGraphProcessor {

  /**
   * Process expression rename for the trace. Due to the fact that a SQL node which should be merged
   * in two traces might have different PC, param, etc. while the only difference is expression
   * name. e.g.: Node n in trace1: select * from XXX where id = q3_res_id; Node m in trace2: select
   * * from XXX where id = q4_res_id; These two nodes should be merged, however param expression
   * differ, so what this processor does is to rename expressions so that a same q3_res_id and
   * q4_res_id should have the same name. How to rename: TODO
   */
  @Override
  public void process(SQLGraphWrapper graphWrapper) {
    List<SQLGraph> originalFinalGraphs = new ArrayList<>(graphWrapper.getFinalGraphs());
    boolean renameHappened = true;
    while (renameHappened) {
      List<SQLGraph> usedSubgraphs = new ArrayList<>();
      renameHappened = false;
      Map<String, String> namesToRename = new HashMap<>();
      for (SingleTraceSQLGraph trace : graphWrapper.getTraceSubGraphs()) {
        SQLGraph graph =
            SQLGraphMerger.findCanMerge(originalFinalGraphs, trace).stream()
                .filter(graph1 -> !usedSubgraphs.contains(graph1))
                .findFirst()
                .orElse(null);
        if (graph != null) {
          usedSubgraphs.add(graph);
          List<Pair<SQLNode, SQLNode>> commonSQLList =
              SQLGraphHelper.findLongestEqualSubSQLSeq(graph, trace);

          commonSQLList.forEach(
              pair -> namesToRename.putAll(collectNamesToRename(pair.getLeft(), pair.getRight())));
        }
      }
      if (!namesToRename.isEmpty()) {
        renameHappened = true;
      }

      graphWrapper
          .getTraceSubGraphs()
          .forEach(
              trace ->
                  trace
                      .getRootNode()
                      .accept(new SQLGraphExpressionRenameVisitor(namesToRename), trace, null));
    }
  }

  private static Map<String, String> collectNamesToRename(SQLNode node1, SQLNode node2) {
    List<List<String>> node1RetSymNames = node1.getRetSymbolicNames();
    List<List<String>> node2RetSymNames = node2.getRetSymbolicNames();
    String node1RowCountVarName = node1.getRowCountVarName();
    String node2RowCountVarName = node2.getRowCountVarName();
    String node1SavePointName = node1.getSavePointName();
    String node2SavePointName = node2.getSavePointName();

    final Map<String, String> nameMapping = new HashMap<>();
    for (int i = 0; i < node1RetSymNames.size() && i < node2RetSymNames.size(); i++) {
      List<String> node1RetSymNamesRow = node1RetSymNames.get(i);
      List<String> node2RetSymNamesRow = node2RetSymNames.get(i);

      for (int j = 0; j < node1RetSymNamesRow.size(); j++) {
        String node1Name = node1RetSymNamesRow.get(j);
        String node2Name = node2RetSymNamesRow.get(j);
        if (!node1Name.equals(node2Name)) {
          nameMapping.put(node2Name, node1Name);
        }
      }
    }

    if (node1RowCountVarName != null
        && node2RowCountVarName != null
        && !node1RowCountVarName.equals(node2RowCountVarName)) {
      nameMapping.put(node2RowCountVarName, node1RowCountVarName);
    }

    if (node1SavePointName != null
        && node2SavePointName != null
        && !node1SavePointName.equals(node2SavePointName)) {
      nameMapping.put(node2SavePointName, node1SavePointName);
    }

    return nameMapping;
  }
}
