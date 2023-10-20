package webridge.sql;

import webridge.sql.types.SQLVarType;
import webridge.sql.types.SqlType;
import java.util.List;

public interface SymSQL {

  SqlType getSqlType();

  String getSqlTemplate();

  String getConcreteSql();

  String getPathConditionStr();

  List<String> getParameterExprs();

  List<SQLVarType> getParameterTypes();

  List<SQLVarType> getRetValTypes();

  List<String> getRetValNames();

  List<String> getRetValAlias();

  List<List<String>> getRetSymbolicNames();

  /**
   * a row count variable indicates the number of rows returned by select or affected by
   * update/insert/delete
   */
  String getRowCountVarName();

  int getConnNo();

  /** null indicates there's no savepoint for this sql */
  default String getSavePointName() {
    return null;
  }

  /**
   * Set savepoint of this sql. We only add 'savepoint p1' statement right before a write sql. For a
   * select, it stores the savepoint of the first write sql after this select within a transaction.
   */
  default void setSavePointName(String savePointName) {}

  int getSqlNo();

  void setSqlNo(int sqlNo);
}
