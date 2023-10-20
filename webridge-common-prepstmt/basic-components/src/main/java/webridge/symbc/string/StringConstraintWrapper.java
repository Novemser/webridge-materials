package webridge.symbc.string;

import webridge.symbc.numeric.Constraint;
import webridge.symbc.numeric.Expression;

import java.util.Objects;

public class StringConstraintWrapper extends Constraint {
  private final StringComparator comparator;

  public StringComparator getStringComparator() {
    return comparator;
  }

  public StringConstraint unwrap() {
    final StringConstraint result =
        new StringConstraint(
            (StringExpression) getLeft(), comparator, (StringExpression) getRight());

    StringConstraint current = result;
    StringConstraintWrapper next = (StringConstraintWrapper) and;
    while (next != null) {
      final StringConstraint unwrapped =
          new StringConstraint(
              (StringExpression) next.getLeft(),
              next.comparator,
              (StringExpression) next.getRight());
      current.and = unwrapped;
      current = unwrapped;
      next = (StringConstraintWrapper) next.and;
    }

    return result;
  }

  /**
   * construct a StringConstraintWrapper chain from a StringConstraint chain
   *
   * @param stringConstraint
   * @return
   */
  public static StringConstraintWrapper to(StringConstraint stringConstraint) {
    if (stringConstraint == null) return null;

    final StringConstraintWrapper wrapperHead =
        new StringConstraintWrapper(
            stringConstraint.getLeft(), stringConstraint.comp, stringConstraint.getRight());
    StringConstraintWrapper last = wrapperHead;
    StringConstraint next = stringConstraint.and();
    while (next != null) {
      final StringConstraintWrapper wrapped =
          new StringConstraintWrapper(next.getLeft(), next.comp, next.getRight());
      last.and = wrapped;
      last = wrapped;
      next = next.and();
    }

    return wrapperHead;
  }

  public StringConstraintWrapper(Expression left, StringComparator cmp, Expression right) {
    super(left, null, right);
    comparator = Objects.requireNonNull(cmp);
  }

  @Override
  public Constraint not() {
    return new StringConstraintWrapper(getLeft(), comparator, getRight());
  }

  @Override
  public Constraint copy() {
    return new StringConstraintWrapper(getLeft(), comparator, getRight());
  }

  @Override
  public boolean equals(Object o) {
    if (!(o instanceof StringConstraintWrapper)) {
      return false;
    }

    StringConstraintWrapper casted = (StringConstraintWrapper) o;

    return Objects.equals(getLeft(), casted.getLeft())
        && Objects.equals(comparator, casted.comparator)
        && Objects.equals(getRight(), casted.getRight());
  }

  @Override
  public int hashCode() {
    int result = Integer.MAX_VALUE;
    if (getLeft() != null) {
      result = result ^ getLeft().hashCode();
    }
    if (comparator != null) {
      result = result ^ comparator.hashCode();
    }
    if (getRight() != null) {
      result = result ^ getRight().hashCode();
    }
    return result;
  }

  @Override
  public String toString() {
    //    if (toStringCache == null) {
    return getLeft().toString()
        + comparator.toString()
        + getRight().toString()
        + ((and == null) ? "" : " &&\n" + and);
    //    }
    //    return toStringCache;
  }
}
