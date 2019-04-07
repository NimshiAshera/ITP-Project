package Accounts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {

    private static Connect connect;
    private static Connection con;
    private static String url = "jdbc:mysql://localhost/";
    private static String dbname = "project";
    private static String username = "root";
    private static String password = "root";

    private Connect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url + dbname, username, password);
    }

    public static Connect getInstance() throws ClassNotFoundException, SQLException {
        if (connect == null) {
            connect = new Connect();
            return connect;
        } else {
            return connect;
        }
    }

    public static boolean getStatus() {
        if (connect == null) {
            return false;
        } else {
            return true;
        }
    }
    
    public static Connection getConnction(){
        return con;
    }
}
