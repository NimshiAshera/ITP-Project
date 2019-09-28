package DriverBook;

import java.io.File;
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
import javax.servlet.http.Part;

import Driver.DBManager;


/**
 * Servlet implementation class updateUserServlet
 */
@WebServlet("/updateUserSD")
public class updateUserSD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateUserSD() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		DriverBook driver = new DriverBook();

		HttpSession session = request.getSession();
			
		driver.setUsername((String)session.getAttribute("username"));
		driver.setdname(request.getParameter("dname"));
		driver.setdate(request.getParameter("date"));
		driver.setnumd(request.getParameter("numd"));
		driver.setprice(request.getParameter("price"));
		driver.setamount(request.getParameter("amount"));
	 

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			try {
					String sql3 = "update driverbook set " + "dname='"+ driver.getdname() + "',"+ "date='"+ driver.getdate()+ "'," + "numd='"+ driver.getnumd() + "',"+ "price='"+ driver.getprice() + "',"+ "amount='"+ driver.getamount() + "'"+" where username='"+ driver.getUsername() + "'";


					Statement st1=conn.createStatement();
					st1.executeUpdate(sql3);
					
					session.setAttribute("loggedAs", "driver");
					session.setAttribute("username", driver.getUsername());
					session.setAttribute("dname", driver.getdname());
					 
					session.setAttribute("numd", driver.getnumd());
					session.setAttribute("price", driver.getprice());
					session.setAttribute("amount", driver.getamount());
					

					request.getRequestDispatcher("/getUserForUpdateD.jsp").forward(request,response);
	
			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}

	}

}
