package webridge.common.offline.compiler.impl;

import webridge.storedprocedure.SPConfig;
import webridge.storedprocedure.SPDefinition;
import webridge.storedprocedure.StoredProcedureManager;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.SerializationUtils;
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.client5.http.protocol.HttpClientContext;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import webridge.common.offline.compiler.TraceCompiledResult;
import webridge.common.offline.compiler.TraceCompiler;
import webridge.common.offline.compiler.config.ConfigTemplate;
import webridge.common.offline.compiler.config.DBConfig;
import webridge.common.offline.compiler.utils.ShellCommandExecutor;
import webridge.common.spring.filter.TraceRecordingFilter;
import webridge.common.utils.Constants;

public class TraceCompilerImpl extends UnicastRemoteObject implements TraceCompiler {
  private final CloseableHttpClient httpClient;
  private final HttpClientContext clientContext;
  private final String concolicExecutorEndpoint;
  private final String baseDir;
  private final String spdefDir;
  private final String schemaSql;
  private static final Logger logger = LoggerFactory.getLogger(TraceCompilerImpl.class);

  public TraceCompilerImpl(
      String concolicExecutorEndpoint, String baseDir, String spdefDir, String schemaSql)
      throws RemoteException {
    this.spdefDir = spdefDir;
    this.schemaSql = schemaSql;
    // http client initialization
    this.httpClient = HttpClients.createDefault();
    this.concolicExecutorEndpoint = concolicExecutorEndpoint;
    this.clientContext = HttpClientContext.create();
    this.baseDir = baseDir;
  }

  @Override
  public synchronized TraceCompiledResult compileTrace(
      TraceRecordingFilter.WeBridgeRecordedTrace trace, DBConfig dbConfig) throws RemoteException {
    // save the trace to a file
    String apiName = trace.getApiName();
    final String tmpTraceFileName =
        String.format("trace-%s-%s", apiName, trace.getTraceIdentifier().hashCode());
    logger.info("Saving temp trace file: " + tmpTraceFileName);

    final String filePath = saveTrace(trace, tmpTraceFileName);

    // delete previous generated dependency graph
    final Path source = Paths.get(Constants.DEFAULT_TMP_GRAPH_PATH);
    deleteIfExists(source);
    // send http request to the server to compile the trace and generate dependency graph
    fireConcolicExecution(filePath);

    // Wait for up to 10 seconds for online server send file to offline server
    long start = System.currentTimeMillis();
    long used = 0;
    while (Files.notExists(source) && used < 10000) {
      used = System.currentTimeMillis() - start;
    }

    // generate stored procedure with collected *.json file
    if (Files.notExists(source)) {
      throw new RuntimeException("Concolic executor failed to generate the dependency graph");
    }

    // prepare a jpf configuration file
    final File configFile = prepareConfigTemplate(tmpTraceFileName, apiName);
    generateStoredProcedure(source, configFile);

    final Path spDefDir = Paths.get(spdefDir, "sql", apiName);
    // read the stored procedure into object

    final List<SPDefinition> generatedSpDefs = getGeneratedSpDefs(spDefDir);
    if (generatedSpDefs.isEmpty()) {
      throw new RuntimeException("Unexpected empty generated stored procedure");
    }

    if (!generatedSpDefs.get(0).getApiName().equals(apiName)) {
      throw new RuntimeException(
          String.format(
              "Fetched wrong stored procedure from dir %s with sps:%s",
              spDefDir.toFile().getAbsolutePath(),
              generatedSpDefs.stream().map(SPDefinition::getSpName).collect(Collectors.toList())));
    }

    registerStoredProcedures(spDefDir, dbConfig);

    final TraceCompiledResult res = new TraceCompiledResult();
    res.setCompiledData(generatedSpDefs);
    res.setSucceed(true);
    res.setMessage(String.format("Compiled trace %s successfully", filePath));
    logger.info(
        String.format(
            "Sending compiled trace %s back to web server for API %s(definition generated for API %s)",
            filePath, apiName, generatedSpDefs.get(0).getApiName()));
    return res;
  }

  private static void generateStoredProcedure(Path source, File configFile) {
    try {
      String sqlPath = source.toAbsolutePath().toString();
      logger.warn("Generating sp with parameters:" + sqlPath + "|" + configFile.getAbsolutePath());
      StoredProcedureManager.run(sqlPath, configFile.getAbsolutePath());
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  private File prepareConfigTemplate(String tmpTraceFileName, String apiName) {
    final String fileContent =
        ConfigTemplate.BASE_CONTENT
            .replace("${baseDir}", baseDir)
            .replace("${apiName}", apiName)
            .replace("${spdefDir}", spdefDir)
            .replace("${schemaSql}", schemaSql);
    final String configFileName = tmpTraceFileName + "-config.conf";
    final File configFile = Paths.get("/tmp", configFileName).toFile();
    try {
      logger.info("Saving config[" + configFile.getAbsolutePath() + "] as:" + fileContent);
      Files.write(configFile.toPath(), fileContent.getBytes());
      logger.info("Saved config " + configFile.getAbsolutePath());
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
    return configFile;
  }

  private static List<SPDefinition> getGeneratedSpDefs(Path spDefDir) {
    final List<SPDefinition> allSpDefs = new ArrayList<>();
    Arrays.stream(
            Objects.requireNonNull(
                spDefDir
                    .toFile()
                    .listFiles(file -> file.getName().endsWith(SPConfig.SP_DEF_FILE_SUFFIX))))
        .sorted(File::compareTo)
        .forEach(
            f -> {
              try (ObjectInputStream ois =
                  new ObjectInputStream(
                      new BufferedInputStream(Files.newInputStream(f.toPath())))) {
                List<SPDefinition> spDefs = (List<SPDefinition>) ois.readObject();
                if (spDefs != null && !spDefs.isEmpty()) {
                  allSpDefs.clear();
                  allSpDefs.addAll(spDefs);
                }
              } catch (IOException | ClassNotFoundException e) {
                e.printStackTrace();
              }
            });
    return allSpDefs;
  }

  public static void registerStoredProcedures(Path spDefDir, DBConfig dbConfig) {
    Pattern pattern = Pattern.compile("jdbc:mysql://(.*?):(.*?)/(.*)");
    Matcher matcher = pattern.matcher(dbConfig.getDbUrl());
    String host;
    String port;
    String dbName;

    if (matcher.find()) {
      host = matcher.group(1);
      port = matcher.group(2);
      dbName = matcher.group(3);
    } else {
      throw new IllegalArgumentException(dbConfig.getDbUrl());
    }

    // get all *graph-SP*.sql files
    List<File> filesToExecute =
        FileUtils.listFiles(spDefDir.toFile(), new String[] {"sql"}, false).stream()
            .filter(file -> file.getName().contains("graph-SP"))
            .sorted(File::compareTo)
            .collect(Collectors.toList());
    logger.info("Registering " + filesToExecute.size() + " sql scripts");
    filesToExecute.forEach(
        file ->
            ShellCommandExecutor.executeShellCommand(
                String.format(
                    "mysql -u%s -p%s -h%s -P%s %s < %s",
                    dbConfig.getDbUserName(),
                    dbConfig.getDbPassword(),
                    host,
                    port,
                    dbName,
                    file.getAbsoluteFile())));
  }

  private void fireConcolicExecution(String tracePath) {
    final String encodedPath = Base64.getEncoder().encodeToString(tracePath.getBytes());
    String uri = String.format("%s/webridge/compile/%s", concolicExecutorEndpoint, encodedPath);
    final HttpGet req = new HttpGet(uri);
    if (logger.isInfoEnabled()) {
      logger.info(
          String.format(
              "Sending Concolic Execution Request to the Offline Server at %s. The request URI is %s",
              concolicExecutorEndpoint, uri));
    }

    try (CloseableHttpResponse response = httpClient.execute(req, clientContext)) {
      int statusCode = response.getCode();

      if (statusCode != 200) {
        throw new RuntimeException(
            "status=" + statusCode + ", message=" + response.getReasonPhrase());
      }

      final HttpEntity entity = response.getEntity();
      assert entity != null;
      final String res = EntityUtils.toString(entity);
      logger.warn(
          String.format(
              "Generated stored procedure dependency graph for trace %s with received result %s",
              tracePath, res));
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  private static void deleteIfExists(Path source) {
    if (Files.exists(source)) {
      try {
        FileUtils.delete(source.toFile());
      } catch (IOException e) {
        throw new RuntimeException(e);
      }
    }
  }

  private String saveTrace(
      TraceRecordingFilter.WeBridgeRecordedTrace trace, String tmpTraceFileName) {
    final String filePath;
    try {
      final File tmpFile = new File(tmpTraceFileName);
      FileUtils.writeByteArrayToFile(tmpFile, SerializationUtils.serialize(trace));
      filePath = tmpFile.getAbsolutePath();
      logger.info("Saved temp file to " + filePath);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
    return filePath;
  }
}
