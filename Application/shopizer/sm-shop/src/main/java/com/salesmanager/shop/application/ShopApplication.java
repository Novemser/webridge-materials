package com.salesmanager.shop.application;

import webridge.storedprocedure.invocation.prefetch.AsyncPrefetcher;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import javax.sql.DataSource;


@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class ShopApplication extends SpringBootServletInitializer implements CommandLineRunner {
    private static final Log logger = LogFactory.getLog(ShopApplication.class);

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ShopApplication.class);
    }
	
    public static void main(String[] args) {
        SpringApplication.run(ShopApplication.class, args);
    }

    @Autowired
    private DataSource dataSource;

    @Override
    public void run(String... args) throws Exception {
        AsyncPrefetcher.setDataSource(dataSource);
//        AsyncPrefetcher.enable();
    }
}
