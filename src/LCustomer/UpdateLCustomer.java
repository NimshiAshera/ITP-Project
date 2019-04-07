package LCustomer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Driver.DBManager;

/**
 * Servlet implementation class UpdateLCustomer
 */
@WebServlet("/UpdateLCustomer")
public class UpdateLCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLCustomer() {
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
		
		
		LCustomer lcustomer = new LCustomer();
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		
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
				if(session.getAttribute("uname")!= null){
					String uname = (String) session.getAttribute("uname");
					//String password = (String)session.getAttribute("password");
				}
				else{
					response.sendRedirect("#");
				}
			}
			
			try{
				String uname = (String) session.getAttribute("uname");
				String sql2 = "update lcustomer set  fname=? ,lname=? , phone=? ,email=?  "
						+ "where uname = '"+uname+"'";
		
				PreparedStatement pre = conn.prepareStatement(sql2);
				
				pre.setString(1, fname);
				pre.setString(2, lname);
				pre.setString(3, phone);
				pre.setString(4, email);
				
				
				pre.execute();
				
				Object message = "Successfully updated";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/Home-AfterLogin.jsp").forward(request, response);
				
			}
			catch(Exception e){
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
				
	}
		
		
	}

}
