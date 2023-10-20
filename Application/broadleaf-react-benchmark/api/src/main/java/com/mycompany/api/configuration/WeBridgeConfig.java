/*
 * #%L
 * React API Starter
 * %%
 * Copyright (C) 2009 - 2022 Broadleaf Commerce
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
package com.mycompany.api.configuration;

import com.alibaba.fastjson2.JSONObject;
import webridge.storedprocedure.invocation.SPInvokeManager;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.broadleafcommerce.authapi.domain.AccessTokenAuthentication;
import org.broadleafcommerce.authapi.domain.ApiUserDTO;
import org.broadleafcommerce.authapi.service.AuthenticationTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.concurrent.ConcurrentTaskExecutor;
import org.springframework.scheduling.concurrent.DefaultManagedTaskExecutor;
import webridge.common.utils.WeBridgeWebRequestUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import webridge.common.utils.BufferedServletRequestWrapper;

@Configuration
public class WeBridgeConfig {
    static final Pattern pattern1 = Pattern.compile("/cart/(\\d+)/items/(\\d+)");

    static final Pattern pattern2 = Pattern.compile("/cart/(\\d+)/item");

    static final Pattern pattern3 = Pattern.compile("/shipping/(\\d+)/group/(\\d+)");

    static final Pattern pattern4 = Pattern.compile("/product/(.*?)/(.*?)$");

    static final Pattern pattern5 = Pattern.compile("/ratings/(\\d)");

    @Autowired
    protected AuthenticationTokenService authenticationTokenService;

    @Bean
    public WeBridgeWebRequestUtils getUtils() {
        WeBridgeWebRequestUtils utils = new WeBridgeWebRequestUtils();
        utils.setRequestConsumer(request -> {
            String authorization = request.getHeader("Authorization");
            if (authorization != null) {
                String authToken = authorization.substring(7);
                AccessTokenAuthentication authRequest = new AccessTokenAuthentication(authToken);
                String token = authRequest.getToken();
                Claims claims = Jwts.parser().setSigningKey("blAccessSecret")
                        .parseClaimsJws(token)
                        .getBody();
                SPInvokeManager.storeParam("M_L_String__user_name", claims.getSubject());
            }

            final String requestURI = request.getRequestURI();
            SPInvokeManager.storeParam("M_L_String__req_uri", requestURI);
            Matcher matcher = pattern4.matcher(requestURI);
            if (matcher.find()) {
                String category = matcher.group(1);
                String product = matcher.group(2);
                SPInvokeManager.storeParam("M_L_String__product_key", product);
                SPInvokeManager.storeParam("M_L_String__product_category", category);
            }

            if (request instanceof BufferedServletRequestWrapper) {
                final BufferedServletRequestWrapper wrapper = (BufferedServletRequestWrapper) request;
                String requestBody = wrapper.getRequestBody();
                if (StringUtils.isEmpty(requestBody)) return;
                JSONObject jsonObject = JSONObject.parseObject(requestBody);
                if (jsonObject.containsKey("productId")) {
                    SPInvokeManager.storeParam("M_J_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Long_value", jsonObject.getLongValue("productId"));
                }
                SPInvokeManager.storeParam("M_Z_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Boolean_value", false);
            }
        });
        return utils;
    }

    @Bean
    public TaskExecutor getTaskScheduler() {
        return new ConcurrentTaskExecutor();
    }
}
