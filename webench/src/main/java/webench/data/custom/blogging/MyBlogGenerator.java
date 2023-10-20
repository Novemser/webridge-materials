package webench.data.custom.blogging;

import webench.data.TableGenerator;
import webench.database.DBHelper;
import webench.meta.workload.WorkloadConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MyBlogGenerator implements TableGenerator {

  @Override
  public void populateData(Connection connection, WorkloadConfig config) throws SQLException {
    Integer totalNumBlogs = config.getTotalNumRecords().get("Blog");
    logger.warn("populating posts " + totalNumBlogs);
    DBHelper.truncateTable(connection, "tb_blog");

    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO tb_blog ("
                + "blog_title, blog_sub_url, blog_cover_image, "
                + "blog_content, blog_category_id, blog_category_name, "
                + "blog_tags, blog_status, blog_views, "
                + "enable_comment, is_deleted) values (?,?,?,?,?,?,?,?,?,?,?)")) {
      for (int blogId = 1; blogId <= totalNumBlogs; blogId++) {
        pstmt.setString(1, "TITLE" + blogId);
        pstmt.setString(2, "");
        pstmt.setString(3, "http://127.0.0.1:9080/admin/dist/img/rand/10.jpg");
        pstmt.setString(4, "CONTENT" + blogId);
        pstmt.setObject(5, 24);
        pstmt.setObject(6, "日常随笔");
        pstmt.setObject(7, "zz");
        pstmt.setObject(8, 1);
        pstmt.setObject(9, 1);
        pstmt.setObject(10, 0);
        pstmt.setObject(11, 0);
        pstmt.addBatch();
        if (blogId % getBatchWriteSize() == 0) {
          if (logger.isInfoEnabled()) {
            logger.info(
                String.format(
                    "MyBlog executing batch of size %d, index at %d", getBatchWriteSize(), blogId));
          }
          pstmt.executeBatch();
        }
      }
      pstmt.executeBatch();
      connection.commit();
    }

    // the relation table
    try (final PreparedStatement pstmt =
        connection.prepareStatement(
            "INSERT INTO tb_blog_tag_relation (blog_id, tag_id) values (?,?)")) {
      for (int blogId = 1; blogId <= totalNumBlogs; blogId++) {
        pstmt.setObject(1, blogId);
        pstmt.setObject(2, 135);
      }
      pstmt.executeBatch();
      connection.commit();
    }
  }
}
