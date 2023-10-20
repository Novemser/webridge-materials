package com.salesmanager.test.shop;


import com.salesmanager.shop.application.ShopApplication;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.client.RestTemplate;
import webridge.common.spring.controller.CompilerController;

import java.util.Base64;

@RunWith(SpringRunner.class)
@ContextConfiguration
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT, classes = {ShopApplication.class})
public class PurchaseTest {
    private final static int EXPECTED_PORT = Utils.EXPECTED_PORT;

    @Autowired
    private RestTemplateBuilder builder;

    private RestTemplate restTemplate;

    @Before
    public void setUp() {
        restTemplate = builder.build();
    }

    @Autowired
    private JdbcTemplate jdbcTemplate;

//    @Test
//    public void testPurchaseMultipleTimes() {
//        jdbcTemplate.execute("delete from SHOPPING_CART_ITEM where SHP_CART_ID in (select SHP_CART_ID from SHOPPING_CART where CUSTOMER_ID >= 0 AND CUSTOMER_ID <= 50002)");
//        jdbcTemplate.execute("delete from SHOPPING_CART where CUSTOMER_ID >= 0 AND CUSTOMER_ID <= 50002");
//
//        for (int i = 1; i < 5001; i++) {
//            try {
//                String res = ShopizerClient.doPurchaseProduct(
//                        String.format("http://localhost:%d/api/v1", EXPECTED_PORT),
//                        1L,
//                        i + ".user",
//                        "123"
//                );
//            } catch (Exception ignored) {}
////            if (res == null) throw new RuntimeException();
//        }
//    }
    @Autowired
    private CompilerController compilerController;

    private static final Log logger = LogFactory.getLog(PurchaseTest.class);

    @Test
    public void testPurchase() {
        // using default id generator(disable global cache)
        final String path = "/home/shopizer/sm-shop/dump-data/api-input/Purchase/trace-[1510218228].data";

        final String encodedString = Base64.getEncoder().encodeToString(path.getBytes());
        final Object res = compilerController.compile(encodedString);
        logger.info(res.toString());
//        jdbcTemplate.execute("delete from SHOPPING_CART_ITEM where SHP_CART_ID in (select SHP_CART_ID from SHOPPING_CART where CUSTOMER_ID >= 0 AND CUSTOMER_ID <= 5002)");
//        jdbcTemplate.execute("delete from SHOPPING_CART where CUSTOMER_ID >= 0 AND CUSTOMER_ID <= 5002");

//        jdbcTemplate.execute("delete from SHOPPING_CART_ITEM where SHP_CART_ID in (select SHP_CART_ID from SHOPPING_CART where CUSTOMER_ID = 0)");
//        final String uri = "http://localhost:" + EXPECTED_PORT + "/api/v1/products/1";
//        String res = restTemplate.getForObject(uri, String.class);
//        if (res == null || res.isEmpty()) {
//            throw new RuntimeException();
//        }
//        System.out.println(res);
//        System.out.println("get product successfully");

//        String res = ShopizerClient.doPurchaseProduct(
//                String.format("http://localhost:%d/api/v1", EXPECTED_PORT),
//                1L,
//                "1.user",
//                "123"
//        );
//        if (res == null) throw new RuntimeException();
//
//        System.out.println("add item and purchase res:" + res);
    }
}
