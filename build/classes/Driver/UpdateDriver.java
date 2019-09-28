package Driver;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateDriver
 */
@WebServlet("/UpdateDriver")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class UpdateDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDriver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Driver driver = new Driver();
		
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String dI=request.getParameter("dI");
		String dE=request.getParameter("dE");
		String part=request.getParameter("part");
		
		
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
					response.sendRedirect("driverSignin.jsp");
				}
			}
			
			try{
				String username = (String) session.getAttribute("username");
				String sql2 = "update driver set  email=? , phone=? , dI=? , dE=? , part=? "
						+ "where username = '"+username+"'";
		
				PreparedStatement pre = conn.prepareStatement(sql2);
				
				pre.setString(1, email);
				pre.setString(2, phone);
				pre.setString(3, dI);
				pre.setString(4, dE);
				pre.setString(5, part);
				
				pre.execute();
				
				Object message = "Successfully updated";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/Home.jsp").forward(request, response);
				request.getRequestDispatcher("/Header.jsp").forward(request, response);
				
			}
			catch(Exception e){
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
				
	}

}
}
