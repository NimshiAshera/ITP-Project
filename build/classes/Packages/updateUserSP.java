package Packages;

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
@WebServlet("/updateUserSP")
public class updateUserSP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateUserSP() {
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
		PackageBook pack = new PackageBook();

		HttpSession session = request.getSession();
			
		pack.setUsername((String)session.getAttribute("username"));
		pack.setpid(request.getParameter("pid"));
		 
		pack.setpt(request.getParameter("pt"));
		pack.setprice(request.getParameter("price"));
		pack.setamount(request.getParameter("amount"));
	 

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			try {
					String sql3 = "update packagebook set " + "pid='"+ pack.getpid() + "',"+ "pt='"+ pack.getpt() + "',"+ "price='"+ pack.getprice() + "',"+ "amount='"+ pack.getamount() + "'"+" where username='"+ pack.getUsername() + "'";


					Statement st1=conn.createStatement();
					st1.executeUpdate(sql3);
					
					session.setAttribute("loggedAs", "tour");
					session.setAttribute("uname", pack.getUsername());
					session.setAttribute("pid", pack.getpid());
					 
					session.setAttribute("pt", pack.getpt());
					session.setAttribute("price", pack.getprice());
					session.setAttribute("amount", pack.getamount());
					

					request.getRequestDispatcher("/getUserForUpdateT.jsp").forward(request,response);
		//		}
			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}

	}

}
