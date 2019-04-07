package Accounts;


import Accounts.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Business_Payment {

    private String sql;
    private PreparedStatement ps;

    public int addpayment(String Transaction_Id, String Type, String Date, String Amount) throws SQLException, ClassNotFoundException {

        if (Connect.getInstance() != null) {
            Connection con = Connect.getConnction();
            sql = "INSERT INTO `business_payment`(`Transaction_Id`, `Type`, `Date`, `Amount`) VALUES (?,?,?,?)";
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

 
} 