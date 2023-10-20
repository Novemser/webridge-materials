package webench.meta.argument;

import webench.meta.workload.WorkloadType;
import com.beust.jcommander.IParameterValidator;
import com.beust.jcommander.ParameterException;
import java.util.Locale;

public class WorkloadTypeValidator implements IParameterValidator {

  @Override
  public void validate(String name, String value) throws ParameterException {
    final String s = value.toUpperCase(Locale.ROOT);
    if (s.equals(WorkloadType.ECOMMERCE.name())
        || s.equals(WorkloadType.BLOGGING.name())
        || s.equals(WorkloadType.FORUM.name())
        || s.equals(WorkloadType.CONFIG_MANAGE.name())) return;
    throw new ParameterException(
        "Workload type of "
            + value
            + " is invalid. Valid workloads are ["
            + WorkloadType.ECOMMERCE.name()
            + ","
            + WorkloadType.BLOGGING.name()
            + ","
            + WorkloadType.FORUM.name()
            + ","
            + WorkloadType.CONFIG_MANAGE.name()
            + "]");
  }
}
