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
// Copyright (C) 2005 United States Government as represented by the
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

abstract class LinearIntegerExpression extends IntegerExpression {

  public IntegerExpression _minus_reverse(long i) {
    return new BinaryLinearIntegerExpression(new IntegerConstant(i), Operator.MINUS, this);
  }

  public IntegerExpression _minus(long i) {
    // simplify
    if (i == 0) return this;

    return new BinaryLinearIntegerExpression(this, Operator.MINUS, new IntegerConstant(i));
  }

  public IntegerExpression _minus(IntegerExpression e) {
    // simplify
    if (e instanceof IntegerConstant) {
      IntegerConstant ic = (IntegerConstant) e;
      if (ic.value == 0) return this;
    }
    if (e == this) return new IntegerConstant(0);

    if (e instanceof LinearIntegerExpression) {
      return new BinaryLinearIntegerExpression(this, Operator.MINUS, e);
    } else {
      return super._minus(e);
    }
  }

  public IntegerExpression _mul(long i) {
    // simplify
    if (i == 1) return this;
    if (i == 0) return new IntegerConstant(0);

    return new BinaryLinearIntegerExpression(this, Operator.MUL, new IntegerConstant(i));
  }

  public IntegerExpression _mul(IntegerExpression e) {
    // simplify
    if (e instanceof IntegerConstant) {
      IntegerConstant ic = (IntegerConstant) e;
      if (ic.value == 1) return this;
      if (ic.value == 0) return new IntegerConstant(0);
    }

    if (e instanceof IntegerConstant) return new BinaryLinearIntegerExpression(this, Operator.MUL, e);
    else {
      return super._mul(e);
    }
  }

  public IntegerExpression _div(long i) {
    // simplify
    assert (i != 0);
    if (i == 1) return this;
    return new BinaryLinearIntegerExpression(this, Operator.DIV, new IntegerConstant(i));
  }

  public IntegerExpression _div(IntegerExpression e) {
    // simplify
    if (e instanceof IntegerConstant) {
      IntegerConstant ic = (IntegerConstant) e;
      assert (ic.value != 0);
      if (ic.value == 1) return this;
      else new BinaryLinearIntegerExpression(this, Operator.MUL, e);
    }
    if (e == this) return new IntegerConstant(1);

    return super._div(e);
  }

  public IntegerExpression _div_reverse(long i) {
    if (i == 0) return new IntegerConstant(0);
    return super._div(i);
  }

  public IntegerExpression _plus(long i) {
    // simplify
    if (i == 0) return this;

    return new BinaryLinearIntegerExpression(this, Operator.PLUS, new IntegerConstant(i));
  }

  public IntegerExpression _plus(IntegerExpression e) {
    // simplify
    if (e instanceof IntegerConstant) {
      IntegerConstant ic = (IntegerConstant) e;
      if (ic.value == 0) return this;
    }

    if (e instanceof LinearIntegerExpression) {
      return new BinaryLinearIntegerExpression(this, Operator.PLUS, e);
    } else {
      return super._plus(e);
    }
  }

  public IntegerExpression _neg() {
    return new BinaryLinearIntegerExpression(new IntegerConstant(0), Operator.MINUS, this);
  }

  public IntegerExpression _and(long i) {
    if (i == 0) {
      return new IntegerConstant(0);
    }
    return new BinaryLinearIntegerExpression(this, Operator.AND, new IntegerConstant(i));
  }

  public IntegerExpression _and(IntegerExpression e) {
    if (e instanceof IntegerConstant) {
      IntegerConstant ic = (IntegerConstant) e;
      if (ic.value == 0) {
        return new IntegerConstant(0);
      }
      return new BinaryLinearIntegerExpression(this, Operator.AND, e);
    }
    if (e instanceof LinearIntegerExpression) {
      return new BinaryLinearIntegerExpression(this, Operator.AND, e);
    }
    return new BinaryNonLinearIntegerExpression(this, Operator.AND, e);
  }

  public IntegerExpression _or(long i) {
    if (i == 0) {
      return this;
    }
    return new BinaryLinearIntegerExpression(this, Operator.OR, new IntegerConstant(i));
  }

  public IntegerExpression _or(IntegerExpression e) {
    if (e instanceof IntegerConstant) {
      IntegerConstant ic = (IntegerConstant) e;
      if (ic.value == 0) {
        return this;
      }
      return new BinaryLinearIntegerExpression(this, Operator.OR, e);
    }
    if (e instanceof LinearIntegerExpression) {
      return new BinaryLinearIntegerExpression(this, Operator.OR, e);
    }
    return new BinaryNonLinearIntegerExpression(this, Operator.OR, e);
  }

  public IntegerExpression _xor(long i) {
    return new BinaryLinearIntegerExpression(this, Operator.XOR, new IntegerConstant(i));
  }

  public IntegerExpression _xor(IntegerExpression e) {
    if (e instanceof IntegerConstant) {
      return new BinaryLinearIntegerExpression(this, Operator.XOR, e);
    }
    if (e instanceof LinearIntegerExpression) {
      return new BinaryLinearIntegerExpression(this, Operator.XOR, e);
    }
    return new BinaryNonLinearIntegerExpression(this, Operator.XOR, e);
  }

  public IntegerExpression _shiftR(long i) {
    if (i == 0) {
      return this;
    }
    return new BinaryLinearIntegerExpression(this, Operator.SHIFTR, new IntegerConstant(i));
  }

  public IntegerExpression _shiftR(IntegerExpression e) {
    if (e instanceof IntegerConstant) {
      IntegerConstant ic = (IntegerConstant) e;
      if (ic.value == 0) {
        return this;
      }
      return new BinaryLinearIntegerExpression(this, Operator.SHIFTR, e);
    }
    if (e instanceof LinearIntegerExpression) {
      return new BinaryLinearIntegerExpression(this, Operator.SHIFTR, e);
    }
    return new BinaryNonLinearIntegerExpression(this, Operator.SHIFTR, e);
  }

  public IntegerExpression _shiftUR(long i) {
    if (i == 0) {
      return this;
    }
    return new BinaryLinearIntegerExpression(this, Operator.SHIFTUR, new IntegerConstant(i));
  }

  public IntegerExpression _shiftUR(IntegerExpression e) {
    if (e instanceof IntegerConstant) {
      IntegerConstant ic = (IntegerConstant) e;
      if (ic.value == 0) {
        return this;
      }
      return new BinaryLinearIntegerExpression(this, Operator.SHIFTUR, e);
    }
    if (e instanceof LinearIntegerExpression) {
      return new BinaryLinearIntegerExpression(this, Operator.SHIFTUR, e);
    }
    return new BinaryNonLinearIntegerExpression(this, Operator.SHIFTUR, e);
  }

  public IntegerExpression _shiftL(long i) {
    if (i == 0) {
      return this;
    }
    return new BinaryLinearIntegerExpression(this, Operator.SHIFTL, new IntegerConstant(i));
  }

  public IntegerExpression _shiftL(IntegerExpression e) {
    if (e instanceof IntegerConstant) {
      IntegerConstant ic = (IntegerConstant) e;
      if (ic.value == 0) {
        return this;
      }
      return new BinaryLinearIntegerExpression(this, Operator.SHIFTL, e);
    }
    if (e instanceof LinearIntegerExpression) {
      return new BinaryLinearIntegerExpression(this, Operator.SHIFTL, e);
    }
    return new BinaryNonLinearIntegerExpression(this, Operator.SHIFTL, e);
  }

  // protected void finalize() throws Throwable {
  //	System.out.println("Finalized LIE" + this);
  // }

}
