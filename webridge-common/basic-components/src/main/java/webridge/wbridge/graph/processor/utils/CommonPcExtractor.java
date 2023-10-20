package webridge.wbridge.graph.processor.utils;

import webridge.wbridge.graph.SQLCondition;
import webridge.wbridge.graph.SQLGraph;
import webridge.wbridge.graph.SQLNode;
import webridge.wbridge.graph.impl.SQLConditionImpl;
import webridge.wbridge.symbc.numeric.Comparator;
import webridge.wbridge.symbc.string.StringConstraintWrapper;
import webridge.wbridge.symbc.numeric.*;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public abstract class CommonPcExtractor {
  public static final String CONCENTRATED_PC = "extract.pc";
  public static final String ORIGINAL_PC = "original.pc";
  public static boolean INTER_PROCEDURE = true;
  public static String COMMON_PC_VAR_PREFIX = "COMMON_PC_";

  private static class PcStore {
    private int varCnt;
    private final Map<PathCondition, String> constraintMap = new HashMap<>();
    private final Map<String, PathCondition> constraintReverseMap = new HashMap<>();
    private final Map<String, PathCondition> concentratedPc = new HashMap<>();

    String nextVarName() {
      return String.format("%s%d", COMMON_PC_VAR_PREFIX, varCnt++);
    }

    private String findEqualConstraintVarName(PathCondition constraint) {
      for (PathCondition c : constraintMap.keySet()) {
        if (constraint.equals(c)) return constraintMap.get(c);
      }

      return null;
    }

    private String findLongestPrefixConstraintVarName(PathCondition constraint) {
      if (constraint.header == null) return null;
      int longestConstraintSize = Integer.MIN_VALUE;
      PathCondition res = null;

      for (PathCondition c : constraintMap.keySet()) {
        if (!constraint.header.implies(c.header)) continue;

        // if `constraint` --> `c`, convert `constraint` to c /\ x
        int len = c.count();
        if (len > longestConstraintSize) {
          longestConstraintSize = len;
          res = c;
        }
      }

      if (res == null) return null;
      return Objects.requireNonNull(constraintMap.get(res));
    }

    private String registerNew(PathCondition pc) {
      if (constraintMap.containsKey(pc)) {
        return constraintMap.get(pc);
      }

      String nextVarName = nextVarName();
      constraintMap.put(pc, nextVarName);
      constraintReverseMap.put(nextVarName, pc);

      return nextVarName;
    }

    // unify numeric and string constraint into a single Constraint object
    private Constraint mergeConstraints(SQLCondition condition) {
      final Constraint numericConstraint = Objects.requireNonNull(condition).getConstraint();
      final Constraint stringConstraint =
          StringConstraintWrapper.to(condition.getStringConstraint());
      if (numericConstraint == null) return stringConstraint;
      if (stringConstraint == null) return numericConstraint;
      numericConstraint.last().and = stringConstraint;
      numericConstraint.clearToStringCache();
      return numericConstraint;
    }

    SQLCondition extractAndSimplify(SQLCondition condition) {
      final Constraint constraint = mergeConstraints(condition.deepClone());
      final PathCondition pc = new PathCondition(constraint);
      String varName = findLongestPrefixConstraintVarName(pc);
      if (varName == null) {
        // no existing pc can be leveraged
        varName = registerNew(pc);
        concentratedPc.put(varName, pc);
      } else {
        // leverage existing pc
        final Constraint prevConstraint = constraintReverseMap.get(varName).header;
        final Constraint diff = constraint.subtract(prevConstraint);
        if (diff != null) {
          final String newVarName = registerNew(pc);
          // only create new vars for pcs that are different from previous ones
          final LinearIntegerConstraint simplified =
              new LinearIntegerConstraint(
                  new SymbolicBoolean(varName), webridge.wbridge.symbc.numeric.Comparator.EQ, new IntegerConstant(1));
          simplified.and = diff;

          concentratedPc.put(newVarName, new PathCondition(simplified));
          varName = newVarName;
        }
      }

      final LinearIntegerConstraint resultCons =
          new LinearIntegerConstraint(
              new SymbolicBoolean(varName), Comparator.EQ, new IntegerConstant(1));

      return new SQLConditionImpl(resultCons, 1, null, 0);
    }
  }

  private static PcStore pcStoreInstance;

  private static PcStore getPcStoreInstance() {
    if (INTER_PROCEDURE) {
      if (pcStoreInstance == null) pcStoreInstance = new PcStore();
      return pcStoreInstance;
    }
    return new PcStore();
  }

  public static SQLGraph extractCommonPc(SQLGraph graph) {
    final Iterator<SQLNode> nodes = graph.getTopologicalSortedNodes();
    final PcStore pcStore = getPcStoreInstance();
    while (nodes.hasNext()) {
      final SQLNode node = nodes.next();
      final SQLCondition prunedSQLCondition = node.getPrunedSQLCondition();
      node.setPrunedSQLCondition(pcStore.extractAndSimplify(prunedSQLCondition));
    }

    graph.setAttribute(CONCENTRATED_PC, pcStore.concentratedPc);
    graph.setAttribute(ORIGINAL_PC, pcStore.constraintReverseMap);
    return graph;
  }

  public static boolean startsWithCommonPcVarName(String varName) {
    return varName.startsWith(COMMON_PC_VAR_PREFIX);
  }

  public static String parseLeadingCommonPcVarName(String pcStr) {
    return pcStr.substring(0, pcStr.indexOf(" "));
  }

  public static Set<String> parseAllCommonPcVarNames(String pcStr) {
    final Set<String> res = new HashSet<>();
    final Pattern pattern = Pattern.compile(COMMON_PC_VAR_PREFIX + "\\d+");
    final Matcher matcher = pattern.matcher(pcStr);
    while (matcher.find()) {
      final String group = matcher.group();
      res.add(group);
    }
    return res;
  }

  public static String commonPcVarDeclareStatement(String varName) {
    return String.format("DECLARE %s BIT(1) DEFAULT TRUE;\n", varName);
  }
}
