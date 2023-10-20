package webridge.storedprocedure.transformation;

import static webridge.graph.processor.utils.CommonPcExtractor.parseLeadingCommonPcVarName;
import static webridge.graph.processor.utils.CommonPcExtractor.startsWithCommonPcVarName;

import webridge.graph.SQLGraph;
import webridge.graph.processor.utils.CommonPcExtractor;
import webridge.hack.pc.BigDecimalHandler;
import webridge.sql.SymSQL;
import webridge.sql.types.SQLVarType;
import webridge.sql.types.SqlType;
import webridge.storedprocedure.SPConfig;
import webridge.storedprocedure.SPContext;
import webridge.storedprocedure.utils.SQLPCUtil;
import webridge.symbc.numeric.PathCondition;
import java.util.*;
import java.util.regex.Matcher;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;

class SPMetaInfoBuilder {

  private final SPContext spCtx;
  private final SPMetaInfo resultSPInfo;

  static SPMetaInfoBuilder of(SPContext spCtx) {
    return new SPMetaInfoBuilder(spCtx);
  }

  @SuppressWarnings("all")
  SPMetaInfoBuilder(SPContext spCtx) {
    this.spCtx = spCtx;
    if (spCtx instanceof SQLGraph) {
      this.resultSPInfo =
          new SPMetaInfo(
              (Map<String, PathCondition>)
                  ((SQLGraph) spCtx).getAttribute(CommonPcExtractor.CONCENTRATED_PC));
    } else {
      this.resultSPInfo = new SPMetaInfo();
    }
  }

  SPMetaInfo build() {
    extractSPInput();
    extractSQLParamAndRet();
    return extractDependencies(resultSPInfo);
  }

  // extract input parameters of the sp
  private void extractSPInput() {
    resultSPInfo.spInputVariable.putAll(spCtx.extractDependentVariables());
  }

  private void extractSQLParamAndRet() {
    final Map<String, PathCondition> originalPcs = new HashMap<>();
    final Map<String, PathCondition> concentratedPcs = new HashMap<>();
    if (spCtx instanceof SQLGraph) {
      boolean containsCommitBefore = ((SQLGraph) spCtx).isContainsCommitBefore();
      if (containsCommitBefore
          && !SPConfig.EXPERIMENT_PREFETCH) { // do not piggyback commit in prefetch mode
        final SQLMetaInfo sqlMetaInfo =
            new SQLMetaInfo(-1, SqlType.COMMIT, "commit", "true", null, null);
        resultSPInfo.sqlInfos.add(sqlMetaInfo);
      }
      final Object originalPcAttributes =
          ((SQLGraph) spCtx).getAttribute(CommonPcExtractor.ORIGINAL_PC);
      if (originalPcAttributes != null) {
        originalPcs.putAll((Map<? extends String, ? extends PathCondition>) originalPcAttributes);
      }
      final Object concentratedPcAttributes =
          ((SQLGraph) spCtx).getAttribute(CommonPcExtractor.CONCENTRATED_PC);
      if (concentratedPcAttributes != null) {
        concentratedPcs.putAll(
            (Map<? extends String, ? extends PathCondition>) concentratedPcAttributes);
      }
    }

    // these decimal columns need to transform to intCompact+scale
    final HashSet<Pair<String, SQLVarType>> specialDecimalCol = new HashSet<>();
    // extract all SQL statements into RawSQLInfos
    Iterator<SymSQL> sqlIterator = spCtx.getSymSQLList();
    int sqlIdx = -1;
    while (sqlIterator.hasNext()) {
      sqlIdx++;
      SymSQL sqlTemplate = sqlIterator.next();
      assert !StringUtils.isEmpty(sqlTemplate.getRowCountVarName())
          || sqlTemplate.getSqlType().isTxnControl();
      final String actualPc =
          sqlTemplate.getPathConditionStr().replace(BigDecimalHandler.DECIMAL_WRAPPER, "");
      final String originalPcStr;
      if (startsWithCommonPcVarName(actualPc)) {
        final String var = parseLeadingCommonPcVarName(actualPc);
        if (!CommonPcExtractor.INTER_PROCEDURE) {
          originalPcStr = SQLPCUtil.simplifyPathCondition(originalPcs.get(var));
        } else {
          originalPcStr = SQLPCUtil.simplifyPathCondition(concentratedPcs.get(var));
        }
      } else {
        originalPcStr = null;
      }
      final SQLMetaInfo sqlMetaInfo =
          new SQLMetaInfo(
              sqlIdx,
              sqlTemplate.getSqlType(),
              sqlTemplate.getSqlTemplate().replace("?", "%s"),
              actualPc, // remove DECIMAL WRAPPER
              sqlTemplate.getRowCountVarName(),
              sqlTemplate.getSavePointName(),
              originalPcStr);

      // special decimal from path condition
      recordDecimalVarFromPC(sqlTemplate.getPathConditionStr(), specialDecimalCol);
      // do not forget pc before Common Expression Elimination opt.
      recordDecimalVarFromPC(originalPcStr, specialDecimalCol);

      // parameters
      final List<String> paramExprs = sqlTemplate.getParameterExprs();
      final List<SQLVarType> paramTypes = sqlTemplate.getParameterTypes();
      for (int pIdx = 0; pIdx < paramExprs.size(); pIdx++) {
        final String paramExpr = paramExprs.get(pIdx);
        final SQLVarType paramType = paramTypes.get(pIdx);
        recordDecimalVarFromParameter(paramExpr, paramType, specialDecimalCol);

        String newParamExpr = paramExpr.replace(BigDecimalHandler.DECIMAL_WRAPPER, "");
        sqlMetaInfo.parameters.add(
            new VarMetaInfo(generateInputVarName(sqlIdx + 1, pIdx + 1), paramType, newParamExpr));
      }

      // return values
      for (List<String> vars : sqlTemplate.getRetSymbolicNames()) {
        assert vars.size() == sqlTemplate.getRetValNames().size();
        assert sqlTemplate.getSqlType() == SqlType.SELECT;
        List<VarMetaInfo> varMetasOfOneRow = new ArrayList<>();
        sqlMetaInfo.returnValues.add(varMetasOfOneRow);
        for (int i = 0; i < vars.size(); i++) {
          String retValName = vars.get(i);
          SQLVarType retValType = sqlTemplate.getRetValTypes().get(i);
          String retValAlias = sqlTemplate.getRetValAlias().get(i);
          if (StringUtils.isEmpty(retValAlias)) {
            // Assign a random alias name as identifier if non-exist. Support unified processing of
            // select ... AS alias name syntax. MySQL does not allow the 'alias' to be null/empty
            retValAlias = "_" + UUID.randomUUID().toString().substring(0, 4);
          }
          varMetasOfOneRow.add(new VarMetaInfo(retValName, retValType, retValAlias));
        }
      }

      resultSPInfo.sqlInfos.add(sqlMetaInfo);
    }

    transformDecimalParameter(specialDecimalCol);
  }

  private SPMetaInfo extractDependencies(SPMetaInfo spMetaInfo) {
    final int sqlNum = spMetaInfo.sqlInfos.size();
    for (int formerIdx = 0; formerIdx < sqlNum; ++formerIdx) {
      SQLMetaInfo formerSql = spMetaInfo.sqlInfos.get(formerIdx);
      for (int laterIdx = formerIdx + 1; laterIdx < sqlNum; ++laterIdx) {
        SQLMetaInfo laterSql = spMetaInfo.sqlInfos.get(laterIdx);

        boolean depend = false; // whether param of laterSql depends on return val of formerSql
        int dependOnRow = -1;
        for (int rowIdx = 0; rowIdx < formerSql.returnValues.size(); ++rowIdx) {
          List<VarMetaInfo> varMetaInfoList = formerSql.returnValues.get(rowIdx);
          for (VarMetaInfo retVarMeta : varMetaInfoList) {
            if (laterSql.parameterExprContainsVar(retVarMeta.varName)
                || laterSql.pathConditionContainsVar(retVarMeta.varName)) {
              depend = true;
              dependOnRow = rowIdx;
              break;
            }
          }
        }
        if (!depend) continue;

        if (laterSql.sqlType == SqlType.SELECT) {
          formerSql.dependedSelects.add(laterSql.sqlIdx);
        } else {
          formerSql.dependedUpdates.add(laterSql.sqlIdx);
        }

        if (formerSql.sqlType == SqlType.SELECT) {
          laterSql.dependOnSelectAtRow.add(Pair.of(formerIdx, dependOnRow));
        }
      }
    }
    return spMetaInfo;
  }

  private void recordDecimalVarFromPC(
      String pcStr, HashSet<Pair<String, SQLVarType>> specialDecimalCol) {
    if (StringUtils.isEmpty(pcStr)) return;
    Matcher paramMatcher = BigDecimalHandler.INT_COMPACT_PATTERN.matcher(pcStr);
    while (paramMatcher.find()) {
      String var = paramMatcher.group(1);
      specialDecimalCol.add(Pair.of(var, SQLVarType.BIGINT));
    }

    paramMatcher = BigDecimalHandler.SCALE_PATTERN.matcher(pcStr);
    while (paramMatcher.find()) {
      String var = paramMatcher.group(1);
      specialDecimalCol.add(Pair.of(var, SQLVarType.INT));
    }
  }

  private void recordDecimalVarFromParameter(
      String paramExpr, SQLVarType paramType, HashSet<Pair<String, SQLVarType>> specialDecimalCol) {
    // logic for bigdecimal
    if (paramExpr.contains(SemanticEqualTransformer.DECIMAL_FUNC_NAME)) {
      assert paramType == SQLVarType.DECIMAL;
      Matcher funcMatcher = BigDecimalHandler.DECIMAL_FUNC_PATTERN.matcher(paramExpr);
      boolean find = funcMatcher.find();
      assert find;
      String left = funcMatcher.group(1);
      String right = funcMatcher.group(2);
      assert !funcMatcher.find();

      Matcher paramMatcher = BigDecimalHandler.INT_COMPACT_PATTERN.matcher(left);
      while (paramMatcher.find()) {
        String var = paramMatcher.group(1);
        specialDecimalCol.add(Pair.of(var, SQLVarType.BIGINT));
      }

      paramMatcher = BigDecimalHandler.SCALE_PATTERN.matcher(right);
      find = paramMatcher.find();
      if (find) {
        String var = paramMatcher.group(1);
        specialDecimalCol.add(Pair.of(var, SQLVarType.INT));
        assert !paramMatcher.find();
      }
    }
  }

  private void transformDecimalParameter(HashSet<Pair<String, SQLVarType>> specialDecimalCol) {
    // handle specical decimal column
    if (specialDecimalCol.size() > 0) {
      resultSPInfo.sqlInfos.forEach(
          sInfo -> {
            Iterator<Pair<String, SQLVarType>> iterator = specialDecimalCol.iterator();
            while (iterator.hasNext()) {
              Pair<String, SQLVarType> element = iterator.next();
              String var = element.getLeft();
              SQLVarType type = element.getRight();
              if (sInfo.returnVarContains(var)) {
                iterator.remove();
                if (type == SQLVarType.BIGINT) {
                  sInfo.epilogueVars.add(
                      new VarMetaInfo(
                          var + "_intCompact",
                          type,
                          String.format(
                              SemanticEqualTransformer.GET_INT_COMPACT_FUNC + "(%s)", var)));
                } else {
                  sInfo.epilogueVars.add(
                      new VarMetaInfo(
                          var + "_scale",
                          type,
                          String.format(SemanticEqualTransformer.GET_SCALE_FUNC + "(%s)", var)));
                }
              }
            }
          });
    }

    // remaining decimals are from sp inputs, add those new variables to the first sql's prologue
    if (specialDecimalCol.size() > 0) {
      Iterator<Pair<String, SQLVarType>> iterator = specialDecimalCol.iterator();
      while (iterator.hasNext()) {
        Pair<String, SQLVarType> element = iterator.next();
        String var = element.getLeft();
        SQLVarType type = element.getRight();
        if (type == SQLVarType.BIGINT) {
          resultSPInfo.premisedVariables.add(
              new VarMetaInfo(
                  var + "_intCompact",
                  type,
                  String.format(SemanticEqualTransformer.GET_INT_COMPACT_FUNC + "(%s)", var)));
        } else {
          resultSPInfo.premisedVariables.add(
              new VarMetaInfo(
                  var + "_scale",
                  type,
                  String.format(SemanticEqualTransformer.GET_SCALE_FUNC + "(%s)", var)));
        }
        iterator.remove();
      }
    }
  }

  private static final String INPUT_VAR_TEMPLATE = "q%d_i%d";

  private String generateInputVarName(int sqlIndex, int varIndex) {
    return String.format(INPUT_VAR_TEMPLATE, sqlIndex, varIndex);
  }
}
