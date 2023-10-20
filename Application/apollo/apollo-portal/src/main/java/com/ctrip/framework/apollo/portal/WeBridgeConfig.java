package com.ctrip.framework.apollo.portal;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import webridge.common.utils.WeBridgeWebRequestUtils;

@Configuration
public class WeBridgeConfig {
    @Bean
    public WeBridgeWebRequestUtils getWebRequest() {
        final WeBridgeWebRequestUtils utils = new WeBridgeWebRequestUtils();
        return utils;
    }
}
