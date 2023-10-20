package webridge.wbridge.symbc.numeric;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

// TODO optimize this shit, unify it with SymbolicFunction
public class SymbolicPlaceHolder extends SymbolicReturnRef {
  private String convertedRepresentation;
  private boolean nonDeterministic;
  private static final Pattern pattern = Pattern.compile("f_invoke_([0-9]\\d*)_([A-Z]+)");
  public static final String FUNC_TEMPLATE = "f_invoke_%d_%s";
  public static final String ND_FUNC_TEMPLATE_PREFIX = "__nd__func__";
  public static final String ND_FUNC_TEMPLATE_PREFIX_2 = "unique_cart_code";
  public static final String ND_FUNC_TEMPLATE = ND_FUNC_TEMPLATE_PREFIX + FUNC_TEMPLATE;

  public void setNonDeterministic(boolean nonDeterministic) {
    this.nonDeterministic = nonDeterministic;
  }

  public static Pattern getPattern() {
    return pattern;
  }

  public static String fullName(Matcher matcher) {
    return matcher.group(0).trim();
  }

  public static String invokingFuncName(Matcher matcher) {
    return matcher.group(2).trim();
  }

  public String getConvertedRepresentation() {
    return convertedRepresentation == null ? toString() : convertedRepresentation;
  }

  @Override
  public String toString() {
    if (convertedRepresentation != null) return convertedRepresentation;
    return String.format(
        isNonDeterministic() ? ND_FUNC_TEMPLATE : FUNC_TEMPLATE,
        unique_id,
        getName().contains("(") ? getName().substring(0, getName().indexOf("(")) : getName());
  }

  public void setConvertedRepresentation(String convertedRepresentation) {
    this.convertedRepresentation = convertedRepresentation;
  }

  public SymbolicPlaceHolder(String name) {
    super(name);
  }

  public SymbolicPlaceHolder(String name, boolean nonDeterministic) {
    super(name);
    this.nonDeterministic = nonDeterministic;
  }

  public boolean isNonDeterministic() {
    return nonDeterministic;
  }
}
