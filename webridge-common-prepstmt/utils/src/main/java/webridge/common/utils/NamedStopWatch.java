package webridge.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

// note that this stopwatch is currently not thread-safe
public class NamedStopWatch {
    private static final Map<String, NamedStopWatch> stopWatchMap = new HashMap<>();
    private volatile static boolean hasEnabled;
    private static final Logger logger = LoggerFactory.getLogger(NamedStopWatch.class);

    private long beginTime;
    private boolean enabled;
    private BigDecimal duration = new BigDecimal(0);
    private int count = 0;

    private long beginTimeBackup;
    private long endTimeBackup;

    public long getBeginTimeBackup() {
        return beginTimeBackup;
    }

    public void setBeginTimeBackup(long beginTimeBackup) {
        this.beginTimeBackup = beginTimeBackup;
    }

    public long getEndTimeBackup() {
        return endTimeBackup;
    }

    public void setEndTimeBackup(long endTimeBackup) {
        this.endTimeBackup = endTimeBackup;
    }

    public void activate() {
    }

    public static NamedStopWatch resolveStopWatch(String name) {
        // for performance reason, try not to use lambda here
//    return stopWatchMap.computeIfAbsent(name, s -> new NamedStopWatch());
        final boolean exists = stopWatchMap.containsKey(name);
        if (exists) return stopWatchMap.get(name);
        final NamedStopWatch res = new NamedStopWatch();
        stopWatchMap.put(name, res);
        return res;
    }

    public static void begin(String name) {
        if (!hasEnabled) return;

        final NamedStopWatch stopWatch = resolveStopWatch(name);
        if (!stopWatch.enabled) {
            logger.warn("Timer " + name + " not enabled in thread " + Thread.currentThread().getName());
            return;
        }
        if (stopWatch.beginTime != 0) {
            throw new RuntimeException(String.format("Timer %s already started timing[%s]", name, Thread.currentThread().getName()));
        }
        stopWatch.beginTime = System.nanoTime();
        stopWatch.beginTimeBackup = stopWatch.beginTime;
    }

    public static void end(String name) {
        if (!hasEnabled) return;

        final NamedStopWatch stopWatch = resolveStopWatch(name);

        if (!stopWatch.enabled) {
            return;
        }
        if (stopWatch.beginTime == 0) {
            throw new RuntimeException("Timing not started[" + Thread.currentThread().getName() + "]:" + name);
        }
        long ct = System.nanoTime();
        stopWatch.endTimeBackup = ct;
        stopWatch.duration =
                stopWatch.duration.add(new BigDecimal(ct - stopWatch.beginTime));
        stopWatch.beginTime = 0;
        stopWatch.count++;
    }

    public static void setEnabled(boolean enabled, String name) {
        if (!hasEnabled && enabled) hasEnabled = true;
        resolveStopWatch(name).enabled = enabled;
        if (logger.isDebugEnabled())
            logger.debug("Set enable timmer " + name + " to " + enabled);
    }

    public static BigDecimal getTime(String name) {
        return resolveStopWatch(name).duration;
    }

    public static int getCount(String name) {
        return resolveStopWatch(name).count;
    }

    public static void reset(String name) {
        final NamedStopWatch stopWatch = resolveStopWatch(name);

        stopWatch.duration = new BigDecimal(0);
        stopWatch.count = 0;
    }

    public static void reset() {
        stopWatchMap.clear();
    }
}
