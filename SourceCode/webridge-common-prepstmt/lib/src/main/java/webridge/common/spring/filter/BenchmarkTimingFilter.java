package webridge.common.spring.filter;

import static webridge.common.utils.DBUtils.getMySQLTimerMS;

import com.google.common.base.Joiner;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.ReentrantLock;
import java.util.stream.Collectors;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.Ordered;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import webridge.common.utils.DBUtils;
import webridge.common.utils.MySQLNamedStopWatch;
import webridge.common.utils.NamedStopWatch;
import webridge.common.utils.WeBridgeWebRequestUtils;
import webridge.common.utils.pojo.ApiExecution;
import webridge.common.utils.pojo.SQL;

@Component("webridgeBenchmarkTimingFilter")
public class BenchmarkTimingFilter extends OncePerRequestFilter implements Ordered {
  // performance counter granularity
  private enum Granularity {
    PERFORMANCE, // all, db+net,
    FINED_GRAINED_L1, // all, db+net, profilingTags
    FINED_GRAINED_L2, // all, db+net, profilingTags, mysqlSWTags
    FINED_GRAINED_L3, // all, db+net, profilingTags, mysqlSWTags, mysqlStageTags
    GLOBAL_STAGES_SUMMARY // only calculate the accumulated summary of each stage. recommended to
    // use this when #clients > 1
  }

  private static final ReentrantLock TIMING_MUTEX = new ReentrantLock();

  private final Logger logger = LoggerFactory.getLogger(getClass());

  private final boolean enableSp;
  private final boolean enableTiming;
  private final boolean enableFineGrainedProfiling;
  private final Granularity granularity;

  private final ThreadLocal<Long> beginTime;
  private final ThreadLocal<Long> endTime;

  public void setBeginTime(long beginTime) {
    resetTimers();
    this.beginTime.set(beginTime);
  }

  private final int warmUp;
  private final int warmUpWaitSec;
  private long benchmarkBeginTime = Long.MIN_VALUE;

  public void setEndTime(long endTime) {
    this.endTime.set(endTime);
  }

  private final Map<String, AtomicInteger> reqCounter = new ConcurrentHashMap<>();

  public BenchmarkTimingFilter(
      JdbcTemplate jdbcTemplate,
      @Value("${enable.finegrained.profiling:false}") boolean enableFineGrainedProfiling,
      @Value("${webridge.use.sp:false}") boolean enableSp,
      @Value("${enable.timing:false}") boolean enableTiming,
      @Value("${timing.granularity:perf}") String granularity,
      @Value("${webridge.use.sp.warmup:15}") int warmUp,
      @Value("${webridge.use.sp.warmup.min.sec:300}") int warmUpWaitSec) {
    this.jdbcTemplate = jdbcTemplate;
    this.enableSp = enableSp;
    this.enableTiming = enableTiming;
    this.warmUp = warmUp;
    this.warmUpWaitSec = warmUpWaitSec;
    if (enableFineGrainedProfiling && !enableTiming) {
      throw new IllegalArgumentException("Unexpected enableFineGrainedProfiling && !enableTiming");
    }
    this.enableFineGrainedProfiling = enableFineGrainedProfiling;
    if (granularity.toLowerCase(Locale.ROOT).startsWith("perf")) {
      this.granularity = Granularity.PERFORMANCE;
    } else if (granularity.toLowerCase(Locale.ROOT).contains("l1")) {
      this.granularity = Granularity.FINED_GRAINED_L1;
    } else if (granularity.toLowerCase(Locale.ROOT).contains("l2")) {
      this.granularity = Granularity.FINED_GRAINED_L2;
    } else if (granularity.toLowerCase(Locale.ROOT).contains("l3")) {
      this.granularity = Granularity.FINED_GRAINED_L3;
    } else if (granularity.toLowerCase(Locale.ROOT).contains("summary")) {
      this.granularity = Granularity.GLOBAL_STAGES_SUMMARY;
      if (enableFineGrainedProfiling) {
        throw new RuntimeException(
            "Currently fined grained profiling with global stages summary profiling cannot be enabled together");
      }
    } else {
      throw new RuntimeException("Unexpected granularity:" + granularity);
    }
    if (enableFineGrainedProfiling || this.granularity.equals(Granularity.GLOBAL_STAGES_SUMMARY)) {
      DBUtils.enableMysqlProfiling(jdbcTemplate);
    }

    registerShutdownHook();
    this.beginTime = new ThreadLocal<>();
    this.endTime = new ThreadLocal<>();
  }

  // Compute the aggregated numbers(p50,p90,p99) after application showdown
  private void registerShutdownHook() {
    final Thread printingHook =
        new Thread(
            () -> {
              if (granularity.equals(Granularity.GLOBAL_STAGES_SUMMARY)) {
                // only calculate stage summaries
                final CSVPrinter csvPrinter = getSharedPrinter();
                try {
                  csvPrinter.printRecord("Stages breakdown");
                  csvPrinter.printRecord(
                      DBUtils.getGlobalBreakDownStageAggregationByEventNames(jdbcTemplate));
                  csvPrinter.printRecord("Wait breakdown");
                  csvPrinter.printRecord(
                      DBUtils.getGlobalBreakDownWaitAggregationByEventNames(jdbcTemplate));
                  csvPrinter.flush();
                } catch (IOException e) {
                  throw new RuntimeException(e);
                }
                return;
              }

              if (resultData.isEmpty()) {
                return;
              }

              final int numCols = resultData.get(0).size();
              List<List<BigDecimal>> colAcc = new ArrayList<>();
              for (int colIdx = 0; colIdx < numCols; colIdx++) {
                colAcc.add(new ArrayList<>());
              }

              for (List<BigDecimal> row : resultData) {
                for (int colIdx = 0; colIdx < numCols; colIdx++) {
                  final BigDecimal data = row.get(colIdx);
                  colAcc.get(colIdx).add(data);
                }
              }

              colAcc.forEach(lst -> lst.sort(BigDecimal::compareTo));
              final List<BigDecimal> finalP50Val = new ArrayList<>();
              final List<BigDecimal> finalP90Val = new ArrayList<>();
              final List<BigDecimal> finalP99Val = new ArrayList<>();
              for (int colIdx = 0; colIdx < numCols; colIdx++) {
                final List<BigDecimal> colData = colAcc.get(colIdx);
                finalP50Val.add(colData.get(p50(colData.size())));
                finalP90Val.add(colData.get(p90(colData.size())));
                finalP99Val.add(colData.get(p99(colData.size())));
              }

              final CSVPrinter csvPrinter = sharedPrinter;
              try {
                csvPrinter.printRecord("p50");
                csvPrinter.printRecord(finalP50Val);
                csvPrinter.printRecord("p90");
                csvPrinter.printRecord(finalP90Val);
                csvPrinter.printRecord("p99");
                csvPrinter.printRecord(finalP99Val);
                csvPrinter.flush();
              } catch (IOException e) {
                throw new RuntimeException(e);
              }

              if (l3grainStagingDurations.isEmpty()) {
                logger.info("Received empty l3grainStagingDurations");
                return;
              }

              l3grainStagingDurations.forEach(
                  (stageName, recordedNumbers) -> {
                    recordedNumbers.sort(BigDecimal::compareTo);
                    try {
                      int size = recordedNumbers.size();
                      csvPrinter.printRecord(
                          String.format(
                              "Stage [%s] p50=%s,p90=%s,p99=%s",
                              stageName,
                              recordedNumbers.get(p50(size)),
                              recordedNumbers.get(p90(size)),
                              recordedNumbers.get(p99(size))));
                      csvPrinter.flush();
                    } catch (IOException e) {
                      throw new RuntimeException(e);
                    }
                  });

              logger.warn("Timer shutdown hook executed successfully");
            });
    Runtime.getRuntime().addShutdownHook(printingHook);
  }

  private static int p50(int size) {
    return (int) Math.min(size - 1, size * 0.5);
  }

  private static int p90(int size) {
    return (int) Math.min(size - 1, size * 0.9);
  }

  private static int p99(int size) {
    return (int) Math.min(size - 1, size * 0.99);
  }

  private final List<List<BigDecimal>> resultData = new ArrayList<>();
  private final Map<String, List<BigDecimal>> l3grainStagingDurations = new HashMap<>();

  private String generateThreadLocalFileName() {
    final long id = Thread.currentThread().getId();

    return String.format(
        "thread-%d-log-%s.csv",
        id, LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
  }

  private static final String[] mysqlSWTags = {
    "MySQL-output-io-write",
    "MySQL-input-io-read",
    "MySQL-pstmt-update",
    "MySQL-pstmt-exeQuery",
    "MySQL-conn-commit",
    "MySQL-conn-setAutoCommit",
    "MySQL-pstmt-execute",
    "MySQL-pstmt-execute-internal",
    "MySQL-pstmt-execute-readAllResults",
    //            "mysql-findColumn",
    //            "mysql-getString",
    "MySQL-pstmt-execute-s1",
    "MySQL-executeInternal",
    "MySQL-executeInternal-s1",
    "MySQL-executeInternal-s2",
    "MySQL-executeInternal-innerExecSQL",
    "MySQL-pstmt-execute-s2",
    "MySQL-execSQL",
    "readResultsForQueryOrUpdate-1",
    "readResultsForQueryOrUpdate-2"
  };

  private static final String[] stagingTags = {
    "ViewProduct_sp_1_ver0",
    "ViewProduct_sp_2_ver0",
    "ViewProduct_sp_3_ver0",
    "ViewProduct_sp_4_ver0",
    "ViewProduct_sp_1_ver0-lifecycle",
    "ViewProduct_sp_2_ver0-lifecycle",
    "ViewProduct_sp_3_ver0-lifecycle",
    "ViewProduct_sp_4_ver0-lifecycle",
  };
  private static final String[] profilingTags = {
    "store-buffer-loop",
    "store-buffer-rs-next",
    "store-buffer-loop-meta",
    "store-buffer-getObj",
    "async-callback-param",
    "invokeMngr-query",
    "invokeMngr-update",
    "invokeMngr-autocommit",
    "invokeMngr-commit",
    "invokeMngr-query-invoke",
    "invokeMngr-autocommit-invoke",
    "invokeMngr-update-invoke",
    "sp-invocation",
    "invokeMngr-query-transform",
    "invokeMngr-query-storebuffer",
    "invokeMngr-query-getNextSp",
    "invokeMngr-query-record",
    "transform-parse-ps",
    "transform-loop-set-colval",
    "transform-getInstance",
    "validate-sql",
    "validate-sql-param",
    "validate-sql-prepare",
    "validate-sql-format",
    "async-invokeSPAsync",
    "async-setNewSPInvocation",
    //            "async-invokeSPAsync0",
    //            "async-eval-parameters",
    //            "async-create-statement",
    "async-callback-spfinish",
    "product-api-get-product",
    "arg-resolver-merchant",
    "arg-resolver-language",
    "product-api-findOne",
    "product-api-populate",
    "async-wait-ctx-ViewProduct_sp_1_ver0",
    "async-wait-ctx-ViewProduct_sp_2_ver0",
    "async-wait-ctx-ViewProduct_sp_3_ver0",
    "async-wait-ctx-ViewProduct_sp_4_ver0",
    "async-wait-ctx-ViewProduct_sp_5_ver0",
    "async-wait-ctx-ViewProduct_sp_6_ver0",
    "async-wait-ctx-ViewProduct_sp_7_ver0",
    "async-wait-ctx-ViewProduct_sp_8_ver0",
    "async-wait-ctx-ViewProduct_sp_9_ver0",
    //            "product-res",
    //            "product-hibernate",
    "hibernate-process-rs",
    //            "hibernate-exe-wrapper",
    //            "Hibernate-core-processResultSet-s1",
    //            "Hibernate-core-processResultSet-s2",
    //            "Hibernate-core-processResultSet-s3",
    //            "Hibernate-core-extract-key",
    //            "Hibernate-core-getRow",
    //            "Hibernate-core-read-collection",
    //            "exKey-resolve",
    //            "exKey-hydrate",
    //            "do-extract",
    //            "getLong",
    //            "getInt",
    //            "loadFromResultSet",
    //            "hydrate",
    //            "hydrate-inner",
    //            "org_hibernate_type_descriptor_sql_BigIntTypeDescriptor$1",
    //            "org_hibernate_type_descriptor_sql_DecimalTypeDescriptor$2",
    //            "org_hibernate_type_descriptor_sql_BooleanTypeDescriptor$2",
    //            "org_hibernate_type_descriptor_sql_IntegerTypeDescriptor$2",
    //            "org_hibernate_type_descriptor_sql_DateTypeDescriptor$2",
    //            "org_hibernate_type_descriptor_sql_TimestampTypeDescriptor$2",
    //            "org_hibernate_type_descriptor_sql_VarcharTypeDescriptor$2",
    //            "org_hibernate_type_BagType",
    //            "org_hibernate_type_CurrencyType",
    //            "org_hibernate_type_CustomType",
    //            "org_hibernate_type_ComponentType",
    //            "org_hibernate_type_TextType",
    //            "org_hibernate_type_StringType",
    //            "org_hibernate_type_SetType",
    //            "org_hibernate_type_BooleanType",
    //            "org_hibernate_type_ManyToOneType",
    //            "org_hibernate_type_BigDecimalType",
    //            "org_hibernate_type_DateType",
    //            "org_hibernate_type_IntegerType",
    //            "org_hibernate_type_TimestampType",
  };
  private static final String[] stagingTagsHeader = {
    "ViewProduct_sp_1_ver0_begin",
    "ViewProduct_sp_1_ver0_end",
    "ViewProduct_sp_2_ver0_begin",
    "ViewProduct_sp_2_ver0_end",
    "ViewProduct_sp_3_ver0_begin",
    "ViewProduct_sp_3_ver0_end",
    "ViewProduct_sp_4_ver0_begin",
    "ViewProduct_sp_4_ver0_end",
    "ViewProduct_sp_1_ver0_lifecycle_begin",
    "ViewProduct_sp_1_ver0_lifecycle_end",
    "ViewProduct_sp_2_ver0_lifecycle_begin",
    "ViewProduct_sp_2_ver0_lifecycle_end",
    "ViewProduct_sp_3_ver0_lifecycle_begin",
    "ViewProduct_sp_3_ver0_lifecycle_end",
    "ViewProduct_sp_4_ver0_lifecycle_begin",
    "ViewProduct_sp_4_ver0_lifecycle_end",
  };

  private static final String[] aggCols = {"total", "db", "network-all", "rtt"};

  private static String[] getColDefs() {
    final List<String> cols = new ArrayList<>();
    cols.addAll(Arrays.asList(aggCols));
    cols.addAll(Arrays.asList(profilingTags));
    cols.addAll(Arrays.asList(mysqlSWTags));
    return cols.toArray(new String[0]);
  }

  //            ObjectArrays.concat(
  //            ObjectArrays.concat(ObjectArrays.concat(aggCols, profilingTags, String.class),
  // "mysql-findColumn"), "mysql-getString");
  //            ObjectArrays.concat(ObjectArrays.concat(aggCols, stagingTagsHeader, String.class),
  // "uri");
  //            aggCols, profilingTags, String.class);

  private static CSVPrinter sharedPrinter;
  private static FileWriter debugWriter;

  private CSVPrinter getSharedPrinter() {
    if (sharedPrinter != null) return sharedPrinter;

    try {
      synchronized (mysqlSWTags) {
        if (sharedPrinter != null) return sharedPrinter;
        final List<String> resultColumns = new ArrayList<>();
        switch (granularity) {
          case FINED_GRAINED_L3:
          case FINED_GRAINED_L2:
            for (int idx = mysqlSWTags.length - 1; idx >= 0; idx--) {
              resultColumns.add(0, mysqlSWTags[idx]);
            }
          case FINED_GRAINED_L1:
            for (int idx = profilingTags.length - 1; idx >= 0; idx--) {
              resultColumns.add(0, profilingTags[idx]);
            }
          case PERFORMANCE:
            for (int idx = aggCols.length - 1; idx >= 0; idx--) {
              resultColumns.add(0, aggCols[idx]);
            }
            break;
          case GLOBAL_STAGES_SUMMARY:
            resultColumns.add("Accumulated MySQL profiling result");
            break;
          default:
            throw new RuntimeException("Invalid granularity:" + granularity);
        }
        final String[] columnDefs = new String[resultColumns.size()];
        for (int index = 0; index < columnDefs.length; index++) {
          columnDefs[index] = resultColumns.get(index);
        }
        return sharedPrinter = CSVFormat.DEFAULT.withHeader(columnDefs).print(initSharedWriter());
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public FileWriter getDebugWriter() {
    if (debugWriter != null) return debugWriter;

    try {
      synchronized (mysqlSWTags) {
        if (debugWriter != null) return debugWriter;
        return debugWriter = initDebugWriter();
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  private FileWriter initDebugWriter() throws IOException {
    return new FileWriter(
        String.format(
            "debug-%s.txt", LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME)));
  }

  private FileWriter initSharedWriter() throws IOException {
    return new FileWriter(
        String.format(
            "all-threads-%s.csv",
            LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME)));
  }

  @Override
  public int getOrder() {
    return FilterOrders.of(getClass());
  }

  private final String[] basicTags = new String[] {"MySQL-input-io-read", "MySQL-output-io-write"};

  public void enableTimers() {
    if (granularity.equals(Granularity.GLOBAL_STAGES_SUMMARY)) return;
    DBUtils.enableMySQLStopWatch(basicTags);
    if (granularity.equals(Granularity.PERFORMANCE)) return;
    DBUtils.enableStopWatch(profilingTags);
    if (granularity.equals(Granularity.FINED_GRAINED_L1)) return;
    DBUtils.enableMySQLStopWatch(mysqlSWTags);
  }

  public void disableTimers() {
    if (granularity.equals(Granularity.GLOBAL_STAGES_SUMMARY)) return;
    DBUtils.disableMySQLStopWatch(basicTags);
    if (granularity.equals(Granularity.PERFORMANCE)) return;
    DBUtils.disableStopWatch(profilingTags);
    if (granularity.equals(Granularity.FINED_GRAINED_L1)) return;
    DBUtils.disableMySQLStopWatch(mysqlSWTags);
  }

  public void resetTimers() {
    if (granularity.equals(Granularity.GLOBAL_STAGES_SUMMARY)) return;
    DBUtils.resetMySQLStopWatch(basicTags);
    if (granularity.equals(Granularity.PERFORMANCE)) return;
    DBUtils.resetStopWatch(profilingTags);
    if (granularity.equals(Granularity.FINED_GRAINED_L1)) return;
    DBUtils.resetMySQLStopWatch(mysqlSWTags);
  }

  final JdbcTemplate jdbcTemplate;

  @Override
  protected void doFilterInternal(
      HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
      throws ServletException, IOException {
    // currently only support single threaded timing/profiling
    if (shouldWrapWithTimingLock()) TIMING_MUTEX.lock();
    try {
      if (!enableTiming || !WeBridgeWebRequestUtils.isSpURI(request)) {
        filterChain.doFilter(request, response);
        return;
      }
      logger.info(
          request.getRequestURI()
              + " Started timing at thread:"
              + Thread.currentThread().getName());

      if (enableFineGrainedProfiling) {
        DBUtils.truncateProfilingLog(jdbcTemplate);
        DBUtils.markBegin(jdbcTemplate, 0);
      }

      enableTimers();
      setBeginTime(System.nanoTime());
      filterChain.doFilter(request, response);
      setEndTime(System.nanoTime());
      final double totalTime = getTotalTime();

      if (enableFineGrainedProfiling) {
        DBUtils.markEnd(jdbcTemplate, 0);
      }

      if (logger.isDebugEnabled()) {
        logger.debug(
            request.getRequestURI()
                + " finished in "
                + totalTime
                + " ms at thread:"
                + Thread.currentThread().getName());
      }

      try {
        final String apiName = WeBridgeWebRequestUtils.getSPDefApi(request);
        final AtomicInteger reqCnt =
            reqCounter.compute(
                apiName,
                (ignored, counter) -> {
                  if (counter != null) return counter;
                  counter = new AtomicInteger(0);

                  if (benchmarkBeginTime != Long.MIN_VALUE) return counter;
                  benchmarkBeginTime = System.currentTimeMillis();
                  if (!granularity.equals(Granularity.GLOBAL_STAGES_SUMMARY)) return counter;
                  DBUtils.truncateGlobalSummaryProfilingLog(jdbcTemplate);
                  logger.warn("Initialized MySQL GlobalSummaryStageProfilingLog");
                  return counter;
                });

        if (reqCnt.incrementAndGet() <= warmUp) return;
        if (benchmarkBeginTime == Long.MIN_VALUE) return;
        // warm up at lease warmUpWait * 1000 ms
        if (System.currentTimeMillis() - benchmarkBeginTime <= warmUpWaitSec * 1_000L) return;
        // in global summary stage profiling level, we do not record each API's profiled data as in
        // other profiling level
        if (granularity == Granularity.GLOBAL_STAGES_SUMMARY) return;

        storeTime(totalTime, request);
      } catch (Exception e) {
        throw new RuntimeException(e);
      }
    } finally {
      if (shouldWrapWithTimingLock()) TIMING_MUTEX.unlock();
      resetTimers();
      disableTimers();
    }
  }

  private double getTotalTime() {
    assert !endTime.get().equals(beginTime.get()) && beginTime.get() != 0;
    return (endTime.get() - beginTime.get()) / 1e6;
  }

  private BigDecimal calculateJdbcAll() {
    return getMySQLTimerMS("MySQL-conn-setAutoCommit")
        .add(getMySQLTimerMS("MySQL-pstmt-exeQuery"))
        .add(getMySQLTimerMS("MySQL-pstmt-update"))
        .add(getMySQLTimerMS("MySQL-conn-commit"))
        .add(getMySQLTimerMS("MySQL-pstmt-execute"));
  }

  private BigDecimal calculateJdbcInternal() {
    return calculateJdbcAll()
        .subtract(getMySQLTimerMS("MySQL-input-io-read"))
        .subtract(getMySQLTimerMS("MySQL-output-io-write"));
  }

  private BigDecimal calculateJdbcNetwork() {
    return getMySQLTimerMS("MySQL-input-io-read").add(getMySQLTimerMS("MySQL-output-io-write"));
  }

  private List<BigDecimal> getMySQLTimeMs() {
    try {
      final List<BigDecimal> result = new ArrayList<>();
      for (String mysqlSWTag : mysqlSWTags) {
        result.add(DBUtils.getMySQLTimerMS(mysqlSWTag));
      }
      return result;
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  private List<BigDecimal> getCallSpTimeMs() {
    try {
      final List<BigDecimal> result = new ArrayList<>();
      for (String stagingTag : stagingTags) {
        NamedStopWatch watch = NamedStopWatch.resolveStopWatch(stagingTag);
        result.add(new BigDecimal(watch.getBeginTimeBackup()).divide(new BigDecimal(DBUtils.E6)));
        result.add(new BigDecimal(watch.getEndTimeBackup()).divide(new BigDecimal(DBUtils.E6)));
      }
      return result;
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  private List<BigDecimal> getProfileTimeMs() {
    try {
      final List<BigDecimal> result = new ArrayList<>();
      for (String stagingTag : profilingTags) {
        result.add(NamedStopWatch.getTime(stagingTag).divide(new BigDecimal(DBUtils.E6)));
        //                result.add(BigDecimal.valueOf(NamedStopWatch.getCount(stagingTag)));
      }
      return result;
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  private void storeTime(final double totalTime, HttpServletRequest request) throws IOException {
    final CSVPrinter csvPrinter = getSharedPrinter();
    // get time ms must be performed before getDbSummary to avoid unwanted timing result recorded
    final List<BigDecimal> mySQLTimeMs = getMySQLTimeMs();
    final BigDecimal networkTimeTotal = calculateJdbcNetwork();
    //        final BigDecimal jdbcAll = calculateJdbcAll();
    //        final BigDecimal jdbcInternal = calculateJdbcInternal();
    final BigDecimal dbTime;
    final List<BigDecimal> printResult = new ArrayList<>();
    //        printResult.add(new BigDecimal(this.beginTime).divide(new BigDecimal(DBUtils.E6)));
    printResult.add(new BigDecimal(totalTime).setScale(6, RoundingMode.CEILING));
    final List<String> apiStagesSummary = new ArrayList<>();

    if (enableFineGrainedProfiling) {
      final ApiExecution apiExecution = new ApiExecution();
      final int qCount = getQueryCount(enableSp);
      DBUtils.getDbSummary(
          jdbcTemplate, apiExecution, enableSp, granularity == Granularity.FINED_GRAINED_L3);
      // after get db summary, do not perform any getMySQLTimerMS operations
      dbTime = apiExecution.getDbTime();
      if (qCount != apiExecution.sql.size()) {
        final FileWriter debugFileWriter = getDebugWriter();
        debugFileWriter
            .append("Error SQL size ")
            .append(String.valueOf(apiExecution.sql.size()))
            .append(", recorded ")
            .append(String.valueOf(qCount));
        debugFileWriter.append("\n");
        for (SQL sql : apiExecution.sql) {
          debugFileWriter.append(sql.sqlString).append("\n");
        }
        debugFileWriter.flush();
        throw new RuntimeException(
            "Unmatched number of SQL:"
                + qCount
                + " vs "
                + apiExecution.sql.size()
                + " for request "
                + request.getRequestURI());
      } else {
        logger.info("Timer recorded " + qCount + " queries.");
        if (granularity == Granularity.FINED_GRAINED_L3) {
          List<Map<String, Object>> aggregateStagesBreakDown =
              apiExecution.aggregateStagesBreakDown;
          if (aggregateStagesBreakDown.isEmpty()) {
            throw new RuntimeException("L3 grained stages data not found");
          }
          // record stage duration data
          for (Map<String, Object> stages : aggregateStagesBreakDown) {
            final String eventName = stages.get("EVENT_NAME").toString();
            final BigDecimal duration =
                BigDecimal.valueOf(Double.parseDouble(stages.get("total").toString()));
            l3grainStagingDurations.compute(
                eventName,
                (ignored, dataPoints) -> {
                  if (dataPoints == null) dataPoints = new ArrayList<>();
                  dataPoints.add(duration);
                  return dataPoints;
                });
          }
          apiStagesSummary.addAll(
              aggregateStagesBreakDown.stream()
                  .map(internalMap -> Joiner.on("|").join(internalMap.entrySet()))
                  .collect(Collectors.toList()));
        }
      }
    } else {
      dbTime = BigDecimal.ZERO;
    }
    printResult.add(dbTime);
    printResult.add(networkTimeTotal);
    printResult.add(networkTimeTotal.subtract(dbTime));
    if (granularity.equals(Granularity.FINED_GRAINED_L1)) {
      printResult.addAll(getProfileTimeMs());
    } else if (granularity.equals(Granularity.FINED_GRAINED_L2)
        || granularity.equals(Granularity.FINED_GRAINED_L3)) {
      printResult.addAll(getProfileTimeMs());
      printResult.addAll(mySQLTimeMs);
    }
    //        printResult.addAll(getCallSpTimeMs());
    //        printResult.add(request.getRequestURI() + "__" + request.getMethod());
    //        printResult.add(getMySQLTimerMS("mysql-findColumn"));
    //        printResult.add(getMySQLTimerMS("mysql-getString"));
    resultData.add(printResult);
    final List<String> colStrToPrint =
        printResult.stream().map(BigDecimal::toString).collect(Collectors.toList());
    colStrToPrint.add(request.getRequestURI() + "__" + request.getMethod());
    if (granularity == Granularity.FINED_GRAINED_L3) {
      colStrToPrint.addAll(apiStagesSummary);
    }
    csvPrinter.printRecord(colStrToPrint);
    csvPrinter.flush();
  }

  private int getQueryCount(boolean enableSp) {
    return MySQLNamedStopWatch.getCount("MySQL-pstmt-exeQuery")
        + (enableSp ? 0 : MySQLNamedStopWatch.getCount("MySQL-conn-setAutoCommit"))
        + MySQLNamedStopWatch.getCount("MySQL-conn-commit")
        + MySQLNamedStopWatch.getCount("MySQL-pstmt-update")
        + MySQLNamedStopWatch.getCount("MySQL-pstmt-execute");
  }

  private boolean shouldWrapWithTimingLock() {
    return enableTiming && !granularity.equals(Granularity.GLOBAL_STAGES_SUMMARY);
  }
}
