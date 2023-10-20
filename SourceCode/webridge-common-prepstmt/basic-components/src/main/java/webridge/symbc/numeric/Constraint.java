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

package webridge.symbc.numeric;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import org.apache.commons.lang3.SerializationUtils;

public abstract class Constraint implements Comparable<Constraint>, Serializable {
  protected String toStringCache;

  private final Expression left;

  private Comparator comp;

  private final Expression right;

  public Constraint and;

  public Constraint(Expression l, Comparator c, Expression r) {
    left = l;
    comp = c;
    right = r;
  }

  /** Returns the left expression. Subclasses may override to give tighter type bounds. */
  public Expression getLeft() {
    return left;
  }

  /** Returns the right expression. Subclasses may override to give tighter type bounds. */
  public Expression getRight() {
    return right;
  }

  /** Returns the comparator used in this constraint. */
  public Comparator getComparator() {
    return comp;
  }

  public void setComparator(Comparator c) {
    comp = c;
  }
  /** Returns the negation of this constraint, but without the tail. */
  public abstract Constraint not();

  /** Copy the constraint, keep 'and' field null in the copied one. */
  public abstract Constraint copy();

  /** Returns the next conjunct. */
  public Constraint getTail() {
    return and;
  }

  public String stringPC() {
    return left.stringPC()
        + comp.toString()
        + right.stringPC()
        + ((and == null) ? "" : " && " + and.stringPC());
  }

  public void getVarVals(Map<String, Object> varsVals) {
    if (left != null) {
      left.getVarsVals(varsVals);
    }
    if (right != null) {
      right.getVarsVals(varsVals);
    }
    if (and != null) {
      and.getVarVals(varsVals);
    }
  }

  public boolean equals(Object o) {
    if (!(o instanceof Constraint)) {
      return false;
    }

    final Constraint casted = (Constraint) o;

    return Objects.equals(getLeft(), casted.getLeft())
        && Objects.equals(getComparator(), casted.getComparator())
        && Objects.equals(getRight(), casted.getRight());
  }

  public int hashCode() {
    int result = Integer.MAX_VALUE;
    if (left != null) {
      result = result ^ left.hashCode();
    }
    if (comp != null) {
      result = result ^ comp.hashCode();
    }
    if (right != null) {
      result = result ^ right.hashCode();
    }
    return result;
    // return left.hashCode() ^ comp.hashCode() ^ right.hashCode();
  }

  /**
   * Compare two constraints for orderedness. The function views each constraint as a triple ({@code
   * left}, {@code comp}, {@code right}). The triples are compared lexicographically. Similarly, one
   * element is less than another if and only if (1) the first is {@code null} and the second isn't,
   * or (2) both are non-null and the hash code of the first is less than the hash code of the
   * second.
   *
   * @param c the constraint to compare to
   * @return -1 if this constraint is less than the other, +1 if it is greater, and 0 if they are
   *     equal
   * @see java.lang.Comparable#compareTo(java.lang.Object)
   */
  @Override
  public final int compareTo(Constraint c) {
    int r = comp.compareTo(c.getComparator());
    if (r == 0) {
      r = left.compareTo(c.getLeft());
      if (r == 0) {
        r = right.compareTo(c.getRight());
      }
    }
    return r;
  }

  public String toString() {
    if (toStringCache == null) {
      toStringCache =
          left.toString()
              + comp.toString()
              + right.toString()
              // + ((and == null) ? "" : " && " + and.toString()); -- for specialization
              + ((and == null) ? "" : " &&\n" + and.toString());
    }
    return toStringCache;
  }

  public String selfToString() {
    return left.toString() + comp.toString() + right.toString();
  }

  public Constraint last() {
    Constraint c = this;
    while (c.and != null) {
      c = c.and;
    }
    return c;
  }

  public int computeLength() {
    int len = 1;
    Constraint c = this;
    while (c.and != null) {
      len++;
      c = c.and;
    }
    return len;
  }

  // JacoGeldenhuys
  public void accept(ConstraintExpressionVisitor visitor) {
    visitor.preVisit(this);
    if (left != null) left.accept(visitor);
    if (right != null) right.accept(visitor);
    visitor.postVisit(this);
  }

  public String prefix_notation() {
    // return left.toString() + comp.toString() + right.toString()
    // + ((and == null) ? "" : " && " + and.toString()); -- for specialization
    //      + ((and == null) ? "" : " &&\n" + and.toString());
    // Sang: rewrite NE in z3's notation: (a != b) becomes (not (= a b))
    String result = null;
    if (comp == Comparator.NE) {
      result = "(not ( = " + left.prefix_notation() + " " + right.prefix_notation() + "))";
    } else {
      result =
          " ("
              + comp.toString()
              + " "
              + left.prefix_notation()
              + " "
              + right.prefix_notation()
              + ")";
    }
    if (and != null) result = "(and " + and.prefix_notation() + " " + result + ")";
    return result;
  }

  public boolean isNull() {
    return getLeft() == null || getRight() == null;
  }

  private boolean hasConstraint(Expression left, Comparator cmp, Expression right) {
    Constraint c = this;
    do {
      if (Objects.equals(c.getLeft(), left)
          && Objects.equals(c.getComparator(), cmp)
          && Objects.equals(c.getRight(), right)) {
        return true;
      }

      c = c.and;
    } while (c != null);

    return false;
  }

  private boolean hasConstraint(Constraint that) {
    Constraint c = this;
    do {
      if (c.equals(that)) {
        return true;
      }

      c = c.and;
    } while (c != null);

    return false;
  }

  /** returns true if (this) implies (constraint) e.g., this=A/\B, constraint=A, returns true */
  public boolean implies(Constraint constraint) {
    if (constraint == null) return false;

    Constraint c = constraint;
    do {
      if (!this.hasConstraint(c)) {
        return false;
      }

      c = c.and;
    } while (c != null);

    return true;
  }

  // returns the intersection (common constraints) of two constraints.
  public Constraint intersect(Constraint constraint) {
    if (constraint == null || constraint.isNull()) return null;
    List<Constraint> resCons = new ArrayList<>();

    Constraint c = this;
    do {
      if (constraint.hasConstraint(c)) {
        Constraint clone = SerializationUtils.clone(c);
        clone.clearToStringCache();
        resCons.add(clone);
      }

      c = c.and;
    } while (c != null);

    if (resCons.isEmpty()) return null;

    return getConstraint(resCons);
  }

  // returns (this - constraint)
  public Constraint subtract(Constraint constraint) {
    if (constraint == null) return this;
    List<Constraint> resCons = new ArrayList<>();

    Constraint c = this;
    do {
      if (!constraint.hasConstraint(c)) {
        Constraint clone = SerializationUtils.clone(c);
        clone.clearToStringCache();
        resCons.add(clone);
      }

      c = c.and;
    } while (c != null);

    return getConstraint(resCons);
  }

  private Constraint getConstraint(List<Constraint> resCons) {
    if (resCons.size() == 1) {
      final Constraint res = resCons.get(0);
      res.and = null;
      return res;
    } else if (resCons.isEmpty()) {
      return null;
    }

    for (int curIndex = 1, prevIndex = 0; curIndex < resCons.size(); curIndex++, prevIndex++) {
      final Constraint currentCons = resCons.get(curIndex);
      final Constraint prevCons = resCons.get(prevIndex);
      prevCons.and = currentCons;
      currentCons.and = null;
    }

    return resCons.get(0);
  }

  public void clearToStringCache() {
    Constraint c = this;
    while (c != null) {
      c.toStringCache = null;
      c = c.and;
    }
  }

  public Constraint getAnd() {
    return and;
  }
}
