package webridge.common.offline.compiler.argument;

import com.beust.jcommander.Parameter;

public class Args {
  @Parameter(
      names = {"--host", "-h"},
      description = "the host ip address of the webridge offline server to start")
  private String hostName = "127.0.0.1";

  @Parameter(
      names = {"--baseDir", "-d"},
      description = "the working directory to start web server and compile hot traces")
  private String baseDir = "/tmp";

  @Parameter(
      names = {"--webServer-start-script", "-wscript"},
      description = "path to the location of concolic executor (Java)")
  private String webServerStartScript = "java";

  @Parameter(
      names = {"--concolic-jdk-path", "-cjdk"},
      description = "path to JDK home of concolic executor (Java)")
  private String concolicExecutorJavaPath = "java";

  @Parameter(
      names = {"--app-jar", "-jar"},
      description = "path to the location of application jar")
  private String applicationJarPath = "";

  @Parameter(
      names = {"--sp-def-dir", "-spdef"},
      description = "path to the location of the generated stored procedure")
  private String generatedSPDir = "/tmp/offline-compiler-generated-sps";

  @Parameter(names = {"--concolic-http-endpoint"})
  private String concolicExecutorHttpEndpoint = "";

  @Parameter(
      names = {"--schema-sql", "-ssql"},
      description =
          "path to the location of the schema definition SQL file, which provides schema definition for SP generation")
  private String schemaDefinitionFile = "/home/shopizer/sm-shop/shopizer_schema.sql";

  @Parameter(names = {"--app-name"})
  private String appName = "shopizer";

  public String getHostName() {
    return hostName;
  }

  public void setHostName(String hostName) {
    this.hostName = hostName;
  }

  public String getWebServerStartScript() {
    return webServerStartScript;
  }

  public void setWebServerStartScript(String webServerStartScript) {
    this.webServerStartScript = webServerStartScript;
  }

  public String getApplicationJarPath() {
    return applicationJarPath;
  }

  public void setApplicationJarPath(String applicationJarPath) {
    this.applicationJarPath = applicationJarPath;
  }

  public String getBaseDir() {
    return baseDir;
  }

  public void setBaseDir(String baseDir) {
    this.baseDir = baseDir;
  }

  public String getConcolicExecutorHttpEndpoint() {
    return concolicExecutorHttpEndpoint;
  }

  public void setConcolicExecutorHttpEndpoint(String concolicExecutorHttpEndpoint) {
    this.concolicExecutorHttpEndpoint = concolicExecutorHttpEndpoint;
  }

  public String getConcolicExecutorJavaPath() {
    return concolicExecutorJavaPath;
  }

  public void setConcolicExecutorJavaPath(String concolicExecutorJavaPath) {
    this.concolicExecutorJavaPath = concolicExecutorJavaPath;
  }

  public String getGeneratedSPDir() {
    return generatedSPDir;
  }

  public void setGeneratedSPDir(String generatedSPDir) {
    this.generatedSPDir = generatedSPDir;
  }

  public String getSchemaDefinitionFile() {
    return schemaDefinitionFile;
  }

  public void setSchemaDefinitionFile(String schemaDefinitionFile) {
    this.schemaDefinitionFile = schemaDefinitionFile;
  }

  public String getAppName() {
    return appName;
  }

  public void setAppName(String appName) {
    this.appName = appName;
  }
}
