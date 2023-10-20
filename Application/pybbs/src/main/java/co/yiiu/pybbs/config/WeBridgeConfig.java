package co.yiiu.pybbs.config;

import webridge.storedprocedure.invocation.SPInvokeManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import webridge.common.utils.WeBridgeWebRequestUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Configuration
public class WeBridgeConfig {
    static final Pattern userNamePattern = Pattern.compile("/api/user/(.*?)$");
    @Bean
    public WeBridgeWebRequestUtils getWebRequest() {
        final WeBridgeWebRequestUtils utils = new WeBridgeWebRequestUtils();
        utils.setRequestConsumer(req -> {
            String requestURI = req.getRequestURI();
            Matcher matcher = userNamePattern.matcher(requestURI);
            if (matcher.find()) {
                String group = matcher.group(1);
                SPInvokeManager.storeParam("M_L_String__USER_NAME", group);
            }
        });
        return utils;
    }
}