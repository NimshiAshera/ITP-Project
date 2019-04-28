package Gold;

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
 * Servlet implementation class GoldProfile
 */
@WebServlet("/GoldProfile")
public class GoldProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoldProfile() {
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
		
		Gold gold = new Gold();
		
		HttpSession session=request.getSession();  
		gold.setPid((String)session.getAttribute("pid"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select pname,pid,person,view,bed,d1,d2,d3,d4,d5 from gold where pid = '"+gold.getPid()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				gold.setPname(rs.getString(1));
				gold.setPid(rs.getString(2));
				gold.setPerson(rs.getString(3));
				gold.setView(rs.getString(4));
				gold.setBed(rs.getString(5));
				gold.setD1(rs.getString(6));
				gold.setD2(rs.getString(7));
				gold.setD3(rs.getString(8));
				gold.setD4(rs.getString(9));
				gold.setD5(rs.getString(10));

				
			}
			
			request.setAttribute("gold", gold);
			request.getRequestDispatcher("/.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
	
		
	}

}
