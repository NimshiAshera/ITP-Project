package Accounts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Log {
    
    private static String sql;
    private PreparedStatement ps;
    private static ResultSet res;

    public int addLogEntry(String icon, String log_details) throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            sql = "INSERT INTO `accounts_log`(`log_icon`, `log_details`) VALUES (?,?)";
            ps = con.prepareStatement(sql);

            ps.setString(1, icon);
            ps.setString(2, log_details);
            int query = ps.executeUpdate();

            return query;
        }

        return 0;
    }
    
    
    public static ResultSet viewBusinessLog() throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT `log_icon`, `log_details`, `log_time` FROM `accounts_log` ORDER BY `accounts_log`.`log_time` DESC LIMIT 10";
            res = st.executeQuery(sql);
        }
        return res;

    }
}
