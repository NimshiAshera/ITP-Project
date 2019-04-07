package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/OwnerLoginCheck")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class OwnerLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerLoginCheck() {
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
		
		String uname = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		
		String dbfname = null,dblname =null,dbaddress =null,dbnic=null,dbgender=null,dbdob =null, dbemail =null,dbphoneno=null,dbuser =null, dbpassword =null;
		response.setContentType("text/html");
		PrintWriter write=response.getWriter();
		
		DBConnection db = new DBConnection();
		Connection conn = db.createConnection();
		
		if (conn == null)
			write.write("Connection Not Established");

		else {
			write.write("Connection Established");

			String message=null;
			String sql = "select Fname,Lname, Address, NIC, Gender, DOB, Email, PhoneNo, UserName,Password from owner where UserName ='"+uname+"'";
			
				
			try {
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				
				int count = 0;
				while (rs.next()) {
					dbfname = (rs.getString(1));
					dblname = (rs.getString(2));
					dbaddress = (rs.getString(3));
					dbnic = (rs.getString(4));
					dbgender = (rs.getString(5));
					dbdob = (rs.getString(6));
					dbemail = (rs.getString(7));
					dbphoneno = (rs.getString(8));
					dbuser = (rs.getString(9));
					dbpassword = (rs.getString(10));
					count += 1;
				}

				if (count == 1 && dbuser.equals(uname) && dbpassword.equals(password)) {
					
					if(dbuser.equals("Admin")&& dbpassword.equals(password)){
					System.out.println("Admin");
					
					HttpSession session =request.getSession();
					session.setAttribute("Admin", uname);
					request.setAttribute("username", uname);
					
					request.getRequestDispatcher("/form.jsp").forward(request, response);
					}
					
					else if(dbuser.equals(dbuser)&& dbpassword.equals(password)){
						System.out.println("Customer");
						
						HttpSession session =request.getSession();
						session.setAttribute("Customer", uname);
						request.setAttribute("username", uname);
						
						request.getRequestDispatcher("/homepage.jsp").forward(request, response);
					}
					
					HttpSession session = request.getSession();
					
					session.setAttribute("Fname", dbfname);
					session.setAttribute("Lname", dblname);
					session.setAttribute("Address", dbaddress);
					session.setAttribute("NIC", dbnic);
					session.setAttribute("Gender", dbgender);
					session.setAttribute("DOB", dbdob);
					session.setAttribute("Email", dbemail);
					session.setAttribute("PhoneNo", dbphoneno);
					session.setAttribute("username", dbuser);
					session.setAttribute("password", dbpassword);
					
					
					message="Welcome "+uname;
					request.setAttribute("message", message);
					request.getRequestDispatcher("homePage.jsp").forward(request,response);
					
				}

				else if (count == 1 && dbuser.equals(uname) && !dbpassword.equals(password)) {
					message="Incorrect password";
					request.setAttribute("message", message);
					request.getRequestDispatcher("/ownerSignin.jsp").forward(request,response);
				}
				
				else if (count > 1) {
					message="Dupplicate user "+uname;
					request.setAttribute("message", message);
					request.getRequestDispatcher("/ownerSignin.jsp").forward(request,response);
				}

				else {
					message="Cannot find user "+uname;
					request.setAttribute("message", message);
					request.getRequestDispatcher("/ownerSignin.jsp").forward(request,response);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
