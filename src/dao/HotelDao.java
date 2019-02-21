package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Hotel;

public class HotelDao {
	
	private static Connection connect() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/itp?useSSL=false" , "root", "root");
			System.out.println("Post establishing a DB connection");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}

	public static int registerUser(Hotel c, String sql) {
		int i=0;
		Connection con = connect();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getPart());
			ps.setString(2, c.getName());
			ps.setString(3, c.getPrice());
			ps.setString(4, c.getContact_no());
			ps.setString(5, c.getHotel_id());
			ps.setString(6, c.getAddress());
			ps.setString(7, c.getUsername());
			ps.setString(8, c.getPassword());
			
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return i;
	}

	public static ResultSet LoginUser(Hotel c, String sql) {
        ResultSet rs = null;
        Connection con = connect();
        try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(7, c.getUsername());
			ps.setString(8, c.getPassword());
			
			rs = ps.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
		return rs;
	}

	public static int updateUser(Hotel c, String sql) {
    int i=0;
    
    Connection con = connect();
    
    try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, c.getPart());
		ps.setString(2, c.getName());
		ps.setString(3, c.getPrice());
		ps.setString(4, c.getContact_no());
		ps.setString(5, c.getHotel_id());
		ps.setString(6, c.getAddress());
		ps.setString(7, c.getUsername());
		ps.setString(8, c.getPassword());
		ps.setString(9, c.getUsername());
		
		i = ps.executeUpdate();
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return i;
	}




}
