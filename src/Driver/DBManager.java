package Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
	
	public static void main(String [] abc) {
		DBManager obj = new DBManager();
		
		System.out.println(obj.getConnection());
		
	}
	

	public Connection getConnection() {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/project?useSSL=false", "root", "root");
			return conn;

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
			return null;
		} catch (SQLException e) {

			e.printStackTrace();
			return null;

		}
	}

}
