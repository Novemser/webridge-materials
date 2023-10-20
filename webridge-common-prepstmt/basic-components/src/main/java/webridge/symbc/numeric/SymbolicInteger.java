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

import java.util.Map;
import java.util.Random;

public class SymbolicInteger extends LinearIntegerExpression {
  public static long UNDEFINED = Long.MIN_VALUE;
  public long _min = 0;
  public long _max = 0;
  public long solution = UNDEFINED;

  int unique_id;

  public static String SYM_INT_SUFFIX = "_SYMINT";
  private String name;
  private Byte typeCode;

  public SymbolicInteger() {
    unique_id = MinMax.UniqueId++;
    PathCondition.flagSolved = false;
    name = "INT_" + unique_id;
    _min = MinMax.getVarMinInt(name);
    _max = MinMax.getVarMaxInt(name);
  }

  public SymbolicInteger(String s) {
    unique_id = MinMax.UniqueId++;
    name = s;
    _min = MinMax.getVarMinInt(name);
    _max = MinMax.getVarMaxInt(name);
  }

  public SymbolicInteger(String s, Byte typeCode) {
    this(s);
    this.typeCode = typeCode;
  }

  public SymbolicInteger(long l, long u) {
    unique_id = MinMax.UniqueId++;
    _min = l;
    _max = u;
    name = "INT_" + hashCode();
  }

  public SymbolicInteger(String s, long l, long u) {
    unique_id = MinMax.UniqueId++;
    _min = l;
    _max = u;
    name = s;
  }

  public SymbolicInteger(String s, long l, long u, Byte type) {
    unique_id = MinMax.UniqueId++;
    _min = l;
    _max = u;
    name = s;
    typeCode = type;
  }

  public String getName() {
    return (name != null) ? name : "INT_" + hashCode();
  }

  public void setName(String name) {
    this.name = name;
  }

  public String stringPC() {
    return getName();
  }

  public String toString() {
    return stringPC();
  }

  public String prefix_notation() {
    return getName();
  }

  public Byte getTypeCode() {
    return typeCode;
  }

  public long solution() {
    if (PathCondition.flagSolved) {
      if (solution == UNDEFINED) {
        solution = (new Random().nextLong() % (_max - _min)) + _min;
      }
      if (solution > _max) {
        solution = _max;
      } else if (solution < _min) {
        solution = _min;
      }
      return solution;
    } else throw new RuntimeException("## Error: PC not solved!");
  }

  public int solutionInt() {
    if (PathCondition.flagSolved) {
      if (solution < Integer.MIN_VALUE || solution > Integer.MAX_VALUE) {
        throw new RuntimeException("## Error: Expression Solution request overflow Error: " + this);
      } else {
        return (int) solution();
      }
    } else throw new RuntimeException("## Error: PC not solved!");
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
    if (this == o) return true;
    if (!(o instanceof SymbolicInteger)) return false;

    return this.name.equals(((SymbolicInteger) o).name);
  }

  public int hashCode() {
    return name.hashCode();
  }

  @Override
  public void accept(ConstraintExpressionVisitor visitor) {
    visitor.preVisit(this);
    visitor.postVisit(this);
  }

  @Override
  public int compareTo(Expression expr) {
    if (!(expr instanceof SymbolicInteger))
      return getClass().getCanonicalName().compareTo(expr.getClass().getCanonicalName());

    return Integer.compare(unique_id, ((SymbolicInteger) expr).unique_id);
  }

  public void setMinMax(long min, long max) {
    assert min <= max;
    _max = max;
    _min = min;
  }

  public long getMin() {
    return _min;
  }

  public long getMax() {
    return _max;
  }
}
