package webench.benchmark.client.custom.ecommerce;

import webench.benchmark.client.StatefulClientContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListSet;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.http.HttpEntity;
import org.apache.http.HttpMessage;
import org.apache.http.StatusLine;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.*;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

public class ShopizerClient extends ECommerceClient {
  public ShopizerClient(String webHost) {
    if (StringUtils.isEmpty(webHost)) {
      HOST = "http://localhost:8089/api/v1";
    } else {
      HOST = webHost;
    }
    FRONT_HOST = "http://localhost:4200/";
    LOGIN_URL = HOST + "/customer/login";
    CREATE_CART_URL = HOST + "/customers/%s/cart"; // GET {cartId}
    GET_CART_BY_ID_URL = HOST + "/customers/%s/cart"; // GET {cartId}
    SHOW_CART_URL = HOST + "/api/cart?onlyIfExists=true"; // GET {cartId}
    ADD_ITEM_TO_CUSTOMER_CART_URL = HOST + "/customers/%s/cart"; // POST(when no cart exists)
    ADD_ITEM_TO_CART_URL = HOST + "/cart/%s"; // PUT {cartId/code}
    GET_CART_BY_CODE_URL = HOST + "/cart/%s"; // get {cartId/code}
    REMOVE_ITEM_URL = HOST + "/cart/%s"; // PUT {cartCode}
    GET_ITEM_DETAILS_URL = HOST + "/products/%s"; // ItemDetails
    CHECKOUT_COD = HOST + "/auth/cart/%s/checkout"; // POST {cartCode}
  }

  private final String HOST;
  private final String FRONT_HOST;
  private final String LOGIN_URL;
  private final String CREATE_CART_URL;
  private final String GET_CART_BY_ID_URL;
  private final String SHOW_CART_URL;
  private final String ADD_ITEM_TO_CUSTOMER_CART_URL;
  private final String ADD_ITEM_TO_CART_URL;
  private final String GET_CART_BY_CODE_URL;
  private final String REMOVE_ITEM_URL;
  private final String GET_ITEM_DETAILS_URL;
  private final String CHECKOUT_COD;
  private static final Logger logger = LogManager.getLogger();
  // each user should have a login state
  // if the user does not have a login state, create one and perform login, then store the
  // credential in memory
  private static final Map<Integer, StatefulClientContext> userContext = new ConcurrentHashMap<>();

  static {
    // Configurator.setLevel(logger.getName(), Level.DEBUG);
  }

  public static String doAddCart(String host, Long productId, String userName, String password) {
    final ShopizerClient shopizerClient = new ShopizerClient(host);
    final StatefulClientContext context = new StatefulClientContext(userName, password);
    shopizerClient.initializeUserContext(context);
    return shopizerClient.addItemToCart(productId, context).toString();
  }

  public static String doGetCart(String host, Long productId, String userName, String password) {
    final ShopizerClient shopizerClient = new ShopizerClient(host);
    final StatefulClientContext context = new StatefulClientContext(userName, password);
    shopizerClient.initializeUserContext(context);
    shopizerClient.addItemToCart(productId, context);
    return shopizerClient.getCart(context);
  }

  public static String doPurchaseProduct(
      String host, Long productId, String userName, String password) {
    final ShopizerClient shopizerClient = new ShopizerClient("http://localhost:8089/api/v1");
    final StatefulClientContext context = new StatefulClientContext(userName, password);
    //    shopizerClient.login(context);
    shopizerClient.initializeUserContext(context);
    List<Integer> items = shopizerClient.addItemToCart(productId, context);
    context.getAddedItemIds().addAll(items);
    return shopizerClient.checkout(context.getCartId(), context);
  }

  public static String doLogin(String userName, String pwd) {
    ShopizerClient shopizerClient = new ShopizerClient("http://localhost:8089/api/v1");
    final StatefulClientContext context = new StatefulClientContext(userName, pwd);
    shopizerClient.initializeUserContext(context);
    return String.valueOf(context.getAttributes().get(ShopizerClient.CUSTOMER_ID_KEY));
  }

  public static void main(String[] args) {
    final ShopizerClient shopizerClient = new ShopizerClient("http://localhost:8089/api/v1");
    final StatefulClientContext context = new StatefulClientContext("abc@gmail.com", "123");
    //    shopizerClient.login(context);
    shopizerClient.initializeUserContext(context);
    shopizerClient.getItemDetails(null, "2", false, context);
    shopizerClient.addItemToCart(2L, context);
  }

  private void buildHeader(HttpMessage message, String referer, StatefulClientContext context) {
    message.setHeader("Accept", "*/*");
    message.setHeader("Accept-Encoding", "gzip, deflate, br");
    message.setHeader("Accept-Language", "zh-CN,zh;q=0.9,en;q=0.8");
    message.setHeader("Connection", "keep-alive");
    // cookie here
    message.setHeader("Content-Type", "application/json");
    message.setHeader("Host", "localhost:8080");
    message.setHeader("origin", FRONT_HOST);
    message.setHeader("Referer", FRONT_HOST + referer);
    message.setHeader("Sec-Fetch-Dest", "empty");
    message.setHeader("Sec-Fetch-Mode", "cors");
    message.setHeader("Sec-Fetch-Site", "same-site");
    message.setHeader(
        "User-Agent",
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36");
    message.setHeader("X-Locale", "en-US");
    final Pair<String, String> authorizationHeader = context.getAuthorizationHeader();
    if (authorizationHeader != null) {
      message.setHeader(authorizationHeader.getKey(), authorizationHeader.getValue());
    } else assert referer.equals("account");
  }

  private void login(StatefulClientContext context) {
    CookieStore cookieStore = new BasicCookieStore();
    final HttpClientContext clientContext = context.getClientContext();
    clientContext.setCookieStore(cookieStore);

    /** { "username": "abc@gmail.com", "password": "123" } */
    HttpPost httppost = new HttpPost(LOGIN_URL);
    buildHeader(httppost, "account", context);
    httppost.setEntity(
        new StringEntity(
            new JSONObject()
                .put("username", context.getUserName())
                .put("password", context.getPassword())
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
        final String res = EntityUtils.toString(entity);
        logger.debug("LOGIN SUCCESS: " + res);
        JSONObject jsonObject = new JSONObject(res);
        final String token = jsonObject.getString("token");
        // this id represents customer here
        final long id = jsonObject.getLong("id");
        context.setAttribute(CUSTOMER_ID_KEY, id);
        context.setAuthorizationHeader(Pair.of("Authorization", String.format("Bearer %s", token)));
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
    if (true) return; // in shopizer, create cart is performed when new item is added
    final HttpGet httpGet =
        new HttpGet(String.format(CREATE_CART_URL, context.getLongAttribute(CUSTOMER_ID_KEY)));
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
        context.setAttribute(CART_CODE_KEY, Objects.requireNonNull(jsonObject.get("code")));
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

  private static final String CART_CODE_KEY = "CART.CODE";
  private static final String CUSTOMER_ID_KEY = "CUSTOMER.ID";

  public String getCart(StatefulClientContext context) {
    final HttpClientContext clientContext = context.getClientContext();
    assert clientContext != null;

    final String cartCodeStr = context.getStringAttribute(CART_CODE_KEY);
    final HttpGet httpGet = new HttpGet(String.format(GET_CART_BY_CODE_URL, cartCodeStr));
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
        logger.debug("GET_CAT_BY_CODE_DETAILS SUCCESS: " + res);
        return res;
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
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

    final String cartCodeStr = context.getStringAttribute(CART_CODE_KEY);
    final HttpEntityEnclosingRequestBase httpReq;
    if (StringUtils.isEmpty(cartCodeStr)) {
      httpReq =
          new HttpPost(
              String.format(
                  ADD_ITEM_TO_CUSTOMER_CART_URL,
                  Objects.requireNonNull(context.getLongAttribute(CUSTOMER_ID_KEY))));
    } else {
      httpReq = new HttpPut(String.format(ADD_ITEM_TO_CART_URL, cartCodeStr));
    }

    buildHeader(httpReq, "", context);
    httpReq.setEntity(
        new StringEntity(
            new JSONObject().put("product", productId).put("quantity", 1).toString(), "UTF-8"));

    try (CloseableHttpResponse response = httpClient.execute(httpReq, clientContext)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() < 200 || statusLine.getStatusCode() > 299) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        JSONObject jsonObject = new JSONObject(res);
        final String code = jsonObject.getString("code");
        context.setAttribute(CART_CODE_KEY, Objects.requireNonNull(code));
        final JSONArray products = jsonObject.getJSONArray("products");
        final List<Integer> orderItemIds = new ArrayList<>();
        for (Object productItem : products) {
          final JSONObject pi = (JSONObject) productItem;
          final int id = pi.getInt("id");
          orderItemIds.add(id);
        }
        logger.debug("ADD CART SUCCESS: " + res);
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
    HttpGet httpGet = new HttpGet(String.format(GET_ITEM_DETAILS_URL, item));
    buildHeader(httpGet, "product-detail?productId=" + item, context);

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
    /**
     * { "currency": "CAD", "payment": { "paymentType": "CREDITCARD", "transactionType": "CAPTURE",
     * "paymentModule": "stripe", "paymentToken": "tok_1IHOVD26qlSEj6ibbWmJ2yL8", "amount": 60 } }
     */
    final HttpPost httppost =
        new HttpPost(String.format(CHECKOUT_COD, context.getStringAttribute(CART_CODE_KEY)));
    buildHeader(httppost, "", context);

    httppost.setEntity(
        new StringEntity(
            new JSONObject()
                .put("currency", "CAD")
                .put(
                    "payment",
                    new JSONObject()
                        .put("paymentType", "COD")
                        .put("transactionType", "CAPTURE")
                        .put("paymentModule", "moneyorder")
                        .put("amount", context.getAddedItemIds().size() * 1.99d))
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
}
