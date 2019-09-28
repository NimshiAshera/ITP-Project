package Gold;

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
 * Servlet implementation class DeleteGold
 */
@WebServlet("/DeleteGold")
public class DeleteGold extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteGold() {
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
		
		Gold gold = new Gold();
		
		gold.setPid((String)session.getAttribute("pid"));
		
		DBManager db = new DBManager();
		Connection conn= db.getConnection();
		
		if(conn == null)
				write.write("Connection Not Established");
		
		else {
				write.write("Connection Established"+gold.getPid());
			
				String sql = "delete from gold where pid='"+gold.getPid()+"'";
				try {
					Statement st = conn.createStatement();
					st.executeUpdate(sql);
					
					session.invalidate();  
			        
			        RequestDispatcher rd = request.getRequestDispatcher("/dashBOwner.jsp");
					rd.forward(request, response);
					
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
