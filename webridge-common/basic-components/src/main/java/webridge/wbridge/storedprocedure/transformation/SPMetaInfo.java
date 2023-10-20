package webridge.wbridge.storedprocedure.transformation;

import webridge.wbridge.sql.types.SQLVarType;
import webridge.wbridge.symbc.numeric.PathCondition;

import java.util.*;

class SPMetaInfo {

  SPMetaInfo() {
    this.spInputVariable = new LinkedHashMap<>();
    this.sqlInfos = new ArrayList<>();
    this.premisedVariables = new ArrayList<>();
    this.concentratedPcs = new HashMap<>();
  }

  SPMetaInfo(Map<String, PathCondition> pcs) {
    this();
    if (pcs != null) this.concentratedPcs.putAll(pcs);
  }

  LinkedHashMap<String, SQLVarType>
      spInputVariable; // stored procedure input (variable name -> type)
  List<VarMetaInfo> premisedVariables; // variables that need to define at the beginning of sp
  List<SQLMetaInfo> sqlInfos;
  Map<String, PathCondition> concentratedPcs; // pcs that extracted common expression
}
