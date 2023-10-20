package webridge.common.utils;

import org.apache.commons.io.IOUtils;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.security.Principal;

public class BufferedServletRequestWrapper extends HttpServletRequestWrapper {

    private String requestBody;

    /**
     * Constructs a request object wrapping the given request.
     *
     * @param request The request to wrap
     * @throws IllegalArgumentException if the request is null
     */
    public BufferedServletRequestWrapper(HttpServletRequest request) {
        super(request);
        try {
            this.requestBody = IOUtils.toString(request.getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ServletInputStream getInputStream() {
        final ByteArrayInputStream cachedStream = new ByteArrayInputStream(this.requestBody.getBytes());
        return new ServletInputStream() {
            @Override
            public boolean isFinished() {
                return cachedStream.available() == 0;
            }

            @Override
            public boolean isReady() {
                return true;
            }

            @Override
            public void setReadListener(ReadListener listener) {
            }

            public int read() {
                return cachedStream.read();
            }
        };
    }

    @Override
    public BufferedReader getReader() throws IOException {
        return new BufferedReader(new InputStreamReader(getInputStream(), getCharacterEncoding()));
    }

    public String getRequestBody() {
        return requestBody;
    }

    @Override
    public Principal getUserPrincipal() {
        return super.getUserPrincipal();
    }
}
