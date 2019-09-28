package Platinum;

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
 * Servlet implementation class PlatinumProfile
 */
@WebServlet("/PlatinumProfile")
public class PlatinumProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlatinumProfile() {
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
		//doGet(request, response);
		
		
		PrintWriter out = response.getWriter();
		
		Platinum platinum = new Platinum();
		
		HttpSession session=request.getSession();  
		platinum.setPid((String)session.getAttribute("pid"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select d1,d2,d3,d4,d5,d6,d7 from platinum where pid = '"+platinum.getPid()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				platinum.setD1(rs.getString(6));
				platinum.setD2(rs.getString(7));
				platinum.setD3(rs.getString(8));
				platinum.setD4(rs.getString(9));
				platinum.setD5(rs.getString(10));
				platinum.setD6(rs.getString(11));
				platinum.setD7(rs.getString(12));
				
			}
			
			request.setAttribute("platinum", platinum);
			request.getRequestDispatcher("platinumupdate.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
		
		
	}

}
