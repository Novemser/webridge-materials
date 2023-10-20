package webridge.wbridge.symbc.string;

import webridge.wbridge.symbc.numeric.SymbolicInteger;

public class SymbolicIsEmptyInteger extends SymbolicInteger {
  StringExpression parent;

  public SymbolicIsEmptyInteger(String name, int l, int u, StringExpression parent) {
    super(name, l, u);
    this.parent = parent;
  }

  public StringExpression getExpression() {
    return this.parent;
  }
}
