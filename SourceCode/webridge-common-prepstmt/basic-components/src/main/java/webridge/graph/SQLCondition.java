package webridge.graph;

import webridge.sql.types.SQLVarType;
import webridge.symbc.numeric.Constraint;
import webridge.symbc.string.StringConstraint;
import java.io.Serializable;
import java.util.Map;

public interface SQLCondition extends Serializable {

  String expandConstraints();

  /** return the variables (name and its type) used in this condition, type see java.sql.Types */
  Map<String, SQLVarType> getConstraintVariables();

  SQLCondition deepClone();

  Constraint getConstraint();

  int getCount();

  StringConstraint getStringConstraint();

  int getStringCount();

  // returns whether the pc is satisfiable in all cases
  boolean isTrueConstraint();
}