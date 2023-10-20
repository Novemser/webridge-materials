package webridge.wbridge.storedprocedure;

import webridge.wbridge.symbc.numeric.Expression;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

// stores additional information to perform the prefetch
public class SPDefinitionForPrefetch extends SPDefinition implements Serializable {
  private final List<Expression> queryParameterExpressions;

  public SPDefinitionForPrefetch(
      String apiName, String spName, String spSQL, List<Expression> queryParameterExpressions) {
    super(apiName, spName, spSQL);
    this.queryParameterExpressions = new ArrayList<>(queryParameterExpressions);
  }

  public List<Expression> getQueryParameterExpressions() {
    return queryParameterExpressions;
  }

  public void addParameterExpressions(Collection<Expression> expressions) {
    this.queryParameterExpressions.addAll(expressions);
  }
}
