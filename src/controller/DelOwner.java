package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OwnerK;
import dao.DBConnection;

/**
 * Servlet implementation class DeleteOwner
 */
@WebServlet("/DelOwner")
public class DelOwner extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelOwner() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	
    }
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		PrintWriter write =response.getWriter();
		
			DBConnection db=new DBConnection();
			Connection conn = db.createConnection();
			
			if(conn==null){
				write.write("Connection Not Established");
			}
			else{
				HttpSession session = request.getSession();
				if(session != null){
					if(session.getAttribute("username")!= null){
						String name = (String) session.getAttribute("username");
						String password = (String)session.getAttribute("password");
						
					/*	Object message = "Welcome " + name;
						request.setAttribute("message", message);
						request.getRequestDispatcher("/index.jsp").forward(request, response);
						request.getRequestDispatcher("/header.jsp").forward(request, response);*/
					}
					else{
						response.sendRedirect("ownerSignin.jsp");
					}
				}
				
				try{
					String UserName = (String) session.getAttribute("username");
					String sql2 = "delete from owner where username = '"+UserName+"'";
					
					
					Statement st = conn.createStatement();
					st.execute(sql2);
					
					session.invalidate();
					
					Object message = "Successfully deleted";
					request.setAttribute("message", message);
					request.getRequestDispatcher("/homepage.jsp").forward(request, response);
					request.getRequestDispatcher("/header.jsp").forward(request, response);
				
				}
				catch(Exception e){
					System.out.println("Got an exception");
					System.out.println(e.getMessage());
				}
			}
	
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
