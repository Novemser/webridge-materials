package webridge.common.utils.pojo;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ApiExecution {
    public BigDecimal netAndDbTime, totTime;
    public final List<SQL> sql;
    public List<Map<String, Object>> aggregateStagesBreakDown;
    public List<Map<String, Object>> aggregateStatementsBreakDown;
    public int roundtrip;

    public ApiExecution() {
        netAndDbTime = new BigDecimal(0);
        totTime = new BigDecimal(0);
        sql = new ArrayList<>();
        aggregateStatementsBreakDown = new ArrayList<>();
        roundtrip = 0;
    }

    public BigDecimal getNetTime() {
        return netAndDbTime.subtract(getDbTime());
    }

    public BigDecimal getDbTime() {
        BigDecimal result = new BigDecimal(0);
        for (SQL each : sql) {
            result = result.add(each.time);
        }
        return result;
    }

    public BigDecimal getAppTime() {
        return totTime.subtract(netAndDbTime);
    }
}
