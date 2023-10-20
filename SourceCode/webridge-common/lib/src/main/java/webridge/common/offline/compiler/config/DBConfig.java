package webridge.common.offline.compiler.config;

import java.io.Serializable;

public class DBConfig implements Serializable {
  private String dbUrl;
  private String dbUserName;
  private String dbPassword;

  public DBConfig(String dbUrl, String dbUserName, String dbPassword) {
    if (dbUrl.contains("?")) {
      dbUrl = dbUrl.substring(0, dbUrl.indexOf("?"));
    }
    this.dbUrl = dbUrl;
    this.dbUserName = dbUserName;
    this.dbPassword = dbPassword;
  }

  public String getDbUrl() {
    return dbUrl;
  }

  public void setDbUrl(String dbUrl) {
    this.dbUrl = dbUrl;
  }

  public String getDbUserName() {
    return dbUserName;
  }

  public void setDbUserName(String dbUserName) {
    this.dbUserName = dbUserName;
  }

  public String getDbPassword() {
    return dbPassword;
  }

  public void setDbPassword(String dbPassword) {
    this.dbPassword = dbPassword;
  }
}
