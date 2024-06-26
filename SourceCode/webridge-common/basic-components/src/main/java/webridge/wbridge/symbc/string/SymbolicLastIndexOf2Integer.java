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

package webridge.wbridge.symbc.string;

import webridge.wbridge.symbc.numeric.IntegerExpression;
import webridge.wbridge.symbc.numeric.SymbolicInteger;

public class SymbolicLastIndexOf2Integer extends SymbolicInteger {
  StringExpression source, expression;
  IntegerExpression minIndex;

  public SymbolicLastIndexOf2Integer(
      String name,
      int l,
      int u,
      StringExpression source,
      StringExpression expression,
      IntegerExpression minIndex) {
    super(name, l, u);
    this.source = source;
    this.expression = expression;
    this.minIndex = minIndex;
  }

  public StringExpression getSource() {
    return source;
  }

  public StringExpression getExpression() {
    return expression;
  }

  public IntegerExpression getMinIndex() {
    return minIndex;
  }
}
