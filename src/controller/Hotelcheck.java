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
@WebServlet("/Hotelcheck")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class Hotelcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hotelcheck() {
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
		
		String dbpart = null,dbname =null,dbhotel_id =null,dbimagelocation=null,dbfacilities=null,dbactivities =null, dbfood =null,dbre_services=null,dbcleaning_services=null,dbpool=null,dbrooms=null,dbaddress=null,dbuser =null, dbpassword =null;
		response.setContentType("text/html");
		PrintWriter write=response.getWriter();
		
		DBConnection db = new DBConnection();
		Connection conn = db.createConnection();
		
		if (conn == null)
			write.write("Connection Not Established");

		else {
			write.write("Connection Established");

			String message=null;
			String sql = "select part, name, hotel_id, imagelocation, facilities, activities, food, re_services, cleaning_services, pool, rooms, address, UserName,password from hotel10 where UserName ='"+uname+"'";
			
				
			try {
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				
				int count = 0;
				while (rs.next()) {
					dbpart = (rs.getString(1));
					dbname = (rs.getString(2));
					dbhotel_id = (rs.getString(3));
					dbimagelocation = (rs.getString(4));
					dbfacilities = (rs.getString(5));
					dbactivities = (rs.getString(6));
					dbfood = (rs.getString(7));
					dbre_services = (rs.getString(8));
					dbcleaning_services = (rs.getString(9));
					dbpool = (rs.getString(10));
					dbrooms = (rs.getString(11));
					dbaddress = (rs.getString(12));
					dbuser = (rs.getString(13));
					dbpassword = (rs.getString(14));
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
					
					session.setAttribute("Part", dbpart);
					session.setAttribute("Name", dbname);
					session.setAttribute("Hotel_id", dbhotel_id);
					session.setAttribute("Imagelocation", dbimagelocation);
					session.setAttribute("Facilities", dbfacilities);
					session.setAttribute("Activities", dbactivities);
					session.setAttribute("Food", dbfood);
					session.setAttribute("Re_services", dbre_services);
					session.setAttribute("Cleaning_services", dbcleaning_services);
					session.setAttribute("Pool", dbpool);
					session.setAttribute("Rooms", dbrooms);
					session.setAttribute("Address", dbaddress);
					session.setAttribute("username", dbuser);
					session.setAttribute("password", dbpassword);
					
					
					message="Welcome "+uname;
					request.setAttribute("message", message);
					request.getRequestDispatcher("hotelUpdate.jsp").forward(request,response);
					
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
