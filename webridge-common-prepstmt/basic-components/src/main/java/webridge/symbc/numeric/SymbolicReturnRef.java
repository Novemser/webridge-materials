package webridge.symbc.numeric;

import webridge.symbc.arrays.ArrayExpression;
import webridge.symbc.string.StringSymbolic;

public class SymbolicReturnRef extends SymbolicRef {
  private int objId;

  // ********* support for type casting *********
  private String castedTypeName;
  private StringSymbolic stringAttr;
  private ArrayExpression arrayAttr;

  public String getCastedTypeName() {
    return castedTypeName;
  }

  public void setCastedTypeName(String castedTypeName) {
    this.castedTypeName = castedTypeName;
  }

  public int getObjId() {
    return objId;
  }

  public void setObjId(int objId) {
    this.objId = objId;
  }

  public void castToStringType(StringSymbolic stringAttr) {
    this.stringAttr = stringAttr;
  }

  public void castToArrayType(ArrayExpression arrayAttr) {
    this.arrayAttr = arrayAttr;
  }

  public StringSymbolic getCastedStringAttr() {
    return stringAttr;
  }

  public ArrayExpression getCastedArrayAttr() {
    return arrayAttr;
  }

  public boolean isCastedToStringType() {
    return stringAttr != null;
  }

  public boolean isCastedToArrayType() {
    return arrayAttr != null;
  }

  public SymbolicReturnRef(String name) {
    super(name);
  }
}
