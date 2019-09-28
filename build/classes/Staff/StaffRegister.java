package Staff;

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

import Driver.DBManager;

/**
 * Servlet implementation class StaffRegister
 */
@WebServlet("/StaffRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class StaffRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffRegister() {
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
		
		Staff staff = new Staff();
		
		PrintWriter out = response.getWriter();
		
		staff.setRole(request.getParameter("role"));
		staff.setFname(request.getParameter("fname"));
		staff.setLname(request.getParameter("lname"));
		staff.setNic(request.getParameter("nic"));
		staff.setPhoneno(request.getParameter("phoneno"));
		staff.setEmail(request.getParameter("email"));
		staff.setUsername(request.getParameter("username"));
		staff.setPassword(request.getParameter("password"));
		
		//----------------------------------------------------------
		
		response.setContentType("text/html");
		
		PrintWriter write = response.getWriter();

		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		if (conn == null) {
			System.out.println("connect");
			write.write("Connection Not Established");
			System.out.println("connected");
		} 
		else {
			
			try {
				Statement st = conn.createStatement();
				String sql = "select * from staff where username = '"
						+ staff.getUsername() + "'";
				ResultSet rs = st.executeQuery(sql);

				if (rs.next()) {
					Object message = "Already registered.";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/staffRegistation.jsp").forward(
							request, response);
			   
	           }
				else  {
					String sql2 = "insert into staff (role,fname,lname,nic,phoneno,email,username,password)"
							+ "values (?,?,?,?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, staff.getRole());
					pre.setString(2, staff.getFname());
					pre.setString(3, staff.getLname());
					pre.setString(4, staff.getNic());
					pre.setString(5, staff.getPhoneno());
					pre.setString(6, staff.getEmail());
					pre.setString(7, staff.getUsername());
					pre.setString(8, staff.getPassword());
								
				pre.execute();				
				
				request.getRequestDispatcher("/Home.jsp").forward(request,
						response);
				request.getRequestDispatcher("/Header.jsp").forward(request,
						response);
				
				}		
			
		} catch (Exception e) {
		System.out.println("Got an exception");
		System.out.println(e.getMessage());
		
		}
		}	
		
	}
}

