package util;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DataConnection {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/furama";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "superuser";
    public static java.sql.Connection connection;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public  static void close(){
        try{
            if (connection != null){
                connection.close();
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}






























