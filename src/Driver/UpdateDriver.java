package Driver;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateDriver
 */
@WebServlet("/UpdateDriver")
public class UpdateDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDriver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Driver driver = new Driver();

		HttpSession session = request.getSession();
			
		
		driver.setFname(request.getParameter("fname"));
		driver.setLname(request.getParameter("lname"));
		//driver.setNic(request.getParameter("nic"));
		driver.setEmail(request.getParameter("email"));
		driver.setPhone(request.getParameter("phone"));
		//driver.setLicense(request.getParameter("license"));
		//driver.setdI(request.getParameter("dI"));
		//driver.setdE(request.getParameter("dE"));
		driver.setPart(request.getParameter("part"));
		//driver.setTerms(request.getParameter("terms"));
		driver.setUsername(request.getParameter("username"));
		driver.setPassword(request.getParameter("password"));
		driver.setcPassword(request.getParameter("cPassword"));

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			try {
				Statement st = conn.createStatement();
				String sql = "select * from driver where username = '"
						+ driver.getUsername() +"'and nic ='" + driver.getNic() + "'";
				ResultSet rs = st.executeQuery(sql);
				
				

				if (rs.next()) {
					Object message = "Username or NIC exist";
					request.setAttribute("unameExist", message);
					request.getRequestDispatcher("/DriverProfile")
							.forward(request, response);

				}
				

				else if (!driver.getPassword().equals(driver.getcPassword())) {
					Object message = "Password not maching";
					request.setAttribute("passwordMatchingErr", message);
					request.getRequestDispatcher("/DriverProfile")
							.forward(request, response);
				}


				else {

					String sql3 = "update driver set " + "fname='"
							+ driver.getFname() + "'," + "lname='"
							+ driver.getLname() + "'," + "email='"
							+ driver.getEmail() + "'," + "phone='"
							+ driver.getPhone() + "'," + "part='"
							+ driver.getPart() + "'," + "username='"
							+ driver.getUsername() + "'," + "password='"
							+ driver.getPassword() + "'" + " where nic='"
							+ driver.getNic() + "'";

					Statement st1=conn.createStatement();
					st1.executeUpdate(sql3);
					
					session.setAttribute("loggedAs", "driver");
					session.setAttribute("nic", driver.getNic());
					session.setAttribute("username", driver.getUsername());
					session.setAttribute("password", driver.getPassword());

					request.getRequestDispatcher("/Home-AfterLogin.jsp").forward(request,response);
				}
			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}

		
	}

}
