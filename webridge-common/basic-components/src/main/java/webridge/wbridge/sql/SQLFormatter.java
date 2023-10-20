package webridge.wbridge.sql;

import com.alibaba.druid.sql.SQLUtils;
import com.alibaba.druid.sql.ast.SQLStatement;
import webridge.wbridge.sql.ast.SQLFormatASTVisitor;
import java.util.HashMap;
import java.util.Map;

public class SQLFormatter {
  private static final Map<String, String> cache = new HashMap<>();

  public static String formatSQL(String sql) {
    return cache.compute(
        sql,
        (ignored, formatted) -> {
          if (formatted == null) {
            SQLStatement statement = SQLUtils.parseSingleMysqlStatement(sql);
            statement.accept(new SQLFormatASTVisitor());
            formatted = statement.toString();
          }
          return formatted;
        });
  }
}
