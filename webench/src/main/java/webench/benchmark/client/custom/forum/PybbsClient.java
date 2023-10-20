package webench.benchmark.client.custom.forum;

import webench.benchmark.client.Client;
import webench.benchmark.client.StatefulClientContext;
import webench.meta.APIEndpoint;
import webench.meta.APIType;
import com.google.common.base.Joiner;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpMessage;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class PybbsClient implements Client {
  protected final CloseableHttpClient httpClient = HttpClients.createDefault();

  public PybbsClient(String webHost) {
    if (StringUtils.isEmpty(webHost)) {
      HOST = "http://localhost:8080";
    } else {
      HOST = webHost;
    }
    GET_API_INDEX_URL = HOST + "/api/index";
    GET_TOP100_URL = HOST + "/top100";
    GET_USER_URL = HOST + "/api/user/%s";
  }

  private final String HOST;
  private final String GET_API_INDEX_URL;
  private final String GET_TOP100_URL;
  private final String GET_USER_URL;

  @Override
  public void invokeBlocking(
          APIEndpoint endpoint, Consumer<Callable<APIType>> apiInvokeHandler, Object... args) {
    // refer to @ShopizerClient/@BroadleafClient
    logger.debug(
        "Invoking "
            + endpoint.getApiType().name()
            + " with parameters "
            + Joiner.on(",").join(args));
    switch (endpoint.getApiType()) {
      case GETUSER:
        assert args.length == 1;
        final String userId = (String) args[0];
        apiInvokeHandler.accept(
            () -> {
              getUser(userId);
              return APIType.GETUSER;
            });
        break;
      case GETAPIINDEX:
        apiInvokeHandler.accept(
            () -> {
              getApiIndex();
              return APIType.GETAPIINDEX;
            });
        break;
      case GETTOP100:
        apiInvokeHandler.accept(
            () -> {
              getTop100();
              return APIType.GETTOP100;
            });
        break;
      default:
        logger.error("Unsupported API Type " + endpoint.getApiType().name() + "for pybbs!");
        break;
    }
  }

  private static final Logger logger = LogManager.getLogger();
  // each user should have a login state
  // if the user does not have a login state, create one and perform login, then store the
  // credential in memory
  private static final Map<Integer, StatefulClientContext> userContext = new ConcurrentHashMap<>();

  static {
    // Configurator.setLevel(logger.getName(), Level.DEBUG);
  }

  public static void main(String[] args) {
    final PybbsClient pybbsClient = new PybbsClient("http://127.0.0.1:8080");
    pybbsClient.getUser("user1");
    pybbsClient.getTop100();
    pybbsClient.getApiIndex();
  }

  public String getApiIndex() {
    final HttpGet httpGet = new HttpGet(GET_API_INDEX_URL);
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

  public String getTop100() {
    final HttpGet httpGet = new HttpGet(GET_TOP100_URL);
    buildHeader(httpGet);
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

  public String getUser(String userId) {
    final HttpGet httpGet = new HttpGet(String.format(GET_USER_URL, userId));
    buildHeader(httpGet);
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

  private void buildHeader(HttpMessage message) {
    message.setHeader(
        "Accept",
        "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7");
    message.setHeader("Accept-Encoding", "gzip, deflate, br");
    message.setHeader("Accept-Language", "en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7");
    message.setHeader("Connection", "keep-alive");
    // cookie here
    // message.setHeader("Cookie", "JSESSIONID=Vj315MHrr1ZIOdGQwB0HHR7XwwtrbNRIRsPZ-oPE;
    // rememberMe=sO83JORmMSphwZqvoaFPbKzh+btQXzyKPZijyClrKtiCPPBWA7LFnL8FLwdD+V2rHVyykfRJjKMg1tvAOaVZkLg8vXJoZxWDk5Ecb+plLPv9WJ2EENEmGn4ZpkR0i0yX24micvj3kapI0R+BaXf2XD54F5Ll76AQOYZzSMumwO8YbKA2mgnK5bGqHuGFw4rawFaiTXZJLYHMg+4C7K4vvcZRaCHIMrmnceKUM2n+//fp4GArxBO7uwk8gR1tggLGse7sQHfl2HWpvrOQ1pJyIMhNcGI313UVDs5OXSNKtsVYNi1eMDlH2OqPi324NegUiYiasuOfZ92oLRaA2u0Ujcrl6pZgBRcEMCodU5bWDO0XmRmSAtjsCR9Faxs/rZnHKIfL2SF99k1I4s4NnUAes2p6x7RxalbPuRySM4sfCUT5XuDs4r0Wv0jIdlOsHqr9WRobwt1sgWmkbTCJ1JVPQowhW4yzaXIVzqPb/qvgG3q0XgJ5qLKhdDLLlCBhuKqc6O6gxJMMY3K4HO4c2LGqPUx596FFqgd9/ESBQsP3qk8=");
    message.setHeader("Content-Type", "application/json");
    message.setHeader("Host", "127.0.0.1:8080");
    message.setHeader("Sec-Fetch-Dest", "document");
    message.setHeader("Sec-Fetch-Mode", "navigate");
    message.setHeader("Sec-Fetch-Site", "none");
    message.setHeader("Sec-Fetch-User", "?1");
    message.setHeader(
        "User-Agent",
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36");
    // message.setHeader("token",
    // "[{\"key\":\"token\",\"value\":\"3e63b9ca-5ab3-4ec4-9947-4bb7bd3ff34e\",\"type\":\"text\",\"enabled\":true,\"description\":null}]");
  }
}
