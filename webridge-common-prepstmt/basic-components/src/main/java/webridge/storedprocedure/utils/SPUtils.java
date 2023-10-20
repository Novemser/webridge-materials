package webridge.storedprocedure.utils;

import com.mysql.jdbc.JDBC42PreparedStatement;
import webridge.util.reflect.ReflectionUtils;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SPUtils {
  protected static final Log logger = LogFactory.getLog(SPUtils.class);

  private static Method untrackStatementMth;

  static {
    Class<?> proxyCnnClz = null;
    try {
      proxyCnnClz = Class.forName("com.zaxxer.hikari.pool.ProxyConnection");
      untrackStatementMth = proxyCnnClz.getDeclaredMethod("untrackStatement", Statement.class);
      untrackStatementMth.setAccessible(true);
    } catch (Exception e) {
      logger.error(
          "unable to initialize hikari proxy connection class, proxy connection seems not using HikariProxyConnection");
    }
  }

  public static void unlinkResourceManager(Statement stmt, Connection conn) {
    if (!conn.getClass().getName().equals("com.zaxxer.hikari.pool.HikariProxyConnection")) {
      return;
    }

    try {
      Class<? extends Statement> pstmtClz = stmt.getClass();
      if (pstmtClz.getName().equals("com.zaxxer.hikari.pool.HikariProxyPreparedStatement")) {
        Field delegateFld = fieldFromCache(pstmtClz, "delegate");
        untrackStatementMth.invoke(conn, delegateFld.get(stmt));
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public static class PrepareStmtMeta {
    public int[] paramTypes;
    public byte[][] parameters;
    public String sqlTemplate;

    public PrepareStmtMeta(int[] paramTypes, byte[][] parameters, String sqlTemplate) {
      this.paramTypes = paramTypes;
      this.parameters = parameters;
      this.sqlTemplate = sqlTemplate;
    }
  }

  private static final Map<Class<?>, Map<String, Field>> fldCache = new HashMap<>();
  //  private static final Map<Class<?>, Boolean> isProxyCache = new HashMap<>();

  private static Field fieldFromCache(Class<?> clz, String name) {
    return fldCache
        .compute(
            clz,
            (ignored, fieldMap) -> {
              if (fieldMap == null) fieldMap = new HashMap<>();
              fieldMap.compute(
                  name,
                  (str, field) -> {
                    if (field == null) {
                      field = ReflectionUtils.findField(clz, name);
                      if (field == null) {
                        logger.error(String.format("Unable to find %s.%s", clz.getName(), name));
                      }
                      Objects.requireNonNull(field).setAccessible(true);
                    }
                    return field;
                  });
              return fieldMap;
            })
        .get(name);
  }

  public static PrepareStmtMeta parseIncomingPreparedStmt(PreparedStatement invokingPs)
      throws Exception {
    final Class<? extends PreparedStatement> prepStmtClz = invokingPs.getClass();
    final Field delegateFld, queryFld;
    final Object pstmtBody, queryStringBody;
    if (invokingPs instanceof JDBC42PreparedStatement) {
      return new PrepareStmtMeta(
              (int[]) fieldFromCache(prepStmtClz, "parameterTypes").get(invokingPs),
              (byte[][]) fieldFromCache(prepStmtClz, "parameterValues").get(invokingPs),
              (String) fieldFromCache(prepStmtClz, "originalSql").get(invokingPs));
    } else if (!Proxy.isProxyClass(prepStmtClz)) {
      delegateFld = fieldFromCache(prepStmtClz, "delegate");
      queryStringBody = delegateFld.get(invokingPs);
      queryFld = fieldFromCache(queryStringBody.getClass(), "originalSql");
      pstmtBody = invokingPs;
    } else {
      final InvocationHandler handler = Proxy.getInvocationHandler(invokingPs);
      final Class<? extends InvocationHandler> handlerClz = handler.getClass();
      delegateFld = fieldFromCache(handlerClz, "delegate");
      queryFld = fieldFromCache(handlerClz, "query");
      pstmtBody = queryStringBody = handler;
    }

    final Object delegateObj = delegateFld.get(pstmtBody);
    // parameter values
    final Field parameterValuesFld = fieldFromCache(delegateObj.getClass(), "parameterValues");

    final Field parameterTypeFld = fieldFromCache(delegateObj.getClass(), "parameterTypes");

    return new PrepareStmtMeta(
        (int[]) parameterTypeFld.get(delegateObj),
        (byte[][]) parameterValuesFld.get(delegateObj),
        (String) queryFld.get(queryStringBody));
  }

  public static void setProxyConnAutoCommit(Connection conn, boolean val)
      throws IllegalAccessException {
    final Object connImpl = resolveConnectionFromProxy(conn);
    final Field autoCommitFld = fieldFromCache(connImpl.getClass(), "autoCommit");
    // set the connection's autoCommit to false, inorder for next commit operation
    autoCommitFld.set(connImpl, val);
  }

  public static Connection resolveConnectionFromProxy(Connection conn)
      throws IllegalAccessException {
    if (conn.getClass().getCanonicalName().equals("com.zaxxer.hikari.pool.HikariProxyConnection")) {
      Field connFld = fieldFromCache(conn.getClass(), "delegate");
      return (Connection) connFld.get(conn);
    }
    if (!Proxy.isProxyClass(conn.getClass())) {
      return conn;
    }

    final InvocationHandler invocationHandler = Proxy.getInvocationHandler(conn);
    final Class<? extends InvocationHandler> proxyConnClz = invocationHandler.getClass();
    Field nextFld = fieldFromCache(proxyConnClz, "next");
    Object nextObj = nextFld.get(invocationHandler);
    nextFld = fieldFromCache(nextObj.getClass(), "next");
    nextObj = nextFld.get(nextObj);
    Field connectionFld = fieldFromCache(nextObj.getClass(), "connection");
    final Object connObj = connectionFld.get(nextObj);
    connectionFld = fieldFromCache(connObj.getClass(), "connection");
    return (Connection) connectionFld.get(connObj);
  }

  public static String densify(String str) {
    return str.replace("\n", "");
  }
}