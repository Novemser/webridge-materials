package webridge.symbc.numeric;

import webridge.storedprocedure.transformation.FunctionType;

public class SymbolicCastFunction extends SymbolicFunction {
  private final byte type;

  public SymbolicCastFunction(FunctionType functionType, Expression parameterExpr, byte type) {
    super(functionType, parameterExpr);
    this.type = type;
  }

  public byte getType() {
    return type;
  }
}
