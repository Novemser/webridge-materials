package webench.meta;

import java.util.List;
import lombok.Data;

@Data
public class APIEndpoint {
  private APIType apiType;
  /**
   * Indicating the execution frequency(or weight) of the API. A larger value indicates larger
   * possibility of execution. The frequency is distributed among all the APIs according to the
   * ratio (weight).
   */
  private double ratio;

  private List<Object> parameters;
}
