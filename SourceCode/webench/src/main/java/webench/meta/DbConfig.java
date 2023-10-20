package webench.meta;

import lombok.Data;

@Data
public class DbConfig {
  private final String host;
  private final String database;
  private final String username;
  private final String password;
  private final int port;
}
