package webench;

import java.sql.*;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        if (args.length <= 5) throw new RuntimeException(Arrays.toString(args));

        String MySqlHost = args[0];
        int MySqlPort = Integer.parseInt(args[1]);
        String MySqlDB = args[2];
        String userName = args[3];
        String password = args[4];
        int numHotPaths = Integer.parseInt(args[5]);

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        final String dbUrl =
                String.format(
                        "jdbc:mysql://%s:%d/%s?useUnicode=true&characterEncoding=utf8&useSSL=false&useLocalSessionState=true&rewriteBatchedStatements=true",
                        MySqlHost, MySqlPort, MySqlDB);

        Connection connection;
        ResultSet res;

        try {
            connection = DriverManager.getConnection(dbUrl, userName, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        final String statementStr = String.format("{CALL MULTI_PATH_BENCH_VIEW_PRODUCT_%d(?)}", numHotPaths);

        try {
            CallableStatement callableStatement = connection.prepareCall(statementStr);
            callableStatement.setString(1, "123");
            long startTime = System.nanoTime();
            for (int i = 0; i < 1000; i++) {
                res = callableStatement.executeQuery();
            }
            long totalTime = System.nanoTime() - startTime;
            System.out.printf("Total time used for %d paths: %d%n", numHotPaths, totalTime);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}