package FCustomer;

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
 * Servlet implementation class FCustomerDetails
 */
@WebServlet("/FCustomerDetails")
public class FCustomerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FCustomerDetails() {
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
		
		FCustomer fcustomer = new FCustomer();
		
		HttpSession session=request.getSession();  
		fcustomer.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
	
		try{
			
			Statement st = conn.createStatement();
			String sql = "select * from fcustomer where username = '"+ fcustomer.getUsername()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				  
				fcustomer.setFname(rs.getString(1));
				fcustomer.setLname(rs.getString(2));
				fcustomer.setPass(rs.getString(3));
				fcustomer.setAvatar(rs.getString(4));
				fcustomer.setPath(rs.getString(5));
				fcustomer.setPhone(rs.getString(6));
				fcustomer.setGender(rs.getString(7));
				fcustomer.setEmail(rs.getString(8));
				fcustomer.setUsername(rs.getString(9));
				fcustomer.setPassword(rs.getString(10));
			}
			System.out.println("worked");
			
			request.setAttribute("fcustomer", fcustomer);
			request.getRequestDispatcher("/fcustomerProfiles.jsp").forward(request,response);
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
