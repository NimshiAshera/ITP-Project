package TourguideBook;

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
@WebServlet("/TourguideBookS")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class TourguideBookS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TourguideBookS() {
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

		TourguideBook tour = new TourguideBook();

		HttpSession session = request.getSession();

		PrintWriter out = response.getWriter();

		tour.setUsername((String) session.getAttribute("username"));
		 
		tour.setgname(request.getParameter("gname"));
		tour.setdate(request.getParameter("date"));
		tour.setnumd(request.getParameter("numd"));
		tour.setprice(request.getParameter("price"));
		tour.setamount(request.getParameter("amount"));
		
/*		 out.write("Susccess " +request.getParameter("username")+"\n");
	     out.write("Susccess " +request.getParameter("gname")+"\n");
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
						String sql = "select * from tourguidebook where username = '"
								+ tour.getUsername() + "'";
					ResultSet rs = st.executeQuery(sql);
					
					String sql2 = "insert into tourguidebook (username,gname,date,numd,price,amount)"
							+ "values (?,?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, tour.getUsername());
					pre.setString(2, tour.getgname());
					pre.setString(3, tour.getdate());
				    pre.setString(4, tour.getnumd());
                    pre.setString(5, tour.getprice());
					pre.setString(6, tour.getamount());
					

					pre.execute();

					Object message = tour.getUsername() + " Registered";
					request.setAttribute("message", message);
					//request.getRequestDispatcher("/member.jsp").forward(
							//request, response);
					//request.getRequestDispatcher("/header.jsp").forward(
							//request, response);
					
					request.getRequestDispatcher("/tourguidebooking.jsp").forward(request,
							response);
				

			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
				// System.out.println(vehicle.getUid());
			}
		
	}

	}
}
