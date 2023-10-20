package webench.meta.argument;

import com.beust.jcommander.IParameterValidator;
import com.beust.jcommander.ParameterException;

public class ScaleValidator implements IParameterValidator {

  @Override
  public void validate(String name, String value) throws ParameterException {
    final double v = Double.parseDouble(value);
    double EPS = 1e-6;
    if (!(v >= 0 - EPS) || !(v <= 1 + EPS)) {
      throw new ParameterException("Parameter of the " + name + " should be in the range [0,1)");
    }
  }
}
