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
package com.mycompany.api;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.client.RestTemplate;
import webridge.common.spring.controller.CompilerController;

import java.util.Base64;

@RunWith(SpringRunner.class)
@ContextConfiguration
@ComponentScan({"org.broadleafcommerce.api.common", "webridge.common.spring"})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
public class TestCodpayment {
    private static final Log logger = LogFactory.getLog(TestCodpayment.class);

    @Autowired
    private CompilerController compilerController;

    @Autowired
    protected CatalogService catalogService;

    @Autowired
    private RestTemplateBuilder builder;

    private RestTemplate restTemplate;

    @Before
    public void init() {
        restTemplate = builder.build();
    }

    public String get(String uri) {
        HttpEntity<String> requestEntity = new HttpEntity<>("");
        ResponseEntity<String> responseEntity = restTemplate.exchange(uri, HttpMethod.GET, requestEntity, String.class);
        return responseEntity.getBody();
    }

    @Test
    public void testCodPaymentOnce() throws Exception {
        final String path = "/home/broadleaf-react-benchmark/api/dump-data/api-input/CodPayment/trace-[1773745809].data";
        final String encodedString = Base64.getEncoder().encodeToString(path.getBytes());
        final Object res = compilerController.compile(encodedString);
        logger.info(res.toString());
    }

//    @Test
//    public void testCodPaymentMultipleTimes() throws Exception {
//        String res = BroadleafClient.doAddCart("http://localhost:3000"
//                , 1L, "1.user", "123");
//        System.out.println(res);
//    }
}
