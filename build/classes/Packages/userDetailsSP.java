package Packages;

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
 * Servlet implementation class vehicleDetails
 */
@WebServlet("/userDetailsSP")
public class userDetailsSP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userDetailsSP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		
		PackageBook pack=new PackageBook();
		
		HttpSession session=request.getSession();  
		pack.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select pid,pt,price,amount from packagebook where username= '"+pack.getUsername()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				  
				//vehicle.setUid(rs.getString(1));
				pack.setpid(rs.getString(1));
				 
				pack.setpt(rs.getString(2));
				pack.setprice(rs.getString(3));
				pack.setamount(rs.getString(4));
				 
			}
			
			request.setAttribute("pack", pack);
			request.getRequestDispatcher("/getUserP.jsp").forward(request,response);
			request.getRequestDispatcher("/getPackage.jsp").forward(request,response);
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
