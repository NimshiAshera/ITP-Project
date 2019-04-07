package LCustomer;

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
 * Servlet implementation class LCustomerDetails
 */
@WebServlet("/LCustomerDetails")
public class LCustomerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LCustomerDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		LCustomer lcustomer = new LCustomer();
		
		HttpSession session=request.getSession();  
		lcustomer.setUname((String)session.getAttribute("uname"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select * from lcustomer where uname = '"+ lcustomer.getUname()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				  
				lcustomer.setFname(rs.getString(1));
				lcustomer.setLname(rs.getString(2));
				lcustomer.setNic(rs.getString(3));
				lcustomer.setAvatar(rs.getString(4));
				lcustomer.setPath(rs.getString(5));
				lcustomer.setPhone(rs.getString(6));
				lcustomer.setGender(rs.getString(7));
				lcustomer.setEmail(rs.getString(8));
				lcustomer.setUname(rs.getString(9));
				lcustomer.setPassword(rs.getString(10));
			}
			System.out.println("worked");
			
			request.setAttribute("lcustomer", lcustomer);
			request.getRequestDispatcher("/lcustomerProfiles.jsp").forward(request,response);
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
		doGet(request, response);
	}

}
