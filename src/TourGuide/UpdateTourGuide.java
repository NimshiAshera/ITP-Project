package TourGuide;

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

import Driver.DBManager;
import TourGuide.TourGuide;

/**
 * Servlet implementation class UpdateTourGuide
 */
@WebServlet("/UpdateTourGuide")
public class UpdateTourGuide extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTourGuide() {
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
		
		TourGuide guide = new TourGuide();

		HttpSession session = request.getSession();
			
		
		guide.setFname(request.getParameter("fname"));
		guide.setLname(request.getParameter("lname"));
		//driver.setNic(request.getParameter("nic"));
		guide.setEmail(request.getParameter("email"));
		guide.setPhone(request.getParameter("phone"));
		guide.setLanguage(request.getParameter("language"));
		//guide.setPart(request.getParameter("part"));
		//driver.setLicense(request.getParameter("license"));
		//driver.setdI(request.getParameter("dI"));
		//driver.setdE(request.getParameter("dE"));
		guide.setPart1(request.getParameter("part1"));
		//driver.setTerms(request.getParameter("terms"));
		guide.setUsername(request.getParameter("username"));
		guide.setPassword(request.getParameter("password"));
		guide.setcPassword(request.getParameter("cPassword"));

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			try {
				Statement st = conn.createStatement();
				String sql = "select * from guide where username = '"
						+ guide.getUsername() +"'and nic ='" + guide.getNic() + "'";
				ResultSet rs = st.executeQuery(sql);
				
				

				if (rs.next()) {
					Object message = "Username or NIC exist";
					request.setAttribute("unameExist", message);
					request.getRequestDispatcher("/TourGuideProfile")
							.forward(request, response);

				}
				

				else if (!guide.getPassword().equals(guide.getcPassword())) {
					Object message = "Password not maching";
					request.setAttribute("passwordMatchingErr", message);
					request.getRequestDispatcher("/TourGuideProfile")
							.forward(request, response);
				}


				else {

					String sql3 = "update guide set " + "fname='"
							+ guide.getFname() + "'," + "lname='"
							+ guide.getLname() + "'," + "email='"
							+ guide.getEmail() + "'," + "phone='"
							+ guide.getPhone() + "'," + "language='"
							+ guide.getLanguage() + "'," + "part1='"
							+ guide.getPart1() + "'," + "username='"
							+ guide.getUsername() + "'," + "password='"
							+ guide.getPassword() + "'" + " where username='"
							+ guide.getUsername() + "'";

					Statement st1=conn.createStatement();
					st1.executeUpdate(sql3);
					
					session.setAttribute("loggedAs", "guide");
					session.setAttribute("nic", guide.getNic());
					session.setAttribute("username", guide.getUsername());
					session.setAttribute("password", guide.getPassword());

					request.getRequestDispatcher("/Home-AfterLogin.jsp").forward(request,response);
				}
			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}
		
	}

}
