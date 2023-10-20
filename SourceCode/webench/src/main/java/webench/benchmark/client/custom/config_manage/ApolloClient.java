package webench.benchmark.client.custom.config_manage;

import webench.benchmark.client.Client;
import webench.benchmark.client.StatefulClientContext;
import webench.data.IdGenerator;
import webench.meta.APIEndpoint;
import webench.meta.APIType;
import com.google.common.base.Joiner;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListSet;
import java.util.function.Consumer;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpMessage;
import org.apache.http.StatusLine;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.cookie.Cookie;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ApolloClient implements Client {
  protected final CloseableHttpClient httpClient = HttpClients.createDefault();

  private static final Logger logger = LogManager.getLogger();

  public ApolloClient(String webHost) {
    if (StringUtils.isEmpty(webHost)) {
      HOST = "http://localhost:8070";
    } else {
      HOST = webHost;
    }
    GET_APPS_URL = HOST + "/apps";
    GET_INDEX_URL = HOST + "/";
    GET_USER_URL = HOST + "/user";
    LOGIN_URL = HOST + "/signin";
  }

  private final String HOST;
  private final String GET_APPS_URL;
  private final String GET_INDEX_URL;
  private final String GET_USER_URL;
  private final String LOGIN_URL;

  public static void main(String[] args) {
    final ApolloClient apolloClient = new ApolloClient("http://127.0.0.1:8070");
    StatefulClientContext ctx = new StatefulClientContext("2.user", "admin");
    apolloClient.initializeUserContext(ctx);
    //    apolloClient.getApps();
    //    apolloClient.getIndex();
    apolloClient.getUser(ctx);
  }

  private static final Map<Integer, StatefulClientContext> userContext = new ConcurrentHashMap<>();

  private StatefulClientContext getRequestContext(int userId) {
    userContext.computeIfAbsent(
        userId, id -> new StatefulClientContext(IdGenerator.userNameFromId(id), "admin"));
    final StatefulClientContext clientContext = Objects.requireNonNull(userContext.get(userId));
    if (!clientContext.isInitialized()) {
      logger.warn("Initializing client with user info " + clientContext.getUserName());
      synchronized (clientContext) {
        if (clientContext.isInitialized()) return Objects.requireNonNull(clientContext);
        initializeUserContext(clientContext);
        clientContext.setInitialized(true);
      }
    }
    return Objects.requireNonNull(clientContext);
  }

  @Override
  public void invokeBlocking(
          APIEndpoint endpoint, Consumer<Callable<APIType>> apiInvokeHandler, Object... args) {
    logger.debug(
        "Invoking "
            + endpoint.getApiType().name()
            + " with parameters "
            + Joiner.on(",").join(args));
    final int userId = (int) args[0];
    final StatefulClientContext clientContext = getRequestContext(userId);
    switch (endpoint.getApiType()) {
      case GETAPPS:
        apiInvokeHandler.accept(
            () -> {
              getApps(clientContext);
              return APIType.GETAPPS;
            });
        break;
      case GETINDEX:
        apiInvokeHandler.accept(
            () -> {
              getIndex(clientContext);
              return APIType.GETINDEX;
            });
        break;
      case GETUSER:
        apiInvokeHandler.accept(
            () -> {
              getUser(clientContext);
              return APIType.GETUSER;
            });
        break;
      default:
        logger.error("Unsupported API Type " + endpoint.getApiType().name() + "for Apollo!");
        break;
    }
  }

  public String getApps(StatefulClientContext clientContext) {
    final HttpGet httpGet = new HttpGet(GET_APPS_URL);
    buildHeader(httpGet, clientContext);
    try (CloseableHttpResponse response = httpClient.execute(httpGet)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + response.toString());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Get API Index Success! Respone: " + res);
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public String getIndex(StatefulClientContext clientContext) {
    final HttpGet httpGet = new HttpGet(GET_INDEX_URL);
    buildHeader(httpGet, clientContext);
    try (CloseableHttpResponse response = httpClient.execute(httpGet)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + response.toString());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Get API Index Success! Respone: " + res);
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public String getUser(StatefulClientContext clientContext) {
    final HttpGet httpGet = new HttpGet(GET_USER_URL);
    buildHeader(httpGet, clientContext);
    try (CloseableHttpResponse response = httpClient.execute(httpGet)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + response.toString());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Get API Index Success! Respone: " + res);
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  private void buildHeader(HttpMessage message, StatefulClientContext context) {
    CookieStore cookieStore = context.getClientContext().getCookieStore();
    message.setHeader("Host", "127.0.0.1:8070");
    message.setHeader(
        "User-Agent",
        "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0");
    message.setHeader(
        "Accept",
        "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8");
    message.setHeader("Accept-Language", "en-US,en;q=0.5");
    message.setHeader("Accept-Encoding", "gzip, deflate, br");
    message.setHeader("Referer", "http://127.0.0.1:8070/signin");
    message.setHeader("Connection", "keep-alive");
    StringBuffer cookieStr = new StringBuffer();
    List<Cookie> cookies = cookieStore.getCookies();
    for (int idx = 0; idx < cookies.size(); idx++) {
      Cookie cookie = cookies.get(idx);
      cookieStr.append(cookie.getName()).append("=").append(cookie.getValue());
      if (idx != cookies.size() - 1) {
        cookieStr.append("; ");
      } else {
        cookieStr.append("; NG_TRANSLATE_LANG_KEY=en");
      }
    }
    message.setHeader("Cookie", cookieStr.toString());
    //        "SESSION=M2M3MjIzZTUtNTNhZi00M2ZhLTk2YzQtZTEyMWQ1OWY4OGMw; NG_TRANSLATE_LANG_KEY=en");
    message.setHeader("Upgrade-Insecure-Requests", "1");
    message.setHeader("Sec-Fetch-Dest", "document");
    message.setHeader("Sec-Fetch-Mode", "navigate");
    message.setHeader("Sec-Fetch-Site", "same-origin");
    message.setHeader("Sec-Fetch-User", "?1");
  }

  private void login(StatefulClientContext context) {
    CookieStore cookieStore = new BasicCookieStore();
    final HttpClientContext clientContext = context.getClientContext();
    clientContext.setCookieStore(cookieStore);

    /** { "username": "abc@gmail.com", "password": "123" } */
    String param =
        String.format(
            "username=%s&password=%s&login-submit=Login",
            context.getUserName(), context.getPassword());
    HttpPost httppost = new HttpPost(LOGIN_URL + "?" + param);
    httppost.setEntity(new StringEntity(param, "UTF-8"));

    try (CloseableHttpResponse response = httpClient.execute(httppost, clientContext)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 302) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        Header[] setCookieHeader = response.getHeaders("Set-Cookie");
        if (logger.isDebugEnabled())
          logger.debug("LOGIN SUCCESS: " + Arrays.toString(setCookieHeader));
        response.close();
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

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
  }
}
