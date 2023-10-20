package webridge.common.utils;

import org.apache.catalina.connector.RequestFacade;
import org.apache.catalina.connector.ResponseFacade;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Triple;
import org.springframework.context.annotation.Scope;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponseWrapper;
import java.lang.reflect.Field;
import java.util.*;
import java.util.function.Consumer;

@Scope("singleton")
public class WeBridgeWebRequestUtils {
    private static List<Triple<String, String, String>> spUris;
    private static final Set<String> enableSpApiList = new HashSet<>();
    private Consumer<HttpServletRequest> requestConsumer;

    public boolean prepareSPParam(HttpServletRequest request) {
        if (requestConsumer == null || request == null) return false;
        requestConsumer.accept(request);
        return true;
    }

    public void setRequestConsumer(Consumer<HttpServletRequest> requestConsumer) {
        this.requestConsumer = requestConsumer;
    }

    public static void addEnableSpApi(String apiName) {
        enableSpApiList.add(apiName);
    }

    public static void addSpUri(Triple<String, String, String> spUri) {
        if (spUris == null) spUris = new ArrayList<>();
        spUris.add(spUri);
    }

    public static String getSPDefApi(HttpServletRequest request) {
        if (spUris == null) return null;
        String api = null;
        for (Triple<String, String, String> t : spUris) {
            if (request.getRequestURI().matches(t.getLeft())
                    && request.getMethod().equalsIgnoreCase(t.getMiddle())
                    && enableSpApiList.contains(t.getRight())) {
                api = t.getRight();
                break;
            }
        }
        return api;
    }

    public static boolean isSpURI(HttpServletRequest request) {
        return !StringUtils.isEmpty(getSPDefApi(request));
    }

    public static BufferedServletRequestWrapper bufferRequestBody(HttpServletRequest request)
            throws Exception {
        // force access parameters so that they will get serialized
        request.getParameterMap();
        if (request instanceof BufferedServletRequestWrapper)
            return (BufferedServletRequestWrapper) request;
        final ServletRequest unwrapReq = unwrap(request);
        final BufferedServletRequestWrapper requestWrapper =
                new BufferedServletRequestWrapper((HttpServletRequest) unwrapReq);
        requestWrapper.getParameter("productId");
        return requestWrapper;
    }

    public static ServletRequest unwrap(ServletRequest wrapper) throws Exception {
        if (wrapper instanceof HttpServletRequestWrapper) {
            return unwrap(((HttpServletRequestWrapper) wrapper).getRequest());
        } else if (wrapper instanceof RequestFacade) {
            final Field response = wrapper.getClass().getDeclaredField("request");
            response.setAccessible(true);
            return (ServletRequest) response.get(wrapper);
        }
        return wrapper;
    }

    public static ServletResponse unwrap(ServletResponse wrapper) throws Exception {
        if (wrapper instanceof HttpServletResponseWrapper) {
            return unwrap(((HttpServletResponseWrapper) wrapper).getResponse());
        } else if (wrapper instanceof ResponseFacade) {
            final Field response = wrapper.getClass().getDeclaredField("response");
            response.setAccessible(true);
            return (ServletResponse) response.get(wrapper);
        }
        return wrapper;
    }
}