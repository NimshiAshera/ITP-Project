package VehicleBook;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import Driver.DBManager;

/**
 * Servlet implementation class addVehicle
 */
@WebServlet("/VehicleBookS")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class VehicleBookS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VehicleBookS() {
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
		// TODO Auto-generated method stub

		VehicleBook vehicle = new VehicleBook();

		HttpSession session = request.getSession();

		PrintWriter out = response.getWriter();

		vehicle.setUsername((String) session.getAttribute("username"));
		 
		vehicle.setvname(request.getParameter("vname"));
		vehicle.settype(request.getParameter("type"));
		vehicle.setdate(request.getParameter("date"));
		vehicle.setnumd(request.getParameter("numd"));
		vehicle.setprice(request.getParameter("price"));
		vehicle.setamount(request.getParameter("amount"));
		
		/*
		 out.write("Susccess " +request.getParameter("username")+"\n");
	     out.write("Susccess " +request.getParameter("type")+"\n");
		 out.write("Susccess " +request.getParameter("numd")+"\n");
		out.write("Susccess " +request.getParameter("price")+"\n");
		out.write("Susccess " +request.getParameter("amount")+"\n");
		
		 */
		response.setContentType("text/html");

		PrintWriter write = response.getWriter();

		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			write.write("Connection Not Established");
		}
		
				else {
					
					try {
						Statement st = conn.createStatement();
						String sql = "select * from vehiclebook where username = '"
								+ vehicle.getUsername() + "'";
					ResultSet rs = st.executeQuery(sql);
					
					String sql2 = "insert into vehiclebook (username,vname,type,date,numd,price,amount)"
							+ "values (?,?,?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, vehicle.getUsername());
					pre.setString(2, vehicle.getvname());
					pre.setString(3, vehicle.gettype());
					pre.setString(4, vehicle.getdate());
					pre.setString(5, vehicle.getnumd());

					pre.setString(6, vehicle.getprice());
					pre.setString(7, vehicle.getamount());
					

					pre.execute();

					Object message = vehicle.getUsername() + " Registered";
					request.setAttribute("message", message);
					//request.getRequestDispatcher("/member.jsp").forward(
							//request, response);
					//request.getRequestDispatcher("/header.jsp").forward(
							//request, response);
					
					request.getRequestDispatcher("/vehicleBooking.jsp").forward(request,
							response);
				

			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
				// System.out.println(vehicle.getUid());
			}
		
	}

	}
}
