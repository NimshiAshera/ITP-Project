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
import LCustomer.LCustomer;

/**
 * Servlet implementation class FCustomerProfile
 */
@WebServlet("/FCustomerProfile")
public class FCustomerProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FCustomerProfile() {
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
		
		PrintWriter out = response.getWriter();
		
		FCustomer fcustomer = new FCustomer();
		
		HttpSession session=request.getSession();  
		fcustomer.setUname((String)session.getAttribute("uname"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select fname,lname,pass,phone,gender,email,uname,password from fcustomer where uname = '"+fcustomer.getUname()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				fcustomer.setFname(rs.getString(1));
				fcustomer.setLname(rs.getString(2));
				fcustomer.setPass(rs.getString(3));
				fcustomer.setPhone(rs.getString(4));
				fcustomer.setGender(rs.getString(5));
				fcustomer.setEmail(rs.getString(6));
				fcustomer.setUname(rs.getString(7));
				fcustomer.setPassword(rs.getString(8));
				
			}
			
			request.setAttribute("fcustomer", fcustomer);
			request.getRequestDispatcher("/fcustomerProfileUpdate.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
		
		
	}

}
