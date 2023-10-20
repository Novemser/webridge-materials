/*
 * Copyright (C) 2014, United States Government, as represented by the
 * Administrator of the National Aeronautics and Space Administration.
 * All rights reserved.
 *
 * Symbolic Pathfinder (jpf-symbc) is licensed under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//
// Copyright (C) 2006 United States Government as represented by the
// Administrator of the National Aeronautics and Space Administration
// (NASA).  All Rights Reserved.
//
// This software is distributed under the NASA Open Source Agreement
// (NOSA), version 1.3.  The NOSA has been approved by the Open Source
// Initiative.  See the file NOSA-1.3-JPF at the top of the distribution
// directory tree for the complete NOSA document.
//
// THE SUBJECT SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY WARRANTY OF ANY
// KIND, EITHER EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING, BUT NOT
// LIMITED TO, ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL CONFORM TO
// SPECIFICATIONS, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
// A PARTICULAR PURPOSE, OR FREEDOM FROM INFRINGEMENT, ANY WARRANTY THAT
// THE SUBJECT SOFTWARE WILL BE ERROR FREE, OR ANY WARRANTY THAT
// DOCUMENTATION, IF PROVIDED, WILL CONFORM TO THE SUBJECT SOFTWARE.
//

package webridge.wbridge.symbc.numeric;

import webridge.wbridge.symbc.string.StringConstraint;
import webridge.wbridge.symbc.string.StringPathCondition;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import za.ac.sun.cs.green.Instance;

// path condition contains mixed constraints of integers and reals

/** YN: added solveWithValuation() from later verision (Yannic Noller <nolleryc@gmail.com>) */
public class PathCondition implements Comparable<PathCondition>, Serializable {
  private static final Logger logger = LoggerFactory.getLogger(PathCondition.class);
  public static boolean flagSolved = false;
  private static boolean skipPc;

//  static {
//    Configurator.setLevel(logger.getName(), Level.INFO);
//  }

  public static void setSkipPc(boolean skipPc) {
    PathCondition.skipPc = skipPc;
  }

  public static boolean isSkipPc() {
    return skipPc;
  }

  public enum AttrType {
    EXTRA_MAP_CONSTRAINT,
    LAST_ADDED_CONSTRAINT
  }

//  public transient Map<String, ArrayExpression> arrayExpressions;
  public transient Map<AttrType, Object> extraAttrs;
  public Constraint header;
  int count = 0;

//  private transient Instance instance = null;

  // TODO: to review
  public StringPathCondition spc = new StringPathCondition(this);

  private Integer hashCode = null;

  public PathCondition() {
    header = null;
//    arrayExpressions = new HashMap<>();
    extraAttrs = new HashMap<>();
  }

  public PathCondition(Constraint header) {
    this.header = header;
//    arrayExpressions = new HashMap<>();
    extraAttrs = new HashMap<>();
    count = length(this.header);
  }

  public PathCondition make_copy() {
    PathCondition pc_new = new PathCondition();
    pc_new.header = this.header;
    pc_new.count = this.count;
    pc_new.spc = this.spc.make_copy(pc_new); // TODO: to review
//    pc_new.arrayExpressions = this.arrayExpressions;
    pc_new.extraAttrs = new HashMap<>(extraAttrs);
    return pc_new;
  }

  public Object getAttr(AttrType name) {
    return extraAttrs.get(name);
  }

  public void setAttr(AttrType name, Object attr) {
    extraAttrs.put(name, attr);
  }

  // Added by Gideon
  public void _addDet(LogicalORLinearIntegerConstraints loic) {
    prependIfAbsent(loic);
  }

  // constraints on integers
  public void _addDet(Comparator c, IntegerExpression l, long r) {
    _addDet(c, l, new LongConstant(r));
  }

  public void _addDet(Comparator c, long l, IntegerExpression r) {
    _addDet(c, new IntegerConstant(l), r);
  }

  public void _addDet(Comparator c, IntegerExpression l, IntegerExpression r) {
    if (l instanceof IntegerConstant && r instanceof IntegerConstant) {
      final boolean lLong = l instanceof LongConstant;
      final boolean rLong = r instanceof LongConstant;
      if (c.evaluate(
          lLong ? l.solution() : l.solutionInt(), rLong ? r.solution() : r.solutionInt()))
        return; // ignore tautology
    }

    Constraint t =
        (l instanceof LinearIntegerExpression) && (r instanceof LinearIntegerExpression)
            ? new LinearIntegerConstraint(l, c, r)
            : new NonLinearIntegerConstraint(l, c, r);

    prependIfAbsent(t);
  }

  // constraints on reals
  public void _addDet(Comparator c, RealExpression l, double r) {
    _addDet(c, l, new RealConstant(r));
  }

  public void _addDet(Comparator c, double l, RealExpression r) {
    _addDet(c, new RealConstant(l), r);
  }

  public void _addDet(Comparator c, RealExpression l, RealExpression r) {
    prependIfAbsent(new RealConstraint(l, c, r));
  }

  // mixed real/integer constraints to handle cast bytecodes

  public void _addDet(Comparator c, RealExpression l, IntegerExpression r) {
    Constraint t;

    t = new MixedConstraint(l, c, r);

    prependIfAbsent(t);
  }

  public void _addDet(Comparator c, IntegerExpression l, RealExpression r) {
    Constraint t;

    t = new MixedConstraint(r, c, l);

    prependIfAbsent(t);
  }

  public void prependIfAbsent(Constraint t) {
    // if pc should not be added into the path condition
    if (skipPc) return;
    //    if (t.toString().contains("hashCode")) {
    //      return;
    //    }
    // if Green is used and slicing is on then we always add the constraint
    // since we assume the last constraint added is always the header
    if (!hasConstraint(t)) {
      flagSolved = false;
      t.and = header;
      header = t;
      count++;
    }
  }

  public void prependAllConjuncts(Constraint t) {
    t.last().and = header;
    header = t;
    count = length(header);
  }

  public void appendAllConjuncts(Constraint t) {
    header.last().and = t;
    count = length(header);
  }

  public void setCount(int count) {
    this.count = count;
  }

  private static int length(Constraint c) {
    int x = 0;
    while (c != null) {
      x++;
      c = c.and;
    }
    return x;
  }

  /** Returns the number of constraints in this path condition. */
  public int count() {
    return count;
  }

  public boolean hasConstraint(Constraint c) {
    for (Constraint t = header; t != null; t = t.and) if (c.equals(t)) return true;

    return false;
  }

  public Constraint last() {
    return header.last();
  }

//  public boolean solve() {
//    return solveOld();
//  }
//
//  public boolean simplify() {
//    return simplifyOld();
//  }
//
//  private boolean solveWithSolution() {
//    return false;
//  }
//
//  private boolean solveOld() { // warning: solve calls simplify
//    SymbolicConstraintsGeneral solver = new SymbolicConstraintsGeneral();
//
//    boolean result1 = solver.solve(this);
//    solver.cleanup();
//    PathCondition.flagSolved = true;
//
//    // modification for string path condition
//    boolean result2 = spc.solve(); // TODO: to review
//    solver.cleanup();
//    return result1 && result2;
//  }
//
//  private boolean simplifyOld() {
//    SymbolicConstraintsGeneral solver = new SymbolicConstraintsGeneral();
//    boolean result1;
//
//    if (SymbolicInstructionFactory.concolicMode) {
//      PCAnalyzer pa = new PCAnalyzer();
//      result1 = pa.isSatisfiable(this, solver);
//    } else result1 = solver.isSatisfiable(this);
//    solver.cleanup();
//
//    if (SymbolicInstructionFactory.debugMode) {
//      MinMax.Debug_no_path_constraints++;
//      if (result1) MinMax.Debug_no_path_constraints_sat++;
//      else MinMax.Debug_no_path_constraints_unsat++;
//      System.out.println(
//          "### PCs: total:"
//              + MinMax.Debug_no_path_constraints
//              + " sat:"
//              + MinMax.Debug_no_path_constraints_sat
//              + " unsat:"
//              + MinMax.Debug_no_path_constraints_unsat
//              + "\n");
//    }
//
//    if (!result1) return false;
//    boolean result2 = spc.simplify(); // TODO to review: used for strings
//    solver.cleanup();
//    return result2;
//  }

  public String stringPC() {
    return "constraint # = " + count + ((header == null) ? "" : "\n" + header.stringPC());
  }

  public String toString() {
    return ("constraint # = " + count + ((header == null) ? "" : "\n" + header.toString()))
        + (spc == null
            ? ""
            : ("\nSPC # = "
                + spc.count()
                + (spc.header == null ? "" : ("\n" + spc.header.toString()))));
  }

  public String prefix_notation() {
    return "constraint # = " + count + ((header == null) ? "" : "\n" + header.prefix_notation());
  }

  /**
   * Indicates whether some other object is "equal to" this one.
   *
   * <p>Note: Technically, this routine is incomplete and should take the string path condition
   * stored in field {@code spc} into account.
   *
   * @param obj the reference object with which to compare
   * @return {@code true} if this object is the same as the obj argument; {@code false} otherwise.
   * @see java.lang.Object#equals(java.lang.Object)
   */
  @Override
  public boolean equals(Object obj) {
    if (obj == this) return true;
    if (!(obj instanceof PathCondition)) return false;

    PathCondition p = (PathCondition) obj;
    if (count != p.count) return false;
    Constraint c = header;
    Constraint pc = p.header;
    while (c != null) {
      if (pc == null) return false;
      if (!c.equals(pc)) return false;
      c = c.and;
      pc = pc.and;
    }
    return pc == null;
  }

  /**
   * Compare two path conditions for orderedness. The function is based on the hash codes of the
   * path conditions. In the event that the hash codes are equal, a lexicographic comparison is made
   * between the constraints of the path conditions.
   *
   * @param pc the path condition to compare to
   * @return -1 if this path condition is less than the other, +1 if it is greater, and 0 if they
   *     are equal
   */
  @Override
  public int compareTo(PathCondition pc) {
    final int hc1 = hashCode();
    final int hc2 = pc.hashCode();
    if (hc1 < hc2) return -1;
    if (hc1 > hc2) return 1;

    // perform a lexicographic comparison
    Constraint c1 = header;
    Constraint c2 = pc.header;

    while (c1 != null) {
      if (c2 == null) return 1;
      int r = c1.compareTo(c2);
      if (r != 0) return r;
      c1 = c1.and;
      c2 = c2.and;
    }

    return (c2 == null) ? 0 : -1;
  }

  /**
   * Returns a hash code value for the object.
   *
   * <p>Note: Technically, this routine is incomplete and should take the string path condition
   * stored in field {@code spc} into account.
   *
   * @return a hash code value for this object
   * @see java.lang.Object#hashCode()
   */
  @Override
  public int hashCode() {
    if (hashCode == null) {
      int hash = 0;

      for (Constraint c = header; c != null; c = c.and) hash = hash ^ c.hashCode();

      hashCode = hash;
    }
    return hashCode;
  }

  public PathCondition computeNoRedundantPC() {
    final PathCondition pc = make_copy();
    pc.removePathCondition(
        constraint -> {
          final Expression left = constraint.getLeft();
          final Expression right = constraint.getRight();
          return constraint.getComparator().equals(Comparator.EQ)
              && left.toString().equals(right.toString());
        });
    logger.info("ComputeNoRedundantPC #no redundant pcs:" + count() + " -> " + pc.count());
    if (logger.isDebugEnabled())
      logger.debug("Before:" + toString() + " -> After:" + pc.toString());
    return pc;
  }

  public void removePathCondition(Predicate<Constraint> removePredicate) {
    Constraint next = header;
    Constraint last = null;
    if (next == null) return;
    while (next != null) {
      if (removePredicate.test(next)) {
        logger.debug("Pruning " + next);
        setCount(count() - 1);
        if (last == null) {
          header = next.and;
        } else {
          last.and = next.and;
        }
      } else {
        last = next;
      }
      next = next.and;
    }
  }

  public void sortPcByAlphabeticOrder() {
    Constraint next = header;
    final List<Constraint> records = new ArrayList<>();
    while (next != null) {
      records.add(next);
      next = next.and;
    }
    records.sort(java.util.Comparator.comparing(Constraint::selfToString));
    header = null;
    Constraint lastConstraint = null;
    // update the original pc order
    for (Constraint record : records) {
      if (header == null) {
        header = record;
      } else {
        lastConstraint.and = record;
      }

      lastConstraint = record;
    }
    // set last constraint to null
    if (lastConstraint != null) lastConstraint.and = null;

    StringConstraint nextSc = spc.header;
    final List<StringConstraint> sRecords = new ArrayList<>();
    while (nextSc != null) {
      sRecords.add(nextSc);
      nextSc = nextSc.and();
    }

    sRecords.sort(java.util.Comparator.comparing(StringConstraint::selfToString));
    spc.header = null;
    StringConstraint lastStrConstraint = null;
    for (StringConstraint sRecord : sRecords) {
      if (spc.header == null) {
        spc.header = sRecord;
      } else {
        lastStrConstraint.setAnd(sRecord);
      }
      lastStrConstraint = sRecord;
    }
    if (lastStrConstraint != null) lastStrConstraint.setAnd(null);
  }
}
