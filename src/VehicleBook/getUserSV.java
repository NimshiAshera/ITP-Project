package VehicleBook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Driver.DBManager;




/**
 * Servlet implementation class getUserServlet
 */
@WebServlet("/getUserSV")
public class getUserSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getUserSV() {
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
		PrintWriter out = response.getWriter();
		
		VehicleBook vehicle=new VehicleBook();
		
		HttpSession session=request.getSession();  
		vehicle.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select vname,type,date,numd,price,amount from vehiclebook where username = '"+vehicle.getUsername()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				vehicle.setvname(rs.getString(1));
				vehicle.settype(rs.getString(2));
				vehicle.setdate(rs.getString(3));
				vehicle.setnumd(rs.getString(4));
				vehicle.setprice(rs.getString(5));
				vehicle.setamount(rs.getString(6));
				
				
			}
			
			request.setAttribute("vehicle", vehicle);
			request.getRequestDispatcher("/getUserForUpdateV.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
		
		
	}

}
