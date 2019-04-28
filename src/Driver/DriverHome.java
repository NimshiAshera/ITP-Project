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
 * Servlet implementation class DriverHome
 */
@WebServlet("/DriverHome")
public class DriverHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverHome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Driver driver=new Driver();
		
		HttpSession session=request.getSession();  
		driver.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		//System.out.println("worked");
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select * from driver";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				  
				driver.setFname(rs.getString(1));
				driver.setLname(rs.getString(2));
				driver.setNic(rs.getString(3));
				driver.setEmail(rs.getString(4));
				driver.setPhone(rs.getString(5));
				driver.setAvatar(rs.getString(6));
				driver.setPath(rs.getString(7));
				driver.setLicense(rs.getString(8));
				driver.setdI(rs.getString(9));
				driver.setdE(rs.getString(10));
				driver.setPart(rs.getString(11));
				driver.setTerms(rs.getString(12));
				driver.setUsername(rs.getString(13));
				driver.setPassword(rs.getString(14));
			}
			System.out.println("worked");
			
			request.setAttribute("driver", driver);
			request.getRequestDispatcher("/driverHome.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
