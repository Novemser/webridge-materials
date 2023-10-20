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
package webench.meta.perf.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class ApiDbStatistics {
  public final List<SQL> sql;
  public int roundtrip;

  public ApiDbStatistics() {
    sql = new ArrayList<>();
    roundtrip = 0;
  }

  public Long getDbTime() {
    BigDecimal result = new BigDecimal(0);
    for (SQL each : sql) {
      result = result.add(each.time);
    }
    return result.multiply(new BigDecimal(1_000_000)).longValue();
  }
}
