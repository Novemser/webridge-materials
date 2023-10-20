package org.postgresql;

import java.math.BigDecimal;

public class Timing {
  private static long beginTime = 0L;
  private static boolean enabled = false;
  private static BigDecimal duration = new BigDecimal(0);
  private static int count = 0;

  public static void begin() {
    if (!enabled) {
      return;
    }
    if (beginTime != 0) {
      throw new RuntimeException("Already started timing");
    }
    beginTime = System.nanoTime();
  }

  public static void end() {
    if (!enabled) {
      return;
    }
    if (beginTime == 0) {
      throw new RuntimeException("Timing not started");
    }
    duration = duration.add(new BigDecimal(System.nanoTime() - beginTime));
    beginTime = 0;
    count++;
  }

  public static void setEnabled(boolean enabled1) {
    enabled = enabled1;
  }

  public static BigDecimal getTime() {
      return duration;
  }

  public static int getCount() {
    return count;
  }

  public static void reset() {
      duration = new BigDecimal(0);
      count = 0;
  }
}