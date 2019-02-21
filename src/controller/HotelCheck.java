package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;

/**
 * Servlet implementation class HotelCheck
 */
@WebServlet("/HotelCheck")
public class HotelCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelCheck() {
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
		
		String dbpart = null,dbname =null,dbprice =null,dbcontact_no=null,dbhotel_id=null,dbaddress =null,dbuser =null, dbpassword =null;
		response.setContentType("text/html");
		PrintWriter write=response.getWriter();
		
		DBConnection db = new DBConnection();
		Connection conn = db.createConnection();
		
		if (conn == null)
			write.write("Connection Not Established");

		else {
		
			write.write("Connection Established");

			String message=null;
			String sql = "select part, name, price, contact_no, hotel_id, address, UserName,Password from hotel2 where UserName ='"+uname+"'";
			
			
				
			try {
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				
				int count = 0;
				while (rs.next()) {
					dbpart = (rs.getString(1));
					dbname = (rs.getString(2));
					dbprice = (rs.getString(3));
					dbcontact_no = (rs.getString(4));
					dbhotel_id = (rs.getString(5));
					dbaddress = (rs.getString(6));
					dbuser = (rs.getString(7));
					dbpassword = (rs.getString(8));
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
						
						request.getRequestDispatcher("/hotelUpdate.jsp").forward(request, response);
					}
					
					HttpSession session = request.getSession();
					
					session.setAttribute("part", dbpart);
					session.setAttribute("name", dbname);
					session.setAttribute("price", dbprice);
					session.setAttribute("contact_no", dbcontact_no);
					session.setAttribute("hotel_id", dbhotel_id);
					session.setAttribute("address", dbaddress);
					session.setAttribute("username", dbuser);
					session.setAttribute("password", dbpassword);
					
					
					message="Welcome "+uname;
					request.setAttribute("message", message);
					request.getRequestDispatcher("/hotelUpdate.jsp").forward(request,response);
					
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
