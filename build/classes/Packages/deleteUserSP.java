package Packages;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Driver.DBManager;


/**
 * Servlet implementation class deleteUserServlet
 */
@WebServlet("/deleteUserSP")
public class deleteUserSP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteUserSP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter write=response.getWriter();
		
		HttpSession session = request.getSession();
		
		PackageBook pack=new PackageBook();
		
		pack.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		if (conn == null) {
			write.write("Connection Not Established");
			
		
	

		
		
		}

		else {
			write.write("Connection Established"+pack.getUsername());
		
			
		
	
			String sql = "delete from packagebook where username='"+pack.getUsername()+"'";
			try {
				Statement st = conn.createStatement();
				st.executeUpdate(sql);
				
				session.invalidate();  
		        
		        RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
				rd.forward(request, response);
				
				}catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
		}		

	}

	/**
	  @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
}
