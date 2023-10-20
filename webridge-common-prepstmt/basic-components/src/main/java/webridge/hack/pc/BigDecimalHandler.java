package webridge.hack.pc;

import static webridge.storedprocedure.transformation.SemanticEqualTransformer.DECIMAL_FUNC_NAME;

import java.util.regex.Pattern;

public class BigDecimalHandler {
  public static final String DECIMAL_WRAPPER = "$BIG_DECIMAL$";
  public static final Pattern DECIMAL_FUNC_PATTERN =
      Pattern.compile(DECIMAL_FUNC_NAME + "\\((.*),(.*)\\)");
  public static final Pattern INT_COMPACT_PATTERN =
      Pattern.compile("\\$BIG_DECIMAL\\$(\\w+)_intCompact\\$BIG_DECIMAL\\$");
  public static final Pattern SCALE_PATTERN =
      Pattern.compile("\\$BIG_DECIMAL\\$(\\w+)_scale\\$BIG_DECIMAL\\$");

}
