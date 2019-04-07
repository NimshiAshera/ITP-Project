package Vehicle;

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
import Vehicle.Vehicle;

/**
 * Servlet implementation class VehicleDetails
 */
@WebServlet("/VehicleDetails")
public class VehicleDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Vehicle vehicle=new Vehicle();
		
		HttpSession session=request.getSession();  
		vehicle.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select * from vehicle where username = '"+ vehicle.getUsername()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				  
				vehicle.setFname(rs.getString(1));
				vehicle.setLname(rs.getString(2));
				vehicle.setPhone(rs.getString(3));
				vehicle.setType(rs.getString(4));
				vehicle.setStatus(rs.getString(5));
				vehicle.setNoPlate(rs.getString(6));
				vehicle.setAvatar(rs.getString(7));
				vehicle.setPath(rs.getString(8));
				vehicle.setPart(rs.getString(9));
				vehicle.setFeatures(rs.getString(10));
				vehicle.setTerms(rs.getString(11));
				vehicle.setUsername(rs.getString(12));
				vehicle.setPassword(rs.getString(13));
			}
			System.out.println("worked");
			
			request.setAttribute("vehicle", vehicle);
			request.getRequestDispatcher("/vehicleProfiles.jsp").forward(request,response);
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
		
	}

}
