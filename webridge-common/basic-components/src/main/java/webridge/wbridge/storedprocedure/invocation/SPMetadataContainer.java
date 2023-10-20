package webridge.wbridge.storedprocedure.invocation;

import com.google.common.base.Joiner;
import webridge.wbridge.storedprocedure.SPConfig;
import webridge.wbridge.storedprocedure.SPDefinition;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SPMetadataContainer {
  private final Log logger = LogFactory.getLog(getClass());

  private static SPMetadataContainer CONTAINER;

  public static SPMetadataContainer getInstance() {
    if (CONTAINER != null) return CONTAINER;
    synchronized (SPMetadataContainer.class) {
      if (CONTAINER == null) {
        final String spDefDir = System.getProperty("spDefDir");
        if (StringUtils.isEmpty(spDefDir)) {
          throw new RuntimeException("You should specify spDefDir in default.properties");
        }
        CONTAINER = new SPMetadataContainer(spDefDir);
      }
    }
    return CONTAINER;
  }

  private final String spDefDir;
  // For each API, which is the first sp to invoke, currently suppose only one for each API
  private Map<String, Pair<Map<String, SPDefinition>, String>> spDefinitionsAndFirstSpNames;

  private final SPRefresher refresher;

  private SPMetadataContainer(String spDefDir) {
    this.spDefDir = spDefDir;
    ScheduledExecutorService pool = Executors.newScheduledThreadPool(1);
    this.refresher = new SPRefresher();
    refresher.run();
    pool.scheduleAtFixedRate(refresher, 30, 30, TimeUnit.SECONDS);
  }

  Pair<Map<String, SPDefinition>, String> getSpDefinitions(String apiName) {
    return spDefinitionsAndFirstSpNames.get(apiName);
  }

  public void forceRefresh() {
    logger.info("Force refersh spdef");
    refresher.run();
  }

  private class SPRefresher implements Runnable {

    @Override
    public synchronized void run() {
      if (logger.isInfoEnabled())
        logger.info("Refreshing sp defs...");
      Map<String, Map<String, SPDefinition>> spDefinitions = readSpDefFromFile();
      if (logger.isInfoEnabled()) {
          logger.info(String.format("Found %d sp definitions", spDefinitions.size()));
          if (!spDefinitions.isEmpty())
            logger.info(String.format("Sp definitions: %s",
                  Joiner.on("|").join(spDefinitions.entrySet())));
      }
      Map<String, String> firstSpNames = findFirstSpNames(spDefinitions);
      spDefinitionsAndFirstSpNames =
          spDefinitions.entrySet().stream()
              .collect(
                  Collectors
                      .<Map.Entry<String, Map<String, SPDefinition>>, String,
                          Pair<Map<String, SPDefinition>, String>>
                          toMap(
                              Map.Entry::getKey,
                              entry ->
                                  Pair.of(entry.getValue(), firstSpNames.get(entry.getKey()))));
    }

    private Map<String, String> findFirstSpNames(
        Map<String, Map<String, SPDefinition>> spDefinitions) {
      return spDefinitions.entrySet().stream()
          .collect(
              Collectors.<Map.Entry<String, Map<String, SPDefinition>>, String, String>toMap(
                  Map.Entry::getKey,
                  entry -> {
                    Map<String, SPDefinition> definitions = entry.getValue();
                    Set<String> children =
                        definitions.values().stream()
                            .map(SPDefinition::getChildrenSpNames)
                            .flatMap(Collection::stream)
                            .collect(Collectors.toSet());
                    Set<String> spNames = new HashSet<>(definitions.keySet());
                    spNames.removeAll(children);
                    assert spNames.size() == 1;
                    return (String) spNames.toArray()[0];
                  }));
    }

    @SuppressWarnings("unchecked")
    private Map<String, Map<String, SPDefinition>> readSpDefFromFile() {
      File root = new File(spDefDir);
      Map<String, Map<String, SPDefinition>> allSpDefMap = new ConcurrentHashMap<>();
      if (root == null || root.listFiles() == null) return allSpDefMap;

      Arrays.stream(Objects.requireNonNull(root.listFiles()))
          .map(File::listFiles)
          .filter(Objects::nonNull)
          .flatMap(Arrays::stream)
          .filter(f -> f.isFile() && f.getName().endsWith(SPConfig.SP_DEF_FILE_SUFFIX))
          .sorted(File::compareTo) // sort the files by name, so that sp with newer version could
          // overwrite previous ones
          .forEach(
              f -> {
                try {
                  final BasicFileAttributes attr =
                      Files.readAttributes(f.toPath(), BasicFileAttributes.class);
                  logger.warn(
                      "Reading sp def["
                          + f.getName()
                          + "], creationTime: "
                          + attr.creationTime()
                          + ", lastAccessTime: "
                          + attr.lastAccessTime()
                          + ", lastModifiedTime: "
                          + attr.lastModifiedTime());
                } catch (IOException e) {
                  logger.error(e);
                  throw new RuntimeException(e);
                }
                try (ObjectInputStream ois =
                    new ObjectInputStream(new BufferedInputStream(new FileInputStream(f)))) {
                  List<SPDefinition> spDefs = (List<SPDefinition>) ois.readObject();

                  Map<String, SPDefinition> spDefMap = new ConcurrentHashMap<>();

                  if (spDefs != null && !spDefs.isEmpty()) {
                    String apiName = spDefs.get(0).getApiName();
                    spDefs.forEach(
                        spDef -> {
                          final boolean equals = spDef.getApiName().equals(apiName);
                          assert equals;
                          spDefMap.put(spDef.getSpName(), spDef);
                        });
                    allSpDefMap.put(apiName, spDefMap);
                  }
                } catch (IOException | ClassNotFoundException e) {
                  e.printStackTrace();
                }
              });
      if (allSpDefMap.isEmpty() && logger.isInfoEnabled()) {
        logger.warn("Empty spdefs read");
      }
      return allSpDefMap;
    }
  }
}
