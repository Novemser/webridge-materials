package webridge.wbridge.symbc.numeric;

public class EnumConstant extends IntegerConstant {
  private final String name;

  public EnumConstant(long i) {
    this(i, null);
  }

  public EnumConstant(long i, String name) {
    super(i);
    this.name = name;
  }

  @Override
  public String toString() {
    return "EnumConstant[" + name + "]";
  }
}
