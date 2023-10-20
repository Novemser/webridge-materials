package webridge.common.offline.compiler;

import webridge.storedprocedure.SPDefinition;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TraceCompiledResult implements Serializable {
  private boolean isSucceed;
  private String message;
  private List<SPDefinition> compiledData;
  private transient Logger logger = LoggerFactory.getLogger(getClass());

  // save the spdef file onto disk
  public void persist(String spdefDir) {
    // TODO
    if (logger == null) {
      // logger might be null on the rmi receiver side, because it is transient
      logger = LoggerFactory.getLogger(getClass());
    }
    logger.info("Persisting received compiled stored procedure");
    if (compiledData == null || compiledData.isEmpty()) {
      throw new RuntimeException("Received empty compiled result");
    }

    SPDefinition spDefinition = compiledData.get(0);
    String apiName = spDefinition.getApiName();
    File dir = Paths.get(spdefDir, apiName).toFile();
    if (!dir.exists()) dir.mkdirs();

    Path path = Paths.get(spdefDir, apiName, "SpDef.data");
    try (ObjectOutputStream oos =
        new ObjectOutputStream(
            new BufferedOutputStream(Files.newOutputStream(path.toFile().toPath())))) {
      oos.writeObject(compiledData);
      oos.flush();
      logger.info("Saved compiled trace for API " + apiName + " to " + path.toAbsolutePath());
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public boolean isSucceed() {
    return isSucceed;
  }

  public void setSucceed(boolean succeed) {
    isSucceed = succeed;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public List<SPDefinition> getCompiledData() {
    return compiledData;
  }

  public void setCompiledData(List<SPDefinition> compiledData) {
    this.compiledData = compiledData;
  }
}
