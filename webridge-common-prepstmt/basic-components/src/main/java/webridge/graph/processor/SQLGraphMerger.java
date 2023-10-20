package webridge.graph.processor;

import com.google.common.base.Joiner;
import webridge.exception.NotImplementedException;
import webridge.graph.SQLCondition;
import webridge.graph.SQLGraph;
import webridge.graph.SQLGraphHelper;
import webridge.graph.SingleTraceSQLGraph;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SQLGraphMerger implements SQLGraphProcessor {

  private static final Logger logger = LoggerFactory.getLogger(SQLGraphMerger.class);

  @Override
  public void process(SQLGraphWrapper graphWrapper) {
    List<SQLGraph> originalFinalGraphs = new ArrayList<>(graphWrapper.getFinalGraphs());
    List<SQLGraph> usedSubgraphs = new ArrayList<>();
    for (SingleTraceSQLGraph trace : graphWrapper.getTraceSubGraphs()) {
      SQLGraph graph =
          findCanMerge(originalFinalGraphs, trace).stream()
              .filter(graph1 -> !usedSubgraphs.contains(graph1))
              .findFirst()
              .orElse(null);
      if (graph == null) {
        graphWrapper.getFinalGraphs().add(trace);
      } else {
        graph.merge(trace);
        usedSubgraphs.add(graph);
      }
    }
  }

  static List<SQLGraph> findCanMerge(List<SQLGraph> graphList, SingleTraceSQLGraph traceSubgraph) {
    return graphList.stream()
        .filter(subgraph -> graphCanMerge(subgraph, traceSubgraph))
        .collect(Collectors.toList());
  }

  private static boolean graphCanMerge(SQLGraph graph, SingleTraceSQLGraph trace) {
    final List<SQLCondition> condLeft = graph.getRootNode().getAllSQLConditions();
    final List<SQLCondition> condRight = trace.getRootNode().getAllSQLConditions();
    final boolean conditionsMatch = conditionsMatch(condLeft, condRight);
    final boolean nodeCanMerge = graph.getRootNode().canMerge(trace.getRootNode());
    final boolean ret = nodeCanMerge && conditionsMatch;

    if (logger.isDebugEnabled()) {
      final String lConSql = graph.getRootNode().getConcreteSql();
      final String rConSql = trace.getRootNode().getConcreteSql();
      logger.debug(
          "\nSQL1: "
              + lConSql
              + "\nSQL2: "
              + rConSql
              + "\n"
              + " can merge:"
              + ret
              + ", condition1:"
              + Joiner.on("|").join(condLeft).replace("\n", " ")
              + ", condition2:"
              + Joiner.on("|").join(condRight).replace("\n", " "));
    }

    if (ret && graph.isContainsCommitBefore() != trace.isContainsCommitBefore()) {
      throw new NotImplementedException();
    }
    return ret;
  }

  private static boolean conditionsMatch(
      List<SQLCondition> condList1, List<SQLCondition> condList2) {
    condList1 = condList1.stream().distinct().sorted().collect(Collectors.toList());
    condList2 = condList2.stream().distinct().sorted().collect(Collectors.toList());

    if (condList1.size() != condList2.size()) {
      return false;
    }

    for (int i = 0; i < condList1.size(); i++) {
      SQLCondition cond1 = condList1.get(i);
      SQLCondition cond2 = condList2.get(i);

      if ((cond1.getConstraint() == null) != (cond2.getConstraint() == null)) {
        return false;
      }

      if (cond1.getConstraint() != null && cond2.getConstraint() != null) {
        final String l = SQLGraphHelper.constraintToStringLexicographically(cond1.getConstraint());
        final String r = SQLGraphHelper.constraintToStringLexicographically(cond2.getConstraint());
        if (!l.equals(r)) {
          return false;
        }
      }

      if ((cond1.getStringConstraint() == null) != (cond2.getStringConstraint() == null)) {
        return false;
      }

      if (cond1.getStringConstraint() != null && cond2.getStringConstraint() != null) {
        final String l =
            SQLGraphHelper.stringConstraintToStringLexicographically(cond1.getStringConstraint());
        final String r =
            SQLGraphHelper.stringConstraintToStringLexicographically(cond2.getStringConstraint());
        if (!l.equals(r)) {
          return false;
        }
      }
    }
    return true;
  }
}
