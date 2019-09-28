package controller;

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

import Staff.Staff;
import dao.DBConnection;

/**
 * Servlet implementation class EventAdminLogin
 */
@WebServlet("/EventAdminLogin")
public class EventAdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventAdminLogin() {
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
		
		if(button.equals("Login"))  {
		try {
			ResultSet rs=DBConnection.createConnection().createStatement().executeQuery("Select * From Staff where username='"+un+"' ");
			if(rs.next()) {
				
			ResultSet rs1=DBConnection.createConnection().createStatement().executeQuery("Select * From Staff where username='"+un+"'  and  password='"+ps+"' ");
			if(rs1.next()) {
				
				Staff ea=new Staff();
				ea.setRole(rs.getString("role"));
				ea.setFname(rs.getString("fname"));
				ea.setLname(rs.getString("lname"));
				ea.setNic(rs.getString("nic"));
				ea.setPhoneno(rs.getString("phoneno"));
				ea.setEmail(rs.getString("email"));
				ea.setUsername(rs.getString("username"));
				ea.setPassword(rs.getString("password"));

				HttpSession session=request.getSession();
				session.setAttribute("eventadmin",ea);
				RequestDispatcher rd=request.getRequestDispatcher("dashBOwner.jsp")	;
				rd.forward(request, response);	
				
			}else {
				RequestDispatcher rd=request.getRequestDispatcher("EventAdminLogin.jsp?msg=Your User Name or Password Incorrect")	;
				rd.forward(request, response);		
			}	
				
			}else {
			RequestDispatcher rd=request.getRequestDispatcher("CustomerRegister.jsp")	;
			rd.forward(request, response);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	}
}
