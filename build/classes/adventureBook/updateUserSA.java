package adventureBook;

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
@WebServlet("/updateUserSA")
public class updateUserSA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateUserSA() {
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
		adventureBook add = new adventureBook();

		HttpSession session = request.getSession();
			
		add.setUsername((String)session.getAttribute("username"));
		add.setpart(request.getParameter("part"));
		 
		add.setcname(request.getParameter("cname"));
		add.setdate(request.getParameter("date"));
		add.setadul(request.getParameter("adul"));
		add.setchil(request.getParameter("chil"));
		add.setamount(request.getParameter("amount"));
	 

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			try {
					String sql3 = "update adventurebook set " + "part='"+ add.getpart() + "',"+ "cname='"+ add.getcname() + "',"+ "date='"+ add.getdate() + "',"+ "adul='"+ add.getadul() + "',"+  "chil='"+ add.getchil() + "',"+ "amount='"+ add.getamount() + "'"+" where uname='"+ add.getUsername() + "'";


					Statement st1=conn.createStatement();
					st1.executeUpdate(sql3);
					
					session.setAttribute("loggedAs", "add");
					session.setAttribute("username", add.getUsername());
					session.setAttribute("part", add.getpart());
					 
					session.setAttribute("cname", add.getcname());
					session.setAttribute("date", add.getdate());
					session.setAttribute("adul", add.getadul());
					session.setAttribute("chil", add.getchil());
					session.setAttribute("amount", add.getamount());
					

					request.getRequestDispatcher("/getUserForUpdateA.jsp").forward(request,response);
		//		}
			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}

	}

}
