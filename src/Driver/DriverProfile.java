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

import Driver.Driver;

/**
 * Servlet implementation class DriverProfile
 */
@WebServlet("/DriverProfile")
public class DriverProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverProfile() {
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
		

		PrintWriter out = response.getWriter();
		
		Driver driver = new Driver();
		
		HttpSession session=request.getSession();  
		driver.setNic((String)session.getAttribute("nic"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select fname,lname,nic,email,phone,license,dI,dE,part,terms,username,password from driver where nic = '"+driver.getNic()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				driver.setFname(rs.getString(1));
				driver.setLname(rs.getString(2));
				driver.setNic(rs.getString(3));
				driver.setEmail(rs.getString(4));
				driver.setPhone(rs.getString(5));
				driver.setLicense(rs.getString(6));
				driver.setdI(rs.getString(7));
				driver.setdE(rs.getString(8));
				driver.setPart(rs.getString(9));
				driver.setTerms(rs.getString(10));
				driver.setUsername(rs.getString(11));
				driver.setPassword(rs.getString(12));
				
			}
			
			request.setAttribute("driver", driver);
			request.getRequestDispatcher("/driverProfileUpdate.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
		
	}

}
