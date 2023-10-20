package webridge.wbridge.symbc.string;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class LogicalOrStringConstraints extends StringConstraint {

  private List<StringConstraint> list;

  public LogicalOrStringConstraints() {
    super(null, null, null);
    list = new ArrayList<>();
  }

  public LogicalOrStringConstraints(List<StringConstraint> l) {
    super(null, null, null);
    list = Objects.requireNonNull(l).stream().filter(Objects::nonNull).collect(Collectors.toList());
  }

  public void addToList(StringConstraint constraint) {
    if (!list.contains(constraint)) {
      list.add(constraint);
    }
  }

  public List<StringConstraint> getList() {
    return list;
  }

  @Override
  public StringConstraint not() {
    throw new UnsupportedOperationException("Not supported");
  }

  @Override
  public StringConstraint copy() {
    return new LogicalOrStringConstraints(getList());
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
    if (!(o instanceof LogicalOrStringConstraints)) return false;
    LogicalOrStringConstraints other = (LogicalOrStringConstraints) o;
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

  @Override
  public int hashCode() {
    return Objects.hash(list);
  }
}
