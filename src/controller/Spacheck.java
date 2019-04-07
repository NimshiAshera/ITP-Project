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
@WebServlet("/Spacheck")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class Spacheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Spacheck() {
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
		
		String dbname = null,dbid =null,dbimagelocation=null,dbfacials=null,dbwaxing =null, dbbody =null,dbmassage=null,dbtinting=null,dbaddress=null,dbuser =null, dbpassword =null;
		response.setContentType("text/html");
		PrintWriter write=response.getWriter();
		
		DBConnection db = new DBConnection();
		Connection conn = db.createConnection();
		
		if (conn == null)
			write.write("Connection Not Established");

		else {
			write.write("Connection Established");

			String message=null;
			String sql = "select name, id, imagelocation, facials, waxing, body, massage, tinting, address, UserName,password from spa where UserName ='"+uname+"'";
			
				
			try {
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				
				int count = 0;
				while (rs.next()) {
					
					dbname = (rs.getString(1));
					dbid = (rs.getString(2));
					dbimagelocation = (rs.getString(3));
					dbfacials = (rs.getString(4));
					dbwaxing = (rs.getString(5));
					dbbody = (rs.getString(6));
					dbmassage = (rs.getString(7));
					dbtinting = (rs.getString(8));
					dbaddress = (rs.getString(9));
					dbuser = (rs.getString(10));
					dbpassword = (rs.getString(11));
					count += 1;
				}

				if (count == 1 && dbuser.equals(uname) && dbpassword.equals(password)) {
					
					if(dbuser.equals("Admin")&& dbpassword.equals(password)){
					System.out.println("Admin");
					
					HttpSession session =request.getSession();
					session.setAttribute("Admin", uname);
					request.setAttribute("username", uname);
					
					request.getRequestDispatcher("/AdminHomePage.jsp").forward(request, response);
					}
					
					else if(dbuser.equals(dbuser)&& dbpassword.equals(password)){
						System.out.println("Customer");
						
						HttpSession session =request.getSession();
						session.setAttribute("Customer", uname);
						request.setAttribute("username", uname);
						
						request.getRequestDispatcher("/homepage.jsp").forward(request, response);
					}
					
					HttpSession session = request.getSession();
					
					
					session.setAttribute("Name", dbname);
					session.setAttribute("Id", dbid);
					session.setAttribute("Imagelocation", dbimagelocation);
					session.setAttribute("Facials", dbfacials);
					session.setAttribute("Waxing", dbwaxing);
					session.setAttribute("Body", dbbody);
					session.setAttribute("Massage", dbmassage);
					session.setAttribute("Tinting", dbtinting);
					session.setAttribute("Address", dbaddress);
					session.setAttribute("username", dbuser);
					session.setAttribute("password", dbpassword);
					
					
					message="Welcome "+uname;
					request.setAttribute("message", message);
					request.getRequestDispatcher("deleteSpa.jsp").forward(request,response);
					
				}

				else if (count == 1 && dbuser.equals(uname) && !dbpassword.equals(password)) {
					message="Incorrect password";
					request.setAttribute("message", message);
					request.getRequestDispatcher("/test3.jsp").forward(request,response);
				}
				
				else if (count > 1) {
					message="Dupplicate user "+uname;
					request.setAttribute("message", message);
					request.getRequestDispatcher("/test3.jsp").forward(request,response);
				}

				else {
					message="Cannot find user "+uname;
					request.setAttribute("message", message);
					request.getRequestDispatcher("/test3.jsp").forward(request,response);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
