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
 * Servlet implementation class loginCheck4
 */
@WebServlet("/loginCheck4")
public class loginCheck4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginCheck4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			String sql = "select username,password from staff where username='"
					+ username + "'";

			
			try {
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);


				int count = 0;
		
		
					while (rs.next()) {

						
						dbuname = (rs.getString(1));
						dbpassword = (rs.getString(2));
						count += 1;
					}

					if (count == 1 && dbuname.equals(username)
							&& dbpassword.equals(password)) {
						HttpSession session = request.getSession();

						session.setAttribute("loggedAs", "staff");
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
						request.getRequestDispatcher("/staffLogin.jsp").forward(
								request, response);
					}

					else if (count > 1) {
						message = "Dupplicate " +username;
						request.setAttribute("message1", message);
						request.getRequestDispatcher("/staffLogin.jsp").forward(
								request, response);
					}

					else {
							message = "Cannot find user " + username;
							request.setAttribute("message1", message);
							request.getRequestDispatcher("/customerLogin.jsp").forward(request,
									response);
						}			
					
					
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		
	}

}
