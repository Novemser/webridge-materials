package webridge.exception;

public class NotImplementedException extends RuntimeException {
  public NotImplementedException() {
    super("Not implemented yet");
  }

  public NotImplementedException(String info) {
    super("Not implemented yet: " + info);
  }
}
