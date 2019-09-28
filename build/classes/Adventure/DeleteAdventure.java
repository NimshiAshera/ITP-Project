package Adventure;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * Servlet implementation class DeleteAdventure
 */
@WebServlet("/DeleteAdventure")
public class DeleteAdventure extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAdventure() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		response.setContentType("text/html");
		PrintWriter write= response.getWriter();
		
		HttpSession session = request.getSession();
		
		Adventure adventure = new Adventure();
		
		adventure.setUsername((String)session.getAttribute("username"));
	
		DBManager db = new DBManager();
		Connection conn= db.getConnection();
		
		if(conn == null)
				write.write("Connection Not Established");
		
		else {
			write.write("Connection Established"+adventure.getUsername());
		
			String sql = "delete from adventure where username='"+adventure.getUsername()+"'";
			try {
				Statement st = conn.createStatement();
				st.executeUpdate(sql);
				
				session.invalidate();  
		        
				RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
		        RequestDispatcher rd1 = request.getRequestDispatcher("/Header-Before.jsp");
				rd.forward(request, response);
				rd1.forward(request, response);
				
				}catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		
	}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
