package webridge.common.utils;

import com.google.common.base.Joiner;
import org.apache.commons.math3.util.Pair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import webridge.common.utils.pojo.ApiExecution;
import webridge.common.utils.pojo.SQL;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.util.stream.Collectors;

public abstract class DBUtils {
    public static final int E6 = 1_000_000;
    static final String BEGIN_STR = "SET autocommit=0";
    static final String END_STR = "SET autocommit=1";

    public static List<Map<String, Object>> getBreakDownEventAggregationByEventIds(
            JdbcTemplate template, Map<Integer, List<Integer>> threadEventMap) {
        return template.queryForList(
                String.format(
                        "SELECT EVENT_NAME, TRUNCATE(SUM(TIMER_WAIT)/1000000000,6) TOTAL, count(1) CNT FROM performance_schema.events_statements_history_long "
                                + "where %s group by EVENT_NAME order by TOTAL desc",
                        Joiner.on("or").join(concatThreadEventConditions(threadEventMap))));
    }

    public static Map<Integer, List<Integer>> getNestingEventIds(
            JdbcTemplate template, Map<Integer, List<Integer>> threadEventMap) {
        if (threadEventMap == null || threadEventMap.isEmpty())
            throw new RuntimeException("Invalid ids");
        final List<Map<String, Object>> res =
                template.queryForList(
                        String.format(
                                "SELECT EVENT_ID, THREAD_ID FROM performance_schema.events_statements_history_long "
                                        + "where %s",
                                Joiner.on("or").join(concatThreadEventConditions(threadEventMap))));
        final Map<Integer, List<Integer>> resThreadEventMap = new HashMap<>();
        res.forEach(
                row -> {
                    final int eventId = Integer.parseInt(row.get("EVENT_ID").toString());
                    final int threadId = Integer.parseInt(row.get("THREAD_ID").toString());
                    resThreadEventMap.compute(
                            threadId,
                            (id, events) -> {
                                if (events == null) events = new ArrayList<>();
                                events.add(eventId);
                                return events;
                            });
                });
        return resThreadEventMap;
    }

    public static List<Map<String, Object>> getBreakDownStageAggregationByEventIds(
            JdbcTemplate template, Map<Integer, List<Integer>> threadEventMap) {
        return template.queryForList(
                String.format(
                        "select EVENT_NAME, TRUNCATE(sum(TIMER_WAIT)/1000000000,6) total, count(1) CNT from "
                                + "performance_schema.events_stages_history_long where "
                                + "%s group by EVENT_NAME order by total desc",
                        Joiner.on("or").join(concatThreadEventConditions(threadEventMap))));
    }

    private static List<String> concatThreadEventConditions(
            Map<Integer, List<Integer>> threadEventMap) {
        return threadEventMap.entrySet().stream()
                .map(
                        entry ->
                                String.format(
                                        "(NESTING_EVENT_ID in (%s) and THREAD_ID = %d)",
                                        Joiner.on(",").join(entry.getValue()), entry.getKey()))
                .collect(Collectors.toList());
    }

    public static void getDbSummary(
            JdbcTemplate template,
            ApiExecution apiExecution,
            boolean usingSp,
            boolean fineGrainedBreakdown) {
        final List<Map<String, Object>> res =
                template.queryForList(
                        "SELECT EVENT_ID, TRUNCATE(TIMER_WAIT/1000000000,6) as Duration, SQL_TEXT, THREAD_ID FROM performance_schema.events_statements_history_long order by TIMER_START");
        boolean insideApiBlock = false;
        final Map<Integer, List<Integer>> threadEventMap = new HashMap<>();
        for (Map<String, Object> rowInColValMap : res) {
            final String sql = String.valueOf(rowInColValMap.get("SQL_TEXT"));
            if (sql.equals("null")) continue;
            if (sql.startsWith(BEGIN_API_STR)) {
                insideApiBlock = true;
                threadEventMap.clear();
                continue;
            } else if (sql.startsWith(END_API_STR)) {
                insideApiBlock = false;
                if (fineGrainedBreakdown) {
                    if (!usingSp) {
                        apiExecution.aggregateStagesBreakDown =
                                getBreakDownStageAggregationByEventIds(template, threadEventMap);
                    } else {
                        apiExecution.aggregateStatementsBreakDown =
                                getBreakDownEventAggregationByEventIds(template, threadEventMap);
                        apiExecution.aggregateStagesBreakDown =
                                getBreakDownStageAggregationByEventIds(
                                        template, getNestingEventIds(template, threadEventMap));
                        assert apiExecution.aggregateStatementsBreakDown.size() > 0;
                    }
                    assert apiExecution.aggregateStagesBreakDown.size() > 0;
                }
                break;
            }

            if (insideApiBlock) {
                // we only record call xxx sp & commit
                if (!usingSp || (sql.contains("call"))) {
                    final int eventId = Integer.parseInt(rowInColValMap.get("EVENT_ID").toString());
                    final int threadId = Integer.parseInt(rowInColValMap.get("THREAD_ID").toString());
                    threadEventMap.compute(
                            threadId,
                            (id, events) -> {
                                if (events == null) events = new ArrayList<>();
                                events.add(eventId);
                                return events;
                            });
                    apiExecution.sql.add(new SQL(sql, (BigDecimal) rowInColValMap.get("Duration")));
                }
            }
        }
    }

    public enum DBType {
        MySQL,
        Postgres
    }

    private static final int DATA_POPULATION_BATCH_SIZE = 1000;
    static final String BEGIN_API_STR = "SELECT 'BEGIN_API";
    static final String END_API_STR = "SELECT 'END_API";
    private static final Logger logger = LoggerFactory.getLogger(DBUtils.class);

    public static void enableStopWatch(final String[] tags) {
        for (String tag : tags) {
            if (logger.isDebugEnabled())
                logger.debug("Enabling timer " + tag);
            NamedStopWatch.setEnabled(true, tag);
        }
    }
    public static void disableStopWatch(final String[] tags) {
        for (String tag : tags) {
            if (logger.isDebugEnabled())
                logger.debug("Disabling timer " + tag);
            NamedStopWatch.setEnabled(false, tag);
        }
    }
    public static void enableMySQLStopWatch(final String[] tags) {
        for (String tag : tags) MySQLNamedStopWatch.setEnabled(true, tag);
    }

    public static void disableMySQLStopWatch(final String[] tags) {
        for (String tag : tags) MySQLNamedStopWatch.setEnabled(false, tag);
    }

//  public static void enableHibernateStopWatch(final String[] tags) {
//    for (String tag : tags) HibernateCoreNamedStopWatch.setEnabled(true, tag);
//  }

    public static void resetStopWatch(final String[] tags) {
        for (String tag : tags) NamedStopWatch.reset(tag);
    }

    public static void resetMySQLStopWatch(final String[] tags) {
        for (String tag : tags) MySQLNamedStopWatch.reset(tag);
    }

//  public static void resetHibernateStopWatch(final String[] tags) {
//    for (String tag : tags) HibernateCoreNamedStopWatch.reset(tag);
//  }

    public static BigDecimal getMySQLTimerMS(String s) {
        return MySQLNamedStopWatch.getTime(s).divide(new BigDecimal(E6));
    }

    public static void truncateProfilingLog(JdbcTemplate template) {
        template.execute("TRUNCATE TABLE performance_schema.events_statements_history_long");
        template.execute("TRUNCATE TABLE performance_schema.events_stages_history_long");
    }

    public static List<Map<String, Object>> getGlobalBreakDownStageAggregationByEventNames(JdbcTemplate template) {
        return template.queryForList("select EVENT_NAME,SUM_TIMER_WAIT,AVG_TIMER_WAIT,MIN_TIMER_WAIT,MAX_TIMER_WAIT FROM performance_schema.events_stages_summary_global_by_event_name order by SUM_TIMER_WAIT desc");
    }

    public static List<Map<String, Object>> getGlobalBreakDownWaitAggregationByEventNames(JdbcTemplate template) {
        return template.queryForList("select EVENT_NAME,SUM_TIMER_WAIT,AVG_TIMER_WAIT,MIN_TIMER_WAIT,MAX_TIMER_WAIT FROM performance_schema.events_waits_summary_global_by_event_name order by SUM_TIMER_WAIT desc");
    }

    public static void truncateGlobalSummaryProfilingLog(JdbcTemplate template) {
        template.execute("TRUNCATE TABLE performance_schema.events_stages_summary_global_by_event_name");
        template.execute("TRUNCATE TABLE performance_schema.events_waits_summary_global_by_event_name");
    }

    public static Pair<BigDecimal, Integer> finish(Connection conn) throws SQLException {
        Statement stmt = conn.createStatement();
        stmt.execute(END_STR);
        ResultSet rs =
                stmt.executeQuery(
                        "SELECT EVENT_ID, TRUNCATE(TIMER_WAIT/1000000000,6) as Duration, SQL_TEXT "
                                + "FROM performance_schema.events_statements_history_long");
        BigDecimal dbTime = new BigDecimal(0);
        boolean prefix = true;
        int cnt = 0;
        while (rs.next()) {
            String sql = rs.getString("SQL_TEXT");
            if (sql != null && sql.equals(END_STR)) {
                break;
            }
            if (!prefix) {
                System.out.println(rs.getDouble("Duration") + "\nSQL:" + rs.getString("SQL_TEXT"));
                dbTime = dbTime.add(BigDecimal.valueOf(rs.getDouble("Duration")));
                cnt++;
            }
            if (sql != null && sql.equals(BEGIN_STR)) {
                prefix = false;
            }
        }
        rs.close();
        stmt.close();
        return new Pair<>(dbTime, cnt);
    }

    public static void markBegin(JdbcTemplate template, int counter) {
        template.execute(String.format(BEGIN_API_STR + "%d'", counter));
    }

    public static void markEnd(JdbcTemplate template, int counter) {
        template.execute(String.format(END_API_STR + "%d'", counter));
    }

    public static void enableMysqlProfiling(JdbcTemplate template) {
        template.execute(
                "UPDATE performance_schema.setup_instruments "
                        + "SET ENABLED = 'YES', TIMED = 'YES' WHERE NAME LIKE '%statement/%'");
        template.execute(
                "UPDATE performance_schema.setup_instruments "
                        + "SET ENABLED = 'YES', TIMED = 'YES' WHERE NAME LIKE '%stage/%'");
        template.execute(
                "UPDATE performance_schema.setup_consumers "
                        + "SET ENABLED = 'YES' WHERE NAME LIKE '%events_statements_%'");
        template.execute(
                "UPDATE performance_schema.setup_consumers "
                        + "SET ENABLED = 'YES' WHERE NAME LIKE '%events_stages_%'");

        template.execute(
                "UPDATE performance_schema.setup_instruments SET ENABLED = 'YES', TIMED = 'YES' " +
                        "WHERE NAME LIKE 'wait/%'"
        );

        template.execute(
                "UPDATE performance_schema.setup_consumers " +
                        "SET ENABLED = 'YES' WHERE NAME LIKE 'events_waits%'"
        );
    }

    public static void truncateTable(
            final Statement statement, final String tableName, final DBType dbType) throws Exception {
        Objects.requireNonNull(statement);

        switch (dbType) {
            case MySQL:
                statement.execute("SET FOREIGN_KEY_CHECKS=0");
                statement.execute("truncate table " + tableName);
                statement.execute("SET FOREIGN_KEY_CHECKS=1");
                break;
            case Postgres:
                statement.execute("truncate table " + tableName + " CASCADE");
                break;
            default:
                throw new RuntimeException("Unexpected db type");
        }
    }

    public static int getTableSize(final Connection connection, String tableName)
            throws SQLException {
        final Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("select count(*) from " + tableName);
        rs.next();
        int size = rs.getInt(1);
        stmt.close();
        return size;
    }
}
