package webridge.wbridge.graph.impl;

import webridge.wbridge.graph.SQLCondition;
import webridge.wbridge.sql.types.SQLVarType;
import webridge.wbridge.storedprocedure.utils.SQLPCUtil;
import webridge.wbridge.symbc.numeric.Constraint;
import webridge.wbridge.symbc.string.StringConstraint;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import org.apache.commons.lang3.SerializationUtils;

public class SQLConditionImpl implements SQLCondition {
  private static final long serialVersionUID = -8902971337572134324L;

  private final Constraint constraint;
  private final int count;
  private final StringConstraint stringConstraint;
  private final int stringCount;
  private String parsedPc;

  public SQLConditionImpl(
      Constraint constraint, int count, StringConstraint stringConstraint, int stringCount) {
    this.constraint = constraint;
    this.count = count;
    this.stringConstraint = stringConstraint;
    this.stringCount = stringCount;
  }

  @Override
  public String expandConstraints() {
    if (this.parsedPc == null) {
      String normalPc = SQLPCUtil.expandConstraint(constraint);
      String strPc = SQLPCUtil.expandConstraint(stringConstraint);
      if (normalPc != null && strPc != null) {
        this.parsedPc = normalPc + " && " + strPc;
      } else if (normalPc != null) {
        this.parsedPc = normalPc;
      } else if (strPc != null) {
        this.parsedPc = strPc;
      } else {
        // pc contains nothing, which -> true
        this.parsedPc = "true";
      }
    }
    return this.parsedPc;
  }

  private Map<String, SQLVarType> constraintVariables;

  @Override
  public Map<String, SQLVarType> getConstraintVariables() {
    if (constraintVariables != null) return constraintVariables;
    constraintVariables = new HashMap<>();
    SQLPCUtil.collectConstraintVariables(constraint, constraintVariables);
    SQLPCUtil.collectConstraintVariables(stringConstraint, constraintVariables);
    return constraintVariables;
  }

  @Override
  public SQLCondition deepClone() {
    return SerializationUtils.clone(this);
  }

  @Override
  public Constraint getConstraint() {
    return constraint;
  }

  @Override
  public int getCount() {
    return count;
  }

  @Override
  public StringConstraint getStringConstraint() {
    return stringConstraint;
  }

  @Override
  public int getStringCount() {
    return stringCount;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    SQLConditionImpl that = (SQLConditionImpl) o;
    return count == that.count
        && stringCount == that.stringCount
        && Objects.equals(constraint, that.constraint)
        && Objects.equals(stringConstraint, that.stringConstraint);
  }

  @Override
  public int hashCode() {
    return Objects.hash(constraint, count, stringConstraint, stringCount);
  }

  @Override
  public String toString() {
    return "SQLConditionImpl{"
        + "constraint="
        + constraint
        + ", count="
        + count
        + ", stringConstraint="
        + stringConstraint
        + ", stringCount="
        + stringCount
        + ", parsedPc='"
        + parsedPc
        + '\''
        + ", constraintVariables="
        + constraintVariables
        + '}';
  }

  public boolean isTrueConstraint() {
    if (count == 0) return true;
    if (constraint == null && stringConstraint == null) return true;
    boolean numericTrue = false;
    boolean stringTrue = false;
    if (constraint != null) {
      numericTrue = constraint.toString().equalsIgnoreCase("true");
    }
    if (stringConstraint != null) {
      stringTrue = stringConstraint.toString().equalsIgnoreCase("true");
    }
    return numericTrue && stringTrue;
  }
}
