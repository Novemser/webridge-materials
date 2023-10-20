/*
 * #%L
 * React API Starter
 * %%
 * Copyright (C) 2009 - 2017 Broadleaf Commerce
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
package com.mycompany.api;

import javax.sql.DataSource;

import org.broadleafcommerce.common.config.EnableBroadleafSiteRootAutoConfiguration;
import org.hibernate.id.enhanced.PooledLoOptimizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;

import webridge.storedprocedure.invocation.prefetch.AsyncPrefetcher;

/**
 * @author Elbert Bautista (elbertbautista)
 */
@SpringBootApplication
@EnableAutoConfiguration
public class ApiApplication implements CommandLineRunner {

    @Configuration
    @EnableBroadleafSiteRootAutoConfiguration
    public static class BroadleafFrameworkConfiguration {}

    @Override
    public void run(String... args) throws Exception {
        PooledLoOptimizer.REGENERATE = true;
        AsyncPrefetcher.setDataSource(dataSource);
        AsyncPrefetcher.enable();
    }

    @Autowired
    private DataSource dataSource;

    public static void main(String[] args) {
        SpringApplication.run(ApiApplication.class, args);
    }
}
