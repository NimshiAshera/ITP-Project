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
 * Servlet implementation class DriverImage
 */
@WebServlet("/DriverImage")
public class DriverImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverImage() {
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
		
		Driver driver=new Driver();
		
		HttpSession session=request.getSession();  
		driver.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select avatar,path from driver where username = '"+ driver.getUsername() +"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				driver.setAvatar(rs.getString(1));
				driver.setPath(rs.getString(2));
				
			}
			
			request.setAttribute("driver", driver);
			request.getRequestDispatcher("/driverImageUpdate.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
	}

}
