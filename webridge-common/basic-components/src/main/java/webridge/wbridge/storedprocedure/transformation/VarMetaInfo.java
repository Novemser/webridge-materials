package webridge.wbridge.storedprocedure.transformation;

import webridge.wbridge.sql.types.SQLVarType;

class VarMetaInfo {
  String varName;
  SQLVarType varType;
  String remark; // expression (for input) or label (for output)

  VarMetaInfo(String varName, SQLVarType varType, String remark) {
    this.varName = varName;
    this.varType = varType;
    this.remark = remark;
  }
}
