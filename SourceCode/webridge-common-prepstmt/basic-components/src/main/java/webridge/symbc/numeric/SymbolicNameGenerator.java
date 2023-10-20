package webridge.symbc.numeric;

import java.util.concurrent.atomic.AtomicInteger;

public class SymbolicNameGenerator {
  private static final AtomicInteger CASTED_SYMB_VAR_SEQUENCE = new AtomicInteger(0);

  public static Integer getNextCastedSymbVarName() {
    return CASTED_SYMB_VAR_SEQUENCE.getAndIncrement();
  }
}
