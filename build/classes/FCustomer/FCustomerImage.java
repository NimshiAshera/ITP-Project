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
 * Servlet implementation class FCustomerImage
 */
@WebServlet("/FCustomerImage")
public class FCustomerImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FCustomerImage() {
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
		fcustomer.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select avatar,path from fcustomer where username = '"+ fcustomer.getUsername() +"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				fcustomer.setAvatar(rs.getString(1));
				fcustomer.setPath(rs.getString(2));
				
			}
			
			request.setAttribute("fcustomer", fcustomer);
			request.getRequestDispatcher("/fcustomerImageUpdate.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
		
	}

}
