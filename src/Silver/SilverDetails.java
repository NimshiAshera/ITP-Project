package Silver;

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
 * Servlet implementation class SilverDetails
 */
@WebServlet("/SilverDetails")
public class SilverDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SilverDetails() {
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
		
		Silver silver=new Silver();
		
		HttpSession session=request.getSession();  
		silver.setPid((String)session.getAttribute("pid"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		//System.out.println("worked");
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select * from silver where pid = '"+ silver.getPid()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				  
				silver.setPname(rs.getString(1));
				silver.setPid(rs.getString(2));
				silver.setPerson(rs.getString(3));
				silver.setView(rs.getString(4));
				silver.setBed(rs.getString(5));
				silver.setAvatar(rs.getString(6));
				silver.setPath(rs.getString(7));
				silver.setD1(rs.getString(8));
				silver.setD2(rs.getString(9));
				silver.setD3(rs.getString(10));


			}
			System.out.println("worked");
			
			request.setAttribute("silver", silver);
			request.getRequestDispatcher("/.jsp").forward(request,response);
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
