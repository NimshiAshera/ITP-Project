package Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Driver.DBManager;

/**
 * Servlet implementation class loginCheck
 */
@WebServlet("/loginCheck")
public class loginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginCheck() {
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

		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String dbuname = null, dbpassword = null ;


		response.setContentType("text/html");
		PrintWriter write = response.getWriter();

		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null)
			write.write("Connection Not Established");

		else {
			write.write("Connection Established");

			String message = null;
			String sql = "select username,password from driver where username='"
					+ username + "'";

			String sql2 = "select username,password from guide where username = '"
					+ username + "'";
			try {
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);

				Statement st2 = conn.createStatement();
				ResultSet rs2 = st2.executeQuery(sql2);

				int count = 0;
				int countGuide = 0;
		
					while (rs.next()) {

						
						dbuname = (rs.getString(1));
						dbpassword = (rs.getString(2));
						count += 1;
					}

					if (count == 1 && dbuname.equals(username)
							&& dbpassword.equals(password)) {
						HttpSession session = request.getSession();

						session.setAttribute("loggedAs", "driver");
						session.setAttribute("username", dbuname);
						session.setAttribute("password", dbpassword);
						

						message = (String) session.getAttribute("username");
						request.setAttribute("message", message);
						

						request.getRequestDispatcher("/Home.jsp").forward(
								request, response);
						request.getRequestDispatcher("/Header.jsp").forward(
								request, response);
						

					}

					else if (count == 1 && dbuname.equals(username)
							&& !dbpassword.equals(password)) {
						message = "Incorrect password";
						request.setAttribute("message1", message);
						request.getRequestDispatcher("/driverSignin.jsp").forward(
								request, response);
					}

					else if (count > 1) {
						message = "Dupplicate driver " + username;
						request.setAttribute("message1", message);
						request.getRequestDispatcher("/driverSignin.jsp").forward(
								request, response);
					}

					else{
						
						while (rs2.next()) {

							
							dbuname = (rs2.getString(1));
							dbpassword = (rs2.getString(2));
							countGuide += 1;
						}
						
						if (countGuide == 1 && dbuname.equals(username)
								&& dbpassword.equals(password)) {
							HttpSession session = request.getSession();

							session.setAttribute("loggedAs", "guide");
							session.setAttribute("username", dbuname);
							session.setAttribute("password", dbpassword);
						

							message = (String) session.getAttribute("username");
							request.setAttribute("message", message);

							request.getRequestDispatcher("/Home.jsp").forward(
									request, response);
							request.getRequestDispatcher("/Header.jsp").forward(
									request, response);

						}

						else if (countGuide == 1 && dbuname.equals(username)
								&& !dbpassword.equals(password)) {
							message = "Incorrect password";
							request.setAttribute("message1", message);
							request.getRequestDispatcher("/tourGuideSignin.jsp").forward(
									request, response);
						}

						else if (countGuide > 1) {
							message = "Dupplicate Tour guide " + username;
							request.setAttribute("message1", message);
							request.getRequestDispatcher("/tourGuideSignin.jsp").forward(
									request, response);
						}
						
						else {
							message = "Cannot find user " + username;
							request.setAttribute("message1", message);
							request.getRequestDispatcher("/customerLogin.jsp").forward(request,
									response);
						}			
					}
					
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

}

