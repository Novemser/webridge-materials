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
package webridge.utils;

import com.broadleafcommerce.rest.api.wrapper.AddressWrapper;
import com.broadleafcommerce.rest.api.wrapper.FulfillmentGroupWrapper;
import com.broadleafcommerce.rest.api.wrapper.OrderItemWrapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Lists;
import webridge.storedprocedure.SPConfig;
import webridge.storedprocedure.invocation.SPInvokeManager;
import org.apache.catalina.connector.RequestFacade;
import org.apache.catalina.connector.ResponseFacade;
import org.apache.commons.lang3.ClassUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Triple;
import org.broadleafcommerce.authapi.domain.ApiUserDTO;
import org.broadleafcommerce.authapi.service.AuthenticationTokenService;
import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.common.rest.api.wrapper.BaseWrapper;
import org.springframework.util.ReflectionUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponseWrapper;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class WBridgeParamUtils {
  private static final Map<String, ApiUserDTO> userDTOMap = new ConcurrentHashMap<>();
  private static final Set<String> enableSpApiList = new HashSet<>();

  public static void addEnableSpApi(String apiName) {
    enableSpApiList.add(apiName);
  }

  public static List<Triple<String, String, String>> SP_URI_LIST =
      Lists.newArrayList(
          Triple.of("/api/v1/cart/[0-9]+/item?", "POST", "Add"),
          Triple.of("/api/v1/cart?", "GET", "GetCart"),
          Triple.of("/api/v1/cart/[0-9]+/items/[0-9]+", "PUT", "UpdateQuantity"),
          Triple.of("/api/v1/cart/[0-9]+/items/[0-9]+", "DELETE", "Remove"),
          Triple.of("/api/v1/shipping/[0-9]+/group/[0-9]+", "PATCH", "UpdateFulfillmentGroup"),
          Triple.of("/api/v1/cart/checkout/customer-payment", "POST", "SaveNewCustomerPayment"),
          Triple.of("/api/v1/seo", "GET", "Seo"),
          Triple.of("/api/v1/breadcrumbs", "GET", "Breadcrumbs"),
          Triple.of("/api/v1/related-products", "GET", "RelatedProducts"),
          Triple.of(
              "/api/v1/catalog/product/\\w+/\\w+",
              "GET",
              "ItemDetails"),
          Triple.of("/api/v1/ratings/[0-9]", "GET", "Rating"),
          Triple.of("/api/v1/cart/checkout/cod/complete", "POST", "CodPayment"));

  public static String getSPDefApi(HttpServletRequest request) {
    String api = null;
    for (Triple<String, String, String> t : SP_URI_LIST) {
      if (request.getRequestURI().matches(t.getLeft())
          && request.getMethod().equals(t.getMiddle())
          && enableSpApiList.contains(t.getRight())) {
        if (!request.getRequestURI().matches("/api/v1/seo")
            || (request.getRequestURI().matches("/api/v1/seo")
                && request.getParameter("entityType").matches("CATEGORY"))
            || (request.getRequestURI().matches("/api/v1/breadcrumbs")
                && request.getParameter("entityType").matches("CATEGORY"))) {
          api = t.getRight();
          break;
        }
      }
    }
    return api;
  }

  public static boolean isSpURI(HttpServletRequest request) {
    return !StringUtils.isEmpty(getSPDefApi(request));
  }

  public static boolean prepareSPParam(
      BufferedServletRequestWrapper request,
      AuthenticationTokenService authenticationTokenService) {
    String api = getSPDefApi(request);
    if (StringUtils.isEmpty(api)) return false;

    // SPConfig.REQUEST_PARAM_PREFIX
    // parameters from request parameters: quantity, priceOrder, etc.
    extractAllParamsFromRequestParamMap(request);
    // SPConfig.REQUEST_PATH_PARAM_PREFIX
    // parameters from request path placeholder: cartId, itemId, etc.
    extractAllParamsFromRequestPath(request);
    // SPConfig.REQUEST_HEADER_PARAM_PREFIX
    // parameters from request header: X-Locale, etc.
    extractAllParamsFromRequestHeader(request);
    // SPConfig.REQUEST_TOKEN_PARAM_PREFIX
    // parameters that parsed from request token
    // ApiUserDTO: username, userId, isCrossAppAuth, role
    extractAllParamsFromRequestToken(request, authenticationTokenService);
    // SPConfig.REQUEST_BODY_PARAM_PREFIX
    // parameters from request body: OrderItemWrapper
    extractAllParamsFromRequestBody(request);

    // String[] sessionParams =
    //     new String[] {
    //       "SESSION_SPRING_SECURITY_CONTEXT_FIELD_authentication_FIELD_principal_FIELD_username",
    //       "SESSION_SPRING_SECURITY_CONTEXT_FIELD_authentication",
    //       "SESSION__blc_anonymousCustomerMerged",
    //       "SESSION__blc_lastPublishedEventUsername",
    //       "SESSION_blLocale_FIELD_javaLocale",
    //       "SESSION_blLocale_FIELD_localeCode"
    //     };
    // Arrays.stream(sessionParams)
    //     .forEach(
    //         p -> {
    //           boolean paramExtracted = extractParamFromSession(request.getSession(false), p);
    //           if (!paramExtracted) {
    //             System.err.println("[ Warning ] parameter " + p + " is not in session.");
    //           }
    //         });
    return true;
  }

  private static void extractAllParamsFromRequestParamMap(HttpServletRequest request) {
    Map<String, String[]> paramMap = request.getParameterMap();
    paramMap.forEach(
        (k, v) -> {
          String paramKey = SPConfig.REQUEST_PARAM_PREFIX + k;
          if (v == null || v.length == 0) {
            SPInvokeManager.storeParam(paramKey, null);
          } else if (v.length == 1) {
            SPInvokeManager.storeParam(paramKey, v[0]);
          } else {
            throw new RuntimeException("Unexpected parameter values");
          }
        });
  }

  static final Pattern pattern1 = Pattern.compile("/cart/(\\d+)/items/(\\d+)");

  static final Pattern pattern2 = Pattern.compile("/cart/(\\d+)/item");

  static final Pattern pattern3 = Pattern.compile("/shipping/(\\d+)/group/(\\d+)");

  static final Pattern pattern4 = Pattern.compile("/product/(.*?)/(.*?)$");

  static final Pattern pattern5 = Pattern.compile("/ratings/(\\d)");

  // it's not easy to port the logic of parsing path variables (in
  // org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping#handleMatch)
  // so we handle them case by case
  private static void extractAllParamsFromRequestPath(BufferedServletRequestWrapper request) {
    String uri = request.getRequestURI();
    SPInvokeManager.storeParam(SPConfig.REQUEST_PARAM_PREFIX + "uri", uri);

    Matcher matcher = pattern1.matcher(request.getRequestURI());
    if (matcher.find()) {
      assert matcher.groupCount() == 2;
      long cartId = Long.parseLong(matcher.group(1));
      long itemId = Long.parseLong(matcher.group(2));
      SPInvokeManager.storeParam(SPConfig.REQUEST_PATH_PARAM_PREFIX + "cartId", cartId);
      SPInvokeManager.storeParam(SPConfig.REQUEST_PATH_PARAM_PREFIX + "itemId", itemId);
      return;
    }

    matcher = pattern2.matcher(request.getRequestURI());
    if (matcher.find()) {
      assert matcher.groupCount() == 1;
      long cartId = Long.parseLong(matcher.group(1));
      SPInvokeManager.storeParam(SPConfig.REQUEST_PATH_PARAM_PREFIX + "cartId", cartId);
      return;
    }

    matcher = pattern3.matcher(request.getRequestURI());
    if (matcher.find()) {
      assert matcher.groupCount() == 2;
      long cartId = Long.parseLong(matcher.group(1));
      long fulfillmentGroupId = Long.parseLong(matcher.group(2));
      SPInvokeManager.storeParam(SPConfig.REQUEST_PATH_PARAM_PREFIX + "cartId", cartId);
      SPInvokeManager.storeParam(
          SPConfig.REQUEST_PATH_PARAM_PREFIX + "fulfillmentGroupId", fulfillmentGroupId);
      return;
    }

    matcher = pattern4.matcher(request.getRequestURI());
    if (matcher.find()) {
      String category = matcher.group(1);
      String product = matcher.group(2);
      SPInvokeManager.storeParam(SPConfig.REQUEST_PATH_PARAM_PREFIX + "category", category);
      SPInvokeManager.storeParam(SPConfig.REQUEST_PATH_PARAM_PREFIX + "product", product);
      return;
    }

    matcher = pattern5.matcher(request.getRequestURI());
    if (matcher.find()) {
      long itemId = Long.parseLong(matcher.group(1));
      SPInvokeManager.storeParam(
          SPConfig.REQUEST_PATH_PARAM_PREFIX + "itemId", String.valueOf(itemId));
      return;
    }
  }

  private static void extractAllParamsFromRequestHeader(BufferedServletRequestWrapper request) {
    String[] argList = new String[] {"X-Locale"};
    Arrays.stream(argList)
        .forEach(
            arg -> {
              String val = request.getHeader(arg);
              String varName = arg.replace('-', '_').replace('[', '_').replace(']', '_');
              SPInvokeManager.storeParam(SPConfig.REQUEST_HEADER_PARAM_PREFIX + varName, val);
            });
  }

  private static void extractAllParamsFromRequestBody(BufferedServletRequestWrapper request) {
    if (StringUtils.isEmpty(request.getRequestBody())) return;
    if (request.getRequestURI().contains("/cart/checkout")) {
      AddressWrapper addressWrapper = buildAddressWrapper(request, false);
      extractParamsFromObject(SPConfig.REQUEST_BODY_PARAM_PREFIX, addressWrapper);
    } else if (request.getRequestURI().contains("/cart")) {
      OrderItemWrapper itemWrapper = buildOrderItemWrapper(request, false);
      extractParamsFromObject(SPConfig.REQUEST_BODY_PARAM_PREFIX, itemWrapper);
    } else if (request.getRequestURI().contains("/shipping")) {
      FulfillmentGroupWrapper fulfillmentGroupWrapper =
          buildFulfillmentGroupWrapper(request, false);
      extractParamsFromObject(SPConfig.REQUEST_BODY_PARAM_PREFIX, fulfillmentGroupWrapper);
    }
  }

  private static void extractAllParamsFromRequestToken(
      HttpServletRequest request, AuthenticationTokenService authenticationTokenService) {
    // logic from
    // org.broadleafcommerce.authapi.filter.AccessTokenAuthenticationFilter#attemptAuthentication
    // and org.broadleafcommerce.authapi.provider.AccessTokenAuthenticationProvider#retrieveUser
    String authToken = request.getHeader("Authorization").substring(7);
    if (StringUtils.isEmpty(authToken)) return;

    final ApiUserDTO dto =
        userDTOMap.compute(
            authToken,
            (s, apiUserDTO) -> {
              if (apiUserDTO == null) return authenticationTokenService.parseAccessToken(s);
              return apiUserDTO;
            });
    extractParamsFromObject(SPConfig.REQUEST_TOKEN_PARAM_PREFIX, dto);
  }

  // recursively extract primitive or string fields
  private static void extractParamsFromObject(final String paramPrefix, Object obj) {
    ReflectionUtils.doWithFields(
        obj.getClass(),
        field -> {
          field.setAccessible(true);
          Object fldVal = ReflectionUtils.getField(field, obj);
          String paramName = paramPrefix + SPConfig.FIELD_SEPARATOR + field.getName();
          if (ClassUtils.isPrimitiveOrWrapper(field.getType()) || field.getType() == String.class) {
            SPInvokeManager.storeParam(paramName, fldVal);
          } else {
            // For an object type, sp can only check whether it is null or not.
            // If it is not null, the actual value is not of interest and is only a placeholder,
            // which is 1 here.
            SPInvokeManager.storeParam(paramName, fldVal == null ? null : 1);
            if (fldVal != null) {
              extractParamsFromObject(paramName, fldVal);
            }
          }
        },
        // some other object type (e.g., Money, BigDecimal) need special care
        field ->
            !Modifier.isStatic(field.getModifiers())
                && (ClassUtils.isPrimitiveOrWrapper(field.getType())
                    || field.getType() == String.class
                    || BaseWrapper.class.isAssignableFrom(field.getType())
                    || field.getType() == List.class));
    ReflectionUtils.doWithFields(obj.getClass(), field -> {
      field.setAccessible(true);
      Money fldVal = (Money) ReflectionUtils.getField(field, obj);
      String paramName = paramPrefix + SPConfig.FIELD_SEPARATOR + field.getName();
      if (fldVal == null) {
        SPInvokeManager.storeParam(paramName, 0);
      } else {
        SPInvokeManager.storeParam(paramName, fldVal.doubleValue());
      }
    }, field -> field.getType() == Money.class);
  }

  public static OrderItemWrapper buildOrderItemWrapper(
      ServletRequest request, boolean markSymbolic) {
    ObjectMapper mapper = new ObjectMapper();
    try {
      OrderItemWrapper itemWrapper =
          mapper.readValue(request.getInputStream(), OrderItemWrapper.class);
      if (markSymbolic) {
//        Debug.makeFieldsSymbolic(SPConfig.REQUEST_BODY_PARAM_PREFIX, itemWrapper);
      }
      return itemWrapper;
    } catch (IOException e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
  }

  public static FulfillmentGroupWrapper buildFulfillmentGroupWrapper(
      ServletRequest request, boolean markSymbolic) {
    ObjectMapper mapper = new ObjectMapper();
    try {
      FulfillmentGroupWrapper wrapper =
          mapper.readValue(request.getInputStream(), FulfillmentGroupWrapper.class);
      if (markSymbolic) {
//        Debug.makeFieldsSymbolic(SPConfig.REQUEST_BODY_PARAM_PREFIX, wrapper);
      }
      return wrapper;
    } catch (IOException e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
  }

  public static AddressWrapper buildAddressWrapper(ServletRequest request, boolean markSymbolic) {
    ObjectMapper mapper = new ObjectMapper();
    try {
      AddressWrapper wrapper = mapper.readValue(request.getInputStream(), AddressWrapper.class);
      if (markSymbolic) {
//        Debug.makeFieldsSymbolic(SPConfig.REQUEST_BODY_PARAM_PREFIX, wrapper);
      }
      return wrapper;
    } catch (IOException e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
  }

  // Ideally, these two functions should always return true when executed here.
  // But as Broadleaf frontend will send more than one request to get cart,
  // and we only consider requests with authorization header, and onlyIfExists is true now
  public static boolean shouldCollectInputThisTime(HttpServletRequest req) {
    if (!WBridgeParamUtils.isSpURI(req)) {
      return false;
    }

    if (req.getRequestURI().matches("/api/v1/cart") && req.getMethod().equals("GET")) {
      final String auth = req.getHeader("Authorization");
      return auth != null
          && auth.startsWith("Bearer ")
          && req.getParameter("onlyIfExists").equals("false");
    }
    return true;
  }

  public static boolean shouldUseSpThisTime(HttpServletRequest req) {
    return shouldCollectInputThisTime(req);
  }

  public static BufferedServletRequestWrapper bufferRequestBody(HttpServletRequest request)
      throws Exception {
    if (request instanceof BufferedServletRequestWrapper)
      return (BufferedServletRequestWrapper) request;
    final ServletRequest unwrapReq = WBridgeParamUtils.unwrap(request);
    BufferedServletRequestWrapper requestWrapper =
        new BufferedServletRequestWrapper((HttpServletRequest) unwrapReq);
    // force parse parameters
    requestWrapper.getParameter("productId");
    return requestWrapper;
  }

  public static ServletRequest unwrap(ServletRequest wrapper) throws Exception {
    if (wrapper instanceof HttpServletRequestWrapper) {
      return unwrap(((HttpServletRequestWrapper) wrapper).getRequest());
    } else if (wrapper instanceof RequestFacade) {
      final Field response = wrapper.getClass().getDeclaredField("request");
      response.setAccessible(true);
      return (ServletRequest) response.get(wrapper);
    }
    return wrapper;
  }

  public static ServletResponse unwrap(ServletResponse wrapper) throws Exception {
    if (wrapper instanceof HttpServletResponseWrapper) {
      return unwrap(((HttpServletResponseWrapper) wrapper).getResponse());
    } else if (wrapper instanceof ResponseFacade) {
      final Field response = wrapper.getClass().getDeclaredField("response");
      response.setAccessible(true);
      return (ServletResponse) response.get(wrapper);
    }
    return wrapper;
  }
}
