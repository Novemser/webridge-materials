package webridge.common.spring.filter;

import webridge.wbridge.sql.ResultSetHolder;
import webridge.wbridge.storedprocedure.invocation.SPInvokeManager;
import java.io.*;
import java.net.MalformedURLException;
import java.nio.file.Paths;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.util.SerializationUtils;
import org.springframework.web.filter.OncePerRequestFilter;
import webridge.common.offline.compiler.TraceCompiledResult;
import webridge.common.offline.compiler.TraceCompiler;
import webridge.common.offline.compiler.config.DBConfig;
import webridge.common.utils.BufferedServletRequestWrapper;
import webridge.common.utils.WeBridgeWebRequestUtils;

@Component("traceRecordingFilter")
public class TraceRecordingFilter extends OncePerRequestFilter implements Ordered {
  private final Logger logger = LoggerFactory.getLogger(getClass());
  private final Set<String> compiledTrace = new HashSet<>();

  private static final ExecutorService taskExecutor = Executors.newSingleThreadExecutor();

  @Value("${trace.sql.enable:false}")
  private boolean enableTracing;

  @Value("${recorder.threshold:10}")
  private int traceCompileThreshold;

  @Value("${webridge.offline.compiler.enable:false}")
  private boolean enableOfflineCompiler;

  @Value("${webridge.offline.compiler.host:127.0.0.1}")
  private String offlineCompilerHost;

  @Value("${spdef.dir:/tmp}")
  private String spdefDir;

  @Autowired private ResultSetTracerFilter resultSetTracerFilter;

  @Value("${db.jdbcUrl:}")
  private String jdbcUrl;

  @Value("${db.user:}")
  private String dbUser;

  @Value("${db.password:}")
  private String dbPassword;

  private TraceCompiler traceCompiler;

  @Override
  public int getOrder() {
    return FilterOrders.of(getClass());
  }

  private Map<String, Object> collectCurrentRequestInfo(BufferedServletRequestWrapper req) {
    final String uri = req.getRequestURI();
    final Map<String, String[]> parameterValues = new HashMap<>(req.getParameterMap());
    final Map<String, String> headers = new HashMap<>();
    Enumeration<String> e = req.getHeaderNames();
    while (e.hasMoreElements()) {
      String key = e.nextElement();
      String val = req.getHeader(key);
      headers.put(key, val);
    }
    final String body = req.getRequestBody();

    Map<String, Object> result = new HashMap<>();
    result.put("uri", uri);
    result.put("parameterValues", parameterValues);
    result.put("headers", headers);
    result.put("body", body);
    result.put("method", req.getMethod());
    return result;
  }

  @Override
  protected void doFilterInternal(
      HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
      throws ServletException, IOException {

    if (!enableTracing || !WeBridgeWebRequestUtils.isSpURI(request)) {
      filterChain.doFilter(request, response);
      return;
    }
    final BufferedServletRequestWrapper requestWrapper;
    try {
      requestWrapper = WeBridgeWebRequestUtils.bufferRequestBody(request);
      if (ResultSetHolder.isInitialized()) {
        SPInvokeManager.setUsingRecordedRs(true);
        String spDefApi = WeBridgeWebRequestUtils.getSPDefApi(request);
        if (StringUtils.isEmpty(spDefApi)) {
          logger.error(
              "Unexpected empty sp def api name for "
                  + request.getRequestURI()
                  + " | "
                  + request.getMethod());
        }
        logger.info(
            String.format(
                "Using recorded result set to process API %s", Objects.requireNonNull(spDefApi)));
      } else {
        SPInvokeManager.startRecording();
      }
      filterChain.doFilter(requestWrapper, response);
      if (ResultSetHolder.isInitialized()) {
        SPInvokeManager.setUsingRecordedRs(false);
        ResultSetHolder.reset();
        logger.info("Finished using recorded result set processing");
        SPInvokeManager.endRecording();
        return;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }

    tryCompilingTrace(requestWrapper);
    SPInvokeManager.endRecording();
  }

  private void tryCompilingTrace(BufferedServletRequestWrapper requestWrapper) {
    if (!enableOfflineCompiler) return;
    final List<Pair<String, Object>> recordedResultSet =
        SPInvokeManager.getRecordedSqlAndResultSets();
    if (recordedResultSet == null) {
      // returns if no need to compile
      return;
    }
    // when there's a need to save the request, do save request here
    final String apiName = WeBridgeWebRequestUtils.getSPDefApi(requestWrapper);
    if (apiName == null) {
      return;
    }
    Map<String, Map<String, Integer>> traceCounterHistogram =
        resultSetTracerFilter.getTraceCounterHistogram();
    if (traceCounterHistogram == null || traceCounterHistogram.get(apiName) == null) {
      // nothing need compile
      return;
    }
    Map<String, Integer> histogram = traceCounterHistogram.get(apiName);

    Map<String, Integer> traceCountMap = Objects.requireNonNull(histogram);
    for (Map.Entry<String, Integer> traceKeyCounter : traceCountMap.entrySet()) {
      final String traceKey = traceKeyCounter.getKey();
      if (traceKeyCounter.getValue() < traceCompileThreshold || compiledTrace.contains(traceKey)) {
        continue;
      }
      synchronized (this) {
        if (compiledTrace.contains(traceKey)) {
          continue;
        }
        compiledTrace.add(traceKey);
      }
      Map<String, Object> requestInfo = collectCurrentRequestInfo(requestWrapper);

      // got a trace to compile
      taskExecutor.execute(
          () -> {
            // compiler trace
            logger.info(
                String.format(
                    "Start compiling trace[%d] for API %s%n", traceKey.hashCode(), apiName));
            compileTrace(traceKey, recordedResultSet, apiName, requestInfo);
          });
    }
  }

  private void compileTrace(
      String traceKey,
      List<Pair<String, Object>> recordedResultSet,
      String apiName,
      Map<String, Object> requestInfo) {
    WeBridgeRecordedTrace trace =
        new WeBridgeRecordedTrace(traceKey, apiName, requestInfo, recordedResultSet);
    try {
      trace.save();
      logger.info(
          String.format(
              "Saved a hot trace[%d] to compile for API %s", traceKey.hashCode(), apiName));
    } catch (Exception e) {
      throw new RuntimeException(e);
    }

    if (!enableOfflineCompiler) return;
    // initialized the compiler once
    tryInitializeCompiler();
    // send request to compiler
    final TraceCompiledResult result;
    try {
      result = traceCompiler.compileTrace(trace, new DBConfig(jdbcUrl, dbUser, dbPassword));
    } catch (RemoteException e) {
      throw new RuntimeException(e);
    }
    // receive response and persist onto disk
    if (StringUtils.isEmpty(spdefDir)) throw new IllegalArgumentException("Empty spdef dir");

    result.persist(spdefDir);
  }

  private void tryInitializeCompiler() {
    if (traceCompiler != null) return;
    if (StringUtils.isEmpty(offlineCompilerHost))
      throw new IllegalArgumentException("Empty compiler host");
    if (System.getSecurityManager() == null) {
      System.setSecurityManager(new SecurityManager());
    }
    try {
      traceCompiler =
          (TraceCompiler) Naming.lookup("//" + offlineCompilerHost + ":1099/traceCompiler");
      if (traceCompiler == null)
        throw new RuntimeException("Failed to connect to the trace compiler");
      logger.info("Trace compiler initialized finished");
    } catch (NotBoundException | MalformedURLException | RemoteException e) {
      traceCompiler = null;
      throw new RuntimeException(e);
    }
  }

  public static class WeBridgeRecordedTrace implements Serializable {
    private static final long serialVersionUID = 42L;

    private static final String BASEDIR = Paths.get("/tmp").toAbsolutePath() + "/dump-data/";
    private static final String NEW_TRACE_DIR = "api-input";
    final String apiName;
    final String traceIdentifier;
    final Map<String, Object> requestInfo;
    final List<Pair<String, Object>> recordedResultSet;

    public String getApiName() {
      return apiName;
    }

    public String getTraceIdentifier() {
      return traceIdentifier;
    }

    public Map<String, Object> getRequestInfo() {
      return requestInfo;
    }

    public List<Pair<String, Object>> getRecordedResultSet() {
      return recordedResultSet;
    }

    public String getFileName() {
      return String.format(
          "%s/%s/trace-[%d].data", NEW_TRACE_DIR, apiName, traceIdentifier.hashCode());
    }

    public WeBridgeRecordedTrace(
        String traceIdentifier,
        String apiName,
        Map<String, Object> requestInfo,
        List<Pair<String, Object>> recordedResultSet) {
      this.traceIdentifier = Objects.requireNonNull(traceIdentifier);
      this.apiName = Objects.requireNonNull(apiName);
      this.requestInfo = new HashMap<>(Objects.requireNonNull(requestInfo));
      this.recordedResultSet = new ArrayList<>(Objects.requireNonNull(recordedResultSet));
    }

    public void save() {
      final File file = Paths.get(BASEDIR, getFileName()).toFile();
      file.getParentFile().mkdirs();
      try (final FileOutputStream fos = new FileOutputStream(file)) {
        fos.write(Objects.requireNonNull(SerializationUtils.serialize(this)));
      } catch (IOException ex) {
        throw new RuntimeException(ex);
      }
    }
  }
}
