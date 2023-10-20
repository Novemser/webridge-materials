package webridge.wbridge.storedprocedure.transformation;

import static webridge.wbridge.storedprocedure.transformation.SemanticEqualTransformer.resolveCalledFunction;
import static webridge.wbridge.storedprocedure.transformation.SemanticEqualTransformer.resolveFunction;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.NodeList;
import com.github.javaparser.ast.expr.*;
import com.github.javaparser.ast.stmt.IfStmt;
import com.github.javaparser.ast.visitor.GenericListVisitorAdapter;
import com.github.javaparser.metamodel.ExpressionMetaModel;
import com.google.common.base.Joiner;
import webridge.wbridge.exception.NotImplementedException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;

public class ConversionVisitor extends GenericListVisitorAdapter<String, Void> {

  private static final String CLASS_NAME = "MAIN";
  private static final String METHOD_NAME = "METHOD";
  private static final String ASSIGN_LEFT_NAME = "TARGET";

  String getSqlExpr() {
    return sqlExpr.toString();
  }

  private final StringBuilder sqlExpr = new StringBuilder();

  @Override
  public List<String> visit(CompilationUnit n, Void arg) {
    List<String> result = super.visit(n, arg);
    result.stream()
        .filter(
            s ->
                !s.isEmpty()
                    && !CLASS_NAME.equals(s)
                    && !METHOD_NAME.equals(s)
                    && !ASSIGN_LEFT_NAME.equals(s))
        .forEach(sqlExpr::append);
    return result;
  }

  @Override
  public List<String> visit(AssignExpr n, Void arg) {
    //        List<String> target = visit(n.getTarget(), arg);
    //        target.add("=");
    //        target.addAll(visit(n.getValue(), arg));
    //        return target;
    return visit(n.getValue(), arg);
  }

  @Override
  public List<String> visit(SimpleName n, Void arg) {
    List<String> result = new ArrayList<>();
    if (!StringUtils.isEmpty(n.getIdentifier())) {
      result.add(n.getIdentifier());
    }
    return result;
  }

  @Override
  public List<String> visit(BinaryExpr n, Void arg) {
    List<String> result = new ArrayList<>();
    switch (n.getOperator()) {
      case PLUS:
      case MINUS:
      case MULTIPLY:
      case DIVIDE:
      case OR:
      case AND:
      case LESS:
      case LESS_EQUALS:
      case GREATER:
      case GREATER_EQUALS:
      case REMAINDER:
      case BINARY_OR:
      case BINARY_AND:
      case LEFT_SHIFT:
      case SIGNED_RIGHT_SHIFT:
        result.addAll(visit(n.getLeft(), arg));
        result.add(n.getOperator().asString());
        result.addAll(visit(n.getRight(), arg));
        break;
      case XOR:
        // cast to signed in case of overflow
        result.add("cast(");
        result.addAll(visit(n.getLeft(), arg));
        result.add(n.getOperator().asString());
        result.addAll(visit(n.getRight(), arg));
        result.add(" as signed)");
        break;
      case NOT_EQUALS:
      case EQUALS:
        List<String> left = visit(n.getLeft(), arg);
        List<String> right = visit(n.getRight(), arg);
        if (left.size() == 1 && left.get(0).equalsIgnoreCase("NULL")) {
          result.addAll(right);
          result.add(
              n.getOperator() == BinaryExpr.Operator.NOT_EQUALS ? " IS NOT NULL" : " IS NULL");
        } else if (right.size() == 1 && right.get(0).equalsIgnoreCase("NULL")) {
          result.addAll(left);
          result.add(
              n.getOperator() == BinaryExpr.Operator.NOT_EQUALS ? " IS NOT NULL" : " IS NULL");
        } else {
          result.addAll(visit(n.getLeft(), arg));
          result.add(n.getOperator() == BinaryExpr.Operator.NOT_EQUALS ? "!=" : "=");
          result.addAll(visit(n.getRight(), arg));
        }
        break;
      default:
        throw new RuntimeException("Unhandled Operator: " + n.getOperator().asString());
    }
    return result;
  }

  @Override
  public List<String> visit(EnclosedExpr n, Void arg) {
    List<String> result = visit(n.getInner(), arg);
    result.add(0, "(");
    result.add(")");
    return result;
  }

  @Override
  public List<String> visit(IntegerLiteralExpr n, Void arg) {
    List<String> result = new ArrayList<>();
    result.add(n.getValue());
    return result;
  }

  @Override
  public List<String> visit(StringLiteralExpr n, Void arg) {
    List<String> result = new ArrayList<>();
    result.add("'");
    result.add(n.getValue());
    result.add("'");
    return result;
  }

  @Override
  public List<String> visit(BooleanLiteralExpr n, Void arg) {
    List<String> result = new ArrayList<>();
    result.add(n.getValue() ? "TRUE" : "FALSE");
    return result;
  }

  @Override
  public List<String> visit(NullLiteralExpr n, Void arg) {
    List<String> result = new ArrayList<>();
    result.add("NULL");
    return result;
  }

  @Override
  public List<String> visit(IfStmt n, Void arg) {
    return visit(n.getCondition(), arg);
  }

  @Override
  public List<String> visit(MethodCallExpr n, Void arg) {
    final List<String> result = new ArrayList<>();
    final List<String> args = new ArrayList<>();
    final NodeList<Expression> arguments = n.getArguments();
    if (SemanticEqualTransformer.isPlaceHolderCall(n.toString())) {
      assert arguments.size() == 3;
      final Expression arg1 = arguments.get(0);
      final Expression arg2 = arguments.get(2);
      result.add(
          resolveFunction(
              resolveCalledFunction(n.toString()),
              // flatten the parameters
              arg1.accept(this, arg).stream().reduce(String::concat).get(),
              arg2.accept(this, arg).stream().reduce(String::concat).get()));
    } else {
      arguments.forEach(a -> args.add(a.accept(this, arg).stream().reduce(String::concat).get()));
      result.add(String.format("%s(%s)", n.getNameAsString(), Joiner.on(",").join(args)));
    }
    return result;
  }

  @Override
  public List<String> visit(UnaryExpr n, Void arg) {
    final List<String> res = new ArrayList<>();
    switch (n.getOperator()) {
      case MINUS:
        res.add("-" + n.getExpression().accept(this, arg).stream().reduce(String::concat).get());
        return res;
      default:
        throw new NotImplementedException(n.toString());
    }
  }

  @Override
  public List<String> visit(DoubleLiteralExpr n, Void arg) {
    List<String> result = new ArrayList<>();
    result.add(n.getValue());
    return result;
  }

  private List<String> visit(Expression n, Void arg) {
    List<String> target;
    ExpressionMetaModel metaModel = n.getMetaModel();
    Class clz = metaModel.getType();
    if (clz == NameExpr.class) {
      target = visit(n.asNameExpr(), arg);
    } else if (clz == BinaryExpr.class) {
      target = visit(n.asBinaryExpr(), arg);
    } else if (clz == EnclosedExpr.class) {
      target = visit(n.asEnclosedExpr(), arg);
    } else if (clz == IntegerLiteralExpr.class) {
      target = visit(n.asIntegerLiteralExpr(), arg);
    } else if (clz == ConditionalExpr.class) {
      target = visit(n.asConditionalExpr(), arg);
    } else if (clz == StringLiteralExpr.class) {
      target = visit(n.asStringLiteralExpr(), arg);
    } else if (clz == BooleanLiteralExpr.class) {
      target = visit(n.asBooleanLiteralExpr(), arg);
    } else if (clz == NullLiteralExpr.class) {
      target = visit(n.asNullLiteralExpr(), arg);
    } else if (clz == MethodCallExpr.class) {
      target = visit(n.asMethodCallExpr(), arg);
    } else if (clz == UnaryExpr.class) {
      target = visit(n.asUnaryExpr(), arg);
    } else if (clz == DoubleLiteralExpr.class) {
      target = visit(n.asDoubleLiteralExpr(), arg);
    } else if (clz == FieldAccessExpr.class) {
      target = visit(n.asFieldAccessExpr(), arg);
    } else {
      throw new RuntimeException("Unhandled Expression Type: " + clz + "," + n.toString());
    }
    return target;
  }
}
