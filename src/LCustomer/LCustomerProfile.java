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

/**
 * Servlet implementation class LCustomerProfile
 */
@WebServlet("/LCustomerProfile")
public class LCustomerProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LCustomerProfile() {
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
		
		LCustomer lcustomer = new LCustomer();
		
		HttpSession session=request.getSession();  
		lcustomer.setUname((String)session.getAttribute("uname"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select fname,lname,nic,phone,gender,email,uname,password from lcustomer where uname = '"+lcustomer.getUname()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				lcustomer.setFname(rs.getString(1));
				lcustomer.setLname(rs.getString(2));
				lcustomer.setNic(rs.getString(3));
				lcustomer.setPhone(rs.getString(4));
				lcustomer.setGender(rs.getString(5));
				lcustomer.setEmail(rs.getString(6));
				lcustomer.setUname(rs.getString(7));
				lcustomer.setPassword(rs.getString(8));
				
			}
			
			request.setAttribute("lcustomer", lcustomer);
			request.getRequestDispatcher("/lcustomerProfileUpdate.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
	}

}
