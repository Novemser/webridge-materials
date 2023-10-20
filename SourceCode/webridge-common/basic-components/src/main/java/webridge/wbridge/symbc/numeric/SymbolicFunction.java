package webridge.wbridge.symbc.numeric;

import webridge.wbridge.storedprocedure.transformation.FunctionType;
import java.util.Map;

public class SymbolicFunction extends Expression {
  FunctionType functionType;
  Expression parameterExpr;

  public SymbolicFunction(FunctionType functionType, Expression parameterExpr) {
    this.functionType = functionType;
    this.parameterExpr = parameterExpr;
  }

  @Override
  public String toString() {
    return functionType.toString() + "(" + parameterExpr.toString() + ")";
  }

  @Override
  public String stringPC() {
    return toString();
  }

  @Override
  public void getVarsVals(Map<String, Object> varsVals) {
    parameterExpr.getVarsVals(varsVals);
  }

  @Override
  public void accept(ConstraintExpressionVisitor visitor) {
    visitor.preVisit(this);
    parameterExpr.accept(visitor);
    visitor.postVisit(this);
  }

  public Expression getParameterExpr() {
    return parameterExpr;
  }

  public FunctionType getFunctionType() {
    return functionType;
  }

  @Override
  public int compareTo(Expression expr) {
    if (expr instanceof SymbolicFunction) {
      return parameterExpr.compareTo(((SymbolicFunction) expr).parameterExpr);
    } else {
      return getClass().getCanonicalName().compareTo(expr.getClass().getCanonicalName());
    }
  }
}
