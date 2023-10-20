package webridge.common.spring.filter;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Triple;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import webridge.common.utils.Constants;
import webridge.common.utils.WeBridgeWebRequestUtils;

@Component("concolicEntryPointFilter")
public class ConcolicEntryPointFilter extends OncePerRequestFilter implements Ordered {
  private static final Logger LOGGER = LoggerFactory.getLogger(ConcolicEntryPointFilter.class);
  private final boolean enableWeBridge;

  public ConcolicEntryPointFilter(
      @Value("${enable.sp.apilist:}") String enableSpApiList,
      @Value("${spdef.dir:}") String spDefDir,
      @Value("${webridge.enable.concolic.execution:false}") boolean enable,
      @Value("${sp.api.urilist:}") String spApiUris) {
    // initialize enabled api
    if (!StringUtils.isEmpty(enableSpApiList)) {
      Arrays.stream(enableSpApiList.split(","))
          .map(String::trim)
          .forEach(WeBridgeWebRequestUtils::addEnableSpApi);
    }
    // initialize api uri list
    if (!StringUtils.isEmpty(spApiUris) && !spApiUris.contains("${sp.api.urilist}")) {
      final JSONArray apiArray = JSON.parseArray(spApiUris);
      apiArray.forEach(
          o -> {
            final JSONObject spApiObj = (JSONObject) o;
            if (!spApiObj.containsKey("uri")
                || !spApiObj.containsKey("name")
                || !spApiObj.containsKey("method"))
              throw new IllegalArgumentException(o.toString());
            final String uri = spApiObj.getString("uri").replace("w+", "\\w+");
            final String name = spApiObj.getString("name");
            final String method = spApiObj.getString("method");
            WeBridgeWebRequestUtils.addSpUri(Triple.of(uri, method, name));
          });
    }
    // set the sp Def dir
    System.setProperty("spDefDir", spDefDir);
    this.enableWeBridge = enable;
  }

  @Override
  public int getOrder() {
    return FilterOrders.of(getClass());
  }

  @Override
  protected void doFilterInternal(
      HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
      throws ServletException, IOException {
    if (!WeBridgeWebRequestUtils.isSpURI(request) || !enableWeBridge) {
      filterChain.doFilter(request, response);
      return;
    }
    final String apiName = WeBridgeWebRequestUtils.getSPDefApi(request);
    long begin = System.currentTimeMillis();
    try {
      System.startConcolic();
      filterChain.doFilter(request, response);
      LOGGER.info("[WeBridge] API " + apiName + " started to be analyzed");
      final String res = System.weBridgeAnalysis(this.getClass().getClassLoader());
      LOGGER.info("[WeBridge] API " + apiName + " analyzed result length " + res.length());
      Path source = Paths.get(Constants.DEFAULT_TMP_GRAPH_PATH);
      // rename a file in the same directory
      Files.copy(
          source,
          source.resolveSibling("/tmp/" + apiName + ".json"),
          StandardCopyOption.REPLACE_EXISTING);
      LOGGER.info(
          "[WeBridge] API "
              + apiName
              + " saving dependency graph into "
              + "/tmp/"
              + apiName
              + ".json");
      //            Files.write(Paths.get("/tmp/" + apiName + ".json"),
      // res.getBytes(StandardCharsets.UTF_8));
    } finally {
      System.endConcolic();
      LOGGER.info(apiName + " analysis used " + (System.currentTimeMillis() - begin) + " ms");
    }
  }
}
