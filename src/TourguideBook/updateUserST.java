package TourguideBook;

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
@WebServlet("/updateUserST")
public class updateUserST extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateUserST() {
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
		TourguideBook tour = new TourguideBook();

		HttpSession session = request.getSession();
			
		tour.setUsername((String)session.getAttribute("username"));
		tour.setgname(request.getParameter("gname"));
		tour.setdate(request.getParameter("date")); 
		tour.setnumd(request.getParameter("numd"));
		tour.setprice(request.getParameter("price"));
		tour.setamount(request.getParameter("amount"));
	 

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			try {
					String sql3 = "update tourguidebook set " + "gname='"+ tour.getgname() + "',"+ "date='"+ tour.getdate() + "',"+ "numd='"+ tour.getnumd() + "',"+ "price='"+ tour.getprice() + "',"+ "amount='"+ tour.getamount() + "'"+" where username='"+ tour.getUsername() + "'";


					Statement st1=conn.createStatement();
					st1.executeUpdate(sql3);
					
					session.setAttribute("loggedAs", "tour");
					session.setAttribute("uname", tour.getUsername());
					session.setAttribute("gname", tour.getgname());
					session.setAttribute("date", tour.getdate()); 
					session.setAttribute("numd", tour.getnumd());
					session.setAttribute("price", tour.getprice());
					session.setAttribute("amount", tour.getamount());
					

					request.getRequestDispatcher("/getUserForUpdateT.jsp").forward(request,response);

			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}

	}

}
