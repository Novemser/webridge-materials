package webench.data.custom.confmanage;

import webench.data.IdGenerator;
import webench.data.TableGenerator;
import webench.database.DBHelper;
import webench.meta.workload.WorkloadConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ApolloGenerator implements TableGenerator {
  private static final Logger logger = LogManager.getLogger(ApolloGenerator.class);

  @Override
  public void populateData(Connection connection, WorkloadConfig config) throws SQLException {
    Integer totalNumUsers = config.getTotalNumRecords().get("User");
    logger.warn("populating users " + totalNumUsers);
    DBHelper.truncateTable(connection, "Users");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO Users (Username,Password,UserDisplayName,Email,Enabled) values "
                + "(?,?,?,?,?)")) {
      for (int userId = 1; userId <= totalNumUsers; userId++) {
        pstmt.setObject(1, IdGenerator.userNameFromId(userId));
        pstmt.setObject(2, "$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS");
        pstmt.setObject(3, IdGenerator.userNameFromId(userId));
        pstmt.setObject(4, userId + "@mail.com");
        pstmt.setObject(5, true);
        pstmt.execute();
      }
      connection.commit();
    }

    DBHelper.truncateTable(connection, "UserRole");
    DBHelper.truncateTable(connection, "Authorities");
    DBHelper.truncateTable(connection, "SPRING_SESSION");
    DBHelper.truncateTable(connection, "SPRING_SESSION_ATTRIBUTES");

    final Statement statement = connection.createStatement();
    // FIXME these hard coded role ids
    final int[] roleIds = new int[] {2, 4, 5, 8, 10, 11, 14, 16, 17, 20, 21};
    for (int userId = 1; userId <= totalNumUsers; userId++) {
      for (int roleId : roleIds) {
        int res =
            statement.executeUpdate(
                String.format(
                    "INSERT INTO UserRole (UserId, RoleId) VALUES ('%s', %d)",
                    IdGenerator.userNameFromId(userId), roleId));
        if (res <= 0) {
          throw new RuntimeException("Failed to insert user role");
        }
      }
      int res =
          statement.executeUpdate(
              String.format(
                  "INSERT INTO Authorities (Username, Authority) VALUES ('%s', 'ROLE_user')",
                  IdGenerator.userNameFromId(userId)));
      if (res <= 0) {
        throw new RuntimeException("Failed to insert user role");
      }
    }
    connection.commit();
    statement.close();
  }
}
