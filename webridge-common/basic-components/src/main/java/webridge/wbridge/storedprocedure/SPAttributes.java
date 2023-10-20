package webridge.wbridge.storedprocedure;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

public class SPAttributes {
  private String name;
  private List<Object> args;
  private Connection bindConnection;
  private Map<Integer, SPQueryAttributes> queryAttributes;

  public SPAttributes(String name) {
    this.name = name;
  }

  public SPAttributes(
      String name, List<Object> args, Map<Integer, SPQueryAttributes> queryAttributes) {
    this.name = name;
    this.args = args;
    this.queryAttributes = queryAttributes;
  }

  public String getCallSpStmt() {
    StringBuilder result = new StringBuilder("call " + name + "(");
    for (int i = 0; i < args.size(); i++) {
      result.append("?");
      if (i != args.size() - 1) {
        result.append(", ");
      }
    }
    result.append(")");
    return result.toString();
  }

  public String getName() {
    return name;
  }

  public List<Object> getArgs() {
    return args;
  }

  public Map<Integer, SPQueryAttributes> getQueryAttributes() {
    return queryAttributes;
  }

  public void setArgs(List<Object> args) {
    this.args = args;
  }

  public void setQueryAttributes(Map<Integer, SPQueryAttributes> queryAttributes) {
    this.queryAttributes = queryAttributes;
  }

  public Connection getBindConnection() {
    return bindConnection;
  }

  public void setBindConnection(Connection bindConnection) {
    this.bindConnection = bindConnection;
  }
}
