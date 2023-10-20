package webridge.sql.ast;

import com.alibaba.druid.sql.ast.*;
import com.alibaba.druid.sql.ast.expr.*;
import com.alibaba.druid.sql.ast.statement.*;
import com.alibaba.druid.sql.visitor.SQLASTVisitor;

public class SQLFormatASTVisitor implements SQLASTVisitor {

  @Override
  public void endVisit(SQLAllColumnExpr sqlAllColumnExpr) {}

  @Override
  public void endVisit(SQLBetweenExpr sqlBetweenExpr) {}

  @Override
  public void endVisit(SQLBinaryOpExpr sqlBinaryOpExpr) {}

  @Override
  public void endVisit(SQLCaseExpr sqlCaseExpr) {}

  @Override
  public void endVisit(SQLCaseExpr.Item item) {}

  @Override
  public void endVisit(SQLCaseStatement sqlCaseStatement) {}

  @Override
  public void endVisit(SQLCaseStatement.Item item) {}

  @Override
  public void endVisit(SQLCharExpr sqlCharExpr) {}

  @Override
  public void endVisit(SQLIdentifierExpr sqlIdentifierExpr) {}

  @Override
  public void endVisit(SQLInListExpr sqlInListExpr) {}

  @Override
  public void endVisit(SQLIntegerExpr sqlIntegerExpr) {}

  @Override
  public void endVisit(SQLExistsExpr sqlExistsExpr) {}

  @Override
  public void endVisit(SQLNCharExpr sqlnCharExpr) {}

  @Override
  public void endVisit(SQLNotExpr sqlNotExpr) {}

  @Override
  public void endVisit(SQLNullExpr sqlNullExpr) {}

  @Override
  public void endVisit(SQLNumberExpr sqlNumberExpr) {}

  @Override
  public void endVisit(SQLPropertyExpr sqlPropertyExpr) {}

  @Override
  public void endVisit(SQLSelectGroupByClause sqlSelectGroupByClause) {}

  @Override
  public void endVisit(SQLSelectItem sqlSelectItem) {}

  @Override
  public void endVisit(SQLSelectStatement sqlSelectStatement) {}

  @Override
  public void postVisit(SQLObject sqlObject) {}

  @Override
  public void preVisit(SQLObject sqlObject) {}

  @Override
  public boolean visit(SQLAllColumnExpr sqlAllColumnExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLBetweenExpr sqlBetweenExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLBinaryOpExpr sqlBinaryOpExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLCaseExpr sqlCaseExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLCaseExpr.Item item) {
    return true;
  }

  @Override
  public boolean visit(SQLCaseStatement sqlCaseStatement) {
    return true;
  }

  @Override
  public boolean visit(SQLCaseStatement.Item item) {
    return true;
  }

  @Override
  public boolean visit(SQLCastExpr sqlCastExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLCharExpr sqlCharExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLExistsExpr sqlExistsExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLIdentifierExpr sqlIdentifierExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLInListExpr sqlInListExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLIntegerExpr sqlIntegerExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLNCharExpr sqlnCharExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLNotExpr sqlNotExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLNullExpr sqlNullExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLNumberExpr sqlNumberExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLPropertyExpr sqlPropertyExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLSelectGroupByClause sqlSelectGroupByClause) {
    return true;
  }

  @Override
  public boolean visit(SQLSelectItem sqlSelectItem) {
    return true;
  }

  @Override
  public void endVisit(SQLCastExpr sqlCastExpr) {}

  @Override
  public boolean visit(SQLSelectStatement sqlSelectStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAggregateExpr sqlAggregateExpr) {}

  @Override
  public boolean visit(SQLAggregateExpr sqlAggregateExpr) {
    return true;
  }

  @Override
  public boolean visit(SQLVariantRefExpr sqlVariantRefExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLVariantRefExpr sqlVariantRefExpr) {}

  @Override
  public boolean visit(SQLQueryExpr sqlQueryExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLQueryExpr sqlQueryExpr) {}

  @Override
  public boolean visit(SQLUnaryExpr sqlUnaryExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLUnaryExpr sqlUnaryExpr) {}

  @Override
  public boolean visit(SQLHexExpr sqlHexExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLHexExpr sqlHexExpr) {}

  @Override
  public boolean visit(SQLSelect sqlSelect) {
    return true;
  }

  @Override
  public void endVisit(SQLSelect sqlSelect) {}

  @Override
  public boolean visit(SQLSelectQueryBlock sqlSelectQueryBlock) {
    return true;
  }

  @Override
  public void endVisit(SQLSelectQueryBlock sqlSelectQueryBlock) {}

  @Override
  public boolean visit(SQLExprTableSource sqlExprTableSource) {
    return true;
  }

  @Override
  public void endVisit(SQLExprTableSource node) {
    if (node.getExpr() instanceof SQLPropertyExpr) {
      node.setExpr(((SQLPropertyExpr) node.getExpr()).getName());
      node.getExpr().setParent(node);
    }
  }

  @Override
  public boolean visit(SQLOrderBy sqlOrderBy) {
    return true;
  }

  @Override
  public void endVisit(SQLOrderBy sqlOrderBy) {}

  @Override
  public boolean visit(SQLSelectOrderByItem sqlSelectOrderByItem) {
    return true;
  }

  @Override
  public void endVisit(SQLSelectOrderByItem sqlSelectOrderByItem) {}

  @Override
  public boolean visit(SQLDropTableStatement sqlDropTableStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropTableStatement sqlDropTableStatement) {}

  @Override
  public boolean visit(SQLCreateTableStatement sqlCreateTableStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateTableStatement sqlCreateTableStatement) {}

  @Override
  public boolean visit(SQLColumnDefinition sqlColumnDefinition) {
    return true;
  }

  @Override
  public void endVisit(SQLColumnDefinition sqlColumnDefinition) {}

  @Override
  public boolean visit(SQLColumnDefinition.Identity identity) {
    return true;
  }

  @Override
  public void endVisit(SQLColumnDefinition.Identity identity) {}

  @Override
  public boolean visit(SQLDataType sqlDataType) {
    return true;
  }

  @Override
  public void endVisit(SQLDataType sqlDataType) {}

  @Override
  public boolean visit(SQLCharacterDataType sqlCharacterDataType) {
    return true;
  }

  @Override
  public void endVisit(SQLCharacterDataType sqlCharacterDataType) {}

  @Override
  public boolean visit(SQLDeleteStatement sqlDeleteStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDeleteStatement sqlDeleteStatement) {}

  @Override
  public boolean visit(SQLCurrentOfCursorExpr sqlCurrentOfCursorExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLCurrentOfCursorExpr sqlCurrentOfCursorExpr) {}

  @Override
  public boolean visit(SQLInsertStatement sqlInsertStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLInsertStatement sqlInsertStatement) {}

  @Override
  public boolean visit(SQLInsertStatement.ValuesClause valuesClause) {
    return true;
  }

  @Override
  public void endVisit(SQLInsertStatement.ValuesClause valuesClause) {}

  @Override
  public boolean visit(SQLUpdateSetItem sqlUpdateSetItem) {
    return true;
  }

  @Override
  public void endVisit(SQLUpdateSetItem sqlUpdateSetItem) {}

  @Override
  public boolean visit(SQLUpdateStatement sqlUpdateStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLUpdateStatement sqlUpdateStatement) {}

  @Override
  public boolean visit(SQLCreateViewStatement sqlCreateViewStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateViewStatement sqlCreateViewStatement) {}

  @Override
  public boolean visit(SQLCreateViewStatement.Column column) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateViewStatement.Column column) {}

  @Override
  public boolean visit(SQLNotNullConstraint sqlNotNullConstraint) {
    return true;
  }

  @Override
  public void endVisit(SQLNotNullConstraint sqlNotNullConstraint) {}

  @Override
  public void endVisit(SQLMethodInvokeExpr sqlMethodInvokeExpr) {}

  @Override
  public boolean visit(SQLMethodInvokeExpr sqlMethodInvokeExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLUnionQuery sqlUnionQuery) {}

  @Override
  public boolean visit(SQLUnionQuery sqlUnionQuery) {
    return true;
  }

  @Override
  public void endVisit(SQLSetStatement sqlSetStatement) {}

  @Override
  public boolean visit(SQLSetStatement sqlSetStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAssignItem sqlAssignItem) {}

  @Override
  public boolean visit(SQLAssignItem sqlAssignItem) {
    return true;
  }

  @Override
  public void endVisit(SQLCallStatement sqlCallStatement) {}

  @Override
  public boolean visit(SQLCallStatement sqlCallStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLJoinTableSource sqlJoinTableSource) {}

  @Override
  public boolean visit(SQLJoinTableSource sqlJoinTableSource) {
    return true;
  }

  @Override
  public void endVisit(SQLSomeExpr sqlSomeExpr) {}

  @Override
  public boolean visit(SQLSomeExpr sqlSomeExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLAnyExpr sqlAnyExpr) {}

  @Override
  public boolean visit(SQLAnyExpr sqlAnyExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLAllExpr sqlAllExpr) {}

  @Override
  public boolean visit(SQLAllExpr sqlAllExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLInSubQueryExpr sqlInSubQueryExpr) {}

  @Override
  public boolean visit(SQLInSubQueryExpr sqlInSubQueryExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLListExpr sqlListExpr) {}

  @Override
  public boolean visit(SQLListExpr sqlListExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLSubqueryTableSource sqlSubqueryTableSource) {}

  @Override
  public boolean visit(SQLSubqueryTableSource sqlSubqueryTableSource) {
    return true;
  }

  @Override
  public void endVisit(SQLTruncateStatement sqlTruncateStatement) {}

  @Override
  public boolean visit(SQLTruncateStatement sqlTruncateStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDefaultExpr sqlDefaultExpr) {}

  @Override
  public boolean visit(SQLDefaultExpr sqlDefaultExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLCommentStatement sqlCommentStatement) {}

  @Override
  public boolean visit(SQLCommentStatement sqlCommentStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLUseStatement sqlUseStatement) {}

  @Override
  public boolean visit(SQLUseStatement sqlUseStatement) {
    return true;
  }

  @Override
  public boolean visit(SQLAlterTableAddColumn sqlAlterTableAddColumn) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableAddColumn sqlAlterTableAddColumn) {}

  @Override
  public boolean visit(SQLAlterTableDropColumnItem sqlAlterTableDropColumnItem) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDropColumnItem sqlAlterTableDropColumnItem) {}

  @Override
  public boolean visit(SQLAlterTableDropIndex sqlAlterTableDropIndex) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDropIndex sqlAlterTableDropIndex) {}

  @Override
  public boolean visit(SQLDropIndexStatement sqlDropIndexStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropIndexStatement sqlDropIndexStatement) {}

  @Override
  public boolean visit(SQLDropViewStatement sqlDropViewStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropViewStatement sqlDropViewStatement) {}

  @Override
  public boolean visit(SQLSavePointStatement sqlSavePointStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLSavePointStatement sqlSavePointStatement) {}

  @Override
  public boolean visit(SQLRollbackStatement sqlRollbackStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLRollbackStatement sqlRollbackStatement) {}

  @Override
  public boolean visit(SQLReleaseSavePointStatement sqlReleaseSavePointStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLReleaseSavePointStatement sqlReleaseSavePointStatement) {}

  @Override
  public void endVisit(SQLCommentHint sqlCommentHint) {}

  @Override
  public boolean visit(SQLCommentHint sqlCommentHint) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateDatabaseStatement sqlCreateDatabaseStatement) {}

  @Override
  public boolean visit(SQLCreateDatabaseStatement sqlCreateDatabaseStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLOver sqlOver) {}

  @Override
  public boolean visit(SQLOver sqlOver) {
    return true;
  }

  @Override
  public void endVisit(SQLKeep sqlKeep) {}

  @Override
  public boolean visit(SQLKeep sqlKeep) {
    return true;
  }

  @Override
  public void endVisit(SQLColumnPrimaryKey sqlColumnPrimaryKey) {}

  @Override
  public boolean visit(SQLColumnPrimaryKey sqlColumnPrimaryKey) {
    return true;
  }

  @Override
  public boolean visit(SQLColumnUniqueKey sqlColumnUniqueKey) {
    return true;
  }

  @Override
  public void endVisit(SQLColumnUniqueKey sqlColumnUniqueKey) {}

  @Override
  public void endVisit(SQLWithSubqueryClause sqlWithSubqueryClause) {}

  @Override
  public boolean visit(SQLWithSubqueryClause sqlWithSubqueryClause) {
    return true;
  }

  @Override
  public void endVisit(SQLWithSubqueryClause.Entry entry) {}

  @Override
  public boolean visit(SQLWithSubqueryClause.Entry entry) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableAlterColumn sqlAlterTableAlterColumn) {}

  @Override
  public boolean visit(SQLAlterTableAlterColumn sqlAlterTableAlterColumn) {
    return true;
  }

  @Override
  public boolean visit(SQLCheck sqlCheck) {
    return true;
  }

  @Override
  public void endVisit(SQLCheck sqlCheck) {}

  @Override
  public boolean visit(SQLAlterTableDropForeignKey sqlAlterTableDropForeignKey) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDropForeignKey sqlAlterTableDropForeignKey) {}

  @Override
  public boolean visit(SQLAlterTableDropPrimaryKey sqlAlterTableDropPrimaryKey) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDropPrimaryKey sqlAlterTableDropPrimaryKey) {}

  @Override
  public boolean visit(SQLAlterTableDisableKeys sqlAlterTableDisableKeys) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDisableKeys sqlAlterTableDisableKeys) {}

  @Override
  public boolean visit(SQLAlterTableEnableKeys sqlAlterTableEnableKeys) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableEnableKeys sqlAlterTableEnableKeys) {}

  @Override
  public boolean visit(SQLAlterTableStatement sqlAlterTableStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableStatement sqlAlterTableStatement) {}

  @Override
  public boolean visit(SQLAlterTableDisableConstraint sqlAlterTableDisableConstraint) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDisableConstraint sqlAlterTableDisableConstraint) {}

  @Override
  public boolean visit(SQLAlterTableEnableConstraint sqlAlterTableEnableConstraint) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableEnableConstraint sqlAlterTableEnableConstraint) {}

  @Override
  public boolean visit(SQLColumnCheck sqlColumnCheck) {
    return true;
  }

  @Override
  public void endVisit(SQLColumnCheck sqlColumnCheck) {}

  @Override
  public boolean visit(SQLExprHint sqlExprHint) {
    return true;
  }

  @Override
  public void endVisit(SQLExprHint sqlExprHint) {}

  @Override
  public boolean visit(SQLAlterTableDropConstraint sqlAlterTableDropConstraint) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDropConstraint sqlAlterTableDropConstraint) {}

  @Override
  public boolean visit(SQLUnique sqlUnique) {
    return true;
  }

  @Override
  public void endVisit(SQLUnique sqlUnique) {}

  @Override
  public boolean visit(SQLPrimaryKeyImpl sqlPrimaryKey) {
    return true;
  }

  @Override
  public void endVisit(SQLPrimaryKeyImpl sqlPrimaryKey) {}

  @Override
  public boolean visit(SQLCreateIndexStatement sqlCreateIndexStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateIndexStatement sqlCreateIndexStatement) {}

  @Override
  public boolean visit(SQLAlterTableRenameColumn sqlAlterTableRenameColumn) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableRenameColumn sqlAlterTableRenameColumn) {}

  @Override
  public boolean visit(SQLColumnReference sqlColumnReference) {
    return true;
  }

  @Override
  public void endVisit(SQLColumnReference sqlColumnReference) {}

  @Override
  public boolean visit(SQLForeignKeyImpl sqlForeignKey) {
    return true;
  }

  @Override
  public void endVisit(SQLForeignKeyImpl sqlForeignKey) {}

  @Override
  public boolean visit(SQLDropSequenceStatement sqlDropSequenceStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropSequenceStatement sqlDropSequenceStatement) {}

  @Override
  public boolean visit(SQLDropTriggerStatement sqlDropTriggerStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropTriggerStatement sqlDropTriggerStatement) {}

  @Override
  public void endVisit(SQLDropUserStatement sqlDropUserStatement) {}

  @Override
  public boolean visit(SQLDropUserStatement sqlDropUserStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLExplainStatement sqlExplainStatement) {}

  @Override
  public boolean visit(SQLExplainStatement sqlExplainStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLGrantStatement sqlGrantStatement) {}

  @Override
  public boolean visit(SQLGrantStatement sqlGrantStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropDatabaseStatement sqlDropDatabaseStatement) {}

  @Override
  public boolean visit(SQLDropDatabaseStatement sqlDropDatabaseStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableAddIndex sqlAlterTableAddIndex) {}

  @Override
  public boolean visit(SQLAlterTableAddIndex sqlAlterTableAddIndex) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableAddConstraint sqlAlterTableAddConstraint) {}

  @Override
  public boolean visit(SQLAlterTableAddConstraint sqlAlterTableAddConstraint) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateTriggerStatement sqlCreateTriggerStatement) {}

  @Override
  public boolean visit(SQLCreateTriggerStatement sqlCreateTriggerStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropFunctionStatement sqlDropFunctionStatement) {}

  @Override
  public boolean visit(SQLDropFunctionStatement sqlDropFunctionStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropTableSpaceStatement sqlDropTableSpaceStatement) {}

  @Override
  public boolean visit(SQLDropTableSpaceStatement sqlDropTableSpaceStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropProcedureStatement sqlDropProcedureStatement) {}

  @Override
  public boolean visit(SQLDropProcedureStatement sqlDropProcedureStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLBooleanExpr sqlBooleanExpr) {}

  @Override
  public boolean visit(SQLBooleanExpr sqlBooleanExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLUnionQueryTableSource sqlUnionQueryTableSource) {}

  @Override
  public boolean visit(SQLUnionQueryTableSource sqlUnionQueryTableSource) {
    return true;
  }

  @Override
  public void endVisit(SQLTimestampExpr sqlTimestampExpr) {}

  @Override
  public boolean visit(SQLTimestampExpr sqlTimestampExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLRevokeStatement sqlRevokeStatement) {}

  @Override
  public boolean visit(SQLRevokeStatement sqlRevokeStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLBinaryExpr sqlBinaryExpr) {}

  @Override
  public boolean visit(SQLBinaryExpr sqlBinaryExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableRename sqlAlterTableRename) {}

  @Override
  public boolean visit(SQLAlterTableRename sqlAlterTableRename) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterViewRenameStatement sqlAlterViewRenameStatement) {}

  @Override
  public boolean visit(SQLAlterViewRenameStatement sqlAlterViewRenameStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLShowTablesStatement sqlShowTablesStatement) {}

  @Override
  public boolean visit(SQLShowTablesStatement sqlShowTablesStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableAddPartition sqlAlterTableAddPartition) {}

  @Override
  public boolean visit(SQLAlterTableAddPartition sqlAlterTableAddPartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDropPartition sqlAlterTableDropPartition) {}

  @Override
  public boolean visit(SQLAlterTableDropPartition sqlAlterTableDropPartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableRenamePartition sqlAlterTableRenamePartition) {}

  @Override
  public boolean visit(SQLAlterTableRenamePartition sqlAlterTableRenamePartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableSetComment sqlAlterTableSetComment) {}

  @Override
  public boolean visit(SQLAlterTableSetComment sqlAlterTableSetComment) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableSetLifecycle sqlAlterTableSetLifecycle) {}

  @Override
  public boolean visit(SQLAlterTableSetLifecycle sqlAlterTableSetLifecycle) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableEnableLifecycle sqlAlterTableEnableLifecycle) {}

  @Override
  public boolean visit(SQLAlterTableEnableLifecycle sqlAlterTableEnableLifecycle) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDisableLifecycle sqlAlterTableDisableLifecycle) {}

  @Override
  public boolean visit(SQLAlterTableDisableLifecycle sqlAlterTableDisableLifecycle) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableTouch sqlAlterTableTouch) {}

  @Override
  public boolean visit(SQLAlterTableTouch sqlAlterTableTouch) {
    return true;
  }

  @Override
  public void endVisit(SQLArrayExpr sqlArrayExpr) {}

  @Override
  public boolean visit(SQLArrayExpr sqlArrayExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLOpenStatement sqlOpenStatement) {}

  @Override
  public boolean visit(SQLOpenStatement sqlOpenStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLFetchStatement sqlFetchStatement) {}

  @Override
  public boolean visit(SQLFetchStatement sqlFetchStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLCloseStatement sqlCloseStatement) {}

  @Override
  public boolean visit(SQLCloseStatement sqlCloseStatement) {
    return true;
  }

  @Override
  public boolean visit(SQLGroupingSetExpr sqlGroupingSetExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLGroupingSetExpr sqlGroupingSetExpr) {}

  @Override
  public boolean visit(SQLIfStatement sqlIfStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLIfStatement sqlIfStatement) {}

  @Override
  public boolean visit(SQLIfStatement.ElseIf elseIf) {
    return true;
  }

  @Override
  public void endVisit(SQLIfStatement.ElseIf elseIf) {}

  @Override
  public boolean visit(SQLIfStatement.Else anElse) {
    return true;
  }

  @Override
  public void endVisit(SQLIfStatement.Else anElse) {}

  @Override
  public boolean visit(SQLLoopStatement sqlLoopStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLLoopStatement sqlLoopStatement) {}

  @Override
  public boolean visit(SQLParameter sqlParameter) {
    return true;
  }

  @Override
  public void endVisit(SQLParameter sqlParameter) {}

  @Override
  public boolean visit(SQLCreateProcedureStatement sqlCreateProcedureStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateProcedureStatement sqlCreateProcedureStatement) {}

  @Override
  public boolean visit(SQLCreateFunctionStatement sqlCreateFunctionStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateFunctionStatement sqlCreateFunctionStatement) {}

  @Override
  public boolean visit(SQLBlockStatement sqlBlockStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLBlockStatement sqlBlockStatement) {}

  @Override
  public boolean visit(SQLAlterTableDropKey sqlAlterTableDropKey) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDropKey sqlAlterTableDropKey) {}

  @Override
  public boolean visit(SQLDeclareItem sqlDeclareItem) {
    return true;
  }

  @Override
  public void endVisit(SQLDeclareItem sqlDeclareItem) {}

  @Override
  public boolean visit(SQLPartitionValue sqlPartitionValue) {
    return true;
  }

  @Override
  public void endVisit(SQLPartitionValue sqlPartitionValue) {}

  @Override
  public boolean visit(SQLPartition sqlPartition) {
    return true;
  }

  @Override
  public void endVisit(SQLPartition sqlPartition) {}

  @Override
  public boolean visit(SQLPartitionByRange sqlPartitionByRange) {
    return true;
  }

  @Override
  public void endVisit(SQLPartitionByRange sqlPartitionByRange) {}

  @Override
  public boolean visit(SQLPartitionByHash sqlPartitionByHash) {
    return true;
  }

  @Override
  public void endVisit(SQLPartitionByHash sqlPartitionByHash) {}

  @Override
  public boolean visit(SQLPartitionByList sqlPartitionByList) {
    return true;
  }

  @Override
  public void endVisit(SQLPartitionByList sqlPartitionByList) {}

  @Override
  public boolean visit(SQLSubPartition sqlSubPartition) {
    return true;
  }

  @Override
  public void endVisit(SQLSubPartition sqlSubPartition) {}

  @Override
  public boolean visit(SQLSubPartitionByHash sqlSubPartitionByHash) {
    return true;
  }

  @Override
  public void endVisit(SQLSubPartitionByHash sqlSubPartitionByHash) {}

  @Override
  public boolean visit(SQLSubPartitionByList sqlSubPartitionByList) {
    return true;
  }

  @Override
  public void endVisit(SQLSubPartitionByList sqlSubPartitionByList) {}

  @Override
  public boolean visit(SQLAlterDatabaseStatement sqlAlterDatabaseStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterDatabaseStatement sqlAlterDatabaseStatement) {}

  @Override
  public boolean visit(SQLAlterTableConvertCharSet sqlAlterTableConvertCharSet) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableConvertCharSet sqlAlterTableConvertCharSet) {}

  @Override
  public boolean visit(SQLAlterTableReOrganizePartition sqlAlterTableReOrganizePartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableReOrganizePartition sqlAlterTableReOrganizePartition) {}

  @Override
  public boolean visit(SQLAlterTableCoalescePartition sqlAlterTableCoalescePartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableCoalescePartition sqlAlterTableCoalescePartition) {}

  @Override
  public boolean visit(SQLAlterTableTruncatePartition sqlAlterTableTruncatePartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableTruncatePartition sqlAlterTableTruncatePartition) {}

  @Override
  public boolean visit(SQLAlterTableDiscardPartition sqlAlterTableDiscardPartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableDiscardPartition sqlAlterTableDiscardPartition) {}

  @Override
  public boolean visit(SQLAlterTableImportPartition sqlAlterTableImportPartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableImportPartition sqlAlterTableImportPartition) {}

  @Override
  public boolean visit(SQLAlterTableAnalyzePartition sqlAlterTableAnalyzePartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableAnalyzePartition sqlAlterTableAnalyzePartition) {}

  @Override
  public boolean visit(SQLAlterTableCheckPartition sqlAlterTableCheckPartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableCheckPartition sqlAlterTableCheckPartition) {}

  @Override
  public boolean visit(SQLAlterTableOptimizePartition sqlAlterTableOptimizePartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableOptimizePartition sqlAlterTableOptimizePartition) {}

  @Override
  public boolean visit(SQLAlterTableRebuildPartition sqlAlterTableRebuildPartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableRebuildPartition sqlAlterTableRebuildPartition) {}

  @Override
  public boolean visit(SQLAlterTableRepairPartition sqlAlterTableRepairPartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableRepairPartition sqlAlterTableRepairPartition) {}

  @Override
  public boolean visit(SQLSequenceExpr sqlSequenceExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLSequenceExpr sqlSequenceExpr) {}

  @Override
  public boolean visit(SQLMergeStatement sqlMergeStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLMergeStatement sqlMergeStatement) {}

  @Override
  public boolean visit(SQLMergeStatement.MergeUpdateClause mergeUpdateClause) {
    return true;
  }

  @Override
  public void endVisit(SQLMergeStatement.MergeUpdateClause mergeUpdateClause) {}

  @Override
  public boolean visit(SQLMergeStatement.MergeInsertClause mergeInsertClause) {
    return true;
  }

  @Override
  public void endVisit(SQLMergeStatement.MergeInsertClause mergeInsertClause) {}

  @Override
  public boolean visit(SQLErrorLoggingClause sqlErrorLoggingClause) {
    return true;
  }

  @Override
  public void endVisit(SQLErrorLoggingClause sqlErrorLoggingClause) {}

  @Override
  public boolean visit(SQLNullConstraint sqlNullConstraint) {
    return true;
  }

  @Override
  public void endVisit(SQLNullConstraint sqlNullConstraint) {}

  @Override
  public boolean visit(SQLCreateSequenceStatement sqlCreateSequenceStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateSequenceStatement sqlCreateSequenceStatement) {}

  @Override
  public boolean visit(SQLDateExpr sqlDateExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLDateExpr sqlDateExpr) {}

  @Override
  public boolean visit(SQLLimit sqlLimit) {
    return true;
  }

  @Override
  public void endVisit(SQLLimit sqlLimit) {}

  @Override
  public void endVisit(SQLStartTransactionStatement sqlStartTransactionStatement) {}

  @Override
  public boolean visit(SQLStartTransactionStatement sqlStartTransactionStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDescribeStatement sqlDescribeStatement) {}

  @Override
  public boolean visit(SQLDescribeStatement sqlDescribeStatement) {
    return true;
  }

  @Override
  public boolean visit(SQLWhileStatement sqlWhileStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLWhileStatement sqlWhileStatement) {}

  @Override
  public boolean visit(SQLDeclareStatement sqlDeclareStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDeclareStatement sqlDeclareStatement) {}

  @Override
  public boolean visit(SQLReturnStatement sqlReturnStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLReturnStatement sqlReturnStatement) {}

  @Override
  public boolean visit(SQLArgument sqlArgument) {
    return true;
  }

  @Override
  public void endVisit(SQLArgument sqlArgument) {}

  @Override
  public boolean visit(SQLCommitStatement sqlCommitStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLCommitStatement sqlCommitStatement) {}

  @Override
  public boolean visit(SQLFlashbackExpr sqlFlashbackExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLFlashbackExpr sqlFlashbackExpr) {}

  @Override
  public boolean visit(SQLCreateMaterializedViewStatement sqlCreateMaterializedViewStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateMaterializedViewStatement sqlCreateMaterializedViewStatement) {}

  @Override
  public boolean visit(SQLBinaryOpExprGroup sqlBinaryOpExprGroup) {
    return true;
  }

  @Override
  public void endVisit(SQLBinaryOpExprGroup sqlBinaryOpExprGroup) {}

  @Override
  public boolean visit(SQLScriptCommitStatement sqlScriptCommitStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLScriptCommitStatement sqlScriptCommitStatement) {}

  @Override
  public boolean visit(SQLReplaceStatement sqlReplaceStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLReplaceStatement sqlReplaceStatement) {}

  @Override
  public boolean visit(SQLCreateUserStatement sqlCreateUserStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLCreateUserStatement sqlCreateUserStatement) {}

  @Override
  public boolean visit(SQLAlterFunctionStatement sqlAlterFunctionStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterFunctionStatement sqlAlterFunctionStatement) {}

  @Override
  public boolean visit(SQLAlterTypeStatement sqlAlterTypeStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTypeStatement sqlAlterTypeStatement) {}

  @Override
  public boolean visit(SQLIntervalExpr sqlIntervalExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLIntervalExpr sqlIntervalExpr) {}

  @Override
  public boolean visit(SQLLateralViewTableSource sqlLateralViewTableSource) {
    return true;
  }

  @Override
  public void endVisit(SQLLateralViewTableSource sqlLateralViewTableSource) {}

  @Override
  public boolean visit(SQLShowErrorsStatement sqlShowErrorsStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLShowErrorsStatement sqlShowErrorsStatement) {}

  @Override
  public boolean visit(SQLAlterCharacter sqlAlterCharacter) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterCharacter sqlAlterCharacter) {}

  @Override
  public boolean visit(SQLExprStatement sqlExprStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLExprStatement sqlExprStatement) {}

  @Override
  public boolean visit(SQLAlterProcedureStatement sqlAlterProcedureStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterProcedureStatement sqlAlterProcedureStatement) {}

  @Override
  public boolean visit(SQLAlterViewStatement sqlAlterViewStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterViewStatement sqlAlterViewStatement) {}

  @Override
  public boolean visit(SQLDropEventStatement sqlDropEventStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropEventStatement sqlDropEventStatement) {}

  @Override
  public boolean visit(SQLDropLogFileGroupStatement sqlDropLogFileGroupStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropLogFileGroupStatement sqlDropLogFileGroupStatement) {}

  @Override
  public boolean visit(SQLDropServerStatement sqlDropServerStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropServerStatement sqlDropServerStatement) {}

  @Override
  public boolean visit(SQLDropSynonymStatement sqlDropSynonymStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropSynonymStatement sqlDropSynonymStatement) {}

  @Override
  public boolean visit(SQLRecordDataType sqlRecordDataType) {
    return true;
  }

  @Override
  public void endVisit(SQLRecordDataType sqlRecordDataType) {}

  @Override
  public boolean visit(SQLDropTypeStatement sqlDropTypeStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropTypeStatement sqlDropTypeStatement) {}

  @Override
  public boolean visit(SQLExternalRecordFormat sqlExternalRecordFormat) {
    return true;
  }

  @Override
  public void endVisit(SQLExternalRecordFormat sqlExternalRecordFormat) {}

  @Override
  public boolean visit(SQLArrayDataType sqlArrayDataType) {
    return true;
  }

  @Override
  public void endVisit(SQLArrayDataType sqlArrayDataType) {}

  @Override
  public boolean visit(SQLMapDataType sqlMapDataType) {
    return true;
  }

  @Override
  public void endVisit(SQLMapDataType sqlMapDataType) {}

  @Override
  public boolean visit(SQLStructDataType sqlStructDataType) {
    return true;
  }

  @Override
  public void endVisit(SQLStructDataType sqlStructDataType) {}

  @Override
  public boolean visit(SQLStructDataType.Field field) {
    return true;
  }

  @Override
  public void endVisit(SQLStructDataType.Field field) {}

  @Override
  public boolean visit(SQLDropMaterializedViewStatement sqlDropMaterializedViewStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDropMaterializedViewStatement sqlDropMaterializedViewStatement) {}

  @Override
  public boolean visit(SQLAlterTableRenameIndex sqlAlterTableRenameIndex) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableRenameIndex sqlAlterTableRenameIndex) {}

  @Override
  public boolean visit(SQLAlterSequenceStatement sqlAlterSequenceStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterSequenceStatement sqlAlterSequenceStatement) {}

  @Override
  public boolean visit(SQLAlterTableExchangePartition sqlAlterTableExchangePartition) {
    return true;
  }

  @Override
  public void endVisit(SQLAlterTableExchangePartition sqlAlterTableExchangePartition) {}

  @Override
  public boolean visit(SQLValuesExpr sqlValuesExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLValuesExpr sqlValuesExpr) {}

  @Override
  public boolean visit(SQLValuesTableSource sqlValuesTableSource) {
    return true;
  }

  @Override
  public void endVisit(SQLValuesTableSource sqlValuesTableSource) {}

  @Override
  public boolean visit(SQLContainsExpr sqlContainsExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLContainsExpr sqlContainsExpr) {}

  @Override
  public boolean visit(SQLRealExpr sqlRealExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLRealExpr sqlRealExpr) {}

  @Override
  public boolean visit(SQLWindow sqlWindow) {
    return true;
  }

  @Override
  public void endVisit(SQLWindow sqlWindow) {}

  @Override
  public boolean visit(SQLDumpStatement sqlDumpStatement) {
    return true;
  }

  @Override
  public void endVisit(SQLDumpStatement sqlDumpStatement) {}

  @Override
  public boolean visit(SQLValuesQuery sqlValuesQuery) {
    return true;
  }

  @Override
  public void endVisit(SQLValuesQuery sqlValuesQuery) {}

  @Override
  public boolean visit(SQLDataTypeRefExpr sqlDataTypeRefExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLDataTypeRefExpr sqlDataTypeRefExpr) {}

  @Override
  public boolean visit(SQLTableSampling sqlTableSampling) {
    return true;
  }

  @Override
  public void endVisit(SQLTableSampling sqlTableSampling) {}

  @Override
  public boolean visit(SQLSizeExpr sqlSizeExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLSizeExpr sqlSizeExpr) {}

  @Override
  public boolean visit(SQLUnnestTableSource sqlUnnestTableSource) {
    return true;
  }

  @Override
  public void endVisit(SQLUnnestTableSource sqlUnnestTableSource) {}

  @Override
  public boolean visit(SQLAdhocTableSource sqlAdhocTableSource) {
    return true;
  }

  @Override
  public void endVisit(SQLAdhocTableSource sqlAdhocTableSource) {}

  @Override
  public boolean visit(SQLCurrentTimeExpr sqlCurrentTimeExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLCurrentTimeExpr sqlCurrentTimeExpr) {}

  @Override
  public boolean visit(SQLDecimalExpr sqlDecimalExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLDecimalExpr sqlDecimalExpr) {}

  @Override
  public boolean visit(SQLCurrentUserExpr sqlCurrentUserExpr) {
    return true;
  }

  @Override
  public void endVisit(SQLCurrentUserExpr sqlCurrentUserExpr) {}
}
