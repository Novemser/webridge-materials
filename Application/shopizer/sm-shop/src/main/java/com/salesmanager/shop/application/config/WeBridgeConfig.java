package com.salesmanager.shop.application.config;

import com.alibaba.fastjson2.JSONObject;
import com.salesmanager.shop.store.security.JWTTokenUtil;
import webridge.storedprocedure.SPConfig;
import webridge.storedprocedure.invocation.SPInvokeManager;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import webridge.common.utils.BufferedServletRequestWrapper;
import webridge.common.utils.WeBridgeWebRequestUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Configuration
public class WeBridgeConfig {
    static final Pattern pattern1 = Pattern.compile("/auth/cart/(.*?)/checkout");
    static final Pattern pattern4 = Pattern.compile("/api/v1/products/(\\d+)");
    static final Pattern pattern5 = Pattern.compile("/api/v1/customers/(\\d+)/cart");
    static final Pattern patternGetCart = Pattern.compile("/api/v1/cart/(.*)");

    private static void extractAllParamsFromRequestToken(HttpServletRequest request) {
        // logic from com.salesmanager.shop.store.security.customer.JWTCustomerAuthenticationManager#attemptAuthentication
        String authorization = request.getHeader("Authorization");
        if (StringUtils.isEmpty(authorization)) return;
        String authToken = authorization.substring(7);
        if (StringUtils.isEmpty(authToken)) return;
        JWTTokenUtil util = new JWTTokenUtil();
        try {
            Field secretFld = JWTTokenUtil.class.getDeclaredField("secret");
            secretFld.setAccessible(true);
            secretFld.set(util, "aSecret");
            Field expirationFld = JWTTokenUtil.class.getDeclaredField("expiration");
            expirationFld.setAccessible(true);
            expirationFld.set(util, 6048000000L);
            String username = util.getUsernameFromToken(authToken);
            String paramName = SPConfig.REQUEST_TOKEN_PARAM_PREFIX + "username";
            SPInvokeManager.storeParam(paramName, username);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    private static void extractAllParamsFromRequestPath(HttpServletRequest request) {
        String uri = request.getRequestURI();
        SPInvokeManager.storeParam(SPConfig.REQUEST_PARAM_PREFIX + "uri", uri);

        Matcher matcher = pattern1.matcher(request.getRequestURI());
        if (matcher.find()) {
            assert matcher.groupCount() == 1;
            String code = matcher.group(1);
            SPInvokeManager.storeParam(SPConfig.REQUEST_PATH_PARAM_PREFIX + "code", code);
            SPInvokeManager.storeParam("M_L_String__cart_code", code);
            return;
        }
        matcher = pattern4.matcher(uri);
        if (matcher.find()) {
            assert matcher.groupCount() == 1;
            String productId = matcher.group(1);
            SPInvokeManager.storeParam("M_J_field_product_id_java_lang_Long_value", Integer.valueOf(productId));
            return;
        }
        matcher = pattern5.matcher(uri);
        if (matcher.find()) {
            assert matcher.groupCount() == 1;
            String customerId = matcher.group(1);
            SPInvokeManager.storeParam("M_J_field_cart_id_java_lang_Long_value", Integer.valueOf(customerId));
            return;
        }
        matcher = patternGetCart.matcher(uri);
        if (matcher.find()) {
            assert matcher.groupCount() == 1;
            String code = matcher.group(1);
            SPInvokeManager.storeParam(SPConfig.REQUEST_PATH_PARAM_PREFIX + "code", code);
            SPInvokeManager.storeParam("M_L_String__cart_code", code);
            return;
        }
    }

    @Bean
    public WeBridgeWebRequestUtils getWebRequest() {
        final WeBridgeWebRequestUtils utils = new WeBridgeWebRequestUtils();
        utils.setRequestConsumer(request -> {
            extractAllParamsFromRequestToken(request);
            extractAllParamsFromRequestPath(request);

            SPInvokeManager.storeParam("M_L_String__225", "0.user");
            SPInvokeManager.storeParam("M_Z_field_order_com_salesmanager_shop_model_order_v1_PersistableOrder_customerAgreement", false);
            SPInvokeManager.storeParam("M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity", 1);
            SPInvokeManager.storeParam("M_I_field_order_com_salesmanager_shop_model_order_v1_PersistableOrder_java_util_ArrayList_size", 0);
            SPInvokeManager.storeParam("M_L_String__order_com_salesmanager_shop_model_order_v1_PersistableOrder_com_salesmanager_shop_model_order_transaction_PersistablePayment_amount", 1.99);

            if (request instanceof BufferedServletRequestWrapper) {
                final BufferedServletRequestWrapper wrapper = (BufferedServletRequestWrapper) request;
                String requestBody = wrapper.getRequestBody();
                if (StringUtils.isEmpty(requestBody)) return;
                JSONObject jsonObject = JSONObject.parseObject(requestBody);
                if (jsonObject.containsKey("product")) {
                    SPInvokeManager.storeParam("M_J_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_java_lang_Long_value", jsonObject.getLongValue("product"));
                }
            }
        });
        return utils;
    }
}
