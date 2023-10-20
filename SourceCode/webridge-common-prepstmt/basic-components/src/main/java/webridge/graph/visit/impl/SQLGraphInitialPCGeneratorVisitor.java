package webridge.graph.visit.impl;

import webridge.graph.SQLCondition;
import webridge.graph.SQLGraph;
import webridge.graph.SQLGraphHelper;
import webridge.graph.SQLNode;
import webridge.graph.impl.SQLConditionImpl;
import webridge.graph.visit.SQLGraphNoDuplicateVisitor;
import webridge.symbc.numeric.Constraint;
import webridge.symbc.numeric.LogicalORIntegerConstraints;
import webridge.symbc.string.LogicalOrStringConstraints;
import webridge.symbc.string.StringConstraint;

import java.util.ArrayList;
import java.util.List;

public class SQLGraphInitialPCGeneratorVisitor extends SQLGraphNoDuplicateVisitor {
  @Override
  public void visit(SQLNode node, SQLNode prev, SQLGraph graph) {
    super.visit(node, prev, graph);

    List<Constraint> originalNumericConstraints = new ArrayList<>();
    List<StringConstraint> originalStringConstraints = new ArrayList<>();

    for (SQLCondition condition : node.getAllSQLConditions()) {
      if (condition.getConstraint() != null) {
        originalNumericConstraints.add(condition.getConstraint());
      }
      if (condition.getStringConstraint() != null) {
        originalStringConstraints.add(condition.getStringConstraint());
      }
    }

    Constraint numericConstraints;
    StringConstraint stringConstraints;
    int count, stringCount;

    if (originalNumericConstraints.size() == 0) {
      numericConstraints = null;
      count = 0;
    } else if (originalNumericConstraints.size() == 1) {
      numericConstraints = originalNumericConstraints.get(0);
      count = SQLGraphHelper.unlinkConstraints(numericConstraints).size();
    } else {
      numericConstraints = new LogicalORIntegerConstraints(originalNumericConstraints);
      count = 1;
    }

    if (originalStringConstraints.size() == 0) {
      stringConstraints = null;
      stringCount = 0;
    } else if (originalStringConstraints.size() == 1) {
      stringConstraints = originalStringConstraints.get(0);
      stringCount = SQLGraphHelper.unlinkStringConstraints(stringConstraints).size();
    } else {
      stringConstraints = new LogicalOrStringConstraints(originalStringConstraints);
      stringCount = 1;
    }

    node.setPrunedSQLCondition(
        new SQLConditionImpl(numericConstraints, count, stringConstraints, stringCount));
  }
}
