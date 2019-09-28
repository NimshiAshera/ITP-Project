package Adventure;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Driver.DBManager;

/**
 * Servlet implementation class UpdateAdventure2
 */
@WebServlet("/UpdateAdventure2")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class UpdateAdventure2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdventure2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Adventure adventure = new Adventure();
		
		String contact_no =request.getParameter("contact_no");
		String Details =request.getParameter("Details");
		String season =request.getParameter("season");
		String see =request.getParameter("see");
		String time =request.getParameter("time");
		
		response.setContentType("text/html");
		PrintWriter write =response.getWriter();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		if(conn==null){
			write.write("Connection Not Established");
		}
		else{
			HttpSession session = request.getSession();
			if(session != null){
				if(session.getAttribute("username")!= null){
					String username = (String) session.getAttribute("username");
					//String password = (String)session.getAttribute("password");
				}
				else{
					response.sendRedirect("AdventureLogin.jsp");
				}
			}
			try{
				String username = (String) session.getAttribute("username");
				String sql2 = "update adventure set contact_no=? ,Details=? ,season=? ,see=? ,time=?"
						+ " where username = '"+ username +"'";
		
				PreparedStatement pre = conn.prepareStatement(sql2);
				
				
				pre.setString(1, contact_no);
				pre.setString(2, Details);
				pre.setString(3, season);
				pre.setString(4, see);
				pre.setString(5, time);
			
				
				pre.execute();
				
				Object message = "Successfully updated";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/Home.jsp").forward(request, response);
				request.getRequestDispatcher("/Header.jsp").forward(request,
						response);
				
			}
			catch(Exception e){
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}	
		
		
	}

}
