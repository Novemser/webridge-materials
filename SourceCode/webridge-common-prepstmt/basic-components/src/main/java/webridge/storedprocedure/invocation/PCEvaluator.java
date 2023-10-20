package webridge.storedprocedure.invocation;

import webridge.exception.NotImplementedException;
import webridge.graph.SQLCondition;
import webridge.storedprocedure.transformation.FunctionType;
import webridge.symbc.mixednumstrg.SpecialIntegerExpression;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import webridge.symbc.numeric.*;
import webridge.symbc.string.*;

public class PCEvaluator {
  protected static final Log logger = LogFactory.getLog(PCEvaluator.class);

  private final SPResultBuffer spBuffer;

  public PCEvaluator(SPResultBuffer spBuffer) {
    this.spBuffer = spBuffer;
  }

  boolean evaluate(SQLCondition condition) {
    final Constraint numericConstraints = condition.getConstraint();
    final StringConstraint stringConstraint = condition.getStringConstraint();
    final boolean numericRes = evaluateNumeric(numericConstraints);
    final boolean stringRes = evaluateString(stringConstraint);
    if (logger.isDebugEnabled())
      logger.debug(
          numericRes
              + " numeric pc eval res:"
              + (numericConstraints == null ? true : numericConstraints.toString()));
    if (logger.isDebugEnabled())
      logger.debug(
          stringRes
              + " string pc eval res:"
              + (stringConstraint == null ? true : stringConstraint.toString()));
    return numericRes && stringRes;
  }

  public Object getExpressionValue(Expression expr) {
    if (expr == null) {
      // a null expression means that the input (parameter) is null, so its corresponding value is
      // null
      return null;
    }

    Class<? extends Expression> exprKlz = expr.getClass();
    if (exprKlz.equals(BinaryNonLinearIntegerExpression.class)) {
      BinaryNonLinearIntegerExpression binaryNonLinearIntegerExpression =
          (BinaryNonLinearIntegerExpression) expr;
      return binaryNonLinearIntegerExpression.op.evaluate(
          ((Number) getExpressionValue(binaryNonLinearIntegerExpression.left)).longValue(),
          ((Number) getExpressionValue(binaryNonLinearIntegerExpression.right)).longValue());
    }
    if (exprKlz.equals(BinaryLinearIntegerExpression.class)) {
      BinaryLinearIntegerExpression binaryLinearIntegerExpression =
          (BinaryLinearIntegerExpression) expr;
      return binaryLinearIntegerExpression
          .getOp()
          .evaluate(
              ((Number) getExpressionValue(binaryLinearIntegerExpression.getLeft())).longValue(),
              ((Number) getExpressionValue(binaryLinearIntegerExpression.getRight())).longValue());
    } else if (exprKlz.equals(SpecialIntegerExpression.class)) {
      SpecialIntegerExpression specialIntegerExpression = (SpecialIntegerExpression) expr;
      return specialIntegerExpression.op.evaluate(
          getStringExpressionValue(specialIntegerExpression.opr));
    } else if (exprKlz.equals(IntegerConstant.class)) {
      return ((IntegerConstant) expr).value;
    } else if (exprKlz.equals(LongConstant.class)) {
      return ((LongConstant) expr).value;
    } else if (exprKlz.equals(SymbolicLengthInteger.class)) {
      SymbolicLengthInteger symbolicLengthInteger = (SymbolicLengthInteger) expr;
      return ((String) getExpressionValue(symbolicLengthInteger.getExpression())).length();
    } else if (exprKlz.equals(SymbolicCharAtInteger.class)) {
      SymbolicCharAtInteger symbolicCharAtInteger = (SymbolicCharAtInteger) expr;
      String str = (String) getExpressionValue(symbolicCharAtInteger.getExpression());
      int index = ((Long) getExpressionValue(symbolicCharAtInteger.getIndex())).intValue();
      return str.charAt(index);
    } else if (exprKlz.equals(SymbolicLastIndexOfChar2Integer.class)) {
      SymbolicLastIndexOfChar2Integer symbolicLastIndexOfChar2Integer =
          (SymbolicLastIndexOfChar2Integer) expr;
      String source = (String) getExpressionValue(symbolicLastIndexOfChar2Integer.getSource());
      char expression =
          (char)
              ((Long) getExpressionValue(symbolicLastIndexOfChar2Integer.getExpression()))
                  .longValue();
      int minDist =
          ((Long) getExpressionValue(symbolicLastIndexOfChar2Integer.getMinDist())).intValue();
      return source.lastIndexOf(expression, minDist);
    } else if (exprKlz.equals(SymbolicLastIndexOfCharInteger.class)) {
      SymbolicLastIndexOfCharInteger symbolicLastIndexOfCharInteger =
          ((SymbolicLastIndexOfCharInteger) expr);
      String sourceStr = (String) getExpressionValue(symbolicLastIndexOfCharInteger.getSource());
      Long intExpCst = (Long) getExpressionValue(symbolicLastIndexOfCharInteger.getExpression());
      return sourceStr.lastIndexOf(intExpCst.intValue());
    } else if (exprKlz.equals(SymbolicIsEmptyInteger.class)) {
      SymbolicIsEmptyInteger symbolicIsEmptyInteger = (SymbolicIsEmptyInteger) expr;
      String str = (String) getExpressionValue(symbolicIsEmptyInteger.getExpression());
      return str.isEmpty();
    } else if (exprKlz.equals(StringSymbolic.class)) {
      return spBuffer.getParam(expr.toString());
    } else if (exprKlz.equals(SymbolicBoolean.class)) {
      return spBuffer.getParam(expr.toString());
    } else if (exprKlz.equals(RealConstant.class)) {
      return ((RealConstant) expr).value;
    } else if (exprKlz.equals(SymbolicInteger.class)) {
      final String exprStr = expr.toString();
      if (exprStr.indexOf("#intCompact") != -1) {
        Pattern pattern = Pattern.compile("\\$BIG_DECIMAL\\$(.*?)#intCompact\\$BIG_DECIMAL\\$");
        Matcher matcher = pattern.matcher(exprStr);
        if (matcher.find()) {
          String name = matcher.group(1);
          BigDecimal bigDecimalVal = ((BigDecimal) spBuffer.getParam(name));
          try {
            Field intCompactFld = bigDecimalVal.getClass().getDeclaredField("intCompact");
            intCompactFld.setAccessible(true);
            return intCompactFld.get(bigDecimalVal);
          } catch (Exception e) {
            throw new RuntimeException(e);
          }
        }
      } else if (exprStr.indexOf("#scale") != -1) {
        Pattern pattern = Pattern.compile("\\$BIG_DECIMAL\\$(.*?)#scale\\$BIG_DECIMAL\\$");
        Matcher matcher = pattern.matcher(exprStr);
        if (matcher.find()) {
          String name = matcher.group(1);
          BigDecimal bigDecimalVal = ((BigDecimal) spBuffer.getParam(name));
          try {
            Field intCompactFld = bigDecimalVal.getClass().getDeclaredField("scale");
            intCompactFld.setAccessible(true);
            return intCompactFld.get(bigDecimalVal);
          } catch (Exception e) {
            throw new RuntimeException(e);
          }
        }
      } else if (exprStr.indexOf("#nanos") != -1) {
        Pattern pattern = Pattern.compile("(.*?)#nanos");
        Matcher matcher = pattern.matcher(exprStr);
        if (matcher.find()) {
          String name = matcher.group(1);
          Timestamp timestampVal = ((Timestamp) spBuffer.getParam(name));
          try {
            Field nanosFld = timestampVal.getClass().getDeclaredField("nanos");
            nanosFld.setAccessible(true);
            return nanosFld.get(timestampVal);
          } catch (Exception e) {
            throw new RuntimeException(e);
          }
        }
      } else if (exprStr.indexOf("#fastTime") != -1) {
        Pattern pattern = Pattern.compile("(.*?)#fastTime");
        Matcher matcher = pattern.matcher(exprStr);
        if (matcher.find()) {
          String name = matcher.group(1);
          Object timestampVal = spBuffer.getParam(name);
          try {
            Field fastTimeFld;
            if (timestampVal instanceof Timestamp || timestampVal instanceof java.sql.Date) {
              fastTimeFld = timestampVal.getClass().getSuperclass().getDeclaredField("fastTime");
            } else if (timestampVal instanceof java.util.Date) {
              fastTimeFld = timestampVal.getClass().getDeclaredField("fastTime");
            } else {
              throw new NotImplementedException(expr.toString());
            }

            fastTimeFld.setAccessible(true);
            return fastTimeFld.get(timestampVal);
          } catch (Exception e) {
            throw new RuntimeException(e);
          }
        }
      }
      String v = expr.toString();

      if (v.contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX)) {
        logger.error("Mocking __nd__func");
        return System.currentTimeMillis();
      }
      return spBuffer.getParam(v.replace("#value", "").replace("#", "_FIELD_"));
    } else if (exprKlz.equals(StringConstant.class)) {
      return ((StringConstant) expr).value;
    } else if (exprKlz.equals(SymbolicFunction.class)) {
      final FunctionType functionType = ((SymbolicFunction) expr).getFunctionType();
      final Expression parameterExpr = ((SymbolicFunction) expr).getParameterExpr();
      switch (functionType) {
        case TO_TIMESTAMP:
          Object expressionValue = getExpressionValue(parameterExpr);
          if (expressionValue instanceof Long) {
            return new Timestamp((Long) expressionValue);
          } else if (expressionValue instanceof String) {
            return Timestamp.valueOf((String) expressionValue);
          } else {
            throw new RuntimeException(
                "Unsupported type for TO_TIMESTAMP: " + expressionValue.getClass());
          }
      }
    } else if (exprKlz.equals(DerivedStringExpression.class)) {
      DerivedStringExpression derivedStringExpression = (DerivedStringExpression) expr;
      if (derivedStringExpression.op == StringOperator.CONCAT) {
        String left_str = (String) getExpressionValue(derivedStringExpression.left);
        String right_str = (String) getExpressionValue(derivedStringExpression.right);
        return left_str.concat(right_str);
      } else if (derivedStringExpression.op == StringOperator.SUBSTRING) {
        int len = derivedStringExpression.oprlist.length;
        assert len >= 2 : "Should be >= 2";
        String left_str = (String) getExpressionValue(derivedStringExpression.oprlist[0]);
        Integer index = (Integer) getExpressionValue(derivedStringExpression.oprlist[1]);
        if (len == 2) {
          return left_str.substring(index);
        } else if (len == 3) {
          Integer end = (Integer) getExpressionValue(derivedStringExpression.oprlist[2]);
          return left_str.substring(index, end);
        } else {
          throw new NotImplementedException(expr.toString());
        }
      } else if (derivedStringExpression.op == StringOperator.VALUEOF) {
        Expression expression = ((DerivedStringExpression) expr).oprlist[0];
        return String.valueOf(getExpressionValue(expression));
      } else {
        throw new NotImplementedException(expr.toString());
      }
    }
    if (exprKlz.equals(SymbolicPlaceHolder.class)) {
      if (expr.toString().contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX)) {
        return System.currentTimeMillis();
      }
      throw new NotImplementedException(expr.toString());
    } else if (exprKlz.equals(SymbolicDecimal.class)) {
      return new BigDecimal(5.99d);
    } else {
      throw new NotImplementedException(expr.toString());
    }
  }

  private String getStringExpressionValue(StringExpression expr) {
    // FIXME: Correct implementation
    if (!(expr.getClass().equals(StringSymbolic.class))) {
      throw new NotImplementedException();
    }
    return (String) spBuffer.getParam(expr.toString());
  }

  private boolean evaluateNumeric(Constraint numericConstraints) {
    if (numericConstraints == null || numericConstraints.toString().equalsIgnoreCase("true")) {
      return true;
    }

    boolean result;

    if (numericConstraints.getClass().equals(LinearIntegerConstraint.class)
        || numericConstraints.getClass().equals(NonLinearIntegerConstraint.class)) {
      Object lhs = getExpressionValue(numericConstraints.getLeft());
      Object rhs = getExpressionValue(numericConstraints.getRight());
      if (lhs == null || rhs == null) {
        return false;
      }
      if (lhs.getClass().equals(Double.class) && rhs.getClass().equals(Double.class)) {
        result = numericConstraints.getComparator().evaluate((Double) lhs, (Double) rhs);
      } else {
        if (lhs.getClass().equals(Character.class)) {
          lhs = (long) (Character) lhs;
        } else if (lhs.getClass().equals(Boolean.class)) {
          lhs = (Boolean) lhs ? 1L : 0L;
        }
        if (rhs.getClass().equals(Character.class)) {
          rhs = (long) (Character) rhs;
        } else if (rhs.getClass().equals(Boolean.class)) {
          rhs = (Boolean) rhs ? 1L : 0L;
        }
        lhs = ((Number) lhs).longValue();
        rhs = ((Number) rhs).longValue();
        result = numericConstraints.getComparator().evaluate((Long) lhs, (Long) rhs);
      }

    } else if (numericConstraints.getClass().equals(LogicalORIntegerConstraints.class)) {
      LogicalORIntegerConstraints logicalORIntegerConstraints =
          (LogicalORIntegerConstraints) numericConstraints;
      result = logicalORIntegerConstraints.getList().stream().anyMatch(this::evaluateNumeric);
    } else {
      throw new NotImplementedException();
    }
    result &= evaluateNumeric(numericConstraints.and);
    return result;
  }

  private boolean evaluateString(StringConstraint stringConstraints) {
    if (stringConstraints == null || stringConstraints.toString().equalsIgnoreCase("true")) {
      return true;
    }

    boolean result;

    if (!(stringConstraints.getClass().equals(LogicalOrStringConstraints.class))) {
      String lhs = getStringExpressionValue(stringConstraints.getLeft());
      String rhs = getStringExpressionValue(stringConstraints.getRight());
      result = stringConstraints.getComparator().evaluate(lhs, rhs);
    } else {
      LogicalOrStringConstraints logicalOrStringConstraints =
          (LogicalOrStringConstraints) stringConstraints;
      result = logicalOrStringConstraints.getList().stream().anyMatch(this::evaluateString);
    }
    result &= evaluateString(stringConstraints.and());
    return result;
  }
}
