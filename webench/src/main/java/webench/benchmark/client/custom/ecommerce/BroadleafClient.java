package webench.benchmark.client.custom.ecommerce;

import webench.benchmark.client.StatefulClientContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListSet;

import org.apache.commons.lang3.tuple.Pair;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpMessage;
import org.apache.http.StatusLine;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

public class BroadleafClient extends ECommerceClient {
  private final String HOST;
  private final String LOGIN_URL;
  private final String CREATE_CART_URL;
  private final String SHOW_CART_URL;
  private final String ADD_ITEM_CART_URL;
  private final String REMOVE_ITEM_URL;
  private final String UPDATE_QUANTITY_URL;
  private final String SEO_URL;
  private final String BREADCRUMBS_URL;
  private final String RELATEDPRODUCTS_URL;
  private final String GET_ITEM_DETAILS_URL;
  private final String RATING_URL;
  private final String CHECKOUT_COD;

  private static final Logger logger = LogManager.getLogger();
  // each user should have a login state
  // if the user does not have a login state, create one and perform login, then store the
  // credential in memory
  private static final Map<Integer, StatefulClientContext> userContext = new ConcurrentHashMap<>();

  static {
    //    Configurator.setLevel(logger.getName(), Level.WARN);
  }

  public BroadleafClient(String webHost) {
    HOST = webHost;
    LOGIN_URL = HOST + "/api/login";
    CREATE_CART_URL = HOST + "/api/cart?onlyIfExists=false"; // GET {cartId}
    SHOW_CART_URL = HOST + "/api/cart?onlyIfExists=true"; // GET {cartId}
    ADD_ITEM_CART_URL = HOST + "/api/cart/%d/item?isUpdateRequest=false"; // POST {cartId}
    REMOVE_ITEM_URL = HOST + "/api/cart/%d/items/%d"; // DELETE {cartId}{itemId}
    UPDATE_QUANTITY_URL =
        HOST + "/api/cart/%d/items/%d?quantity=%d"; // PUT {cartId}{itemId}{quantity}
    SEO_URL = HOST + "/api/seo?entityType=CATEGORY&entityURI=%2Fmens"; // SEO
    BREADCRUMBS_URL =
        HOST + "/api/breadcrumbs?entityURI=%2Fhot-sauces&entityType=CATEGORY"; // Breadcrumbs
    RELATEDPRODUCTS_URL =
        HOST
            + "/api/related-products?quantity=3&type=FEATURED&categoryKey=hot-sauces&productKey&includePromotionMessages=true"; // RelatedProducts
    GET_ITEM_DETAILS_URL =
        HOST + "/api/catalog/product/%s/%s?includePromotionMessages=%b"; // ItemDetails
    RATING_URL = HOST + "/api/ratings/%d?ratingType=PRODUCT"; // Rating
    CHECKOUT_COD = HOST + "/api/cart/checkout/cod/complete?cartId=%d";
  }

  public static String doAddCart(String host, Long productId, String userName, String password) {
    final BroadleafClient broadleafClient = new BroadleafClient(host);
    final StatefulClientContext context = new StatefulClientContext(userName, password);
    broadleafClient.initializeUserContext(context);
    return broadleafClient.addItemToCart(productId, context).toString();
  }

  private void buildHeader(HttpMessage message, String referer, StatefulClientContext context) {
    message.setHeader("Accept", "*/*");
    message.setHeader("Accept-Encoding", "gzip, deflate, br");
    message.setHeader("Accept-Language", "zh-CN,zh;q=0.9,en;q=0.8");
    message.setHeader("Connection", "keep-alive");
    // cookie here
    message.setHeader("Content-Type", "application/json");
    message.setHeader("Host", "localhost:3000");
    message.setHeader("origin", HOST);
    message.setHeader("Referer", HOST + referer);
    message.setHeader("Sec-Fetch-Dest", "empty");
    message.setHeader("Sec-Fetch-Mode", "cors");
    message.setHeader("Sec-Fetch-Site", "same-origin");
    message.setHeader(
        "User-Agent",
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36");
    message.setHeader("X-Locale", "en-US");
    final Pair<String, String> authorizationHeader = context.getAuthorizationHeader();
    if (authorizationHeader != null) {
      message.setHeader(authorizationHeader.getKey(), authorizationHeader.getValue());
    } else assert referer.equals("login");
  }

  private void login(StatefulClientContext context) {
    CookieStore cookieStore = new BasicCookieStore();
    final HttpClientContext clientContext = context.getClientContext();
    clientContext.setCookieStore(cookieStore);

    HttpPost httppost = new HttpPost(LOGIN_URL);
    buildHeader(httppost, "login", context);
    httppost.setEntity(
        new StringEntity(
            new JSONObject()
                .put("username", context.getUserName())
                .put("password", context.getPassword())
                .toString(),
            "UTF-8"));

    try (CloseableHttpResponse response = httpClient.execute(httppost, clientContext)) {
      StatusLine statusLine = response.getStatusLine();
      Header[] header = response.getHeaders("authorization");
      if (header.length != 1) {
        throw new RuntimeException("Unexpected response header");
      }
      assert context.getAuthorizationHeader() == null;
      context.setAuthorizationHeader(Pair.of(header[0].getName(), header[0].getValue()));
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        EntityUtils.consumeQuietly(entity);
        logger.debug("LOGIN SUCCESS");
        response.close();
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public void initializeUserContext(StatefulClientContext context) {
    // perform login to the user and create a cart if not exists
    int CONNECTION_TIMEOUT_MS = 36000 * 1000; // Timeout in millis.
    final RequestConfig requestConfig =
        RequestConfig.custom()
            .setConnectionRequestTimeout(CONNECTION_TIMEOUT_MS)
            .setConnectTimeout(CONNECTION_TIMEOUT_MS)
            .setSocketTimeout(CONNECTION_TIMEOUT_MS)
            .build();
    final HttpClientContext clientContext = HttpClientContext.create();
    clientContext.setRequestConfig(requestConfig);
    Objects.requireNonNull(context).setClientContext(clientContext);
    context.setAddedItemIds(new ConcurrentSkipListSet<>());
    login(context);
    createCartIfNotExist(context);
    //  clientContext
    //          .getCookieStore()
    //          .getCookies()
    //          .forEach(cookie -> logger.info("Local cookie: " + cookie));
  }

  @Override
  public void createCartIfNotExist(StatefulClientContext context) {
    final HttpGet httpGet = new HttpGet(CREATE_CART_URL);
    final HttpClientContext clientContext = context.getClientContext();
    buildHeader(httpGet, "", context);

    try (CloseableHttpResponse response = httpClient.execute(httpGet, clientContext)) {
      StatusLine statusLine = response.getStatusLine();

      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("CREATE CART SUCCESS: " + res);
        JSONObject jsonObject = new JSONObject(res);
        context.setCartId(jsonObject.getInt("id"));
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public List<Integer> addItemToCart(long productId, StatefulClientContext context) {
    return addItemToCart(productId, null, null, null, context);
  }

  @Override
  public List<Integer> addItemToCart(
      long productId,
      String colorAttr,
      String sizeAttr,
      String nameAttr,
      StatefulClientContext context) {
    final HttpClientContext clientContext = context.getClientContext();
    assert clientContext != null;

    HttpPost httppost = new HttpPost(String.format(ADD_ITEM_CART_URL, context.getCartId()));
    buildHeader(httppost, "", context);
    httppost.setEntity(
        new StringEntity(
            new JSONObject()
                .put("productId", productId)
                //                .put("orderItemAttributes", new JSONArray())
                .toString(),
            "UTF-8"));

    try (CloseableHttpResponse response = httpClient.execute(httppost, clientContext)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        JSONObject jsonObject = new JSONObject(res);
        final JSONArray orderItems = jsonObject.getJSONArray("orderItems");
        final List<Integer> orderItemIds = new ArrayList<>();
        for (Object orderItem : orderItems) {
          final JSONObject oi = (JSONObject) orderItem;
          final int orderItemId = oi.getInt("id");
          orderItemIds.add(orderItemId);
        }
        logger.debug("ADD CART SUCCESS: " + res);
        //        try {
        //          Thread.sleep(210 * 1000);
        //        } catch (InterruptedException e) {
        //          e.printStackTrace();
        //        }
        return orderItemIds;
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public boolean removeItemFromCart(long itemId, StatefulClientContext context) {
    final HttpClientContext clientContext = context.getClientContext();
    final long cartId = context.getCartId();
    assert clientContext != null && cartId > 0;

    HttpDelete httpDelete = new HttpDelete(String.format(REMOVE_ITEM_URL, cartId, itemId));
    buildHeader(httpDelete, "cart", context);

    try (CloseableHttpResponse response = httpClient.execute(httpDelete, clientContext)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("REMOVE FROM CART SUCCESS: " + res);
        // EntityUtils.consumeQuietly(entity);
        return true;
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public boolean getItemDetails(
      String category,
      String item,
      Boolean includePromotionMessages,
      StatefulClientContext context) {
    final HttpClientContext clientContext = context.getClientContext();
    HttpGet httpGet =
        new HttpGet(String.format(GET_ITEM_DETAILS_URL, category, item, includePromotionMessages));
    buildHeader(httpGet, "", context);

    try (CloseableHttpResponse response = httpClient.execute(httpGet, clientContext)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("GET_ITEM_DETAILS SUCCESS: " + res);
        return true;
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public String checkout(long cartId, StatefulClientContext context) {
    final HttpClientContext clientContext = context.getClientContext();
    assert clientContext != null;

    HttpPost httppost = new HttpPost(String.format(CHECKOUT_COD, context.getCartId()));
    buildHeader(httppost, "", context);

    try (CloseableHttpResponse response = httpClient.execute(httppost, clientContext)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("PURCHASE CART SUCCESS: " + res + " for cart " + cartId);
        return res;
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public JSONObject showCart(StatefulClientContext context) {
    final HttpClientContext clientContext = context.getClientContext();
    HttpGet httpGet = new HttpGet(SHOW_CART_URL);
    buildHeader(httpGet, "", context);

    try (CloseableHttpResponse response = httpClient.execute(httpGet, clientContext)) {
      StatusLine statusLine = response.getStatusLine();

      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("SHOW CART SUCCESS: " + res);
        return new JSONObject(res);
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }
  //  public boolean updateQuantityOfCart(long itemId, int quantity) {
  //    assert clientContext != null;
  //
  //    HttpPut httpput = new HttpPut(String.format(UPDATE_QUANTITY_URL, cartId, itemId, quantity));
  //    buildHeader(httpput, "cart");
  //
  //    try (CloseableHttpResponse response = httpClient.execute(httpput, clientContext)) {
  //      StatusLine statusLine = response.getStatusLine();
  //      if (statusLine.getStatusCode() != 200) {
  //        throw new RuntimeException(
  //            "status=" + statusLine.getStatusCode() + ", message=" +
  // statusLine.getReasonPhrase());
  //      } else {
  //        HttpEntity entity = response.getEntity();
  //        assert entity != null;
  //        String res = EntityUtils.toString(entity);
  //        logger.debug("UPDATE QUANTITY SUCCESS: " + res);
  //        // EntityUtils.consumeQuietly(entity);
  //        return true;
  //      }
  //    } catch (IOException e) {
  //      throw new RuntimeException(e);
  //    }
  //  }
  //
  //  public JSONObject seo() {
  //    HttpGet httpGet = new HttpGet(SEO_URL);
  //    buildHeader(httpGet, "");
  //
  //    try (CloseableHttpResponse response = httpClient.execute(httpGet, clientContext)) {
  //      StatusLine statusLine = response.getStatusLine();
  //      if (statusLine.getStatusCode() != 200) {
  //        throw new RuntimeException(
  //            "status=" + statusLine.getStatusCode() + ", message=" +
  // statusLine.getReasonPhrase());
  //      } else {
  //        HttpEntity entity = response.getEntity();
  //        assert entity != null;
  //        String res = EntityUtils.toString(entity);
  //        logger.debug("SEO SUCCESS: " + res);
  //        return new JSONObject(res);
  //      }
  //    } catch (IOException e) {
  //      throw new RuntimeException(e);
  //    }
  //  }
  //
  //  public boolean breadcrumbs() {
  //    HttpGet httpGet = new HttpGet(BREADCRUMBS_URL);
  //    buildHeader(httpGet, "");
  //
  //    try (CloseableHttpResponse response = httpClient.execute(httpGet, clientContext)) {
  //      StatusLine statusLine = response.getStatusLine();
  //      if (statusLine.getStatusCode() != 200) {
  //        throw new RuntimeException(
  //            "status=" + statusLine.getStatusCode() + ", message=" +
  // statusLine.getReasonPhrase());
  //      } else {
  //        HttpEntity entity = response.getEntity();
  //        assert entity != null;
  //        String res = EntityUtils.toString(entity);
  //        logger.debug("BREADCRUMBS SUCCESS: " + res);
  //        return true;
  //      }
  //    } catch (IOException e) {
  //      throw new RuntimeException(e);
  //    }
  //  }
  //
  //  public boolean relatedProducts() {
  //    HttpGet httpGet = new HttpGet(RELATEDPRODUCTS_URL);
  //    buildHeader(httpGet, "");
  //
  //    try (CloseableHttpResponse response = httpClient.execute(httpGet, clientContext)) {
  //      StatusLine statusLine = response.getStatusLine();
  //      if (statusLine.getStatusCode() != 200) {
  //        throw new RuntimeException(
  //            "status=" + statusLine.getStatusCode() + ", message=" +
  // statusLine.getReasonPhrase());
  //      } else {
  //        HttpEntity entity = response.getEntity();
  //        assert entity != null;
  //        String res = EntityUtils.toString(entity);
  //        logger.debug("RELATEDPRODUCTS SUCCESS: " + res);
  //        return true;
  //      }
  //    } catch (IOException e) {
  //      throw new RuntimeException(e);
  //    }
  //  }
  //
  //  public boolean rating(long itemId) {
  //    HttpGet httpGet = new HttpGet(String.format(RATING_URL, itemId));
  //    buildHeader(httpGet, "");
  //
  //    try (CloseableHttpResponse response = httpClient.execute(httpGet, clientContext)) {
  //      StatusLine statusLine = response.getStatusLine();
  //      if (statusLine.getStatusCode() != 200) {
  //        throw new RuntimeException(
  //            "status=" + statusLine.getStatusCode() + ", message=" +
  // statusLine.getReasonPhrase());
  //      } else {
  //        HttpEntity entity = response.getEntity();
  //        assert entity != null;
  //        String res = EntityUtils.toString(entity);
  //        logger.debug("RATING SUCCESS: " + res);
  //        return true;
  //      }
  //    } catch (IOException e) {
  //      throw new RuntimeException(e);
  //    }
  //  }
}
