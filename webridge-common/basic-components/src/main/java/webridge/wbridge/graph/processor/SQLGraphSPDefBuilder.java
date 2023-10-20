package webridge.wbridge.graph.processor;

import webridge.wbridge.graph.SQLGraph;
import webridge.wbridge.graph.SQLNode;
import webridge.wbridge.graph.processor.utils.CommonPcExtractor;
import webridge.wbridge.storedprocedure.EntryPoint;
import webridge.wbridge.storedprocedure.SPConfig;
import webridge.wbridge.storedprocedure.SPDefinition;
import webridge.wbridge.storedprocedure.SPDefinitionForPrefetch;
import webridge.wbridge.storedprocedure.transformation.SPParser;
import webridge.wbridge.symbc.Constants;
import webridge.wbridge.symbc.numeric.Expression;
import webridge.wbridge.symbc.numeric.SymbolicPlaceHolder;
import webridge.wbridge.util.FileUtils;
import java.io.File;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;

public class SQLGraphSPDefBuilder implements SQLGraphProcessor {

  private static int CUR_SP_COUNTER = 0;
  private int version;
  public static boolean COMMON_PC_EXTRACTION = false;

  public static void reset() {
    CUR_SP_COUNTER = 0;
  }

  // record the mapping between graph and spDef, so that we can add child spName to SpDefinition
  // according the father-child relation of SQLGraph
  private final Map<SQLGraph, SPDefinition> graph2SpDef = new IdentityHashMap<>();

  @Override
  public void process(SQLGraphWrapper graphWrapper) {
    final String path = SPConfig.getConfig().getString(Constants.SQL_GRAPH_PATH_KEY);
    if (StringUtils.isEmpty(path)) {
      throw new RuntimeException("Miss sql graph dump file location config!");
    }
    final File parentDir = new File(path);
    FileUtils.ensureDirs(parentDir, true);

    final String PREFIX = "ver-";
    version = SQLGraphRecorder.getMaxVerInDir(parentDir, PREFIX) + 1;
    List<SQLGraph> sqlGraphs = graphWrapper.getFinalGraphs();
    assert sqlGraphs != null && sqlGraphs.size() > 0;
    List<SPDefinition> spDefinitions =
        sqlGraphs.stream().map(this::generateSpDefinition).collect(Collectors.toList());
    assert spDefinitions.size() == sqlGraphs.size();

    // populate children sp names
    for (int i = 0; i < sqlGraphs.size(); ++i) {
      for (SQLGraph childGraph : sqlGraphs.get(i).getChildren()) {
        SPDefinition childSp = graph2SpDef.get(childGraph);
        spDefinitions.get(i).addChildSpName(childSp.getSpName());
      }
    }

    graphWrapper.setSpDefinitions(spDefinitions);
  }

  private SPDefinition generateSpDefinition(SQLGraph graph) {
    if (COMMON_PC_EXTRACTION) {
      CommonPcExtractor.extractCommonPc(graph);
    }

    String spName = generateSpName();

    SPDefinition spDef;
    if (SPConfig.PREFETCH_PURE_SQL_MODE) {
      spDef =
          new SPDefinitionForPrefetch(
              EntryPoint.API_NAME,
              spName,
              SPParser.getStoredProcedureStatement(spName, graph),
              new ArrayList<>());
    } else {
      spDef =
          new SPDefinition(
              EntryPoint.API_NAME, spName, SPParser.getStoredProcedureStatement(spName, graph));
    }
    // populate column and row metadata
    Iterator<SQLNode> sortedNodesIter = graph.getTopologicalSortedNodes();
    int sqlIdx = 0;
    while (sortedNodesIter.hasNext()) {
      SQLNode curNode = sortedNodesIter.next();

      spDef.setEntryPc(graph.getEntryPc());
      spDef.addSqlTemplates(curNode.getSqlTemplate());
      spDef.addSavePointName(curNode.getSavePointName());
      if (SPConfig.PREFETCH_PURE_SQL_MODE && spDef instanceof SPDefinitionForPrefetch) {
        // in prefetch mode, there should be only one SQL in each SP
        ((SPDefinitionForPrefetch) spDef).addParameterExpressions(curNode.getParameterSymbolics());
      }

      if (!StringUtils.isEmpty(curNode.getRowCountVarName())) {
        spDef.putSqlRetCntVarNames(sqlIdx, curNode.getRowCountVarName());
      }
      spDef.putSqlSelectColumnVarNames(sqlIdx, curNode.getRetSymbolicNames());
      sqlIdx++;
    }
    // add parameter vars
    graph.extractDependentVariables().keySet().forEach(spDef::addParameterVar);
    // add variables to collect from first sql's actual parameters
    List<Expression> rootNodeSymbolics = graph.getRootNode().getParameterSymbolics();
    List<Pair<Integer, String>> firstSqlParamsToCollect =
        IntStream.range(0, rootNodeSymbolics.size())
            .filter(
                i -> {
                  // TODO reverse the parameter expression to get the real nd variable inside.
                  Expression expr = rootNodeSymbolics.get(i);
                  return expr != null
                      && expr.toString().contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX);
                })
            .mapToObj(i -> Pair.of(i, rootNodeSymbolics.get(i).toString()))
            .collect(Collectors.toList());
    spDef.setFirstSqlParamsToCollect(firstSqlParamsToCollect);
    spDef.setContainsCommitBefore(graph.isContainsCommitBefore());
    this.graph2SpDef.put(graph, spDef);
    return spDef;
  }

  private String generateSpName() {
    return String.format(SPConfig.SP_NAME_TEMPLATE, EntryPoint.API_NAME, ++CUR_SP_COUNTER, version);
  }
}
