package webench.data.custom.forum;

import webench.data.TableGenerator;
import webench.database.DBHelper;
import webench.meta.workload.WorkloadConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class PybbsGenerator implements TableGenerator {
  private static final Logger logger = LogManager.getLogger(PybbsGenerator.class);
  protected final Random random;

  public PybbsGenerator() {
    random = new Random(42);
  }

  @Override
  public void populateData(Connection connection, WorkloadConfig workloadConfig)
      throws SQLException {
    if (logger.isDebugEnabled()) {
      logger.debug("Populating database for Pybbs");
    }
    Integer totalNumUsers = workloadConfig.getTotalNumRecords().get("User");
    Integer totalNumTopics = workloadConfig.getTotalNumRecords().get("Topic");
    Integer totalNumcomments = workloadConfig.getTotalNumRecords().get("Comment");
    logger.warn("Populating users: " + totalNumUsers);
    DBHelper.truncateTable(connection, "user");

    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO user ("
                + "username, password, "
                + "avatar, email, mobile, "
                + "website, bio, "
                + "score, in_time, token, "
                + "telegram_name, email_notification, active) values (?,?,?,?,?,?,?,?,?,?,?,?,?)")) {
      for (int userId = 0; userId < totalNumUsers; userId++) {
        // pstmt.setInt(1, userId);
        pstmt.setString(1, "user" + userId);
        pstmt.setString(2, "password-" + userId);
        pstmt.setString(3, "");
        pstmt.setString(4, userId + "@webridge.edu");
        pstmt.setString(5, "Tel-" + userId);
        pstmt.setString(6, "");
        pstmt.setString(7, "I am user" + userId);
        pstmt.setInt(8, 100 + userId);
        pstmt.setTimestamp(9, Timestamp.valueOf("2023-10-12 14:08:05.477"));
        pstmt.setString(10, "token-" + userId);
        pstmt.setString(11, "telegram-user-" + userId);
        pstmt.setInt(12, 0);
        pstmt.setInt(13, 1);
        pstmt.addBatch();
        if (userId % getBatchWriteSize() == 0) {
          if (logger.isInfoEnabled()) {
            logger.info(
                String.format(
                    "Pybbs executing batch of size %d, index at %d", getBatchWriteSize(), userId));
          }
          pstmt.executeBatch();
        }
      }
      pstmt.executeBatch();
      connection.commit();
    }

    logger.warn("Populating topics: " + totalNumTopics);
    DBHelper.truncateTable(connection, "topic");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO topic ("
                + "title, content, "
                + "in_time, modify_time, user_id, "
                + "style, comment_count, "
                + "collect_count, view, top, "
                + "good, up_ids) values (?,?,?,?,?,?,?,?,?,?,?,?)")) {
      for (int topicId = 0; topicId < totalNumTopics; topicId++) {
        pstmt.setString(1, "Topic" + topicId);
        pstmt.setString(2, "wubba lubba dub dub");
        pstmt.setTimestamp(3, Timestamp.valueOf("2023-10-12 14:08:05.477"));
        pstmt.setTimestamp(4, Timestamp.valueOf("2023-10-12 14:08:05.497"));
        pstmt.setInt(5, random.nextInt(totalNumUsers));
        pstmt.setString(6, "MD");
        pstmt.setInt(7, 0);
        pstmt.setInt(8, 0);
        pstmt.setInt(9, 0);
        pstmt.setInt(10, 0);
        pstmt.setInt(11, 0);
        pstmt.setString(12, "");
        pstmt.addBatch();
        if (topicId % getBatchWriteSize() == 0) {
          if (logger.isInfoEnabled()) {
            logger.info(
                String.format(
                    "Pybbs executing batch of size %d, index at %d", getBatchWriteSize(), topicId));
          }
          pstmt.executeBatch();
        }
      }
      pstmt.executeBatch();
      connection.commit();
    }

    logger.warn("Populating comments: " + totalNumTopics);
    DBHelper.truncateTable(connection, "comment");
    int commentsPerUser = totalNumcomments / totalNumUsers;
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO comment ("
                + "style, content, "
                + "topic_id, user_id, in_time, "
                + "comment_id, up_ids, "
                + "tg_message_id, status) values (?,?,?,?,?,?,?,?,?)")) {
      for (int userId = 0; userId < totalNumUsers; userId++) {
        for (int commentId = 0; commentId < commentsPerUser; commentId++) {
          pstmt.setString(1, "MD");
          pstmt.setString(2, "wubba lubba dub dub");
          pstmt.setInt(3, random.nextInt(totalNumTopics));
          pstmt.setInt(4, userId);
          pstmt.setTimestamp(5, Timestamp.valueOf("2023-10-12 15:08:05.477"));
          pstmt.setInt(6, commentId);
          pstmt.setString(7, "");
          pstmt.setInt(8, commentId);
          pstmt.setInt(9, 0);
          pstmt.addBatch();
          if (commentId % getBatchWriteSize() == 0) {
            if (logger.isInfoEnabled()) {
              logger.info(
                  String.format(
                      "Pybbs executing batch of size %d, index at %d",
                      getBatchWriteSize(), commentId));
            }
            pstmt.executeBatch();
          }
        }
      }
      pstmt.executeBatch();
      connection.commit();
    }
  }
}
