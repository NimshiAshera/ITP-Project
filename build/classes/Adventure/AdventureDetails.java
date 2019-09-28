package Adventure;

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

/**
 * Servlet implementation class AdventureDetails
 */
@WebServlet("/AdventureDetails")
public class AdventureDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdventureDetails() {
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
	
		Adventure adventure = new Adventure();
		
		HttpSession session=request.getSession();  
		adventure.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select * from adventure where username = '"+ adventure.getUsername()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				  
				adventure.setPart(rs.getString(1));
				adventure.setName(rs.getString(2));
				adventure.setContact_no(rs.getString(3));
				adventure.setAvatar(rs.getString(4));
				adventure.setPath(rs.getString(5));
				adventure.setDetails(rs.getString(6));
				adventure.setSeason(rs.getString(7));
				adventure.setSee(rs.getString(8));
				adventure.setTime(rs.getString(9));
				adventure.setAvb(rs.getString(10));
				adventure.setUsername(rs.getString(11));
				adventure.setPassword(rs.getString(12));
			}
			
			System.out.println("worked");
			
			request.setAttribute("adventure", adventure);
			request.getRequestDispatcher("/adventureProfiles.jsp").forward(request,response);
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
