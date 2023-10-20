package webridge.common.spring.controller;

import com.google.common.base.Joiner;
import webridge.exception.NotImplementedException;
import webridge.sql.ResultSetHolder;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;
import org.apache.commons.lang3.tuple.Pair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.*;
import org.springframework.util.SerializationUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import webridge.common.spring.filter.TraceRecordingFilter;

@RestController
@RequestMapping("/webridge")
public class CompilerController {
  private final Logger logger = LoggerFactory.getLogger(getClass());

  @Autowired private ServerProperties serverProperties;

  private final RestTemplateBuilder builder;

  private HttpHeaders headers;

  private HttpStatus status;

  private final RestTemplate restTemplate;

  public void setStatus(HttpStatus status) {
    this.status = status;
  }

  public void setHeaders(HttpHeaders headers) {
    this.headers = headers;
  }

  public String get(String uri) {
    HttpEntity<String> requestEntity = new HttpEntity<>("", Objects.requireNonNull(headers));
    ResponseEntity<String> responseEntity =
        restTemplate.exchange(uri, HttpMethod.GET, requestEntity, String.class);
    this.setStatus(responseEntity.getStatusCode());
    return responseEntity.getBody();
  }

  public String post(String uri, String json) {
    HttpEntity<String> requestEntity = new HttpEntity<>(json, Objects.requireNonNull(headers));
    ResponseEntity<String> responseEntity =
        restTemplate.exchange(uri, HttpMethod.POST, requestEntity, String.class);
    this.setStatus(responseEntity.getStatusCode());
    return responseEntity.getBody();
  }

  public String put(String uri, String json) {
    HttpEntity<String> requestEntity = new HttpEntity<>(json, Objects.requireNonNull(headers));
    ResponseEntity<String> responseEntity =
        restTemplate.exchange(uri, HttpMethod.PUT, requestEntity, String.class);
    this.setStatus(responseEntity.getStatusCode());
    return responseEntity.getBody();
  }

  public CompilerController(RestTemplateBuilder builder) {
    this.builder = builder;
    restTemplate = builder.build();
  }

  @GetMapping("/hi")
  public String helloWorld() {
    return "Hi";
  }

  @GetMapping("/compile/{traceDataAbsPath}")
  public Object compile(@PathVariable String traceDataAbsPath) {
    traceDataAbsPath =
        new String(Base64.getDecoder().decode(Objects.requireNonNull(traceDataAbsPath)));

    final TraceRecordingFilter.WeBridgeRecordedTrace trace;
    try {
      trace =
          (TraceRecordingFilter.WeBridgeRecordedTrace)
              Objects.requireNonNull(
                  SerializationUtils.deserialize(Files.readAllBytes(Paths.get(traceDataAbsPath))));
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
    return fireTrace(trace);
  }

  @SuppressWarnings("unchecked")
  private Object fireTrace(TraceRecordingFilter.WeBridgeRecordedTrace trace) {
    final Map<String, Object> requestInfo = trace.getRequestInfo();
    String method = (String) requestInfo.get("method");
    final Map<String, String[]> parameterValues =
        (Map<String, String[]>) requestInfo.get("parameterValues");
    final Map<String, String> headers = (Map<String, String>) requestInfo.get("headers");
    final String body = (String) requestInfo.get("body");
    final StringBuilder uriStrBuilder = new StringBuilder((String) requestInfo.get("uri"));
    if (!parameterValues.isEmpty()) {
      uriStrBuilder
          .append("?")
          .append(
              Joiner.on("&")
                  .join(
                      parameterValues.entrySet().stream()
                          .map(
                              e ->
                                  e.getKey()
                                      + "="
                                      + e.getValue()[
                                          0]) // FIXME: handle parameters with multiple value?
                          .collect(Collectors.toList())));
    }
    final String uri = uriStrBuilder.toString();
    String traceIdentifier = trace.getTraceIdentifier();
    List<Pair<String, Object>> recordedResultSet = trace.getRecordedResultSet();
    logger.info(
        String.format(
            "Received trace [%d] to compile for API[%s], method=[%s], uri=[%s], parameters=[%s], recordedResultSet.size=[%d]",
            traceIdentifier.hashCode(),
            trace.getApiName(),
            method,
            uri,
            parameterValues.toString(),
            recordedResultSet.size()));

    try {
      ResultSetHolder.initialize(SerializationUtils.serialize(recordedResultSet));
      ResultSetHolder.setInitialized(true);
      final HttpHeaders httpHeaders = new HttpHeaders();
      headers.forEach(httpHeaders::add);
      setHeaders(httpHeaders);
      // TODO: check http/https for different apps
      final String requestUri =
          String.format("http://localhost:%d%s", serverProperties.getPort(), uri);

      switch (method) {
        case "GET":
          return get(requestUri);
        case "POST":
          return post(requestUri, body);
        case "PUT":
          return put(requestUri, body);
        default:
          throw new NotImplementedException(method);
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally {
      ResultSetHolder.setInitialized(false);
    }
  }
}
