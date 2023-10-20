package webridge.common.offline.compiler;

import static webridge.common.offline.compiler.utils.ShellCommandExecutor.executeShellCommand;

import com.beust.jcommander.JCommander;
import java.rmi.Naming;
import java.rmi.registry.LocateRegistry;
import java.util.concurrent.*;
import org.apache.commons.lang3.NotImplementedException;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import webridge.common.offline.compiler.argument.Args;
import webridge.common.offline.compiler.impl.TraceCompilerImpl;
import webridge.common.offline.compiler.utils.ShellCommandExecutor;

public class OfflineCompilerServer {
  private enum SupportedApps {
    shopizer,
    broadleaf,
    sagan,
    pybbs,
    apollo,
    myblog
  }

  private final Logger logger = LoggerFactory.getLogger(getClass());
  private final ExecutorService threadPool = Executors.newFixedThreadPool(2);

  private void prepareWebServer(String concolicJdkHome, String workingDirectory, String appName) {
    logger.info("Starting the web application");
    if (StringUtils.isEmpty(concolicJdkHome) || StringUtils.isEmpty(workingDirectory)) {
      throw new RuntimeException("Invalid path " + workingDirectory + "|" + concolicJdkHome);
    }

    destroyAllProcessesWhenFinished();
    switch (SupportedApps.valueOf(appName)) {
      case shopizer:
      case broadleaf:
        final String cmd = String.format("JAVA_HOME=%s;mvn spring-boot:run -e", concolicJdkHome);
        threadPool.submit(
            () ->
                executeShellCommand(
                    cmd,
                    //                String.format("JAVA_HOME=%s;./run-spring-boot-java.sh",
                    // concolicJdkHome),
                    workingDirectory));
        waitForStartedUp();
        break;
      case sagan:
        final String cmdBuild = "./gradlew build -x test";
        final String cmdRender = "./gradlew :sagan-renderer:bootRun";
        final String cmdSite =
            String.format(
                "JAVA_HOME=%s;SPRING_PROFILES_ACTIVE=standalone ./gradlew :sagan-site:bootRun -x :sagan-common:jar -x :sagan-site:compileJava -x :sagan-client:jar",
                concolicJdkHome);
        int res = executeShellCommand(cmdBuild, workingDirectory);
        if (res != 0) logger.info("Building sagan failed ! Returned " + res);
        threadPool.submit(() -> executeShellCommand(cmdRender, workingDirectory));
        threadPool.submit(() -> executeShellCommand(cmdSite, workingDirectory));
        break;
      case pybbs:
        final String cmdCompile = "mvn clean compile package";
        final String cmdRun =
            String.format(
                "JAVA_HOME=%s; %s/bin/java -jar target/pybbs.jar --spring.profiles.active=dev",
                concolicJdkHome, concolicJdkHome);
        int resRun = executeShellCommand(cmdCompile, workingDirectory);
        if (resRun != 0) logger.info("Building sagan failed ! Returned " + resRun);
        threadPool.submit(() -> executeShellCommand(cmdRun, workingDirectory));
        break;
      case apollo:
        final String cmdPackage = "mvn clean package -Dmaven.test.skip=true";
        // cmdRunAssembly is a heavy component to run in background silently, better run it in
        // command line manually
        // final String cmdRunAssembly =
        //     "java -Dapollo_profile=github -jar apollo-assembly/target/apollo-assembly-2.1.0.jar
        // --configservice --adminservice";
        final String cmdRunPortal =
            String.format(
                "JAVA_HOME=%s; %s/bin/java -Dapollo_profile=github,auth -Ddev_meta=http://172.20.209.145:8080/ -Dserver.port=8099 -Djava.security.policy=webridge.policy -jar apollo-portal/target/apollo-portal-2.1.0.jar",
                concolicJdkHome, concolicJdkHome);
        int resPackage = executeShellCommand(cmdPackage, workingDirectory);
        if (resPackage != 0) logger.info("Building apollo failed ! Returned " + resPackage);
        // threadPool.submit(() -> executeShellCommand(cmdRunAssembly, workingDirectory));
        threadPool.submit(() -> executeShellCommand(cmdRunPortal, workingDirectory));
        break;
      case myblog:
        if (executeShellCommand("mvn clean package -Dmaven.test.skip=true", workingDirectory)
            != 0) {
          logger.info("Building myblog failed, exiting");
          return;
        }
        final String cmdRunBlog =
            String.format(
                "JAVA_HOME=%s; %s/bin/java -Xmx16G -Xss20m -jar %s/target/my-blog-4.0.0-SNAPSHOT.jar",
                concolicJdkHome, concolicJdkHome, workingDirectory);
        threadPool.submit(() -> executeShellCommand(cmdRunBlog, workingDirectory));
        break;
      default:
        throw new NotImplementedException(appName);
    }

    waitForStartedUp();
    logger.info("Web application started successfully");
  }

  private void waitForStartedUp() {
    try {
      Thread.sleep(1000 * 30);
    } catch (InterruptedException e) {
      throw new RuntimeException(e);
    }
  }

  private void prepareCompilerServer(
      String concolicExecutorEndpoint, String baseDir, String spdefDir, String schemaSql)
      throws Exception {
    if (System.getSecurityManager() == null) {
      System.setSecurityManager(new SecurityManager());
    }
    logger.info("Starting WeBridge Offline Compiler Server at port 1099");
    LocateRegistry.createRegistry(1099);
    TraceCompilerImpl traceCompiler =
        new TraceCompilerImpl(concolicExecutorEndpoint, baseDir, spdefDir, schemaSql);
    Naming.rebind("traceCompiler", traceCompiler);
    logger.info("WeBridge Offline Compiler Server is Ready");
  }

  public void startServer(
      String hostName,
      String baseDir,
      String concolicJdkHomePath,
      String concolicExecutorHttpEndpoint,
      String spdefDir,
      String schemaSql,
      String appName) {
    logger.info("java.rmi.server.hostname: " + hostName);
    logger.info("BaseDir: " + baseDir);
    logger.info("Concolic executor using: " + concolicJdkHomePath);

    assert baseDir.endsWith("/");
    System.setProperty("java.rmi.server.hostname", hostName);

    try {
      // start a fresh spring application
      prepareWebServer(concolicJdkHomePath, baseDir, appName);
      // bind address and start listening incoming connections
      prepareCompilerServer(concolicExecutorHttpEndpoint, baseDir, spdefDir, schemaSql);
    } catch (Exception e) {
      logger.error(e.getMessage());
      throw new RuntimeException(e);
    }
  }

  private void destroyAllProcessesWhenFinished() {
    final Thread cleaningThread = new Thread(ShellCommandExecutor::destroyAllProcesses);
    Runtime.getRuntime().addShutdownHook(cleaningThread);
  }

  public static void main(String[] args) {
    final Args argument = new Args();
    JCommander.newBuilder().addObject(argument).build().parse(args);
    new OfflineCompilerServer()
        .startServer(
            argument.getHostName(),
            argument.getBaseDir(),
            argument.getConcolicExecutorJavaPath(),
            argument.getConcolicExecutorHttpEndpoint(),
            argument.getGeneratedSPDir(),
            argument.getSchemaDefinitionFile(),
            argument.getAppName());
  }
}
