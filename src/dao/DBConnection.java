package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnection {
	
	public static Connection createConnection()
	{
		Connection con = null;
		try{
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
			}catch (ClassNotFoundException e){
				e.printStackTrace();
				
			}
			
			//connect to database
			con = DriverManager.getConnection("jdbc:mysql://localhost/itp?useSSL=false" , "root", "root");
			System.out.println("Post establishing a DB connection");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return con;
	}
	
	
	public static ResultSet DBquery(String query) {
		try{
		//connect to database
		   Connection con = DriverManager.getConnection("jdbc:mysql://localhost/itp?useSSL=false" , "root", "root");
		   
		//create statement
		   Statement mys = con.createStatement();
		
		//execute sql query
		   ResultSet rs = mys.executeQuery(query);
		
		//process results
		   return rs;
		}
		
		catch(Exception ex) {
			ex.printStackTrace();
			return null;

		}
		
	}

}
