package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Spa;

public class SpaDao {
	
	private static Connection connect() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false" , "root", "root");
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

	public static int registerUser(Spa c, String sql) {
		int i=0;
		Connection con = connect();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, c.getName());
			ps.setString(2, c.getId());
			ps.setString(3, c.getDbimagelocation());
			ps.setString(4, c.getFacials());
			ps.setString(5, c.getWaxing());
			ps.setString(6, c.getBody());
			ps.setString(7, c.getMassage());
			ps.setString(8, c.getTinting());
			ps.setString(9, c.getAddress());
			ps.setString(10, c.getUsername());
			ps.setString(11, c.getPassword());
			
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return i;
	}

	public static ResultSet LoginUser(Spa c, String sql) {
        ResultSet rs = null;
        Connection con = connect();
        try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(10, c.getUsername());
			ps.setString(11, c.getPassword());
			
			rs = ps.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
		return rs;
	}

	public static int updateUser(Spa c, String sql) {
    int i=0;
    
    Connection con = connect();
    
    try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, c.getName());
		ps.setString(2, c.getId());
		ps.setString(3, c.getDbimagelocation());
		ps.setString(4, c.getFacials());
		ps.setString(5, c.getWaxing());
		ps.setString(6, c.getBody());
		ps.setString(7, c.getMassage());
		ps.setString(8, c.getTinting());
		ps.setString(9, c.getAddress());
		ps.setString(10, c.getUsername());
		ps.setString(11, c.getPassword());
		ps.setString(12, c.getUsername());
		i = ps.executeUpdate();
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return i;
	}




}
