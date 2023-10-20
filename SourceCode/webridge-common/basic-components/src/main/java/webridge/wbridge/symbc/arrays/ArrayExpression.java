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

package webridge.wbridge.symbc.arrays;

import webridge.wbridge.symbc.numeric.IntegerExpression;
import webridge.wbridge.symbc.numeric.SymbolicInteger;
import java.util.Map;

public class ArrayExpression extends SymbolicInteger {
    public final IntegerExpression lengthExpr;
    public final IntegerExpression refExpr;
    private final String name;
    private String elemType;
    private Map<Integer, ? extends Number> solutions;

    public static final String PRIMITIVE_TYPE_SYM = "?";

    public ArrayExpression(int ref) {
        this(ref, PRIMITIVE_TYPE_SYM);
    }

    public ArrayExpression(int ref, SymbolicInteger lengthExpr) {
        this(ref, PRIMITIVE_TYPE_SYM, lengthExpr);
    }

    public ArrayExpression(int ref, String elemType) {
        this(ref, elemType, new SymbolicInteger(generateName(ref) + "_length"));
    }

    public ArrayExpression(String name, String elemType) {
        this(name, elemType, new SymbolicInteger(name + "_length"));
    }

    public ArrayExpression(String name, String elemType, SymbolicInteger lengthExpr) {
        assert name != null && !name.isEmpty();
        this.lengthExpr = lengthExpr;
        this.refExpr = new SymbolicInteger(name + "_ref");
        this.elemType = elemType;
        this.name = name;
    }

    public ArrayExpression(int ref, String elemType, SymbolicInteger lengthExpr) {
        this.name = generateName(ref);
        this.lengthExpr = lengthExpr;
        this.refExpr = new SymbolicInteger(name + "_ref");
        this.elemType = elemType;
    }

    public ArrayExpression(ArrayExpression prev) {
        name = getNewName(prev);
        lengthExpr = prev.lengthExpr;
        refExpr = prev.refExpr;
        elemType = prev.elemType;
        solutions = prev.solutions;
    }

    public static String generateName(int objRef) {
        return "SYM_ARR_" + objRef;
    }

    private static String getNewName(ArrayExpression prev) {
        String newName = prev.getName();
        final int index = newName.indexOf("!");
        if (index == -1) {
            newName = newName + "!1";
        } else {
            /* Increment the number after '!' */
            final int aux = Integer.parseInt(newName.substring(index + 1));
            newName = newName.substring(0, index + 1) + (aux + 1);
        }
        return newName;
    }

    public String getName() {
        return name;
    }

    public String getRootName() {
        final String name = getName();
        final int index = name.indexOf("!");

        return index == -1 ? name : name.substring(0, index);
    }

    public String getElemType() {
        return elemType;
    }

    public void setElemType(String elemType) {
        this.elemType = elemType;
    }

    public void setSolutions(Map<Integer, ? extends Number> solutions) {
        this.solutions = solutions;
    }

    public Map<Integer, ? extends Number> getSolutions() {
        return solutions;
    }

    @Override
    public String stringPC() {
        return name;
    }

    @Override
    public String toString() {
        return stringPC();
    }
}
