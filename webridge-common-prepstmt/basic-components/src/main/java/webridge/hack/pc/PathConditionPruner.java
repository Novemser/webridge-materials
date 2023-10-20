package webridge.hack.pc;

import static java.util.Objects.requireNonNull;

import webridge.symbc.numeric.Comparator;
import webridge.symbc.numeric.Constraint;
import webridge.symbc.numeric.PathCondition;

import java.util.Stack;
import java.util.function.Predicate;

public class PathConditionPruner {
  private static final Stack<Boolean> skipPcStatusStack = new Stack<>();
  private static final Stack<Boolean> keepPcStatusStack = new Stack<>();
  private static boolean keepInner = false;

  public static void skip() {
    if (keepInner) {
      return;
    }
    if (!PathCondition.isSkipPc() && skipPcStatusStack.size() > 0) {
      throw new RuntimeException();
    }
    skipPcStatusStack.push(PathCondition.isSkipPc());
    PathCondition.setSkipPc(true);
  }

  public static void keep() {
    keepPcStatusStack.push(PathCondition.isSkipPc());
    PathCondition.setSkipPc(false);
  }


  private static final Predicate<Constraint> RM_CDATE_NULL =
      (constraint) -> {
        // useless time related pc
        final boolean leftMatch = constraint.getLeft().toString().endsWith("#cdate");
        final boolean rightMatch = constraint.getRight().toString().equals("REF_NULL");
        final boolean operatorMatch = constraint.getComparator().equals(Comparator.EQ);
        if (leftMatch && rightMatch) assert operatorMatch : "Unexpected not equal comparator";
        return leftMatch && rightMatch;
      };

  public static PathCondition prunePcByRules(PathCondition pc) {
    pc.removePathCondition(RM_CDATE_NULL);
    return pc;
  }
}
