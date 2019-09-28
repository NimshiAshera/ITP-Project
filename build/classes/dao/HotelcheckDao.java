package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.HotelLoginBean;

public class HotelcheckDao {
	
	public String authenticateUser(HotelLoginBean loginBean)
	{
		String username = loginBean.getUsername();
		String password = loginBean.getPassword();
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String userNameDB = "";
		String passwordDB = "";
		
		try
		{
			con = DBConnection.createConnection();
			statement =con.createStatement();
			resultSet = statement.executeQuery("select username,password from hotel10");
			
			while(resultSet.next()){
				userNameDB = resultSet.getString("username");
				passwordDB = resultSet.getString("password");
				
				if(username.equals("Admin") && password.equals(passwordDB))
					return "Admin_Role";
				
				else if(username.equals(userNameDB) && password.equals(passwordDB))
					return "User_Role";
			}
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return "Invalid user credentials";
	}

}
