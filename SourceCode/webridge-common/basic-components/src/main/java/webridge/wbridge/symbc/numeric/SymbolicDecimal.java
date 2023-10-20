package webridge.wbridge.symbc.numeric;

import webridge.wbridge.storedprocedure.transformation.SemanticEqualTransformer;
import java.util.Map;

public class SymbolicDecimal extends Expression {
  private IntegerExpression symbolicIntCompact;
  private IntegerExpression symbolicScale;

  public SymbolicDecimal(IntegerExpression symbolicIntCompact, IntegerExpression symbolicScale) {
    this.symbolicIntCompact = symbolicIntCompact;
    this.symbolicScale = symbolicScale;
  }

  public IntegerExpression getSymbolicIntCompact() {
    return symbolicIntCompact;
  }

  public IntegerExpression getSymbolicScale() {
    return symbolicScale;
  }

  @Override
  public String toString() {
    return SemanticEqualTransformer.DECIMAL_FUNC_NAME
        + "("
        + symbolicIntCompact.toString()
        + ", "
        + symbolicScale.toString()
        + ')';
  }

  @Override
  public String stringPC() {
    return SemanticEqualTransformer.DECIMAL_FUNC_NAME
        + "("
        + symbolicIntCompact.stringPC()
        + ", "
        + symbolicScale.stringPC()
        + ')';
  }

  @Override
  public void getVarsVals(Map<String, Object> varsVals) {
    symbolicIntCompact.getVarsVals(varsVals);
    symbolicScale.getVarsVals(varsVals);
  }

  @Override
  public void accept(ConstraintExpressionVisitor visitor) {
    visitor.preVisit(this);
    symbolicIntCompact.accept(visitor);
    symbolicScale.accept(visitor);
    visitor.postVisit(this);
  }

  @Override
  public int compareTo(Expression expr) {
    if (expr instanceof SymbolicDecimal) {
      SymbolicDecimal e = (SymbolicDecimal) expr;
      int r = getSymbolicIntCompact().compareTo(e.getSymbolicIntCompact());
      if (r == 0) {
        r = getSymbolicScale().compareTo(e.getSymbolicScale());
      }
      return r;
    } else {
      return getClass().getCanonicalName().compareTo(expr.getClass().getCanonicalName());
    }
  }
}
