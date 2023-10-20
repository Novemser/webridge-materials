package webridge.symbc.numeric;

public class GeneralMixedConstraint extends Constraint {
  public GeneralMixedConstraint(Expression l, Comparator c, Expression r) {
    super(l, c, r);
  }

  @Override
  public Constraint not() {
    return new GeneralMixedConstraint(getLeft(), getComparator().not(), getRight());
  }

  @Override
  public Constraint copy() {
    return new GeneralMixedConstraint(getLeft(), getComparator(), getRight());
  }
}
