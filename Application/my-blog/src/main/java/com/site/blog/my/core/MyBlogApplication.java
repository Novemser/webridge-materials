package com.site.blog.my.core;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Bean;
import webridge.common.utils.WeBridgeWebRequestUtils;

/**
 *
 */
@MapperScan("com.site.blog.my.core.dao")
@ComponentScan({"com.site.blog", "webridge.common.spring"})
@SpringBootApplication
public class MyBlogApplication {
    public static void main(String[] args) {
        SpringApplication.run(MyBlogApplication.class, args);
    }

    @Bean
    public WeBridgeWebRequestUtils getWebRequest() {
        final WeBridgeWebRequestUtils utils = new WeBridgeWebRequestUtils();
        return utils;
    }
}
