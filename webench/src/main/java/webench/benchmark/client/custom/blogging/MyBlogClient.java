package webench.benchmark.client.custom.blogging;

import webench.benchmark.client.Client;
import webench.meta.APIEndpoint;
import webench.meta.APIType;
import com.google.common.base.Joiner;
import java.util.concurrent.Callable;
import java.util.function.Consumer;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.*;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class MyBlogClient implements Client {

  private static final Logger logger = LogManager.getLogger();
  private final String HOST;
  private final String GET_INDEX_URL;
  private final String GET_BLOG_URL;
  private final String EDIT_BLOG_URL;
  protected final CloseableHttpClient httpClient;

  public static void main(String[] args) {
    final MyBlogClient myBlogClient = new MyBlogClient("");
    myBlogClient.getIndex();
    myBlogClient.getBlog("3");
    myBlogClient.editBlog("3");
  }

  public MyBlogClient(String webHost) {
    this.httpClient = HttpClients.createDefault();
    if (StringUtils.isEmpty(webHost)) {
      HOST = "http://localhost:9080";
    } else {
      HOST = webHost;
    }
    // GET ""
    GET_INDEX_URL = HOST;
    // GET "/blog/{id}"
    GET_BLOG_URL = HOST + "/blog/%s";
    // POST "/admin/blogs/update"
    EDIT_BLOG_URL = HOST + "/admin/blogs/update";
  }

  @Override
  public void invokeBlocking(
          APIEndpoint endpoint, Consumer<Callable<APIType>> apiInvokeHandler, Object... args) {
    // refer to @ShopizerClient/@BroadleafClient
    logger.debug(
        "Invoking "
            + endpoint.getApiType().name()
            + " with parameters "
            + Joiner.on(",").join(args));
    assert args.length == 1;
    final String blogId = (String) args[0];
    switch (endpoint.getApiType()) {
      case GETINDEX:
        apiInvokeHandler.accept(
            () -> {
              getIndex();
              return APIType.GETINDEX;
            });
        break;
      case GETBLOG:
        apiInvokeHandler.accept(
            () -> {
              getBlog(blogId);
              return APIType.GETBLOG;
            });
        break;
      case EDITBLOG:
        apiInvokeHandler.accept(
            () -> {
              editBlog(blogId);
              return APIType.EDITBLOG;
            });
        break;
      default:
        logger.error("Unsupported API Type " + endpoint.getApiType().name() + "for MyBlog!");
        break;
    }
  }

  private void buildHeader(HttpMessage message) {
    message.setHeader("Accept", "*/*");
    message.setHeader("Accept-Encoding", "gzip, deflate, br");
    message.setHeader("Accept-Language", "en-US,en;q=0.9");
    message.setHeader("Connection", "keep-alive");
    // cookie here
    message.setHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    message.setHeader("X-Requested-With", "XMLHttpRequest");
    // message.setHeader("Host", "localhost:8080");
    message.setHeader("origin", HOST);
    // message.setHeader("Referer", EDIT_BLOG_URL + referer);
    message.setHeader("Sec-Fetch-Dest", "empty");
    message.setHeader("Sec-Fetch-Mode", "cors");
    message.setHeader("Sec-Fetch-Site", "same-origin");
    message.setHeader(
        "User-Agent",
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36");
  }

  public String getIndex() {
    final HttpGet httpGet = new HttpGet(GET_INDEX_URL);
    try (CloseableHttpResponse response = httpClient.execute(httpGet)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + response.toString());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Get Index Success! Respone: " + res);
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public String getBlog(String blogId) {
    final HttpGet httpGet = new HttpGet(String.format(GET_BLOG_URL, blogId));
    try (CloseableHttpResponse response = httpClient.execute(httpGet)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + response.toString());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Get Blog Success! Respone: " + res);
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public String editBlog(String blogId) {
    final HttpPost httpPost = new HttpPost(EDIT_BLOG_URL);
    buildHeader(httpPost);

    httpPost.setEntity(
        new StringEntity(
            "blogId="
                + blogId
                + "&blogTitle=asdddmm&blogSubUrl=&blogCategoryId=24&blogTags=zz&blogContent=asd&blogCoverImage=http%3A%2F%2F127.0.0.1%3A9080%2Fadmin%2Fdist%2Fimg%2Frand%2F10.jpg&blogStatus=1&enableComment=0",
            "utf-8"));
    try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + response.toString());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Get Blog Success! Respone: " + res);
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
