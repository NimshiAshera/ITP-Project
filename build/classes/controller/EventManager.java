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

import model.EventAdmin;
import pk.DataBase;

/**
 * Servlet implementation class EventManager
 */
@WebServlet("/EventManager")
public class EventManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventManager() {
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

		PrintWriter out = response.getWriter();
		HttpSession hs = request.getSession();
		
		String firstname = request.getParameter("fusername");
		String lastname = request.getParameter("lusername");
		String address = request.getParameter("address");
		String nic = request.getParameter("nic");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dateofbirth");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String un = request.getParameter("username");
		String pw = request.getParameter("password");
		
		String buttonevent = request.getParameter("Submit");
		
		 if(buttonevent.equals("Submit")){
				
				try {  
						
						ResultSet rs = DataBase.getconn().createStatement().executeQuery("select * from eventadmin where email = '" + email + "' ");	
						if(rs.next()){
							RequestDispatcher rd = request.getRequestDispatcher("eventAdminRegistartion.jsp?Message=This Event already exists.Try agian with anothor one");
						    rd.forward(request, response);
						}
						else{
							EventAdmin ea = new EventAdmin();
				            ea.setFirstname(firstname);
				            ea.setLastname(lastname);
							ea.setAddress(address);
							ea.setNic(nic);
							ea.setGender(gender);
							ea.setDob(dob);
							ea.setEmail(email);
							ea.setPhone(phone);
							ea.setUsername(un);
							ea.setPassword(pw);
							HttpSession session=request.getSession();
							session.setAttribute("eventadmin",ea);
							
							DataBase.getconn().createStatement().executeUpdate("insert into eventadmin (firstname,lastname,address,nic,gender,dob,email,phone,username,password) values('"+firstname+"','"+lastname+"','"+address+"','"+nic+"','"+gender+"','"+dob+"','"+email+"','"+phone+"','"+un+"','"+pw+"')");
							RequestDispatcher rd=request.getRequestDispatcher("dashEventOwners.jsp?Message=Succesfull Register");
							rd.forward(request, response);
					         
						}
						
					} 
					
					catch (Exception e) {
						e.printStackTrace();
					}
				  }	
				  else{
					  RequestDispatcher rd = request.getRequestDispatcher("eventAdminRegister.jsp");
		              rd.forward(request, response);
				  }
		
	}

}
