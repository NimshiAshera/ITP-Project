package pk;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import LCustomer.LCustomer;

/**
 * Servlet implementation class Logins
 */
@WebServlet("/Logins")
public class Logins extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logins() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		
		String un=request.getParameter("name");
		String ps=request.getParameter("pass");
		String button=request.getParameter("submit");
		
		if(button.equals("Login")) {
		try {
			ResultSet rs=DataBase.getconn().createStatement().executeQuery("Select * From lcustomer where username='"+un+"' ");
			if(rs.next()) {
				
			ResultSet rs1=DataBase.getconn().createStatement().executeQuery("Select * From lcustomer where username='"+un+"'  and  password='"+ps+"' ");
			if(rs1.next()) {
				
				LCustomer c=new LCustomer();
				c.setFname(rs.getString("fname"));
				c.setLname(rs.getString("lname"));
				c.setNic(rs.getString("nic"));
				c.setAvatar(rs.getString("avatar"));
				c.setPhone(rs.getString("phone"));
				c.setGender(rs.getString("gender"));
				c.setEmail(rs.getString("email"));
				c.setUsername(rs.getString("username"));
				c.setPassword(rs.getString("password"));
				
				HttpSession session=request.getSession();
				session.setAttribute("customer",c);
				RequestDispatcher rd=request.getRequestDispatcher("homepage.jsp")	;
				rd.forward(request, response);	
				
			}else {
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp?msg=Your User Name or Password Incorrect")	;
				rd.forward(request, response);		
			}	
				
			}else {
			RequestDispatcher rd=request.getRequestDispatcher("customerRegister.jsp")	;
			rd.forward(request, response);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		}
		
	}

}
