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
public class AddCartTest {
    private final static int EXPECTED_PORT = Utils.EXPECTED_PORT;
    @Autowired
    private CompilerController compilerController;
    private static final Log logger = LogFactory.getLog(AddCartTest.class);

//    @Autowired
//    private RestTemplateBuilder builder;
//    private RestTemplate restTemplate;
//
//    @Before
//    public void setUp() {
//        restTemplate = builder.build();
//    }
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
//    public void testAddCartMultipleTimes() {
//        jdbcTemplate.execute("delete from SHOPPING_CART_ITEM where SHP_CART_ID in (select SHP_CART_ID from SHOPPING_CART where CUSTOMER_ID >= 0 AND CUSTOMER_ID <= 50002)");
//        jdbcTemplate.execute("delete from SHOPPING_CART where CUSTOMER_ID >= 0 AND CUSTOMER_ID <= 50002");
//        // warmup 5000
//        for (int i = 0; i < 15000; i++) {
//            testAddCart(i);
//        }
////        testAddCart(0);
//    }
//
//    public void testAddCart(int userId) {
//        String res = ShopizerClient.doAddCart(
//                String.format("http://localhost:%d/api/v1", EXPECTED_PORT),
//                1L,
//                userId + ".user",
//                "123"
//        );
//        if (res == null) throw new RuntimeException();
//
//        System.out.println("res:" + res);
//    }

    @Test
    public void testAddCart() {
        // using default id generator(disable global cache)
        final String path = "/home/shopizer/sm-shop/dump-data/api-input/AddCart/trace-[-1128134210].data";
//        // using TableIdGenerator

        final String encodedString = Base64.getEncoder().encodeToString(path.getBytes());
        final Object res = compilerController.compile(encodedString);
        logger.info(res.toString());
//        jdbcTemplate.execute("delete from SHOPPING_CART_ITEM where SHP_CART_ID in (select SHP_CART_ID from SHOPPING_CART where CUSTOMER_ID = 0)");
//        jdbcTemplate.execute("delete from SHOPPING_CART where CUSTOMER_ID = 0");
//        String res = ShopizerClient.doAddCart(
//                String.format("http://localhost:%d/api/v1", EXPECTED_PORT),
//                1L,
//                "0.user",
//                "123"
//        );
//        if (res == null) throw new RuntimeException();
//
//        System.out.println("res:" + res);
    }
}
