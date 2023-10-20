package webridge.wbridge.storedprocedure.transformation;

import webridge.wbridge.sql.types.SQLVarType;
import webridge.wbridge.sql.types.SqlType;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;

class SQLMetaInfo {

  final int sqlIdx;
  final SqlType sqlType;
  final String sqlTemplate;
  final String pathCondition;
  final List<VarMetaInfo> parameters;
  final List<List<VarMetaInfo>> returnValues; // can be multiple rows
  final List<VarMetaInfo> prologueVars; // variables that need to define before this sql
  final List<VarMetaInfo> epilogueVars; // variables that need to define after this sql
  final List<Integer> dependedSelects; // selects that depend on the output of this sql
  final List<Integer> dependedUpdates; // updates that depend on the output of this sql
  final List<Pair<Integer, Integer>>
      dependOnSelectAtRow; // this sql depends on the result of selects <sqlIdx, rowIdx>
  // used to record the number of rows of resultSet. This variable is NOT included in returnValues.
  final VarMetaInfo rowCntVar;
  final VarMetaInfo cursorCntVar;
  final String savePointName;
  final String nonConcentratedPc;

  // following two variables are used for defer execution
  //  final int writeSqlConcreteRet;
  //  final BreakInfo breakInfo;

  SQLMetaInfo(
      int sqlIdx,
      SqlType sqlType,
      String sqlTemplate,
      String pc,
      String retCntVar,
      String savePointName,
      String nonConcentratedPc) {
    this.sqlIdx = sqlIdx;
    this.sqlType = sqlType;
    this.sqlTemplate = sqlTemplate;
    this.pathCondition = pc;
    this.parameters = new ArrayList<>();
    this.returnValues = new ArrayList<>();
    this.prologueVars = new ArrayList<>();
    this.epilogueVars = new ArrayList<>();
    this.dependedSelects = new ArrayList<>();
    this.dependedUpdates = new ArrayList<>();
    this.dependOnSelectAtRow = new ArrayList<>();
    this.savePointName = savePointName;
    if (!StringUtils.isEmpty(retCntVar)) {
      this.rowCntVar = new VarMetaInfo(retCntVar, SQLVarType.INT, retCntVar);
      String var = "cursor_cnt_" + sqlIdx;
      this.cursorCntVar = new VarMetaInfo(var, SQLVarType.INT, var);
      // TODO remove this cursorCntVar
    } else {
      this.rowCntVar = null;
      this.cursorCntVar = null;
    }
    this.nonConcentratedPc = nonConcentratedPc;
  }

  SQLMetaInfo(
      int sqlIdx,
      SqlType sqlType,
      String sqlTemplate,
      String pc,
      String retCntVar,
      String savePointName) {
    this(sqlIdx, sqlType, sqlTemplate, pc, retCntVar, savePointName, null);
  }

  boolean returnVarContains(String vName) {
    for (List<VarMetaInfo> varMetaInfos : returnValues) {
      for (VarMetaInfo varMeta : varMetaInfos) {
        if (varMeta.varName.equals(vName)) return true;
      }
    }
    return false;
  }

  boolean parameterExprContainsVar(String vName) {
    for (VarMetaInfo varMeta : parameters) {
      String vExpr = varMeta.remark;
      if (vExpr.contains(vName)) return true;
    }
    return false;
  }

  boolean pathConditionContainsVar(String vName) {
    return pathCondition.contains(vName)
        || (nonConcentratedPc != null && nonConcentratedPc.contains(vName));
  }
}
