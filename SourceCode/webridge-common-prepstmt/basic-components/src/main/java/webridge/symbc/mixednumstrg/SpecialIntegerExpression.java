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

/*  Copyright (C) 2005 United States Government as represented by the
Administrator of the National Aeronautics and Space Administration
(NASA).  All Rights Reserved.

Copyright (C) 2009 Fujitsu Laboratories of America, Inc.

DISCLAIMER OF WARRANTIES AND LIABILITIES; WAIVER AND INDEMNIFICATION

A. No Warranty: THE SUBJECT SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY
WARRANTY OF ANY KIND, EITHER EXPRESSED, IMPLIED, OR STATUTORY,
INCLUDING, BUT NOT LIMITED TO, ANY WARRANTY THAT THE SUBJECT SOFTWARE
WILL CONFORM TO SPECIFICATIONS, ANY IMPLIED WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR FREEDOM FROM
INFRINGEMENT, ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL BE ERROR
FREE, OR ANY WARRANTY THAT DOCUMENTATION, IF PROVIDED, WILL CONFORM TO
THE SUBJECT SOFTWARE. NO SUPPORT IS WARRANTED TO BE PROVIDED AS IT IS PROVIDED "AS-IS".

B. Waiver and Indemnity: RECIPIENT AGREES TO WAIVE ANY AND ALL CLAIMS
AGAINST FUJITSU LABORATORIES OF AMERICA AND ANY OF ITS AFFILIATES, THE
UNITED STATES GOVERNMENT, ITS CONTRACTORS AND SUBCONTRACTORS, AS WELL
AS ANY PRIOR RECIPIENT.  IF RECIPIENT'S USE OF THE SUBJECT SOFTWARE
RESULTS IN ANY LIABILITIES, DEMANDS, DAMAGES, EXPENSES OR LOSSES ARISING
FROM SUCH USE, INCLUDING ANY DAMAGES FROM PRODUCTS BASED ON, OR RESULTING
FROM, RECIPIENT'S USE OF THE SUBJECT SOFTWARE, RECIPIENT SHALL INDEMNIFY
AND HOLD HARMLESS FUJITSU LABORATORTIES OF AMERICA AND ANY OF ITS AFFILIATES,
THE UNITED STATES GOVERNMENT, ITS CONTRACTORS AND SUBCONTRACTORS, AS WELL
AS ANY PRIOR RECIPIENT, TO THE EXTENT PERMITTED BY LAW.  RECIPIENT'S SOLE
REMEDY FOR ANY SUCH MATTER SHALL BE THE IMMEDIATE, UNILATERAL
TERMINATION OF THIS AGREEMENT.

*/

package webridge.symbc.mixednumstrg;

import webridge.symbc.numeric.ConstraintExpressionVisitor;
import webridge.symbc.numeric.Expression;
import webridge.symbc.numeric.IntegerExpression;
import webridge.symbc.string.StringExpression;

import java.util.Map;
import java.util.Objects;

public class SpecialIntegerExpression extends IntegerExpression {

  public SpecialOperator op;
  public StringExpression opr;

  public SpecialIntegerExpression(StringExpression opr1) {
    op = SpecialOperator.VALUEOF;
    opr = opr1;
  }

  public SpecialIntegerExpression(StringExpression opr1, SpecialOperator op1) {
    op = op1;
    opr = opr1;
  }

  public SpecialIntegerExpression clone() {
    throw new RuntimeException("Operation not implemented");
  }

  public void getVarsVals(Map<String, Object> varsVals) {}

  public String stringPC() {
    return op.toString() + "__" + opr.stringPC() + "__";
  }

  public String toString() {
    return op.toString() + "__" + opr.toString() + "__";
  }
  // JacoGeldenhuys
  @Override
  public void accept(ConstraintExpressionVisitor visitor) {
    visitor.preVisit(this);
    opr.accept(visitor);
    visitor.postVisit(this);
  }

  @Override
  public int compareTo(Expression expr) {
    if (expr instanceof SpecialIntegerExpression) {
      SpecialIntegerExpression e = (SpecialIntegerExpression) expr;
      int r = op.compareTo(e.op);
      if (r == 0) {
        r = opr.compareTo(e.opr);
      }
      return r;
    } else {
      return getClass().getCanonicalName().compareTo(expr.getClass().getCanonicalName());
    }
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    SpecialIntegerExpression that = (SpecialIntegerExpression) o;
    return op == that.op && Objects.equals(opr, that.opr);
  }

  @Override
  public int hashCode() {
    return Objects.hash(op, opr);
  }
}
