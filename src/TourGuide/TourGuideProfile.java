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
 * Servlet implementation class TourGuideProfile
 */
@WebServlet("/TourGuideProfile")
public class TourGuideProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourGuideProfile() {
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
		
		TourGuide guide = new TourGuide();
		
		HttpSession session=request.getSession();  
		guide.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select fname,lname,nic,email,phone,language,part,license,dI,dE,part1,terms,username,password from tourguide where username = '"+guide.getUsername()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				guide.setFname(rs.getString(1));
				guide.setLname(rs.getString(2));
				guide.setNic(rs.getString(3));
				guide.setEmail(rs.getString(4));
				guide.setPhone(rs.getString(5));
				guide.setLanguage(rs.getString(6));
				guide.setPart(rs.getString(7));
				guide.setLicense(rs.getString(8));
				guide.setdI(rs.getString(9));
				guide.setdE(rs.getString(10));
				guide.setPart1(rs.getString(11));
				guide.setTerms(rs.getString(12));
				guide.setUsername(rs.getString(13));
				guide.setPassword(rs.getString(14));
				
			}
			
			request.setAttribute("guide", guide);
			request.getRequestDispatcher("/tourGuideProfileUpdate.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
		
	}

}
