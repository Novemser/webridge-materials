package webridge.common.utils;

import java.math.BigDecimal;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class MySQLNamedStopWatch {
    private static final Map<String, MySQLNamedStopWatch> stopWatchMap = new ConcurrentHashMap<>();
    private long beginTime;
    private boolean enabled;
    private BigDecimal duration = new BigDecimal(0);
    private int count = 0;

    public MySQLNamedStopWatch() {
    }

    private static MySQLNamedStopWatch resolveStopWatch(String name) {
        name = Thread.currentThread().getId() + name;
        boolean exists = stopWatchMap.containsKey(name);
        if (exists) {
            return stopWatchMap.get(name);
        } else {
            MySQLNamedStopWatch res = new MySQLNamedStopWatch();
            stopWatchMap.put(name, res);
            return res;
        }
    }

    public static void begin(String name) {
        MySQLNamedStopWatch stopWatch = resolveStopWatch(name);
        if (stopWatch.enabled) {
            if (stopWatch.beginTime != 0L) {
                throw new RuntimeException(String.format("Timer %s already started timing", name));
            } else {
                stopWatch.beginTime = System.nanoTime();
            }
        }
    }

    public static void begin(String name, String queryString) {
        MySQLNamedStopWatch stopWatch = resolveStopWatch(name);
        if (stopWatch.enabled) {
            if (stopWatch.beginTime != 0L) {
                throw new RuntimeException(String.format("Timer %s already started timing", name));
            } else {
                stopWatch.beginTime = System.nanoTime();
            }
        }
    }

    public static void end(String name) {
        MySQLNamedStopWatch stopWatch = resolveStopWatch(name);
        if (stopWatch.enabled) {
            if (stopWatch.beginTime == 0L) {
                throw new RuntimeException("Timing not started");
            } else {
                stopWatch.duration = stopWatch.duration.add(new BigDecimal(System.nanoTime() - stopWatch.beginTime));
                stopWatch.beginTime = 0L;
                ++stopWatch.count;
            }
        }
    }

    public static void setEnabled(boolean enabled, String name) {
        resolveStopWatch(name).enabled = enabled;
    }

    public static BigDecimal getTime(String name) {
        return resolveStopWatch(name).duration;
    }

    public static int getCount(String name) {
        return resolveStopWatch(name).count;
    }

    public static void reset(String name) {
        MySQLNamedStopWatch stopWatch = resolveStopWatch(name);
        stopWatch.duration = new BigDecimal(0);
        stopWatch.count = 0;
        stopWatch.beginTime = 0L;
    }
}
