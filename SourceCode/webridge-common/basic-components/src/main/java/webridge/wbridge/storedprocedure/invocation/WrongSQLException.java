package webridge.wbridge.storedprocedure.invocation;

public class WrongSQLException extends Exception {
  public WrongSQLException(String message) {
    super("Executed wrong SQL: " + message);
  }
}
