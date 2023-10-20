package webridge.storedprocedure.utils;

import static webridge.vm.Types.getTypeName;

import com.google.common.base.Joiner;
import webridge.hack.pc.BigDecimalHandler;
import webridge.sql.types.SQLVarType;
import webridge.storedprocedure.SPConfig;
import webridge.storedprocedure.SPManager;
import webridge.storedprocedure.transformation.FunctionType;
import webridge.storedprocedure.transformation.SemanticEqualTransformer;
import webridge.symbc.mixednumstrg.SpecialIntegerExpression;
import webridge.symbc.mixednumstrg.SpecialOperator;
import webridge.vm.Types;
import java.util.*;
import java.util.stream.Collectors;
import org.apache.commons.lang.NotImplementedException;
import webridge.symbc.numeric.*;
import webridge.symbc.string.*;

// TODO rewrite this with visitor pattern
public abstract class SQLPCUtil {

  public static final int NULL_CONSTANT = -1;

  private static final Set<String> seenNdVars = new HashSet<>();

  public static String simplifyPathCondition(PathCondition pc) {
    if (pc == null) return null;
    String normalPc = expandConstraint(pc.header);
    String strPc = expandConstraint(pc.spc.header);
    if (normalPc != null && strPc != null) {
      return normalPc + " && " + strPc;
    } else if (normalPc != null) {
      return normalPc;
    } else if (strPc != null) {
      return strPc;
    } else {
      // pc contains nothing, which -> true
      return "true";
    }
  }

  public static String expandConstraint(Object constraint) {
    if (constraint == null) return null;
    if (constraint instanceof StringConstraintWrapper) {
      // convert to normal string constraint
      final StringConstraintWrapper casted = (StringConstraintWrapper) constraint;
      constraint = casted.unwrap();
    }

    if (constraint instanceof Constraint) {
      Constraint subConstraint = (Constraint) constraint;
      final Expression leftCons = subConstraint.getLeft();
      final Expression rightCons = subConstraint.getRight();
      if (subConstraint instanceof LinearIntegerConstraint
          || subConstraint instanceof MixedConstraint
          || subConstraint instanceof GeneralMixedConstraint
          || subConstraint instanceof NonLinearIntegerConstraint
          || subConstraint instanceof RealConstraint) {
        String current =
            expandExpression(leftCons)
                + subConstraint.getComparator().toString()
                + expandExpression(rightCons);

        String next = expandConstraint(subConstraint.and);
        if (next != null) return next + " && " + current;
        else return current;
      } else if (subConstraint instanceof LogicalORIntegerConstraints) {
        LogicalORIntegerConstraints logicalORIntegerConstraints =
            (LogicalORIntegerConstraints) subConstraint;
        if (logicalORIntegerConstraints.getList().stream().allMatch(Objects::isNull)) {
          return null;
        }
        List<String> orItems =
            logicalORIntegerConstraints.getList().stream()
                .map(sub -> "(" + expandConstraint(sub) + ")")
                .distinct()
                .collect(Collectors.toList());
        return Joiner.on(" || ").join(orItems);
      } else {
        throw new NotImplementedException(subConstraint.toString());
      }
    } else if (constraint instanceof LogicalOrStringConstraints) {
      LogicalOrStringConstraints logicalOrStringConstraints =
          (LogicalOrStringConstraints) constraint;
      if (logicalOrStringConstraints.getList().stream().allMatch(Objects::isNull)) {
        return null;
      }
      List<String> orItems =
          logicalOrStringConstraints.getList().stream()
              .map(sub -> "(" + expandConstraint(sub) + ")")
              .distinct()
              .collect(Collectors.toList());
      return Joiner.on(" or ").join(orItems);
    } else if (constraint instanceof StringConstraint) {
      StringConstraint subConstraint = (StringConstraint) constraint;
      final Expression leftCons = subConstraint.getLeft();
      final Expression rightCons = subConstraint.getRight();
      final String current;
      final String leftConsExpr = expandExpression(leftCons);
      final String rightConsExpr = expandExpression(rightCons);
      switch (subConstraint.getComparator()) {
        case CONTAINS:
          current =
              SemanticEqualTransformer.getTransformedSpFunction(
                  FunctionType.CONTAINS, leftConsExpr, rightConsExpr);
          break;
        case EQUALS:
        case EQ:
          current =
              SemanticEqualTransformer.getTransformedSpFunction(
                  FunctionType.EQUALS, leftConsExpr, rightConsExpr);
          break;
        case NOTEQUALS:
        case NE:
          current =
              SemanticEqualTransformer.getTransformedSpFunction(
                  FunctionType.NOT_EQUALS, leftConsExpr, rightConsExpr);
          break;
        case EQUALSIGNORECASE:
          current =
              SemanticEqualTransformer.getTransformedSpFunction(
                  FunctionType.EQUALS_IGNORE_CASE, leftConsExpr, rightConsExpr);
          break;
        case NOTEQUALSIGNORECASE:
          current =
                  SemanticEqualTransformer.getTransformedSpFunction(
                          FunctionType.NOT_EQUALS_IGNORE_CASE, leftConsExpr, rightConsExpr);
          break;
        case STARTSWITH:
          current =
              SemanticEqualTransformer.getTransformedSpFunction(
                  FunctionType.START_WITH, leftConsExpr, rightConsExpr);
          break;
        case NOTSTARTSWITH:
          current =
              SemanticEqualTransformer.getTransformedSpFunction(
                  FunctionType.NOT_START_WITH, leftConsExpr, rightConsExpr);
          break;
        case ENDSWITH:
          current =
              SemanticEqualTransformer.getTransformedSpFunction(
                  FunctionType.END_WITH, leftConsExpr, rightConsExpr);
          break;
        case NOTENDSWITH:
          current =
              SemanticEqualTransformer.getTransformedSpFunction(
                  FunctionType.NOT_END_WITH, leftConsExpr, rightConsExpr);
          break;
        case NOTCONTAINS:
          current =
              SemanticEqualTransformer.getTransformedSpFunction(
                  FunctionType.NOT_CONTAINS, leftConsExpr, rightConsExpr);
          break;
        case EMPTY:
          current =
              SemanticEqualTransformer.getTransformedSpFunction(
                  FunctionType.IS_EMPTY, rightConsExpr);
          break;
        default:
          throw new NotImplementedException(subConstraint.getComparator().toString());
      }

      final String next = expandConstraint(subConstraint.and());
      if (next != null) return next + " && " + current;
      else return current;
    } else throw new RuntimeException("Not implemented constraint:" + constraint);
  }

  public static String expandExpression(Expression expression) {
    if (expression instanceof SymbolicFunction) {
      return SemanticEqualTransformer.getTransformedSpFunction(
          ((SymbolicFunction) expression).getFunctionType(),
          expandExpression(((SymbolicFunction) expression).getParameterExpr()));
    } else if (expression instanceof SymbolicPlaceHolder) {
      return ((SymbolicPlaceHolder) expression).getConvertedRepresentation();
    } else if (expression instanceof SymbolicDecimal) {
      final SymbolicDecimal symDecimal = (SymbolicDecimal) expression;
      String intCompact = expandExpression(symDecimal.getSymbolicIntCompact());
      String scale = expandExpression(symDecimal.getSymbolicScale());
      return SemanticEqualTransformer.getTransformedSpFunction(
          FunctionType.COMPOSITION_DECIMAL, intCompact, scale);
    } else if (expression instanceof SymbolicCharAtInteger) {
      final SymbolicCharAtInteger charAtInt = (SymbolicCharAtInteger) expression;
      return SemanticEqualTransformer.getTransformedSpFunction(
          FunctionType.CHAR_AT,
          expandExpression(charAtInt.getExpression()),
          expandExpression(charAtInt.getIndex()));
    } else if (expression instanceof SymbolicLengthInteger) {
      final SymbolicLengthInteger lengthInt = (SymbolicLengthInteger) expression;
      return SemanticEqualTransformer.getTransformedSpFunction(
          FunctionType.LENGTH, expandExpression(lengthInt.getExpression()));
    } else if (expression instanceof SymbolicIsEmptyInteger) {
      final SymbolicIsEmptyInteger isEmptyInt = (SymbolicIsEmptyInteger) expression;
      return SemanticEqualTransformer.getTransformedSpFunction(
          FunctionType.IS_EMPTY, expandExpression(isEmptyInt.getExpression()));
    } else if (expression instanceof SymbolicIndexOfInteger) {
      final SymbolicIndexOfInteger indexOfInt = (SymbolicIndexOfInteger) expression;
      return SemanticEqualTransformer.getTransformedSpFunction(
          FunctionType.INDEX_OF,
          expandExpression(indexOfInt.getSource()),
          expandExpression(indexOfInt.getExpression()));
    } else if (expression instanceof SymbolicLastIndexOfChar2Integer) {
      final SymbolicLastIndexOfChar2Integer lastIndexOfChar2Int =
          (SymbolicLastIndexOfChar2Integer) expression;
      return SemanticEqualTransformer.getTransformedSpFunction(
          FunctionType.LAST_INDEX_OF_CHAR_2,
          expandExpression(lastIndexOfChar2Int.getSource()),
          expandExpression(lastIndexOfChar2Int.getExpression()),
          expandExpression(lastIndexOfChar2Int.getMinDist()));
    } else if (expression instanceof SymbolicLastIndexOfCharInteger) {
      final SymbolicLastIndexOfCharInteger lastIndexOfChar2Int =
          (SymbolicLastIndexOfCharInteger) expression;
      return SemanticEqualTransformer.getTransformedSpFunction(
          FunctionType.LAST_INDEX_OF_CHAR,
          expandExpression(lastIndexOfChar2Int.getSource()),
          expandExpression(lastIndexOfChar2Int.getExpression()));
    } else if (expression instanceof SpecialIntegerExpression) {
      SpecialIntegerExpression sie = (SpecialIntegerExpression) expression;
      if (sie.op == SpecialOperator.VALUEOF) {
        return SemanticEqualTransformer.getTransformedSpFunction(
            FunctionType.CAST_INT, expandExpression(sie.opr));
      } else throw new NotImplementedException();
    } else if (expression instanceof DerivedSymbolicInteger) {
      DerivedSymbolicInteger exp = (DerivedSymbolicInteger) expression;
      String expandedExp = expandExpression(exp.getDerivedExp());
      switch (exp.getType()) {
        case HASHCODE:
          return SemanticEqualTransformer.getTransformedSpFunction(
              FunctionType.STR_HASHCODE, expandedExp);
        case CAST_TO_INTEGER:
        case CAST_TO_REAL:
          return SemanticEqualTransformer.getTransformedSpFunction(
              FunctionType.CAST, expandedExp, exp.getType().name());
        default:
          throw new NotImplementedException(expression.toString());
      }
    } else if (expression instanceof DerivedSymbolicReal) {
      DerivedSymbolicReal exp = (DerivedSymbolicReal) expression;
      String expandedExp = expandExpression(exp.getDerivedExp());
      switch (exp.getType()) {
        case CAST_TO_REAL:
          return SemanticEqualTransformer.getTransformedSpFunction(
              FunctionType.CAST, expandedExp, exp.getType().name());
        default:
          throw new NotImplementedException(expression.toString());
      }
    } else if (expression instanceof SymbolicInteger) {
      String s = expression.toString();
      // date time related fields
      if (s.contains("#fastTime")) {
        return SemanticEqualTransformer.getTransformedSpFunction(FunctionType.TS_FASTTIME, s);
      } else if (s.contains("#nanos")) {
        return SemanticEqualTransformer.getTransformedSpFunction(FunctionType.TS_NANOS, s);
      }
      // in the form of $xxx#intCompact$, we keep $$ to distinguish the inner expr
      if (s.contains("#intCompact" + BigDecimalHandler.DECIMAL_WRAPPER)) {
        s = s.replace("#intCompact", "_intCompact");
      }
      // in the form of $xxx#scale$, we keep $$ to distinguish the inner expr
      if (s.contains("#scale" + BigDecimalHandler.DECIMAL_WRAPPER)) {
        s = s.replace("#scale", "_scale");
      }
      // '#value' in box type, just remove '#value'
      s = s.replace("#value", "");
      // after above cases, replace # with specified field separator so that the variable literal is
      // (1) compatible with sql syntax (2) encoded with field information
      s = s.replace("#", SPConfig.FIELD_SEPARATOR);
      return s;
    } else if (expression instanceof IntegerConstant) {
      final long value = ((IntegerConstant) expression).value;
      if (((IntegerConstant) expression).isRef() && value == -1) {
        // map null references to sp
        return "null";
      } else {
        // use constant values of the primitive types
        return value + "";
      }
    } else if (expression instanceof StringSymbolic) {
      return ((StringSymbolic) expression).getName().replace("#", SPConfig.FIELD_SEPARATOR);
    } else if (expression instanceof StringConstant) {
      return "\"" + ((StringConstant) expression).value() + "\"";
    } else if (expression instanceof SymbolicReal) {
      return ((SymbolicReal) expression).getName();
    } else if (expression instanceof RealConstant) {
      final double value = ((RealConstant) expression).value;
      if (value == Double.POSITIVE_INFINITY) {
        return String.valueOf(Double.MAX_VALUE);
      } else if (value == Double.NEGATIVE_INFINITY) {
        return String.valueOf(Double.MIN_VALUE);
      }
      return String.valueOf(value); // 10 rules + 12 binary rules
    } else if (expression instanceof BinaryLinearIntegerExpression) {
      final BinaryLinearIntegerExpression binExpr = (BinaryLinearIntegerExpression) expression;
      return handleBinarySubExprs(binExpr.getLeft(), binExpr.getRight(), binExpr.getOp());
    } else if (expression instanceof BinaryNonLinearIntegerExpression) {
      final BinaryNonLinearIntegerExpression binExpr =
          (BinaryNonLinearIntegerExpression) expression;
      return handleBinarySubExprs(binExpr.getLeft(), binExpr.getRight(), binExpr.getOp());
    } else if (expression instanceof BinaryRealExpression) {
      final BinaryRealExpression binExpr = (BinaryRealExpression) expression;
      return wrapWithBrackets(
          expandExpression(binExpr.getLeft())
              + binExpr.getOp()
              + expandExpression(binExpr.getRight()));
    } else if (expression instanceof DerivedStringExpression) {
      final DerivedStringExpression derivedExpr = (DerivedStringExpression) expression;
      switch (derivedExpr.getOp()) {
        case SUBSTRING:
          final StringExpression str = (StringExpression) derivedExpr.getOprlist()[0];
          final Expression toIdx, fromIdx;
          if (derivedExpr.getOprlist().length == 3) {
            toIdx = derivedExpr.getOprlist()[1];
            fromIdx = derivedExpr.getOprlist()[2];
          } else {
            assert derivedExpr.getOprlist().length == 2;
            fromIdx = derivedExpr.getOprlist()[1];
            toIdx = str._length();
          }
          final String fromIdxExpr = expandExpression(fromIdx);
          final String toIdxExpr = expandExpression(toIdx);
          return SemanticEqualTransformer.getTransformedSpFunction(
              FunctionType.SUBSTRING, expandExpression(str), fromIdxExpr, toIdxExpr);
        case CONCAT:
          return SemanticEqualTransformer.getTransformedSpFunction(
              FunctionType.CONCAT,
              expandExpression(derivedExpr.getLeft()),
              expandExpression(derivedExpr.getRight()));
        case VALUEOF:
          return SemanticEqualTransformer.getTransformedSpFunction(
              FunctionType.VALUE_OF, expandExpression(derivedExpr.getOprlist()[0]));
        case INTERN:
          return expandExpression(derivedExpr.getRight());
        case REPLACE:
          return SemanticEqualTransformer.getTransformedSpFunction(
              FunctionType.REPLACE,
              expandExpression(derivedExpr.getOprlist()[0]),
              expandExpression(derivedExpr.getOprlist()[2]),
              expandExpression(derivedExpr.getOprlist()[1]));
        case TOLOWERCASE:
          return SemanticEqualTransformer.getTransformedSpFunction(
              FunctionType.LOWER, expandExpression(derivedExpr.getRight()));
        case TOUPPERCASE:
          return SemanticEqualTransformer.getTransformedSpFunction(
              FunctionType.UPPER, expandExpression(derivedExpr.getRight()));
        default:
          throw new NotImplementedException(derivedExpr.getOp().toString());
      }
    } else if (expression == null) {
      return null;
    } else
      throw new NotImplementedException(
          expression.getClass().getName() + " not implemented yet:" + expression);
  }

  public static String handleBinarySubExprs(
          IntegerExpression left, IntegerExpression right, Operator op) {
    final String leftSubExp = expandExpression(left);
    final String rightSubExp = expandExpression(right);
    if (op.equals(Operator.SHIFTUR)) {
      return wrapWithBrackets(
          SemanticEqualTransformer.getTransformedSpFunction(
              FunctionType.UNSIGNED_R_SHIFT, leftSubExp, rightSubExp));
    } else if (op.equals(Operator.CMP)) {
      throw new NotImplementedException();
    } else {
      return wrapWithBrackets(leftSubExp + op + rightSubExp);
    }
  }

  public static String resolveExpressionType(Expression expression) {
    if (expression instanceof IntegerExpression) {
      if (expression instanceof SymbolicInteger) {
        return Types.getTypeName(((SymbolicInteger) expression).getTypeCode());
      }
      return "int";
    } else if (expression instanceof StringSymbolic) {
      return "String";
    } else throw new RuntimeException("Not implemented");
  }

  private static String wrapWithBrackets(String str) {
    return "(" + str + ")";
  }

  public static void collectConstraintVariables(Object constraint, Map<String, SQLVarType> res) {
    if (constraint == null) return;
    if (constraint instanceof StringConstraintWrapper) {
      // convert to normal string constraint
      final StringConstraintWrapper casted = (StringConstraintWrapper) constraint;
      constraint = casted.unwrap();
    }

    if (constraint instanceof Constraint) {
      Constraint subConstraint = (Constraint) constraint;
      final Expression leftCons = subConstraint.getLeft();
      final Expression rightCons = subConstraint.getRight();
      if (subConstraint instanceof LinearIntegerConstraint
          || subConstraint instanceof MixedConstraint
          || subConstraint instanceof GeneralMixedConstraint
          || subConstraint instanceof NonLinearIntegerConstraint
          || subConstraint instanceof RealConstraint) {
        collectExpressionVariable(leftCons, res);
        collectExpressionVariable(rightCons, res);
        collectConstraintVariables(subConstraint.and, res);
      } else if (constraint instanceof LogicalORIntegerConstraints) {
        LogicalORIntegerConstraints logicalORIntegerConstraints =
            (LogicalORIntegerConstraints) constraint;
        logicalORIntegerConstraints.getList().forEach(sub -> collectConstraintVariables(sub, res));
      } else {
        throw new NotImplementedException(subConstraint.toString());
      }
    } else if (constraint instanceof StringConstraint) {
      StringConstraint subConstraint = (StringConstraint) constraint;
      final Expression leftCons = subConstraint.getLeft();
      final Expression rightCons = subConstraint.getRight();
      collectExpressionVariable(leftCons, res);
      collectExpressionVariable(rightCons, res);
      collectConstraintVariables(subConstraint.and(), res);
      if (constraint instanceof LogicalOrStringConstraints) {
        LogicalOrStringConstraints logicalOrStringConstraints =
            (LogicalOrStringConstraints) constraint;
        logicalOrStringConstraints.getList().forEach(sub -> collectConstraintVariables(sub, res));
      }
    } else throw new RuntimeException("Not implemented constraint:" + constraint);
  }

  /**
   * @param expression the symbolic expression that is going to handle
   * @param res mapping from symbolic expr -> type
   */
  public static void collectExpressionVariable(Expression expression, Map<String, SQLVarType> res) {
    if (expression instanceof SymbolicCharAtInteger) {
      final SymbolicCharAtInteger charAtInt = (SymbolicCharAtInteger) expression;
      collectExpressionVariable(charAtInt.getExpression(), res);
      collectExpressionVariable(charAtInt.getIndex(), res);
    } else if (expression instanceof SymbolicDecimal) {
      final SymbolicDecimal symDecimal = (SymbolicDecimal) expression;
      collectExpressionVariable(symDecimal.getSymbolicIntCompact(), res);
      collectExpressionVariable(symDecimal.getSymbolicScale(), res);
    } else if (expression instanceof SpecialIntegerExpression) {
      SpecialIntegerExpression sie = (SpecialIntegerExpression) expression;
      if (sie.op == SpecialOperator.VALUEOF) {
        collectExpressionVariable(sie.opr, res);
      } else throw new NotImplementedException();
    } else if (expression instanceof SymbolicFunction) {
      collectExpressionVariable(((SymbolicFunction) expression).getParameterExpr(), res);
    } else if (expression instanceof SymbolicPlaceHolder) {
      final SymbolicPlaceHolder holder = (SymbolicPlaceHolder) expression;
      // TODO currently only handle time ms function in path condition
      final String strVal = holder.toString();
      assert strVal.contains("currentTimeMs")
          : "unhandled symbolic placeholder in pc:" + expression;
      res.put(strVal, SQLVarType.BIGINT);
    } else if (expression instanceof SymbolicLengthInteger) {
      final SymbolicLengthInteger lengthInt = (SymbolicLengthInteger) expression;
      collectExpressionVariable(lengthInt.getExpression(), res);
    } else if (expression instanceof SymbolicIsEmptyInteger) {
      final SymbolicIsEmptyInteger isEmptyInt = (SymbolicIsEmptyInteger) expression;
      collectExpressionVariable(isEmptyInt.getExpression(), res);
    } else if (expression instanceof SymbolicIndexOfInteger) {
      final SymbolicIndexOfInteger indexOfInt = (SymbolicIndexOfInteger) expression;
      collectExpressionVariable(indexOfInt.getExpression(), res);
      collectExpressionVariable(indexOfInt.getSource(), res);
    } else if (expression instanceof SymbolicLastIndexOfChar2Integer) {
      final SymbolicLastIndexOfChar2Integer lastIndexOfChar2Int =
          (SymbolicLastIndexOfChar2Integer) expression;
      collectExpressionVariable(lastIndexOfChar2Int.getExpression(), res);
      collectExpressionVariable(lastIndexOfChar2Int.getSource(), res);
      collectExpressionVariable(lastIndexOfChar2Int.getMinDist(), res);
    } else if (expression instanceof SymbolicIndexOfCharInteger) {
      throw new NotImplementedException();
    } else if (expression instanceof SymbolicLastIndexOfCharInteger) {
      final SymbolicLastIndexOfCharInteger lastIndexOfCharInt =
          (SymbolicLastIndexOfCharInteger) expression;
      collectExpressionVariable(lastIndexOfCharInt.getExpression(), res);
      collectExpressionVariable(lastIndexOfCharInt.getSource(), res);
    } else if (expression instanceof DerivedSymbolicInteger) {
      collectExpressionVariable(((DerivedSymbolicInteger) expression).getDerivedExp(), res);
    } else if (expression instanceof SymbolicInteger) {
      final SymbolicInteger symInt = (SymbolicInteger) expression;
      String s = symInt.toString();
      final String tp;
      if (s.contains("#nanos") || s.contains("#fastTime")) {
        tp = "java.sql.timestamp";
      } else if (s.contains(BigDecimalHandler.DECIMAL_WRAPPER)) {
        tp = "java.math.BigDecimal";
      } else if (symInt.getTypeCode() != null && symInt.getTypeCode() > 0) {
        tp = Types.getTypeName(symInt.getTypeCode());
      } else {
        if (symInt._max > Integer.MAX_VALUE) tp = "long";
        else tp = "int";
      }

      s = s.replace("#fastTime", ""); // datetime related
      s = s.replace("#nanos", ""); // datetime related
      s = s.replace(BigDecimalHandler.DECIMAL_WRAPPER, ""); // BigDecimal
      s = s.replace("#intCompact", ""); // BigDecimal.intCompact
      s = s.replace("#scale", ""); // BigDecimal.scale
      s = s.replace("#value", ""); // box type
      // after above cases, replace # with specified field separator so that the variable literal is
      // (1) compatible with sql syntax (2) encoded with field information
      s = s.replace("#", SPConfig.FIELD_SEPARATOR);

      res.put(s, SQLVarType.ofJavaType(tp));
    } else if (expression instanceof SymbolicReal) {
      res.put(((SymbolicReal) expression).getName(), SQLVarType.DOUBLE);
    } else if (expression instanceof StringSymbolic) {
      res.put(
          ((StringSymbolic) expression).getName().replace("#", SPConfig.FIELD_SEPARATOR),
          SQLVarType.VARCHAR);
    } else if (expression instanceof BinaryLinearIntegerExpression) {
      collectExpressionVariable(((BinaryLinearIntegerExpression) expression).getLeft(), res);
      collectExpressionVariable(((BinaryLinearIntegerExpression) expression).getRight(), res);
    } else if (expression instanceof BinaryNonLinearIntegerExpression) {
      collectExpressionVariable(((BinaryNonLinearIntegerExpression) expression).getLeft(), res);
      collectExpressionVariable(((BinaryNonLinearIntegerExpression) expression).getRight(), res);
    } else if (expression instanceof BinaryRealExpression) {
      collectExpressionVariable(((BinaryRealExpression) expression).getLeft(), res);
      collectExpressionVariable(((BinaryRealExpression) expression).getRight(), res);
    } else if (expression instanceof DerivedStringExpression) {
      final DerivedStringExpression derivedExpr = (DerivedStringExpression) expression;
      switch (derivedExpr.getOp()) {
        case SUBSTRING:
          final StringExpression str = (StringExpression) derivedExpr.getOprlist()[0];
          final Expression toIdx, fromIdx;
          if (derivedExpr.getOprlist().length == 3) {
            toIdx = derivedExpr.getOprlist()[1];
            fromIdx = derivedExpr.getOprlist()[2];
          } else {
            assert derivedExpr.getOprlist().length == 2;
            fromIdx = derivedExpr.getOprlist()[1];
            toIdx = str._length();
          }
          collectExpressionVariable(fromIdx, res);
          collectExpressionVariable(toIdx, res);
          collectExpressionVariable(str, res);
          break;
        case CONCAT:
          collectExpressionVariable(derivedExpr.getLeft(), res);
          collectExpressionVariable(derivedExpr.getRight(), res);
          break;
        case VALUEOF:
          collectExpressionVariable(derivedExpr.getOprlist()[0], res);
          break;
        case INTERN:
        case TOUPPERCASE:
        case TOLOWERCASE:
          collectExpressionVariable(derivedExpr.getRight(), res);
          break;
        case REPLACE:
          assert derivedExpr.getOprlist().length == 3;
          collectExpressionVariable(derivedExpr.getOprlist()[0], res);
          collectExpressionVariable(derivedExpr.getOprlist()[1], res);
          collectExpressionVariable(derivedExpr.getOprlist()[2], res);
          break;
        default:
          throw new NotImplementedException(derivedExpr.getOp().toString());
      }
    }
  }

  public static boolean containsNonDeterministicRetVal(String expression, boolean ignoreSeen) {
    if (ignoreSeen) {
      List<String> ndVarList =
          Arrays.stream(expression.split(" "))
              .filter(str -> str.contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX))
              .map(str -> str.replace(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX, ""))
              .filter(
                  str ->
                      str.contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX_2)) // FIXME: rename
              .map(str -> str.replace(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX_2, ""))
              .collect(Collectors.toList());

      boolean ret = ndVarList.stream().anyMatch(var -> !seenNdVars.contains(var));
      seenNdVars.addAll(ndVarList);
      return ret;
    } else {
      return expression.contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX)
          || expression.contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX_2);
    }
  }

  public static boolean containsTransformedNonDeterministicRetVal(String expression) {
    return expression.contains(SPManager.DEFER_PARAM_IDENTIFIER_PREFIX);
  }

  public static boolean containsInconvertibleExpr(String expression) {
    return expression.contains("Array@");
  }
}
