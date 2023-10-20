package webridge.wbridge.symbc.numeric;

public class DerivedSymbolicInteger extends SymbolicInteger {
  public enum Type {
    HASHCODE,
    CAST_TO_INTEGER,
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

  public DerivedSymbolicInteger(Expression derived, String name, Type type) {
    super(name);
    this.derived = derived;
    this.type = type;
  }

  public DerivedSymbolicInteger(Expression derived, Type type) {
    super();
    this.type = type;
    this.derived = derived;
  }
}
