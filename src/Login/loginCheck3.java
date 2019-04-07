package Login;

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

import Driver.DBManager;

/**
 * Servlet implementation class loginCheck3
 */
@WebServlet("/loginCheck3")
public class loginCheck3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginCheck3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uname = request.getParameter("uname").trim();
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
			String sql = "select uname,password from lcustomer where uname='"
					+ uname + "'";

			String sql2 = "select uname,password from fcustomer where uname = '"
					+ uname + "'";
			try {
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);

				Statement st2 = conn.createStatement();
				ResultSet rs2 = st2.executeQuery(sql2);

				int count = 0;
				int countF = 0;
		
					while (rs.next()) {

						
						dbuname = (rs.getString(1));
						dbpassword = (rs.getString(2));
						count += 1;
					}

					if (count == 1 && dbuname.equals(uname)
							&& dbpassword.equals(password)) {
						HttpSession session = request.getSession();

						session.setAttribute("loggedAs", "lcustomer");
						session.setAttribute("uname", dbuname);
						session.setAttribute("password", dbpassword);
						

						message = (String) session.getAttribute("uname");
						request.setAttribute("message", message);
						

						request.getRequestDispatcher("/Home-AfterLogin.jsp").forward(
								request, response);
						

					}

					else if (count == 1 && dbuname.equals(uname)
							&& !dbpassword.equals(password)) {
						message = "Incorrect password";
						request.setAttribute("message1", message);
						request.getRequestDispatcher("/customerLogin.jsp").forward(
								request, response);
					}

					else if (count > 1) {
						message = "Dupplicate register " + uname;
						request.setAttribute("message1", message);
						request.getRequestDispatcher("/customerLogin.jsp").forward(
								request, response);
					}

					else{
						
						while (rs2.next()) {

							
							dbuname = (rs2.getString(1));
							dbpassword = (rs2.getString(2));
							countF += 1;
						}
						
						if (countF == 1 && dbuname.equals(uname)
								&& dbpassword.equals(password)) {
							HttpSession session = request.getSession();

							session.setAttribute("loggedAs", "fcustomer");
							session.setAttribute("uname", dbuname);
							session.setAttribute("password", dbpassword);
						

							message = (String) session.getAttribute("uname");
							request.setAttribute("message", message);

							request.getRequestDispatcher("/Home-AfterLogin.jsp").forward(
									request, response);

						}

						else if (countF == 1 && dbuname.equals(uname)
								&& !dbpassword.equals(password)) {
							message = "Incorrect password";
							request.setAttribute("message1", message);
							request.getRequestDispatcher("/customerLogin.jsp").forward(
									request, response);
						}

						else if (countF > 1) {
							message = "Dupplicate register " + uname;
							request.setAttribute("message1", message);
							request.getRequestDispatcher("/customerLogin.jsp").forward(
									request, response);
						}
						
						else {
							message = "Cannot find user " + uname;
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
