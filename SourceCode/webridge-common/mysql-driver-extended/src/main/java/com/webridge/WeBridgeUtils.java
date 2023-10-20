package com.webridge;

public abstract class WeBridgeUtils {
    private static final ThreadLocal<Boolean> ENTERING_SP_MANAGER_FLAG =
            ThreadLocal.withInitial(() -> false);

    public static boolean isInsideSpManager() {
        return ENTERING_SP_MANAGER_FLAG.get();
    }

    public static void enterSpManager() {
        ENTERING_SP_MANAGER_FLAG.set(true);
    }

    public static void leaveSpManager() {
        ENTERING_SP_MANAGER_FLAG.set(false);
    }
}
