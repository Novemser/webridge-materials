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

package webridge.symbc.numeric.visitors;

import webridge.symbc.numeric.ConstraintExpressionVisitor;
import webridge.symbc.numeric.Expression;
import webridge.symbc.numeric.SymbolicInteger;
import webridge.symbc.numeric.SymbolicReal;
import webridge.symbc.string.StringSymbolic;

import java.util.HashSet;
import java.util.Set;

public class CollectVariableVisitor extends ConstraintExpressionVisitor {

  private Set<Expression> variables = new HashSet<Expression>();

  @Override
  public void postVisit(SymbolicReal realVariable) {
    variables.add(realVariable);
  }

  @Override
  public void postVisit(SymbolicInteger integerVariable) {
    variables.add(integerVariable);
  }

  @Override
  public void postVisit(StringSymbolic stringVariable) {
    variables.add(stringVariable);
  }

  public Set<Expression> getVariables() {
    return variables;
  }
}