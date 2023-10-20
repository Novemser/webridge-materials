package webridge.graph;

import com.google.common.base.Joiner;
import webridge.graph.impl.SQLConditionImpl;
import webridge.symbc.numeric.*;
import webridge.symbc.numeric.visitors.CollectVariableVisitor;
import webridge.symbc.string.LogicalOrStringConstraints;
import webridge.symbc.string.StringConstraint;
import webridge.symbc.string.StringExpression;
import java.util.*;
import java.util.Comparator;
import java.util.stream.Collectors;
import org.apache.commons.lang3.tuple.Pair;

public abstract class SQLGraphHelper {

  private static final Map<Pair<SQLNode, SQLNode>, List<Pair<SQLNode, SQLNode>>> cache =
      new HashMap<>();

  /**
   * Using algorithm similar to LCS to find longest equal sql sequence
   *
   * @param graphLeft a merged graph
   * @param graphRight a single trace graph
   * @return a list which exist in the sequence, each list element is a pair of sql nodes, left is
   *     the SQLNode in graphLeft, right is the SQLNode in graphRight
   */
  public static List<Pair<SQLNode, SQLNode>> findLongestEqualSubSQLSeq(
      SQLGraph graphLeft, SingleTraceSQLGraph graphRight) {
    return findLongestEqualSubSQLSeq(graphLeft.getRootNode(), graphRight.getRootNode());
  }

  private static List<Pair<SQLNode, SQLNode>> findLongestEqualSubSQLSeq(
      SQLNode nodeLeft, SQLNode nodeRight) {
    if (cache.containsKey(Pair.of(nodeLeft, nodeRight))) {
      return cache.get(Pair.of(nodeLeft, nodeRight));
    }

    if (nodeLeft.canMerge(nodeRight)) {
      List<Pair<SQLNode, SQLNode>> lcs = new ArrayList<>();
      lcs.add(Pair.of(nodeLeft, nodeRight));
      if (nodeLeft.getChildNodes().isEmpty() || nodeRight.getChildNodes().isEmpty()) {
        cache.put(Pair.of(nodeLeft, nodeRight), lcs);
        return lcs;
      }
      lcs.addAll(
          nodeLeft.getChildNodes().stream()
              .map(
                  leftChild ->
                      findLongestEqualSubSQLSeq(leftChild, nodeRight.getChildNodes().get(0)))
              .max(Comparator.comparingInt(List::size))
              .orElseThrow(RuntimeException::new));
      cache.put(Pair.of(nodeLeft, nodeRight), lcs);
      return lcs;
    } else {
      List<Pair<SQLNode, SQLNode>> lcs = new ArrayList<>();
      if (!nodeLeft.getChildNodes().isEmpty()) {
        lcs =
            nodeLeft.getChildNodes().stream()
                .map(leftChild -> findLongestEqualSubSQLSeq(leftChild, nodeRight))
                .max(Comparator.comparingInt(List::size))
                .orElseThrow(RuntimeException::new);
      }
      if (!nodeRight.getChildNodes().isEmpty()) {
        List<Pair<SQLNode, SQLNode>> candidate =
            findLongestEqualSubSQLSeq(nodeLeft, nodeRight.getChildNodes().get(0));
        if (candidate.size() > lcs.size()) {
          lcs = candidate;
        }
      }
      cache.put(Pair.of(nodeLeft, nodeRight), lcs);
      return lcs;
    }
  }

  private static Set<Expression> extractExpression(Constraint constraint) {
    if (constraint == null) return new HashSet<>();
    final CollectVariableVisitor collectVariableVisitor = new CollectVariableVisitor();
    constraint.accept(collectVariableVisitor);
    return collectVariableVisitor.getVariables().stream()
        .filter(
            expression ->
                expression.toString().contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX_2)
                    || expression.toString().contains(SymbolicPlaceHolder.ND_FUNC_TEMPLATE_PREFIX))
        .collect(Collectors.toSet());
  }

  private static Set<SymbolicRef> extractSymbolicRef(Expression expr) {
    if (expr instanceof SymbolicRef) {
      return Collections.singleton((SymbolicRef) expr);
    } else if (expr instanceof BinaryLinearIntegerExpression) {
      BinaryLinearIntegerExpression binaryLinearIntegerExpression =
          (BinaryLinearIntegerExpression) expr;
      Set<SymbolicRef> result =
          new HashSet<>(extractSymbolicRef(binaryLinearIntegerExpression.getLeft()));
      result.addAll(new HashSet<>(extractSymbolicRef(binaryLinearIntegerExpression.getRight())));
      return result;
    } else if (expr instanceof BinaryNonLinearIntegerExpression) {
      BinaryNonLinearIntegerExpression binaryNonLinearIntegerExpression =
          (BinaryNonLinearIntegerExpression) expr;
      Set<SymbolicRef> result =
          new HashSet<>(extractSymbolicRef(binaryNonLinearIntegerExpression.getLeft()));
      result.addAll(new HashSet<>(extractSymbolicRef(binaryNonLinearIntegerExpression.getRight())));
      return result;
    } else if (expr instanceof SymbolicFunction) {
      return extractSymbolicRef(((SymbolicFunction) expr).getParameterExpr());
    } else {
      return new HashSet<>();
    }
  }

  /**
   * Find expressions from SQLNode (param + pruned PC) which may lead to SP Break
   *
   * @param node the node containing the returned expressions
   * @return all such expressions, both numeric and string constraints
   */
  public static Pair<List<Expression>, List<StringExpression>> extractExpressionsLeadingToBreak(
      SQLNode node) {
    List<Expression> numericExpressions =
        node.getParameterSymbolics().stream()
            .map(SQLGraphHelper::extractSymbolicRef)
            .flatMap(Collection::stream)
            .distinct()
            .collect(Collectors.toList());
    final SQLCondition sqlCondition = node.getSQLCondition();
    if (sqlCondition != null) {
      numericExpressions.addAll(extractExpression(sqlCondition.getConstraint()));
    }
    return Pair.of(numericExpressions, new ArrayList<>());
  }

  /**
   * using Constraint.and to convert a list of constraint into a constraint link
   *
   * @param constraintList a list of discrete constraints
   * @return a chained constraint
   */
  public static Constraint linkConstraints(List<Constraint> constraintList) {
    if (constraintList.size() == 0) return null;

    constraintList.sort(Comparator.comparing(Constraint::toString));

    Constraint head = constraintList.get(0).copy();
    Constraint current = head;

    for (int i = 1; i < constraintList.size(); i++) {
      current.and = constraintList.get(i).copy();
      current = current.and;
    }
    return head;
  }

  /**
   * using StringConstraint.and to convert a list of string constraint into a string constraint link
   *
   * @param constraintList a list of discrete string constraints
   * @return a chained string constraint
   */
  public static StringConstraint linkStringConstraints(List<StringConstraint> constraintList) {
    if (constraintList.size() == 0) return null;

    constraintList.sort(Comparator.comparing(StringConstraint::toString));

    StringConstraint head = constraintList.get(0).copy();
    StringConstraint current = head;

    for (int i = 1; i < constraintList.size(); i++) {
      current.setAnd(constraintList.get(i).copy());
      current = current.and();
    }
    return head;
  }

  /**
   * convert a chained constraint into a list of discrete constraints
   *
   * @param constraint a chained constraint
   * @return a list of discrete constraints
   */
  public static Set<Constraint> unlinkConstraints(Constraint constraint) {
    Set<Constraint> constraintList = new HashSet<>();
    Constraint current = constraint;

    while (current != null) {
      constraintList.add(current.copy());
      current = current.and;
    }
    return constraintList;
  }

  public static List<Constraint> unlinkConstraintsOrderedLexicographically(Constraint constraint) {
    List<Constraint> constraintList = new ArrayList<>();
    Constraint current = constraint;

    while (current != null) {
      constraintList.add(current.copy());
      current = current.and;
    }
    constraintList.sort(Comparator.comparing(Constraint::toString));
    return constraintList;
  }

  public static String constraintToStringLexicographically(Constraint constraint) {
    return Joiner.on(" && ").join(unlinkConstraintsOrderedLexicographically(constraint));
  }

  public static List<StringConstraint> unlinkStringStringConstraintsOrderedLexicographically(
      StringConstraint constraint) {
    List<StringConstraint> constraintList = new ArrayList<>();
    StringConstraint current = constraint;

    while (current != null) {
      constraintList.add(current.copy());
      current = current.and();
    }
    constraintList.sort(Comparator.comparing(StringConstraint::toString));
    return constraintList;
  }

  public static String stringConstraintToStringLexicographically(StringConstraint constraint) {
    return Joiner.on(" && ")
        .join(unlinkStringStringConstraintsOrderedLexicographically(constraint));
  }

  /**
   * convert a chained string constraint into a list of discrete string constraints
   *
   * @param constraint a chained string constraint
   * @return a list of discrete string constraints
   */
  public static Set<StringConstraint> unlinkStringConstraints(StringConstraint constraint) {
    Set<StringConstraint> constraintList = new HashSet<>();
    StringConstraint current = constraint;

    while (current != null) {
      constraintList.add(current.copy());
      current = current.and();
    }
    return constraintList;
  }

  public static SQLCondition pruneConstraints(
      Constraint numericConstraint,
      StringConstraint stringConstraint,
      Pair<Set<Constraint>, Set<StringConstraint>> constraintsToPrune) {
    Constraint prunedNumericConstraints;
    StringConstraint prunedStringConstraints;
    int numericCount, stringCount;
    if (!(numericConstraint instanceof LogicalORIntegerConstraints)) {
      Set<Constraint> numericConstraints = SQLGraphHelper.unlinkConstraints(numericConstraint);
      numericConstraints.removeAll(constraintsToPrune.getLeft());

      prunedNumericConstraints =
          SQLGraphHelper.linkConstraints(new ArrayList<>(numericConstraints));
      numericCount = numericConstraints.size();
    } else {
      // In order to prune a LogicalORIntegerConstraints, we:
      // 1. Extract its internal constraint list
      // 2. Remove matching constraints from each list
      // 3. Merge these list into a new LogicalORIntegerConstraints
      List<Constraint> numericConstraintsList =
          ((LogicalORIntegerConstraints) numericConstraint).getList();
      prunedNumericConstraints =
          new LogicalORIntegerConstraints(
              numericConstraintsList.stream()
                  .map(
                      linkedConstraints -> {
                        Set<Constraint> constraints =
                            SQLGraphHelper.unlinkConstraints(linkedConstraints);
                        constraints.removeAll(constraintsToPrune.getLeft());
                        return SQLGraphHelper.linkConstraints(new ArrayList<>(constraints));
                      })
                  .collect(Collectors.toList()));
      numericCount = 1;
    }

    if (!(stringConstraint instanceof LogicalOrStringConstraints)) {
      Set<StringConstraint> stringConstraints =
          SQLGraphHelper.unlinkStringConstraints(stringConstraint);
      stringConstraints.removeAll(constraintsToPrune.getRight());

      prunedStringConstraints =
          SQLGraphHelper.linkStringConstraints(new ArrayList<>(stringConstraints));
      stringCount = stringConstraints.size();
    } else {
      // And the same logic for LogicalOrStringConstraints
      List<StringConstraint> stringConstraintsList =
          ((LogicalOrStringConstraints) stringConstraint).getList();
      prunedStringConstraints =
          new LogicalOrStringConstraints(
              stringConstraintsList.stream()
                  .map(
                      linkedConstraints -> {
                        Set<StringConstraint> constraints =
                            SQLGraphHelper.unlinkStringConstraints(linkedConstraints);
                        constraints.removeAll(constraintsToPrune.getRight());
                        return SQLGraphHelper.linkStringConstraints(new ArrayList<>(constraints));
                      })
                  .collect(Collectors.toList()));
      stringCount = 1;
    }
    return new SQLConditionImpl(
        prunedNumericConstraints, numericCount, prunedStringConstraints, stringCount);
  }

  public static Pair<Set<Constraint>, Set<StringConstraint>> findCommonConstraints(
      SQLNode source, List<SQLNode> brothers) {
    Pair<Set<Constraint>, Set<StringConstraint>> common =
        findCommonConstraintsBetween(source, brothers.get(0));
    for (int i = 1; i < brothers.size(); i++) {
      Pair<Set<Constraint>, Set<StringConstraint>> currentCommon =
          findCommonConstraintsBetween(source, brothers.get(i));
      common.getLeft().retainAll(currentCommon.getLeft());
      common.getRight().retainAll(currentCommon.getRight());
    }
    return common;
  }

  private static Pair<Set<Constraint>, Set<StringConstraint>> findCommonConstraintsBetween(
      SQLNode source, SQLNode target) {
    List<Set<Constraint>> commonNumericConstraints = new ArrayList<>();
    for (SQLCondition sourceCondition : source.getAllSQLConditions()) {
      for (SQLCondition targetCondition : target.getAllSQLConditions()) {
        Set<Constraint> constraintSet1 =
            SQLGraphHelper.unlinkConstraints(sourceCondition.getConstraint());
        Set<Constraint> constraintSet2 =
            SQLGraphHelper.unlinkConstraints(targetCondition.getConstraint());
        constraintSet1.retainAll(constraintSet2);
        commonNumericConstraints.add(constraintSet1);
      }
    }
    Set<Constraint> globalCommonNumericConstraints = commonNumericConstraints.get(0);
    for (int i = 1; i < commonNumericConstraints.size(); i++) {
      globalCommonNumericConstraints.retainAll(commonNumericConstraints.get(i));
    }

    List<Set<StringConstraint>> commonStringConstraints = new ArrayList<>();
    for (SQLCondition sourceCondition : source.getAllSQLConditions()) {
      for (SQLCondition targetCondition : target.getAllSQLConditions()) {
        Set<StringConstraint> constraintSet1 =
            SQLGraphHelper.unlinkStringConstraints(sourceCondition.getStringConstraint());
        Set<StringConstraint> constraintSet2 =
            SQLGraphHelper.unlinkStringConstraints(targetCondition.getStringConstraint());
        constraintSet1.retainAll(constraintSet2);
        commonStringConstraints.add(constraintSet1);
      }
    }
    Set<StringConstraint> globalCommonStringConstraints = commonStringConstraints.get(0);
    for (int i = 1; i < commonStringConstraints.size(); i++) {
      globalCommonStringConstraints.retainAll(commonStringConstraints.get(i));
    }
    return Pair.of(globalCommonNumericConstraints, globalCommonStringConstraints);
  }

  public static Pair<Set<Constraint>, Set<StringConstraint>> findUniqueConstraints(
      SQLNode source, List<SQLNode> brothers) {
    Pair<Set<Constraint>, Set<StringConstraint>> unique =
        findUniqueConstraintsBetween(source, brothers.get(0));
    for (int i = 1; i < brothers.size(); i++) {
      Pair<Set<Constraint>, Set<StringConstraint>> currentUnique =
          findUniqueConstraintsBetween(source, brothers.get(i));
      unique.getLeft().retainAll(currentUnique.getLeft());
      unique.getRight().retainAll(currentUnique.getRight());
    }
    return unique;
  }

  private static Pair<Set<Constraint>, Set<StringConstraint>> findUniqueConstraintsBetween(
      SQLNode source, SQLNode target) {
    Set<Constraint> globalNumericUniqueConstraints = new HashSet<>();
    for (SQLCondition sourceCondition : source.getAllSQLConditions()) {
      List<Set<Constraint>> numericConstraintDiffList = new ArrayList<>();
      for (SQLCondition targetCondition : target.getAllSQLConditions()) {
        Set<Constraint> constraintSet1 =
            SQLGraphHelper.unlinkConstraints(sourceCondition.getConstraint());
        Set<Constraint> constraintSet2 =
            SQLGraphHelper.unlinkConstraints(targetCondition.getConstraint());
        constraintSet2.addAll(
            constraintSet2.stream().map(Constraint::not).collect(Collectors.toSet()));
        constraintSet1.removeAll(constraintSet2);
        numericConstraintDiffList.add(constraintSet1);
      }
      Set<Constraint> uniqueNumericConstraints = numericConstraintDiffList.get(0);
      for (int i = 1; i < numericConstraintDiffList.size(); i++) {
        uniqueNumericConstraints.retainAll(numericConstraintDiffList.get(i));
      }
      globalNumericUniqueConstraints.addAll(uniqueNumericConstraints);
    }

    Set<StringConstraint> globalStringUniqueConstraints = new HashSet<>();
    for (SQLCondition sourceCondition : source.getAllSQLConditions()) {
      List<Set<StringConstraint>> stringConstraintDiffList = new ArrayList<>();
      for (SQLCondition targetCondition : target.getAllSQLConditions()) {
        Set<StringConstraint> constraintSet1 =
            SQLGraphHelper.unlinkStringConstraints(sourceCondition.getStringConstraint());
        Set<StringConstraint> constraintSet2 =
            SQLGraphHelper.unlinkStringConstraints(targetCondition.getStringConstraint());
        constraintSet2.addAll(
            constraintSet2.stream().map(StringConstraint::not).collect(Collectors.toSet()));
        constraintSet1.removeAll(constraintSet2);
        stringConstraintDiffList.add(constraintSet1);
      }
      Set<StringConstraint> uniqueStringConstraints = stringConstraintDiffList.get(0);
      for (int i = 1; i < stringConstraintDiffList.size(); i++) {
        uniqueStringConstraints.retainAll(stringConstraintDiffList.get(i));
      }
      globalStringUniqueConstraints.addAll(uniqueStringConstraints);
    }
    return Pair.of(globalNumericUniqueConstraints, globalStringUniqueConstraints);
  }

  public static Pair<Set<Constraint>, Set<StringConstraint>> findNdConstraints(SQLNode node) {
    return Pair.of(
        node.getAllSQLConditions().stream()
            .map(SQLCondition::getConstraint)
            .map(SQLGraphHelper::unlinkConstraints)
            .flatMap(Collection::stream)
            .filter(constraint -> constraint.toString().contains("__nd__"))
            .collect(Collectors.toSet()),
        node.getAllSQLConditions().stream()
            .map(SQLCondition::getStringConstraint)
            .map(SQLGraphHelper::unlinkStringConstraints)
            .flatMap(Collection::stream)
            .filter(constraint -> constraint.toString().contains("__nd__"))
            .collect(Collectors.toSet()));
  }
}
