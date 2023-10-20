/*
 * #%L
 * React API Starter
 * %%
 * Copyright (C) 2009 - 2020 Broadleaf Commerce
 * %%
 * Broadleaf Commerce React Starter
 *
 * Written in 2017 by Broadleaf Commerce info@broadleafcommerce.com
 *
 * To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
 * You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
 *
 * Please Note - The scope of CC0 Public Domain Dedication extends to Broadleaf Commerce React Starter demo application alone. Linked libraries (including all Broadleaf Commerce Framework libraries) are subject to their respective licenses, including the requirements and restrictions specified therein.
 * #L%
 */
package webench.meta.perf;

import webench.meta.perf.pojo.ApiDbStatistics;
import webench.meta.perf.pojo.SQL;
import java.sql.*;

public class DBTestingUtils {

  public static ApiDbStatistics getDbSummary(Connection conn, boolean usingSp) throws SQLException {
    final ApiDbStatistics apiDbStatistics = new ApiDbStatistics();
    PreparedStatement ps =
        conn.prepareStatement(
            "SELECT TRUNCATE(TIMER_WAIT/1000000000,6) as Duration, SQL_TEXT FROM performance_schema.events_statements_history_long order by TIMER_START");
    ResultSet rs = ps.executeQuery();
    boolean insideApiBlock = false;
    boolean insideSp = false;
    while (rs.next()) {
      final String sql = rs.getString("SQL_TEXT");
      if (sql == null) continue;
      if (sql.startsWith(BEGIN_API_STR)) {
        insideApiBlock = true;
        continue;
      } else if (sql.startsWith(END_API_STR)) {
        insideApiBlock = false;
        break;
      }

      if (insideApiBlock) {
        if (!usingSp || !insideSp) {
          apiDbStatistics.sql.add(new SQL(sql, rs.getBigDecimal("Duration")));
          apiDbStatistics.roundtrip++;
        }
        if (sql.startsWith("call ")) {
          insideSp = true;
        } else if (sql.startsWith("SELECT QUERY_ID")) {
          insideSp = false;
        }
      }
    }
    return apiDbStatistics;
  }

  static final String BEGIN_API_STR = "SELECT 'BEGIN_API";
  static final String END_API_STR = "SELECT 'END_API";

  public static void truncateProfilingLog(Connection conn) throws SQLException {
    PreparedStatement ps1 =
        conn.prepareStatement("TRUNCATE TABLE performance_schema.events_statements_history_long");
    ps1.execute();
    ps1.close();
    PreparedStatement ps2 =
        conn.prepareStatement("TRUNCATE TABLE performance_schema.events_stages_history_long");
    ps2.execute();
    ps2.close();
  }

  public static void markBegin(Connection conn, int counter) throws SQLException {
    PreparedStatement ps = conn.prepareStatement(String.format(BEGIN_API_STR + "%d'", counter));
    ps.execute();
    ps.close();
  }

  public static void markEnd(Connection conn, int counter) throws SQLException {
    PreparedStatement ps = conn.prepareStatement(String.format(END_API_STR + "%d'", counter));
    ps.execute();
    ps.close();
  }

  public static void enableMysqlProfiling(Connection conn) throws SQLException {
    PreparedStatement ps1 =
        conn.prepareStatement(
            "UPDATE performance_schema.setup_instruments "
                + "SET ENABLED = 'YES', TIMED = 'YES' WHERE NAME LIKE '%statement/%'");
    ps1.execute();
    ps1.close();
    PreparedStatement ps2 =
        conn.prepareStatement(
            "UPDATE performance_schema.setup_instruments "
                + "SET ENABLED = 'YES', TIMED = 'YES' WHERE NAME LIKE '%stage/%'");
    ps2.execute();
    ps2.close();
    PreparedStatement ps3 =
        conn.prepareStatement(
            "UPDATE performance_schema.setup_consumers "
                + "SET ENABLED = 'YES' WHERE NAME LIKE '%events_statements_%'");
    ps3.execute();
    ps3.close();
    PreparedStatement ps4 =
        conn.prepareStatement(
            "UPDATE performance_schema.setup_consumers "
                + "SET ENABLED = 'YES' WHERE NAME LIKE '%events_stages_%'");
    ps4.execute();
    ps4.close();
  }
}
