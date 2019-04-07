package Accounts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Bad_Debt {

    private static String sql;
    private PreparedStatement ps;
    private static ResultSet res;

    public int addBadDebt(String Transaction_Id, String Business_name, String Department, String Amount, String Date) throws SQLException, ClassNotFoundException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            sql = "INSERT INTO `bad_debts`(`Transaction_Id`, `Business_name`, `Department`, `Amount`, `Date`) VALUES (?,?,?,?,?)";
            ps = con.prepareStatement(sql);

            ps.setString(1, Transaction_Id);
            ps.setString(2, Business_name);
            ps.setString(3, Department);
            ps.setString(4, Amount);
            ps.setString(5, Date);
            int query = ps.executeUpdate();

            return query;
        }

        return 0;
    }

    public static ResultSet getBadDebts() throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT `Transaction_Id`, `Business_name`, `Department`, `Amount`, `Date` FROM `bad_debts`";
            res = st.executeQuery(sql);
        }
        return res;
    }

    public int deleteBadDebt(String Transaction_Id) throws SQLException, ClassNotFoundException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();

            sql = "DELETE FROM bad_debts WHERE Transaction_Id = ? ";
            ps = con.prepareStatement(sql);
            ps.setString(1, Transaction_Id);

            int query = ps.executeUpdate();

            return query;
        }

        return 0;
    }
}
