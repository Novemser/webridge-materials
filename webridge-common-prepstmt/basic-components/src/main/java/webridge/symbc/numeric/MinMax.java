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

public class MinMax {
  //	public static int MININT = -1000000;// Integer.MIN_VALUE;//-10000;
  //	public static int MAXINT = 1000000;// Integer.MAX_VALUE;//10000;
  //	public static double MINDOUBLE = -10000.0;// -1.0e8;//Double.MIN_VALUE;
  //	public static double MAXDOUBLE = 10000.0;// 1.0e8; //Double.MAX_VALUE;

  public static int Debug_no_path_constraints = 0;
  public static int Debug_no_path_constraints_sat = 0;
  public static int Debug_no_path_constraints_unsat = 0;

  public static int UniqueId = 0; // Unique id for each SymbolicInteger or
  // SymbolicReal created

  public static void reset() {
    UniqueId = 0;
  }

  /** Lower bound on symbolic integer variables. */
  private static int minInt = Integer.MIN_VALUE;

  /** Upper bound on symbolic integer variables. */
  private static int maxInt = Integer.MAX_VALUE;

  /** Lower bound on symbolic byte variables. */
  private static byte minByte = Byte.MIN_VALUE;

  /** Upper bound on symbolic short variables. */
  private static byte maxByte = Byte.MAX_VALUE;

  /** Lower bound on symbolic short variables. */
  private static short minShort = Short.MIN_VALUE;

  /** Upper bound on symbolic short variables. */
  private static short maxShort = Short.MAX_VALUE;

  /** Lower bound on symbolic long variables. */
  private static long minLong = Long.MIN_VALUE;

  /** Upper bound on symbolic long variables. */
  private static long maxLong = Long.MAX_VALUE;

  /** Lower bound on symbolic integer variables. */
  private static int minChar = Character.MIN_VALUE;

  /** Upper bound on symbolic integer variables. */
  private static int maxChar = Character.MAX_VALUE;

  /** Lower bound on symbolic real variables. */
  private static double minDouble = Double.MIN_VALUE; // -8;

  /** Upper bound on symbolic real variables. */
  private static double maxDouble = Double.MAX_VALUE; // 7;

  /** Mapping from variable names to minimum integer values. */
  private static Map<String, Long> varMinIntMap;

  /** Mapping from variable names to maximum integer values. */
  private static Map<String, Long> varMaxIntMap;

  /** Mapping from variable names to minimum real values. */
  private static Map<String, Double> varMinDoubleMap;

  /** Mapping from variable names to maximum real values. */
  private static Map<String, Double> varMaxDoubleMap;

  private static long getVarMin(String varname, long min) {
    if (varname.endsWith("_SYMINT")) {
      varname = varname.replaceAll("_[0-9][0-9]*_SYMINT", "");
    }
    return varMinIntMap != null && varMinIntMap.containsKey(varname)
        ? varMinIntMap.get(varname)
        : min;
  }

  /**
   * Return the minimum integer value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the minimum value of the variable
   */
  public static long getVarMinInt(String varname) {
    return getVarMin(varname, minInt);
  }

  /**
   * Return the minimum long value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the minimum value of the variable
   */
  public static long getVarMinLong(String varname) {
    return getVarMin(varname, minLong);
  }

  /**
   * Return the minimum short value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the minimum value of the variable
   */
  public static long getVarMinShort(String varname) {
    return getVarMin(varname, minShort);
  }

  /**
   * Return the minimum byte value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the minimum value of the variable
   */
  public static long getVarMinByte(String varname) {
    return getVarMin(varname, minByte);
  }

  /**
   * Return the minimum char value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the minimum value of the variable
   */
  public static long getVarMinChar(String varname) {
    return getVarMin(varname, minChar);
  }

  private static long getVarMax(String varname, long max) {
    if (varname.endsWith("_SYMINT")) {
      varname = varname.replaceAll("_[0-9][0-9]*_SYMINT", "");
    }
    return varMaxIntMap != null && varMaxIntMap.containsKey(varname)
        ? varMaxIntMap.get(varname)
        : max;
  }

  /**
   * Return the maximum integer value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the maximum value of the variable
   */
  public static long getVarMaxInt(String varname) {
    return getVarMax(varname, maxInt);
  }

  /**
   * Return the maximum long value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the maximum value of the variable
   */
  public static long getVarMaxLong(String varname) {
    return getVarMax(varname, maxLong);
  }

  /**
   * Return the maximum short value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the maximum value of the variable
   */
  public static long getVarMaxShort(String varname) {
    return getVarMax(varname, maxShort);
  }

  /**
   * Return the maximum byte value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the maximum value of the variable
   */
  public static long getVarMaxByte(String varname) {
    return getVarMax(varname, maxByte);
  }

  /**
   * Return the maximum char value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the maximum value of the variable
   */
  public static long getVarMaxChar(String varname) {
    return getVarMax(varname, maxChar);
  }

  /**
   * Return the minimum real value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the minimum value of the variable
   */
  public static double getVarMinDouble(String varname) {
    if (varname.endsWith("_SYMINT")) {
      varname = varname.replaceAll("_[0-9][0-9]*_SYMINT", "");
    }
    return minDouble;
  }

  /**
   * Return the maximum real value that a given variable can assume.
   *
   * @param varname the name of the variable
   * @return the maximum value of the variable
   */
  public static double getVarMaxDouble(String varname) {
    if (varname.endsWith("_SYMINT")) {
      varname = varname.replaceAll("_[0-9][0-9]*_SYMINT", "");
    }
    return maxDouble;
  }
}
