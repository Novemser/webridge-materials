package webridge.common.offline.compiler.utils;

import java.io.*;
import java.lang.reflect.Field;
import java.util.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class ShellCommandExecutor {
  private static final Logger logger = LoggerFactory.getLogger(ShellCommandExecutor.class);
  private static final Set<Long> startedProcesses = new HashSet<>();

  public static int executeShellCommand(String cmd) {
    return executeShellCommand(cmd, false, "/tmp");
  }

  public static int executeShellCommand(String cmd, String workingDir) {
    return executeShellCommand(cmd, false, workingDir);
  }

  public static synchronized long getPidOfProcess(Process p) {
    long pid = -1;
    try {
      if (p.getClass().getName().equals("java.lang.UNIXProcess")) {
        Field f = p.getClass().getDeclaredField("pid");
        f.setAccessible(true);
        pid = f.getLong(p);
        f.setAccessible(false);
      }
    } catch (Exception e) {
      pid = -1;
    }
    return pid;
  }

  public static int executeShellCommand(String cmd, boolean quiet, String workingDir) {
    try {
      if (!quiet) logger.info("Executing command " + cmd);
      final ProcessBuilder builder = new ProcessBuilder("/bin/bash", "-c", cmd);
      builder.directory(new File(workingDir));
      builder.redirectErrorStream(true);
      final Process process = builder.start();
      startedProcesses.add(getPidOfProcess(process));

      final InputStream is = process.getInputStream();
      final BufferedReader reader = new BufferedReader(new InputStreamReader(is));
      String line;
      while ((line = reader.readLine()) != null) {
        if (!quiet) logger.info(line);
      }

      // TODO return directly upon error
      process.waitFor();
      int ret = process.exitValue();
      if (!quiet) logger.info("Cmd " + cmd + " returned " + ret);
      process.destroy();
      startedProcesses.remove(getPidOfProcess(process));
      return ret;
    } catch (IOException | InterruptedException e) {
      throw new RuntimeException(e);
    }
  }

  public static void destroyAllProcesses() {
    logger.info("Cleaning all started processes...");
    startedProcesses.forEach(pid -> executeShellCommand("kill " + pid));
    startedProcesses.clear();
  }
}
