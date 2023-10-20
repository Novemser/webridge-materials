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
package utils.pojo;

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
