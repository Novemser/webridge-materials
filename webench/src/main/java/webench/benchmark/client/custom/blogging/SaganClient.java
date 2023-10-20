package webench.benchmark.client.custom.blogging;

import webench.benchmark.client.Client;
import webench.meta.APIEndpoint;
import webench.meta.APIType;
import com.google.common.base.Joiner;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.function.Consumer;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.*;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SaganClient implements Client {

  private static final Logger logger = LogManager.getLogger();
  private final String HOST;
  private final String CREATE_BLOG_POST_URL;
  private final String EDIT_BLOG_POST_URL;
  private final String SHOW_BLOGS_URL;
  private final String CREATE_PROJECT_URL;
  private final String EDIT_PROJECT_URL;
  protected final CloseableHttpClient httpClient;

  @Override
  public void invokeBlocking(
          APIEndpoint endpoint, Consumer<Callable<APIType>> apiInvokeHandler, Object... args) {
    //  refer to @ShopizerClient/@BroadleafClient
    logger.debug(
        "Invoking "
            + endpoint.getApiType().name()
            + " with parameters "
            + Joiner.on(",").join(args));
    switch (endpoint.getApiType()) {
      case EDITPOST:
        assert args.length == 1;
        final String postId = (String) args[0];
        apiInvokeHandler.accept(
            () -> {
              editPost(postId);
              return APIType.EDITPOST;
            });
        break;
      case CREATEPROJECT:
        apiInvokeHandler.accept(
            () -> {
              createProject();
              return APIType.CREATEPROJECT;
            });
        break;
      case SHOWBLOGS:
        apiInvokeHandler.accept(
            () -> {
              showBlogs();
              return APIType.SHOWBLOGS;
            });
        break;
      case EDITPROJECT:
        assert args.length == 1;
        final String projectId = (String) args[0];
        apiInvokeHandler.accept(
            () -> {
              editProject(projectId);
              return APIType.EDITPROJECT;
            });
        break;
      default:
        logger.error("Unsupported API Type " + endpoint.getApiType().name() + "for Sagan!");
        break;
    }
  }

  public static void main(String[] args) {
    final SaganClient saganClient = new SaganClient("http://127.0.0.1:8020");
    // System.out.println(saganClient.createPost());
    // saganClient.editPost(3);
    for (int i = 0; i < 10; i++) {
      saganClient.editProject("platform");
      saganClient.createProject();
      saganClient.createPost();
    }

    // System.out.println(saganClient.createProject());
    // System.out.println(saganClient.editProject("platform"));
  }

  public SaganClient(String webHost) {
    this.httpClient = HttpClients.createDefault();
    if (StringUtils.isEmpty(webHost)) {
      HOST = "http://localhost:8099";
    } else {
      HOST = webHost;
    }
    // POST "/admin/blog"
    CREATE_BLOG_POST_URL = HOST + "/admin/blog";
    // PUT "/admin/blog/{id}/edit"
    EDIT_BLOG_POST_URL = HOST + "/admin/blog/%s/edit";
    // POST "/admin/projects/spring-new"
    CREATE_PROJECT_URL = HOST + "/admin/projects/spring-new";
    // POST "/admin/projects/{id}"
    EDIT_PROJECT_URL = HOST + "/admin/projects/%s";
    // GET "/admin/blog"
    SHOW_BLOGS_URL = HOST + "/admin/blog";
  }

  private void buildHeader(HttpMessage message, String referer) {
    message.setHeader("Accept", "*/*");
    message.setHeader("Accept-Encoding", "gzip, deflate, br");
    message.setHeader("Accept-Language", "en-US,en;q=0.9");
    message.setHeader("Cache-Control", "max-age=0");
    message.setHeader("Connection", "keep-alive");
    // cookie here
    message.setHeader("Content-Type", "application/x-www-form-urlencoded");
    message.setHeader("Host", "localhost:8080");
    message.setHeader("origin", HOST);
    message.setHeader("Referer", HOST + referer);
    message.setHeader("Sec-Fetch-Dest", "document");
    message.setHeader("Sec-Fetch-Mode", "navigate");
    message.setHeader("Sec-Fetch-Site", "same-origin");
    message.setHeader("Sec-Fetch-User", "?1");
    message.setHeader(
        "User-Agent",
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36");
  }

  public String createPost() {
    final HttpPost httpPost = new HttpPost(CREATE_BLOG_POST_URL);
    buildHeader(httpPost, "/admin/blog/new");
    List<NameValuePair> form = new ArrayList<>();
    form.add(new BasicNameValuePair("title", "WeBench"));
    form.add(new BasicNameValuePair("content", "This is a WeBench test."));
    form.add(new BasicNameValuePair("draft", "true"));
    form.add(new BasicNameValuePair("category", "ENGINEERING"));
    form.add(new BasicNameValuePair("format", "MARKDOWN"));
    form.add(new BasicNameValuePair("publishAt", ""));
    httpPost.setEntity(new UrlEncodedFormEntity(form, Consts.UTF_8));
    try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 302) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Creat Post Success!");
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public String editPost(String postId) {
    final HttpPut httpPut = new HttpPut(String.format(EDIT_BLOG_POST_URL, postId));
    buildHeader(httpPut, String.format(EDIT_BLOG_POST_URL, postId));
    List<NameValuePair> form = new ArrayList<>();
    form.add(new BasicNameValuePair("title", "webenchedit1"));
    form.add(new BasicNameValuePair("content", UUID.randomUUID().toString()));
    form.add(new BasicNameValuePair("draft", "false"));
    form.add(new BasicNameValuePair("category", "ENGINEERING"));
    form.add(new BasicNameValuePair("format", "MARKDOWN"));
    form.add(new BasicNameValuePair("publishAt", "2020-01-22 08:55"));
    httpPut.setEntity(new UrlEncodedFormEntity(form, Consts.UTF_8));
    try (CloseableHttpResponse response = httpClient.execute(httpPut)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Creat Post Success!");
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public String showBlogs() {
    final HttpGet httpGet = new HttpGet(SHOW_BLOGS_URL);
    buildHeader(httpGet, "/admin/blog");

    try (CloseableHttpResponse response = httpClient.execute(httpGet)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 200) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Get Blog Success!");
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public String createProject() {
    final HttpPost httpPost = new HttpPost(CREATE_PROJECT_URL);
    buildHeader(httpPost, "/admin/projects/new");
    List<NameValuePair> form = new ArrayList<>();
    form.add(new BasicNameValuePair("id", "WeBench-PROJECT"));
    form.add(new BasicNameValuePair("name", "WeBench"));
    form.add(new BasicNameValuePair("groupId", "webench"));
    form.add(new BasicNameValuePair("repoUrl", "http://github.com"));
    form.add(new BasicNameValuePair("parentId", "WeBridge"));
    form.add(new BasicNameValuePair("category", "incubator"));
    form.add(new BasicNameValuePair("projectReleases[0].artifactId", "webench"));
    form.add(new BasicNameValuePair("projectReleases[0].version", "1.0.0"));
    form.add(new BasicNameValuePair("_projectReleases[0].current", "on"));
    form.add(new BasicNameValuePair("projectReleases[0].refDocUrl", "http://github.com"));
    form.add(new BasicNameValuePair("projectReleases[0].apiDocUrl", "http://github.com"));
    form.add(new BasicNameValuePair("projectReleases[1].artifactId", ""));
    form.add(new BasicNameValuePair("projectReleases[1].version", ""));
    form.add(new BasicNameValuePair("_projectReleases[1].current", "on"));
    form.add(new BasicNameValuePair("projectReleases[1].refDocUrl", ""));
    form.add(new BasicNameValuePair("projectReleases[1].apiDocUrl", ""));
    form.add(new BasicNameValuePair("siteUrl", "http://github.com"));
    form.add(new BasicNameValuePair("_groups", "1"));
    form.add(new BasicNameValuePair("stackOverflowTags", "cloud"));
    form.add(new BasicNameValuePair("displayOrder", "2147483647"));
    form.add(new BasicNameValuePair("imagePath", ""));
    form.add(new BasicNameValuePair("_featured", "on"));
    form.add(new BasicNameValuePair("rawBootConfig", "start.sh"));
    form.add(new BasicNameValuePair("rawOverview", "Starting"));
    form.add(new BasicNameValuePair("projectSamples[0].displayOrder", "1"));
    form.add(new BasicNameValuePair("projectSamples[0].title", "webenching"));
    form.add(new BasicNameValuePair("projectSamples[0].description", "lets rock"));
    form.add(new BasicNameValuePair("projectSamples[0].url", "github.com"));
    httpPost.setEntity(new UrlEncodedFormEntity(form, Consts.UTF_8));
    try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 302) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Creat Project Success!");
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public String editProject(String projectId) {
    final HttpPost httpPost = new HttpPost(String.format(EDIT_PROJECT_URL, projectId));
    buildHeader(httpPost, String.format(EDIT_PROJECT_URL, projectId));
    List<NameValuePair> form = new ArrayList<>();
    form.add(new BasicNameValuePair("id", projectId));
    form.add(new BasicNameValuePair("name", "WeBench-double-test"));
    form.add(new BasicNameValuePair("groupId", "webench"));
    form.add(new BasicNameValuePair("repoUrl", "http://github.com"));
    form.add(new BasicNameValuePair("parentId", "WeBridge"));
    form.add(new BasicNameValuePair("category", "incubator"));
    form.add(new BasicNameValuePair("projectReleases[0].artifactId", "webench"));
    form.add(new BasicNameValuePair("projectReleases[0].version", "1.0.0"));
    form.add(new BasicNameValuePair("_projectReleases[0].current", "on"));
    form.add(new BasicNameValuePair("projectReleases[0].refDocUrl", "http://github.com"));
    form.add(new BasicNameValuePair("projectReleases[0].apiDocUrl", "http://github.com"));
    form.add(new BasicNameValuePair("projectReleases[1].artifactId", ""));
    form.add(new BasicNameValuePair("projectReleases[1].version", ""));
    form.add(new BasicNameValuePair("_projectReleases[1].current", "on"));
    form.add(new BasicNameValuePair("projectReleases[1].refDocUrl", ""));
    form.add(new BasicNameValuePair("projectReleases[1].apiDocUrl", ""));
    form.add(new BasicNameValuePair("siteUrl", "http://github.com"));
    form.add(new BasicNameValuePair("groups", "1"));
    form.add(new BasicNameValuePair("_groups", "1"));
    form.add(new BasicNameValuePair("stackOverflowTags", "cloud"));
    form.add(new BasicNameValuePair("displayOrder", "2147483647"));
    form.add(new BasicNameValuePair("imagePath", ""));
    form.add(new BasicNameValuePair("_featured", "on"));
    form.add(new BasicNameValuePair("rawBootConfig", "start.sh"));
    form.add(new BasicNameValuePair("rawOverview", "Starting"));
    form.add(new BasicNameValuePair("projectSamples[0].displayOrder", "1"));
    form.add(new BasicNameValuePair("projectSamples[0].title", "webenching"));
    form.add(new BasicNameValuePair("projectSamples[0].description", "lets rock"));
    form.add(new BasicNameValuePair("projectSamples[0].url", "github.com"));
    httpPost.setEntity(new UrlEncodedFormEntity(form, Consts.UTF_8));
    try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
      StatusLine statusLine = response.getStatusLine();
      if (statusLine.getStatusCode() != 302) {
        throw new RuntimeException(
            "status=" + statusLine.getStatusCode() + ", message=" + statusLine.getReasonPhrase());
      } else {
        HttpEntity entity = response.getEntity();
        assert entity != null;
        String res = EntityUtils.toString(entity);
        logger.debug("Edit Project Success!");
        return res;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
