package com.salesmanager.test.shop;

import com.salesmanager.shop.application.ShopApplication;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import webridge.common.spring.controller.CompilerController;

import java.util.Base64;

@RunWith(SpringRunner.class)
@ContextConfiguration
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT, classes = {ShopApplication.class})
public class ProductTest {
    private final static int EXPECTED_PORT = Utils.EXPECTED_PORT;

//    @Value("{webridge.prefetch.enable}")
//    private boolean enablePrefetch = false;
//    private boolean enablePrefetch = false;
    @Autowired
    private CompilerController compilerController;
    private static final Log logger = LogFactory.getLog(ProductTest.class);

//    @Autowired
//    private RestTemplateBuilder builder;
//
//    private RestTemplate restTemplate;

//    @Before
//    public void setUp() {
//        restTemplate = builder.build();
//        if (enablePrefetch) AsyncPrefetcher.enable();
////        SPInvokeManager.setTestAsyncExecuteCallStmt(true);
//    }

//    @Test
//    public void testViewProductMultipleTimes() {
//        for (int i = 0; i < 20000; i++) {
//            testViewProduct();
//        }
//    }

//    @Test
//    public void testViewProduct() {
//        LocalDateTime now = LocalDateTime.now();
//        int nano = now.getNano();
//        System.out.println(nano);
//        final String uri = "http://localhost:" + EXPECTED_PORT + "/api/v1/products/1";
//        String res = restTemplate.getForObject(uri, String.class);
//        System.out.println(res);
//        if (res == null || res.isEmpty()) {
//            throw new RuntimeException();
//        }
//    }

//    @Transactional
//    @Rollback(value = false)
//    public void doGetProductTransactional(Long id) {
////        Thread.sleep(5000);
////        final Product product = productService.getById(id);
////        if (product.getId().equals(1)) {}
////        if (product == null) {
////            throw new RuntimeException("No product");
////        }
////        Set<ProductAvailability> availabilities = product.getAvailabilities();
////        System.out.println("Availabilities size:" + availabilities.size());
//    }

    @Test
    public void testViewProduct() throws Exception {
        final String path = "/home/shopizer/sm-shop/dump-data/api-input/ViewProduct/trace-[-1575114179].data";
        final String encodedString = Base64.getEncoder().encodeToString(path.getBytes());
        final Object res = compilerController.compile(encodedString);
        logger.info(res.toString());
//        System.startConcolic();
//        Long id = 1L;
//        System.symbolize(id);
////        if (id.equals(1L)) {
//            doGetProductTransactional(id);
////        }
//        System.weBridgeAnalysis(getClass().getClassLoader());
//        System.endConcolic();
    }

}
