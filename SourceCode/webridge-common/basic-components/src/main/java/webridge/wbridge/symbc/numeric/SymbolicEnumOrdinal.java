package webridge.wbridge.symbc.numeric;

public class SymbolicEnumOrdinal extends SymbolicInteger {
  private final SymbolicEnum owner;

  public SymbolicEnumOrdinal(SymbolicEnum owner, int limit) {
    this.owner = owner;
    this._min = 0;
    this._max = limit;
  }

  @Override
  public String toString() {
    return owner.getName() + ".ordinal";
  }
}
