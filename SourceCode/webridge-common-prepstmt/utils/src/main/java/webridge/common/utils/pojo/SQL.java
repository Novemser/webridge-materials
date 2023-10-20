package webridge.common.utils.pojo;

import java.math.BigDecimal;

public class SQL {
    public String sqlString;
    public BigDecimal time;

    public SQL() {
        sqlString = "";
        time = new BigDecimal(0);
    }

    public SQL(String sqlString, BigDecimal time) {
        this.sqlString = sqlString;
        this.time = time;
    }

    @Override
    public String toString() {
        return "SQL{" +
                "sqlString='" + sqlString + '\'' +
                ", time=" + time +
                '}';
    }
}
