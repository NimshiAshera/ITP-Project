package Accounts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Booking_Transaction {
    
    private static String sql;
    private static ResultSet res;
    private PreparedStatement ps;


     public int updateBooking(String Transaction_Id) throws SQLException, ClassNotFoundException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();

            sql = "UPDATE booking_payment SET Status = ? WHERE Transaction_Id = ? ";
            ps = con.prepareStatement(sql);

            ps.setString(1, "confirmed");
            ps.setString(2, Transaction_Id);

            int query = ps.executeUpdate();

            return query;
        }

        return 0;
    }
    
    
    public int deleteBooking(String Transaction_Id) throws SQLException, ClassNotFoundException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();

            sql = "DELETE FROM booking_payment WHERE Transaction_Id = ? ";
            ps = con.prepareStatement(sql);
            ps.setString(1, Transaction_Id);

            int query = ps.executeUpdate();

            return query;
        }

        return 0;
    }
    
    
    public static ResultSet viewBookingTransaction() throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT Transaction_Id, Business_name , Department , Amount, Date FROM booking_payment WHERE Status = 'Unconfirmed'";
            res = st.executeQuery(sql);
        }
        return res;
    

    }
}
