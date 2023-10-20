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
package com.mycompany.api.filter;

import webridge.utils.WBridgeParamUtils;
import org.apache.catalina.connector.Request;
import org.apache.catalina.core.StandardContext;
import org.apache.tomcat.util.descriptor.web.FilterMap;
import org.broadleafcommerce.common.security.service.ExploitProtectionService;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.PostConstruct;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

@Component("blAdjustFilterOrderFilter")
public class AdjustFilterOrderFilter extends OncePerRequestFilter implements Ordered {

  private static boolean FILTER_INITIALIZED = false;

  private final Map<String, Integer> filterPositionMapping;
  private final ExploitProtectionService exploitProtectionService;

  public AdjustFilterOrderFilter(ExploitProtectionService exploitProtectionService) {
    this.exploitProtectionService = exploitProtectionService;
    String[] definedOrderFilters = {
      "blAdjustFilterOrderFilter",
      "blBenchmarkTimingFilter",
      "blStoredProcedureControlFilter",
      "blFrontRecordingFilter", // recording should be after blStoredProcedureControlFilter since
                                // some additional sqls will be issued in
                                // blStoredProcedureControlFilter
      "characterEncodingFilter",
      "blRequestContextFilter",
      "blSecurityBasedIgnoreFilter",
      "openEntityManagerInViewFilter",
      "blStatelessSessionFilter",
      "blRequestFilter",
      "blEstablishSessionFilter",
      "hiddenHttpMethodFilter",
      "httpPutFormContentFilter",
      "requestContextFilter",
      "springSecurityFilterChain",
      "blPostRequestFilter",
      "blDeviceResolverRequestFilter",
      "blCustomerStateFilter",
      "blApiCustomerStateFilter",
      "blEntityManagerFindValidationFilter",
      "blURLHandlerFilter",
      "blCartStateFilter",
      "blGeolocationFilter",
      "blTranslationFilter",
      "Tomcat WebSocket (JSR356) Filter",
    };
    this.filterPositionMapping = new HashMap<>();
    for (int i = 0; i < definedOrderFilters.length; i++) {
      this.filterPositionMapping.put(definedOrderFilters[i], i);
    }
  }

  @Override
  public int getOrder() {
    return HIGHEST_PRECEDENCE;
  }

  @Override
  protected void doFilterInternal(
      HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
      throws ServletException, IOException {

    // we can disable xsrf check in test environment
    disableXSRF(request);

//    if (!FILTER_INITIALIZED) {
//      FILTER_INITIALIZED = true;
//      adjustFilterOrder(request);
//      System.out.println("Done adjusting filter order.");
//    }
    filterChain.doFilter(request, response);
  }

  // adjust the filter to a fix order.
  private void adjustFilterOrder(HttpServletRequest request) {
    final Request req;
    try {
      req = (Request) WBridgeParamUtils.unwrap(request);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    StandardContext context = (StandardContext) req.getWrapper().getParent();
    FilterMap[] filterMaps = context.findFilterMaps();

    FilterMap[] tmpMap = new FilterMap[filterMaps.length];
    System.arraycopy(filterMaps, 0, tmpMap, 0, filterMaps.length);
    for (FilterMap m : tmpMap) {
      if (m == null) break;
      if (!filterPositionMapping.containsKey(m.getFilterName())) {
        System.err.println("filter " + m.getFilterName() + " does not have position.");
        continue;
      }
      int pos = filterPositionMapping.get(m.getFilterName());
      filterMaps[pos] = m;
    }
  }

  private void disableXSRF(HttpServletRequest request) {
    try {
      // disable xsrfProtection in test environment
      if (request.getAttribute(exploitProtectionService.getCsrfTokenParameter()) == null) {
        final Field xsrfProtectionEnabledFld =
            exploitProtectionService.getClass().getDeclaredField("xsrfProtectionEnabled");
        xsrfProtectionEnabledFld.setAccessible(true);
        xsrfProtectionEnabledFld.set(exploitProtectionService, false);
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
