package Accounts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Business_Transaction {

    private static String sql;
    private PreparedStatement ps;
    private static ResultSet res;

    public int addpayment(String Transaction_Id, String Type, String Date, String Amount) throws SQLException, ClassNotFoundException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            sql = "INSERT INTO `business_payment`(`Transaction_Id`, `Type`, `Date`, `Amount`) VALUES(?,?,?,?)";
            ps = con.prepareStatement(sql);

            ps.setString(1, Transaction_Id);
            ps.setString(2, Type);
            ps.setString(3, Date);
            ps.setString(4, Amount);

            int query = ps.executeUpdate();

            return query;
        }

        return 0;

    }

    public int deleteBusinessTransaction(String Transaction_Id) throws SQLException, ClassNotFoundException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();

            sql = "DELETE FROM `business_payment` WHERE `Transaction_Id` = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, Transaction_Id);

            int query = ps.executeUpdate();

            return query;
        }

        return 0;
    }

    public static ResultSet viewBusinessTransaction() throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT `Transaction_Id`, `Type`, `Date`, `Amount` FROM `business_payment`";
            res = st.executeQuery(sql);
        }
        return res;

    }

    public int updateBusinessTransaction(String Transaction_Id, String Type, String Date, String Amount) throws SQLException, ClassNotFoundException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            sql = "UPDATE `business_payment` SET `Type`= ?,`Date`= ?,`Amount`= ? WHERE `business_payment`.`Transaction_Id` = ? ";
            ps = con.prepareStatement(sql);

            ps.setString(1, Type);
            ps.setString(2, Date);
            ps.setString(3, Amount);
            ps.setString(4, Transaction_Id);

            int query = ps.executeUpdate();

            return query;
        }

        return 0;
    }

    public static ResultSet getBusinessTransaction(String Transaction_Id) throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT `Transaction_Id`, `Type`, `Date`, `Amount` FROM `business_payment` WHERE `Transaction_Id` = '" + Transaction_Id + "'";

            res = st.executeQuery(sql);
        }
        return res;

    }
}
