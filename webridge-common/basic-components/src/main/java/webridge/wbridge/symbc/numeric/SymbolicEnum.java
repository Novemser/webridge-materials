package webridge.wbridge.symbc.numeric;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.LongStream;

public class SymbolicEnum extends SymbolicInteger {
  public static long UNDEFINED = Long.MIN_VALUE;

  int unique_id;

  public static String SYM_INT_SUFFIX = "_SYMINT";
  private String name;
  private final Set<Long> excludePositions;
  private final List<Long> refs;
  private final Map<Long, String> refNameMap;

  public SymbolicEnum(Map<Long, String> refNameMap) {
    this(null, refNameMap);
  }

  public SymbolicEnum(String s, Map<Long, String> refNameMap) {
    unique_id = MinMax.UniqueId++;
    PathCondition.flagSolved = false;
    name = s == null ? "ENUM_" + hashCode() : s;

    _min = refNameMap.keySet().stream().min(Long::compareTo).get();
    _max = refNameMap.keySet().stream().max(Long::compareTo).get();

    this.refNameMap = refNameMap;
    this.refs = new ArrayList<>(refNameMap.keySet());

    // won't be very large, since enum values should be consecutively allocated
    final Set<Long> rangeSet =
        LongStream.rangeClosed(_min, _max).boxed().collect(Collectors.toSet());
    rangeSet.removeAll(refNameMap.keySet());
    this.excludePositions = rangeSet;
  }

  // bound the solution range of symbolic enum
  public SymbolicEnum boundSolutions(PathCondition pc) {
    excludePositions.forEach(pos -> pc._addDet(webridge.wbridge.symbc.numeric.Comparator.NE, pos, this));
    return this;
  }

  public PathCondition addExclusionConstraint(PathCondition pc) {
    excludePositions.forEach(pos -> pc._addDet(Comparator.NE, pos, this));
    return pc;
  }

  public String getName() {
    return name;
  }

  public String stringPC() {
    return name;
  }

  public String prefix_notation() {
    return name;
  }

  public String toString() {
    //    return !PathCondition.flagSolved
    //        ? name
    //        : name + "[" + solution + ": " + refNameMap.get(solution) + "]";
    return name;
  }

  public void getVarsVals(Map<String, Object> varsVals) {
    varsVals.put(fixName(name), solution);
  }

  private String fixName(String name) {
    if (name.endsWith(SYM_INT_SUFFIX)) {
      name = name.substring(0, name.lastIndexOf(SYM_INT_SUFFIX));
    }
    return name;
  }

  public boolean equals(Object o) {
    return (o instanceof SymbolicInteger) && (this.equals((SymbolicInteger) o));
  }

  private boolean equals(SymbolicInteger s) {
    //        if (name != null)
    //            return (this.name.equals(s.name)) &&
    //                   (this._max == s._max) &&
    //                   (this._min == s._min);
    //        else
    //            return (this._max == s._max) &&
    //                   (this._min == s._min);
    return this.unique_id == s.unique_id;
  }

  public int hashCode() {
    // return Integer.toHexString(_min ^ _max).hashCode();
    return unique_id;
  }

  public int getNumEnumValues() {
    return refNameMap.size();
  }

  public IntegerConstant getConstantAt(int objRef) {
    return new EnumConstant(objRef, getEnumValue(objRef));
  }

  public String getEnumValue(long objRef) {
    return refNameMap.get(objRef);
  }

  public long getRefAt(int index) {
    return refs.get(index);
  }

  @Override
  public void accept(ConstraintExpressionVisitor visitor) {
    visitor.preVisit(this);
    visitor.postVisit(this);
  }

  @Override
  public int compareTo(Expression expr) {
    if (expr instanceof SymbolicInteger) {
      SymbolicInteger e = (SymbolicInteger) expr;
      int a = unique_id;
      int b = e.unique_id;
      return (a < b) ? -1 : (a > b) ? 1 : 0;
    } else {
      return getClass().getCanonicalName().compareTo(expr.getClass().getCanonicalName());
    }
  }

  public int pickValueRef() {
    return refNameMap.keySet().iterator().next().intValue();
  }

  public SymbolicInteger getOrdinalSymbolic() {
    return new SymbolicEnumOrdinal(this, refNameMap.size());
  }
}
