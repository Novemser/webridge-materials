package webridge.sql.ast;

import com.alibaba.druid.sql.ast.*;
import com.alibaba.druid.sql.ast.expr.*;
import com.alibaba.druid.sql.ast.statement.*;
import com.alibaba.druid.sql.dialect.mysql.ast.statement.MySqlDeleteStatement;
import com.alibaba.druid.sql.dialect.mysql.ast.statement.MySqlInsertStatement;
import com.alibaba.druid.sql.dialect.mysql.ast.statement.MySqlSelectQueryBlock;
import com.alibaba.druid.sql.dialect.mysql.ast.statement.MySqlUpdateStatement;
import com.alibaba.druid.sql.dialect.mysql.visitor.MySqlSchemaStatVisitor;
import webridge.exception.NotImplementedException;
import webridge.hack.classes.EntityHierarchyManager;
import webridge.hack.classes.EntityNode;
import webridge.sql.types.SQLVarType;
import webridge.sql.types.SqlType;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import org.apache.commons.lang3.tuple.Pair;

public class SQLAstVisitor extends MySqlSchemaStatVisitor {

  // hibernate hard code this alias as integer
  public static final String IMPLICIT_DISCRIMINATOR_ALIAS = "clazz_";

  // here we assume '?' is the only placeholder
  public static final String PLACE_HOLDER = "?";

  // parameter info
  private final List<Pair<String, String>> argExprLst = new ArrayList<>();
  private final List<SQLVarType> argTypeLst = new ArrayList<>();
  private final List<SQLBinaryOpExpr> argParentExprLst = new ArrayList<>();
  // return value info
  private final List<Pair<String, String>> retValNameTypeMap = new ArrayList<>();
  private final List<Pair<String, String>> retValNameAliasMap = new ArrayList<>();
  private final Map<String, List<Number>> retValCaseWhenValuesMap = new HashMap<>();
  private final Map<String, List<EntityNode>> retValCaseWhenEntityMap = new HashMap<>();
  // key: underling db table name, value: alias name
  private final Map<String, Map<String, String>> retValCaseWhenTableAliasMap = new HashMap<>();
  private final Set<Pair<String, String>> leftJoinConditionTables = new HashSet<>();

  private final Map<String, String> columnTypeMap = new HashMap<>();
  private String fromTableName;
  private SqlType sqlType;
  private final String sqlTemplate;

  public SQLAstVisitor(String sqlTemplate) {
    this.sqlTemplate = sqlTemplate;
  }

  @Override
  public void endVisit(SQLJoinTableSource x) {
    if (x.getJoinType().equals(SQLJoinTableSource.JoinType.LEFT_OUTER_JOIN)) {
      parseLeftJoinCondition(x.getCondition());
    }
    super.endVisit(x);
  }

  private void parseLeftJoinCondition(SQLExpr condition) {
    if (condition instanceof SQLBinaryOpExpr) {
      final SQLBinaryOpExpr cond = (SQLBinaryOpExpr) condition;
      final SQLExpr left = cond.getLeft();
      final SQLExpr right = cond.getRight();
      if (left instanceof SQLBinaryOpExpr) {
        parseLeftJoinCondition(left);
      }
      if (right instanceof SQLBinaryOpExpr) {
        parseLeftJoinCondition(right);
      }
      if (left instanceof SQLPropertyExpr && right instanceof SQLPropertyExpr) {
        final SQLIdentifierExpr leftOwner = (SQLIdentifierExpr) ((SQLPropertyExpr) left).getOwner();
        final SQLIdentifierExpr rightOwner =
            (SQLIdentifierExpr) ((SQLPropertyExpr) right).getOwner();
        leftJoinConditionTables.add(Pair.of(leftOwner.getName(), rightOwner.getName()));
      }
    } else throw new NotImplementedException("Unexpected join condition type:" + condition);
  }

  @Override
  public void endVisit(MySqlDeleteStatement x) {
    final SQLExpr where = x.getWhere();
    handleWhere(where);
    sqlType = SqlType.DELETE;
    super.endVisit(x);
  }

  @Override
  public void endVisit(MySqlInsertStatement x) {
    List<SQLExpr> insertColumns = x.getColumns();
    x.getValuesList().forEach(valuesClause -> handleInsertItem(valuesClause, insertColumns));
    sqlType = SqlType.INSERT;
    super.endVisit(x);
  }

  private void handleInsertItem(
      SQLInsertStatement.ValuesClause valuesClause, List<SQLExpr> insertColumns) {
    List<SQLExpr> values = valuesClause.getValues();
    assert insertColumns.size() == values.size();

    IntStream.range(0, insertColumns.size())
        .forEach(
            idx -> {
              SQLIdentifierExpr colExpr = (SQLIdentifierExpr) insertColumns.get(idx);
              SQLExpr valExpr = values.get(idx);

              if (valExpr.toString().equals(PLACE_HOLDER)) {
                argExprLst.add(Pair.of(colExpr.toString(), valExpr.toString()));
                argTypeLst.add(SQLVarType.of(colExpr.getResolvedColumn().getDataType().getName()));
              }
            });
  }

  @Override
  public void endVisit(MySqlUpdateStatement x) {
    final SQLExpr where = x.getWhere();
    x.getItems().forEach(this::handleUpdateSetItem);
    handleWhere(where);
    sqlType = SqlType.UPDATE;
    super.endVisit(x);
  }

  private void handleUpdateSetItem(SQLUpdateSetItem item) {
    SQLExpr colExpr = item.getColumn();
    if (colExpr instanceof SQLIdentifierExpr) {
      final SQLExpr value = item.getValue();
      if (value.toString().equals(PLACE_HOLDER)) {
        argExprLst.add(Pair.of(colExpr.toString(), value.toString()));
        argTypeLst.add(
            SQLVarType.of(
                ((SQLIdentifierExpr) colExpr).getResolvedColumn().getDataType().getName()));
      }
    } else if (colExpr instanceof SQLPropertyExpr) {
      final SQLExpr value = item.getValue();
      if (value.toString().equals(PLACE_HOLDER)) {
        argExprLst.add(Pair.of(colExpr.toString(), value.toString()));
        argTypeLst.add(
            SQLVarType.of(((SQLPropertyExpr) colExpr).getResolvedColumn().getDataType().getName()));
      }
    }
  }

  private void handleBinaryOpInUpdate(SQLExpr expr, List<SQLExpr> exprList) {
    if (expr instanceof SQLBinaryOpExpr) {
      final SQLBinaryOpExpr binExpr = (SQLBinaryOpExpr) expr;
      final SQLExpr left = binExpr.getLeft();
      final SQLExpr right = binExpr.getRight();
      final SQLVariantRefExpr placeHolder = new SQLVariantRefExpr();
      placeHolder.setName(PLACE_HOLDER);

      if (!exprContainsColumn(left)) {
        exprList.add(left);
        binExpr.setLeft(placeHolder);
      } else handleBinaryOpInUpdate(left, exprList);

      if (!exprContainsColumn(right)) {
        exprList.add(right);
        binExpr.setRight(placeHolder);
      } else handleBinaryOpInUpdate(right, exprList);
    } else if (expr instanceof SQLIdentifierExpr) {
      final SQLIdentifierExpr columnIdentifier = (SQLIdentifierExpr) expr;
      if (columnIdentifier.getResolvedColumn() != null) {
        // the expr is col
        columnTypeMap.put(
            columnIdentifier.getName(),
            columnIdentifier.getResolvedColumn().getDataType().getName());
        exprList.add(columnIdentifier);
      } else {
        // the expr is column's expr
        final SQLVariantRefExpr placeHolder = new SQLVariantRefExpr();
        placeHolder.setName(PLACE_HOLDER);
        final SQLIdentifierExpr colExpr = (SQLIdentifierExpr) exprList.get(exprList.size() - 1);
        exprList.add(expr);
        argExprLst.add(Pair.of(colExpr.getName(), expr.toString()));
        argTypeLst.add(SQLVarType.of(colExpr.getResolvedColumn().getDataType().getName()));
      }
    }
  }

  private boolean exprContainsColumn(SQLExpr expr) {
    if (expr instanceof SQLIdentifierExpr) {
      final SQLIdentifierExpr identifierExpr = (SQLIdentifierExpr) expr;
      return identifierExpr.getResolvedColumn() != null;
    } else {
      return expr.getChildren().stream()
          .anyMatch(
              e -> {
                if (e instanceof SQLExpr) return exprContainsColumn((SQLExpr) e);
                return false;
              });
    }
  }

  @Override
  public void endVisit(MySqlSelectQueryBlock x) {
    SQLTableSource from = x.getFrom();
    if (from == null) {
      // select `constant`;
      sqlType = SqlType.SELECT;
      super.endVisit(x);
      return;
    }
    fromTableName = from.toString();
    final SQLExpr where = x.getWhere();

    x.getSelectList().forEach(this::handleSelectItem);
    handleWhere(where);
    handleLimit(x.getLimit());
    sqlType = SqlType.SELECT;
    super.endVisit(x);
  }

  private void handleLimit(SQLLimit limit) {
    if (limit == null) return;
    SQLExpr rowCount = limit.getRowCount();
    SQLExpr offset = limit.getOffset();
    // Handling select xxx LIMIT ?, ?
    if (offset instanceof SQLVariantRefExpr && rowCount instanceof SQLVariantRefExpr) {
      argExprLst.add(Pair.of("?", "?"));
      argExprLst.add(Pair.of("?", "?"));
      argTypeLst.add(SQLVarType.BIGINT);
      argTypeLst.add(SQLVarType.BIGINT);
    } else if (offset == null && rowCount != null) {
      argExprLst.add(Pair.of("?", "?"));
      argTypeLst.add(SQLVarType.BIGINT);
    } else {
      throw new NotImplementedException(limit.toString());
    }
  }

  private void handleSelectItem(SQLSelectItem item) {
    if (item == null) return;
    final SQLExpr expr = item.getExpr();
    final String alias = item.getAlias();
    if (expr instanceof SQLAllColumnExpr) {
      final List<Pair<String, String>> allColumns =
          getColumns().stream()
              .filter(
                  col ->
                      col.getTable()
                          .equals(((SQLAllColumnExpr) expr).getResolvedTableSource().toString()))
              .map(col -> Pair.of(col.getName(), col.getDataType()))
              .collect(Collectors.toList());
      retValNameTypeMap.addAll(allColumns);
      retValNameAliasMap.addAll(
          allColumns.stream()
              .map(e -> Pair.of(e.getLeft(), e.getLeft()))
              .collect(Collectors.toList()));
    } else if (expr instanceof SQLPropertyExpr) {
      SQLPropertyExpr propExp = (SQLPropertyExpr) expr;
      SQLColumnDefinition col = propExp.getResolvedColumn();
      if (col == null) {
        if (propExp.getName().equals("*")) {
          SQLIdentifierExpr owner = ((SQLIdentifierExpr) propExp.getOwner());
          SQLPropertyExpr tableOwner = (SQLPropertyExpr) owner.getParent();
          SQLTableSource tableSource = tableOwner.getResolvedTableSource();
          if (tableSource instanceof SQLSubqueryTableSource) {
            return;
          }
          List<SQLObject> children = ((SQLExprTableSource) tableSource).getSchemaObject().getStatement().getChildren();
          for (SQLObject child : children) {
            if (!(child instanceof SQLColumnDefinition)) continue;
            SQLColumnDefinition colDef = (SQLColumnDefinition) child;
            SQLName name = colDef.getName();
            SQLDataType dataType = colDef.getDataType();
            retValNameTypeMap.add(Pair.of(name.getSimpleName(), dataType.toString()));
            retValNameAliasMap.add(Pair.of(name.getSimpleName(), alias));
          }
        } else {
//          throw new NotImplementedException(expr.toString());
        }
        return;
      }
      retValNameTypeMap.add(Pair.of(expr.toString(),
          col.getDataType().toString()));
      retValNameAliasMap.add(Pair.of(expr.toString(), alias));
    } else if (expr instanceof SQLIdentifierExpr) {
      SQLColumnDefinition col = ((SQLIdentifierExpr) expr).getResolvedColumn();
      if (col != null) {
        retValNameTypeMap.add(Pair.of(expr.toString(), col.getDataType().toString()));
        retValNameAliasMap.add(Pair.of(expr.toString(), alias));
      }
    } else if (expr instanceof SQLAggregateExpr) {
      SQLAggregateExpr agg = ((SQLAggregateExpr) expr);
      // FIXME: need to check whether retValName can be agg.toString()
      // FIXME: the return value should not be blindly
      final String dataTypeStr;
      final String retValStr;
      if (agg.getMethodName().equals("count")) {
        dataTypeStr = "bigint";
        if (agg.getArguments().size() == 1) {
          final SQLExpr arg = agg.getArguments().get(0);
          if (arg instanceof SQLAllColumnExpr) {
            retValStr = "count_star";
          } else {
            retValStr = "count_" + arg.toString();
          }
        } else {
          throw new NotImplementedException("Unhandled aggregator:" + agg);
        }
      } else if (agg.getMethodName().equals("max")) {
        assert agg.getArguments().size() == 1;
        final SQLExpr arg = agg.getArguments().get(0);
        dataTypeStr = arg.computeDataType().toString();
        retValStr = "max_" + arg.toString();
      } else {
        SQLDataType aggDataType = agg.computeDataType();
        if (aggDataType == null) {
          switch (agg.getMethodName()) {
            case "COUNT":
              dataTypeStr = SQLDataType.Constants.INT;
              break;
            default:
              throw new NotImplementedException(agg.toString());
          }
        } else {
          dataTypeStr = aggDataType.toString();
        }
        retValStr = agg.toString();
      }
      retValNameTypeMap.add(Pair.of(retValStr, dataTypeStr));
      retValNameAliasMap.add(Pair.of(retValStr, alias));
    } else if (expr instanceof SQLCaseExpr) {
      List<SQLCaseExpr.Item> subItems = ((SQLCaseExpr) expr).getItems();
      assert subItems.size() > 0;

      // hibernate hard code this alias as integer
      if (alias.startsWith(IMPLICIT_DISCRIMINATOR_ALIAS)) {
        extractCaseWhenForHibernateQuery((SQLCaseExpr) expr, alias);
        retValNameTypeMap.add(Pair.of(alias, "int"));
      } else {
        SQLDataType dataType = subItems.get(0).getValueExpr().computeDataType();
        retValNameTypeMap.add(Pair.of(alias, dataType.toString()));
      }

      retValNameAliasMap.add(Pair.of(alias, alias));
    } else {
      throw new RuntimeException("Not implemented yet");
    }
  }

  private void extractCaseWhenForHibernateQuery(SQLCaseExpr expr, String alias) {
    for (SQLCaseExpr.Item it : expr.getItems()) {
      final SQLIntegerExpr valueExpr = (SQLIntegerExpr) it.getValueExpr();
      final SQLBinaryOpExpr conditionExpr = (SQLBinaryOpExpr) it.getConditionExpr();
      final SQLPropertyExpr left = (SQLPropertyExpr) conditionExpr.getLeft();
      final SQLExprTableSource tbObj = (SQLExprTableSource) left.getResolvedOwnerObject();
      final String name = tbObj.getName().toString();
      retValCaseWhenTableAliasMap.compute(
          alias,
          (s, mappings) -> {
            if (mappings == null) mappings = new HashMap<>();
            mappings.putIfAbsent(name, tbObj.getAlias());
            return mappings;
          });

      retValCaseWhenEntityMap.compute(
          alias,
          (s, vals) -> {
            if (vals == null) vals = new ArrayList<>();
            vals.add(EntityHierarchyManager.getHierarchyInfo(name));
            return vals;
          });

      retValCaseWhenValuesMap.compute(
          alias,
          (s, vals) -> {
            if (vals == null) vals = new ArrayList<>();
            vals.add(valueExpr.getNumber());
            return vals;
          });
    }
  }

  // recursively extract all where conditions
  // e.g. where username = 1 and id in (1, 2) and attr <> null
  // ==> {username = 1, id in (1, 2), attr <> null}
  private List<SQLExpr> extractWhereConditions(SQLExpr where) {
    if (where == null) return Collections.emptyList();
    if (where instanceof SQLBinaryOpExpr) {
      final SQLBinaryOpExpr binExpr = (SQLBinaryOpExpr) where;
      final SQLBinaryOperator op = binExpr.getOperator();
      if (op == SQLBinaryOperator.BooleanAnd || op == SQLBinaryOperator.BooleanOr) {
        final List<SQLExpr> result = new ArrayList<>();
        result.addAll(extractWhereConditions(binExpr.getLeft()));
        result.addAll(extractWhereConditions(binExpr.getRight()));
        return result;
      }
    }
    return Collections.singletonList(where);
  }

  private void handleWhere(SQLExpr where) {
    if (where == null) return;
    List<SQLExpr> conditions = extractWhereConditions(where);

    for (SQLExpr cond : conditions) {
      if (cond instanceof SQLBinaryOpExpr) {
        final SQLBinaryOpExpr binExpr = (SQLBinaryOpExpr) cond;
        final SQLExpr left = binExpr.getLeft();
        final SQLExpr right = binExpr.getRight();

        final SQLIdentifierExpr columnIdentifier;
        final String columnIdentifierStr;
        final String colExpr;

        if (left instanceof SQLIdentifierExpr || left instanceof SQLPropertyExpr) {
          columnIdentifier =
              (left instanceof SQLIdentifierExpr)
                  ? (SQLIdentifierExpr) left
                  : (SQLIdentifierExpr) ((SQLPropertyExpr) left).getResolvedColumn().getName();
          columnIdentifierStr = left.toString();
          colExpr = right.toString();
        } else if (right instanceof SQLIdentifierExpr || right instanceof SQLPropertyExpr) {
          columnIdentifier =
              (right instanceof SQLIdentifierExpr)
                  ? (SQLIdentifierExpr) right
                  : (SQLIdentifierExpr) ((SQLPropertyExpr) right).getResolvedColumn().getName();
          columnIdentifierStr = right.toString();
          colExpr = left.toString();
        } else {
          throw new RuntimeException("Not implemented yet");
        }

        if (left.getParent().equals(right.getParent())) {
          final SQLObject parent = left.getParent();
          if (parent instanceof SQLBinaryOpExpr) argParentExprLst.add((SQLBinaryOpExpr) parent);
        }

        SQLColumnDefinition resolvedColumn = columnIdentifier.getResolvedColumn();
        if (colExpr.equals(PLACE_HOLDER)) {
          argExprLst.add(Pair.of(columnIdentifierStr, colExpr));
          argTypeLst.add(
              SQLVarType.of(resolvedColumn.getDataType().getName()));
        }
        if (resolvedColumn != null)
        columnTypeMap.put(
            columnIdentifier.getName(),
            resolvedColumn
                    .getDataType()
                    .getName());
      } else if (cond instanceof SQLInListExpr) {
        final SQLExpr inListExpr = ((SQLInListExpr) cond).getExpr();
        List<SQLExpr> targetList = ((SQLInListExpr) cond).getTargetList();
        if (inListExpr instanceof SQLPropertyExpr) {
          final SQLIdentifierExpr columnIdentifier = (SQLIdentifierExpr) ((SQLPropertyExpr) inListExpr).getResolvedColumn().getName();
          for (SQLExpr sqlExpr : targetList) {
            String sqlExprStr = sqlExpr.toString();
            assert sqlExprStr.equals(PLACE_HOLDER) : "Unexpected SQL in arg:" + sqlExpr;
            argExprLst.add(Pair.of(columnIdentifier.toString(), sqlExprStr));
            argTypeLst.add(
                SQLVarType.of(columnIdentifier.getResolvedColumn().getDataType().getName()));
          }
        } else if (inListExpr instanceof SQLIdentifierExpr) {
          // cat_id IN (?, ?)
          SQLIdentifierExpr idExp = (SQLIdentifierExpr) inListExpr;
          for (SQLExpr sqlExpr : targetList) {
            if (sqlExpr instanceof SQLVariantRefExpr &&
                    ((SQLVariantRefExpr) sqlExpr).getName().equals(PLACE_HOLDER)) {
              // this should be "?"
              argExprLst.add(Pair.of(idExp.toString(), sqlExpr.toString()));
              argTypeLst.add(
                      SQLVarType.of(idExp.getResolvedColumn().getDataType().getName()));
            } else {
              throw new NotImplementedException(sqlExpr.toString());
            }
          }
        } else {
          throw new NotImplementedException();
        }
      } else {
        throw new NotImplementedException();
      }
    }
  }

  @Override
  public void endVisit(SQLSelectStatement selectStatement) {
    super.endVisit(selectStatement);
  }

  public String getColumnType(String columnName) {
    return columnTypeMap.get(columnName);
  }

  public String getSqlTemplate() {
    return sqlTemplate;
  }

  public String getFromTableName() {
    return fromTableName;
  }

  public List<Pair<String, String>> getRetValNameTypeMap() {
    return retValNameTypeMap;
  }

  public List<Pair<String, String>> getRetValNameAliasMap() {
    return retValNameAliasMap;
  }

  public List<Pair<String, String>> getArgExprLst() {
    return argExprLst;
  }

  public List<SQLVarType> getArgTypeLst() {
    // FIXME: support multi-length CHAR
    return argTypeLst.stream().map(t -> {
      if (t.equals(SQLVarType.CHAR)) return SQLVarType.VARCHAR;
      return t;
    }).collect(Collectors.toList());
  }

  public SqlType getSqlType() {
    return sqlType;
  }

  public Set<Pair<String, String>> getLeftJoinConditionTables() {
    return leftJoinConditionTables;
  }

  public List<SQLBinaryOpExpr> getArgParentExprLst() {
    return argParentExprLst;
  }

  public Map<String, List<Number>> getRetValCaseWhenValuesMap() {
    return retValCaseWhenValuesMap;
  }

  public Map<String, Map<String, String>> getRetValCaseWhenTableAliasMap() {
    return retValCaseWhenTableAliasMap;
  }

  public Map<String, List<EntityNode>> getRetValCaseWhenEntityMap() {
    return retValCaseWhenEntityMap;
  }
}
