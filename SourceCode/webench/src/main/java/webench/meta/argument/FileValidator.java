package webench.meta.argument;

import com.beust.jcommander.IParameterValidator;
import com.beust.jcommander.ParameterException;
import java.io.File;

public class FileValidator implements IParameterValidator {
  @Override
  public void validate(String name, String value) throws ParameterException {
    if (!new File(value).exists()) throw new ParameterException(value + " does not exist.");
  }
}
