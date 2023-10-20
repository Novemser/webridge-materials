package webridge.sql.types;

public enum SqlType {
  SELECT,
  UPDATE,
  DELETE,
  INSERT,
  ENABLE_AUTO_COMMIT,
  DISABLE_AUTO_COMMIT,
  COMMIT;

  public boolean isTxnControl() {
    return this == ENABLE_AUTO_COMMIT || this == DISABLE_AUTO_COMMIT || this == COMMIT;
  }

  public boolean isWriteSql() {
    return this == UPDATE || this == INSERT || this == DELETE;
  }
}
