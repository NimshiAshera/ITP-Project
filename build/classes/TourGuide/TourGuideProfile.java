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
			String sql = "select email,phone,language,part,dI,dE,part1 from guide where username = '"+guide.getUsername()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				
				guide.setEmail(rs.getString(1));
				guide.setPhone(rs.getString(2));
				guide.setLanguage(rs.getString(3));
				guide.setPart(rs.getString(4));
				guide.setdI(rs.getString(5));
				guide.setdE(rs.getString(6));
				guide.setPart1(rs.getString(7));
				
			}
			
			request.setAttribute("guide", guide);
			request.getRequestDispatcher("/tourGuideProfileUpdate.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
		
	}

}
