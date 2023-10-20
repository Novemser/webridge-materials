package webridge.symbc.numeric;

public class DerivedSymbolicReal extends SymbolicReal {
  public DerivedSymbolicReal(Expression derived, String name, Type type) {
    super(name);
    this.derived = derived;
    this.type = type;
  }

  public DerivedSymbolicReal(Expression derived, Type type) {
    super(derived.toString());
    this.derived = derived;
    this.type = type;
  }

  public enum Type {
    CAST_TO_REAL,
  }

  private final Expression derived;
  private final Type type;

  public Expression getDerivedExp() {
    return derived;
  }

  public Type getType() {
    return type;
  }
}
