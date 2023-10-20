package webridge.wbridge.graph.processor;

import webridge.wbridge.graph.SQLNode;
import webridge.wbridge.graph.SingleTraceSQLGraph;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * After graph split, a read-write txn may be split into multiple subgraph. As a result, some
 * savepoint in a subgraph may be useless. These useless savepoints are removed in this processor.
 */
public class SQLGraphSavepointGenAfterSplit implements SQLGraphProcessor {

  @Override
  public void process(SQLGraphWrapper graphWrapper) {
    List<SingleTraceSQLGraph> subtraces = graphWrapper.getTraceSubGraphs();
    subtraces.forEach(
        st -> {
          Iterator<SQLNode> nodeIterator = st.getTopologicalSortedNodes();
          List<SQLNode> allNodes = new ArrayList<>();
          nodeIterator.forEachRemaining(allNodes::add);

          String validSavep = null;
          for (int i = allNodes.size() - 1; i >= 0; i--) {
            SQLNode curNode = allNodes.get(i);
            if (curNode.getSqlType().isWriteSql() && curNode.getSavePointName() != null) {
              validSavep = curNode.getSavePointName();
            }

            if (curNode.getSavePointName() != null) {
              if (validSavep == null) {
                curNode.setSavePointName(null); // this savepoint may be split into next subtrace
              } else {
                assert validSavep.equals(curNode.getSavePointName());
              }
            }
          }
        });
  }
}
