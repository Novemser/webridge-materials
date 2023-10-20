package webridge.sql.ast;

import com.alibaba.druid.sql.SQLUtils;
import com.alibaba.druid.sql.ast.SQLStatement;
import com.alibaba.druid.sql.ast.expr.SQLBinaryOpExpr;
import com.alibaba.druid.sql.ast.expr.SQLBinaryOperator;
import com.alibaba.druid.sql.dialect.mysql.visitor.MySqlSchemaStatVisitor;
import com.alibaba.druid.util.JdbcConstants;
import webridge.sql.SymbolicSQLTemplate;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SQLConstraintVisitor extends MySqlSchemaStatVisitor {
  private final SymbolicSQLTemplate template;
  private Iterator<String> paramExpIter;
  private final List<List<String>> eqExprGroups;

  public SQLConstraintVisitor(SymbolicSQLTemplate template) {
    this.template = template;
    eqExprGroups = new ArrayList<>();
  }

  public void doParse() {
    final SQLStatement sqlStatement =
        SQLUtils.parseSingleStatement(template.getSqlTemplate(), JdbcConstants.MYSQL);
    paramExpIter = template.getParameterExprs().iterator();
    sqlStatement.accept(this);
  }

  @Override
  public boolean visit(SQLBinaryOpExpr x) {
    Object left = x.getLeft();
    if (left.toString().equals("?")) left = paramExpIter.next();
    Object right = x.getRight();
    if (right.toString().equals("?")) right = paramExpIter.next();
    if (x.getOperator().equals(SQLBinaryOperator.Equality)) {
      addToGroup(left.toString().trim().toLowerCase(), right.toString().trim().toLowerCase());
    }
    return super.visit(x);
  }

  private void addToGroup(String left, String right) {
    for (List<String> eqExprGroup : eqExprGroups) {
      if (eqExprGroup.contains(left)) {
        eqExprGroup.add(right);
        return;
      } else if (eqExprGroup.contains(right)) {
        eqExprGroup.add(left);
        return;
      }
    }

    final List<String> lst = new ArrayList<>();
    lst.add(left);
    lst.add(right);
    eqExprGroups.add(lst);
  }

  public List<List<String>> getEqExprGroups() {
    return eqExprGroups;
  }

  public int computeEqGroupIndex(String expr) {
    // FIXME hard coded string manipulation
    expr = expr.replace("[**undefined**]", "").replace("#value", "");
    for (int i = 0; i < eqExprGroups.size(); i++) {
      for (String s : eqExprGroups.get(i)) {
        if (s.toLowerCase().equals(expr.toLowerCase())) return i;
      }
    }
    return -1;
  }
}
