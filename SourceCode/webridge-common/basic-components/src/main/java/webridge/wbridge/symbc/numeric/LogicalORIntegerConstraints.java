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

package webridge.wbridge.symbc.numeric;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class LogicalORIntegerConstraints extends Constraint {

  private List<Constraint> list;
  public String comment;

  public LogicalORIntegerConstraints() {
    super(null, null, null);
    list = new ArrayList<>();
  }

  public LogicalORIntegerConstraints(List<Constraint> l) {
    super(null, null, null);
    list = Objects.requireNonNull(l).stream().filter(Objects::nonNull).collect(Collectors.toList());
  }

  public void addToList(Constraint lic) {
    if (!list.contains(lic)) {
      list.add(lic);
    }
  }

  public List<Constraint> getList() {
    return list;
  }

  @Override
  public Constraint not() {
    throw new UnsupportedOperationException("Not supported");
    // return null;
  }

  @Override
  public Constraint copy() {
    return new LogicalORIntegerConstraints(getList());
  }

  public String toString() {
    StringBuilder sb = new StringBuilder();
    if (list.size() == 1) {
      return list.get(0).toString();
    } else if (list.isEmpty()) {
      return "true";
    } else {
      sb.append(list.get(0).toString());
    }
    for (int i = 1; i < list.size(); i++) {
      sb.append(" OR ");
      sb.append(list.get(i).toString());
    }
    sb.append("(" + comment + ")");
    if (and != null) {
      sb.append(" && \n");
      sb.append(and.stringPC());
    }
    return sb.toString();
  }

  public String stringPC() {
    return this.toString();
  }

  public boolean equals(Object o) {
    if (!(o instanceof LogicalORIntegerConstraints)) return false;
    LogicalORIntegerConstraints other = (LogicalORIntegerConstraints) o;
    if (this.list.size() != other.list.size()) {
      return false;
    }
    for (int i = 0; i < this.list.size(); i++) {
      if (!this.list.get(i).equals(other.list.get(i))) {
        return false;
      }
    }
    return true;
  }
}
