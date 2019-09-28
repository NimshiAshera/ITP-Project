package adventureBook;

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
@WebServlet("/adventureBookS")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class adventureBookS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adventureBookS() {
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

		adventureBook add = new adventureBook();

		HttpSession session = request.getSession();

		PrintWriter out = response.getWriter();

		add.setUsername((String) session.getAttribute("username"));
		 
		add.setpart(request.getParameter("part"));
		add.setcname(request.getParameter("cname"));
		add.setdate(request.getParameter("date"));
		add.setadul(request.getParameter("adul"));
		add.setchil(request.getParameter("chil"));
		add.setamount(request.getParameter("amount"));
		
		 out.write("Susccess " +request.getParameter("uname")+"\n");
	     out.write("Susccess " +request.getParameter("part")+"\n");
	     out.write("Susccess " +request.getParameter("cname")+"\n");
		 out.write("Susccess " +request.getParameter("date")+"\n");
		out.write("Susccess " +request.getParameter("adul")+"\n");
		out.write("Susccess " +request.getParameter("chil")+"\n");
		out.write("Susccess " +request.getParameter("amount")+"\n");
		

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
						String sql = "select * from adventurebook where username = '"
								+ add.getUsername() + "'";
					ResultSet rs = st.executeQuery(sql);
					
					String sql2 = "insert into adventurebook (username,part,cname,date,adul,chil,amount)"
							+ "values (?,?,?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, add.getUsername());
					pre.setString(2, add.getpart());
					pre.setString(3, add.getcname());
					pre.setString(4, add.getdate());

					pre.setString(5, add.getadul());
					pre.setString(6, add.getchil());
					pre.setString(7, add.getamount());
					

					pre.execute();

					Object message = add.getUsername() + " Registered";
					request.setAttribute("message", message);
					//request.getRequestDispatcher("/member.jsp").forward(
							//request, response);
					//request.getRequestDispatcher("/header.jsp").forward(
							//request, response);
					
					request.getRequestDispatcher("/adventurebooking.jsp").forward(request,
							response);
				

			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
				// System.out.println(vehicle.getUid());
			}
		
	}

	}
}
