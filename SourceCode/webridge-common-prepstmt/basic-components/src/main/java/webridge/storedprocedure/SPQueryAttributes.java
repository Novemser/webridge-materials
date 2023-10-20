package webridge.storedprocedure;

public class SPQueryAttributes {

  private String template;

  public SPQueryAttributes(String template) {
    this.template = template;
  }

  public String getTemplate() {
    return template;
  }

  public int getParamCount() {
    int result = 0;
    for (int i = 0; i < template.length(); i++) {
      if (template.charAt(i) == '?') {
        result++;
      }
    }
    return result;
  }

  public boolean isUpdate() {
    return template.toLowerCase().startsWith("update");
  }
}
