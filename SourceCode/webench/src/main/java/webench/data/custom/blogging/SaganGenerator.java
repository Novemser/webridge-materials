package webench.data.custom.blogging;

import webench.data.TableGenerator;
import webench.database.DBHelper;
import webench.meta.workload.WorkloadConfig;

import java.sql.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SaganGenerator implements TableGenerator {
  private static final Logger logger = LogManager.getLogger(SaganGenerator.class);

  @Override
  public void populateData(Connection connection, WorkloadConfig config) throws SQLException {
    // 4980 Blogs, 35 Projects
    Integer numBlogs = config.getTotalNumRecords().get("Blog");
    logger.info("populating posts " + numBlogs);
    DBHelper.truncateTable(connection, "post");
    DBHelper.truncateTable(connection, "post_public_slug_aliases");
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO post ("
                + "broadcast, category, created_at, "
                + "draft, format, public_slug, "
                + "publish_at, raw_content, "
                + "rendered_content, rendered_summary, title, "
                + "author_id) values (?,?,?,?,?,?,?,?,?,?,?,?)")) {
      for (int blogId = 0; blogId < numBlogs; blogId++) {
        pstmt.setBoolean(1, false);
        pstmt.setString(2, "RELEASES");
        pstmt.setTimestamp(3, Timestamp.valueOf("2020-01-22 08:55:00"));
        pstmt.setBoolean(4, false);
        pstmt.setString(5, "MARKDOWN");
        pstmt.setString(6, "2020/01/22/webenchedit1");
        pstmt.setTimestamp(7, Timestamp.valueOf("2020-01-22 08:55:00"));
        pstmt.setString(8, "CONTENT" + blogId);
        pstmt.setString(9, "CONTENT" + blogId);
        pstmt.setString(10, "SUMMARY" + blogId);
        pstmt.setString(11, "TITLE" + blogId);
        pstmt.setInt(12, 1);
        pstmt.addBatch();
        if (blogId % getBatchWriteSize() == 0) {
          if (logger.isInfoEnabled()) {
            logger.info(
                String.format(
                    "Sagan executing batch of size %d, index at %d", getBatchWriteSize(), blogId));
          }
          pstmt.executeBatch();
        }
      }
      pstmt.executeBatch();
      connection.commit();
    }
  }
}
