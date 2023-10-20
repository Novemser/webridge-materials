package sagan;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import webridge.common.utils.WeBridgeWebRequestUtils;

@Configuration
public class WeBridgeConfig {
    static final String EDIT_BLOG_POST_URL = "/admin/blog/(.*?)/edit";

    static final String EDIT_PROJECT_URL = "/admin/projects/\\d+";

    @Bean
    public WeBridgeWebRequestUtils getWebRequest() {
        final WeBridgeWebRequestUtils utils = new WeBridgeWebRequestUtils();
        utils.setRequestConsumer(req -> {
            String requestURI = req.getRequestURI();

        });
        return utils;
    }
}
