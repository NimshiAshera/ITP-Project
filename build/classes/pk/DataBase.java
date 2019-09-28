package pk;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBase {
	private static Connection c;
	   public static Connection getconn(){
		   if(c==null){
			   try{
				   Class.forName("com.mysql.jdbc.Driver");
				   c = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			   }
			   catch(Exception ex) {
	               ex.printStackTrace();
				   
			   }
		   }
		   return c;
	   }
}
