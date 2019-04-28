package VehicleBook;

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
@WebServlet("/updateUserSV")
public class updateUserSV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateUserSV() {
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
		VehicleBook vehicle = new VehicleBook();

		HttpSession session = request.getSession();
			
		vehicle.setUsername((String)session.getAttribute("username"));
		vehicle.setvname(request.getParameter("vname"));
		vehicle.settype(request.getParameter("type"));
		vehicle.setdate(request.getParameter("date"));
		vehicle.setnumd(request.getParameter("numd"));
		vehicle.setprice(request.getParameter("price"));
		vehicle.setamount(request.getParameter("amount"));
	 

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			try {
					String sql3 = "update vehiclebook set " + "vname='"+ vehicle.getvname() + "',"+ "type='"+ vehicle.gettype() + "'," + "date='"+ vehicle.getdate() + "',"  + "numd='"+ vehicle.getnumd() + "',"+  "price='"+ vehicle.getprice() + "',"+ "amount='"+ vehicle.getamount() + "'"+" where username='"+ vehicle.getUsername() + "'";


					Statement st1=conn.createStatement();
					st1.executeUpdate(sql3);
					
					session.setAttribute("loggedAs", "vehicle");
					session.setAttribute("username", vehicle.getUsername());
					session.setAttribute("vname", vehicle.getvname());
					session.setAttribute("type", vehicle.gettype());
					session.setAttribute("date", vehicle.getdate());
					session.setAttribute("numd", vehicle.getnumd());
					session.setAttribute("price", vehicle.getprice());
					session.setAttribute("amount", vehicle.getamount());
					

					request.getRequestDispatcher("/getUserForUpdateV.jsp").forward(request,response);
		//		}
			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}

	}

}
