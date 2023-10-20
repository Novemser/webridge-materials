package webridge.wbridge.util;

public abstract class Assert {

  /**
   * Assert a boolean expression, throwing {@code IllegalArgumentException} if the test result is
   * {@code false}.
   *
   * <pre class="code">Assert.isTrue(i &gt; 0, "The value must be greater than zero");</pre>
   *
   * @param expression a boolean expression
   * @param message the exception message to use if the assertion fails
   * @throws IllegalArgumentException if expression is {@code false}
   */
  public static void isTrue(boolean expression, String message) {
    if (!expression) {
      throw new IllegalArgumentException(message);
    }
  }

  /**
   * Assert that an object is not {@code null} .
   *
   * <pre class="code">Assert.notNull(clazz, "The class must not be null");</pre>
   *
   * @param object the object to check
   * @param message the exception message to use if the assertion fails
   * @throws IllegalArgumentException if the object is {@code null}
   */
  public static void notNull(Object object, String message) {
    if (object == null) {
      throw new IllegalArgumentException(message);
    }
  }

  /**
   * Assert that an object is not {@code null} .
   *
   * <pre class="code">Assert.notNull(clazz);</pre>
   *
   * @param object the object to check
   * @throws IllegalArgumentException if the object is {@code null}
   */
  public static void notNull(Object object) {
    notNull(object, "[Assertion failed] - this argument is required; it must not be null");
  }

  /**
   * Assert a boolean expression, throwing {@code IllegalStateException} if the test result is
   * {@code false}. Call isTrue if you wish to throw IllegalArgumentException on an assertion
   * failure.
   *
   * <pre class="code">Assert.state(id == null, "The id property must not already be initialized");
   * </pre>
   *
   * @param expression a boolean expression
   * @param message the exception message to use if the assertion fails
   * @throws IllegalStateException if expression is {@code false}
   */
  public static void state(boolean expression, String message) {
    if (!expression) {
      throw new IllegalStateException(message);
    }
  }
}
