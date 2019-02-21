package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;

/**
 * Servlet implementation class UpdateHotel
 */
@WebServlet("/UpdateHotel")
public class UpdateHotel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHotel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @throws IOException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	
    }
    
    		    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		//String fname = request.getParameter("Fname"); // First name
		//String lname = request.getParameter("Lname"); // Last name
		String price = request.getParameter("price"); //Address
		//String nic   = request.getParameter("NIC"); // NIC
		//String gender   = request.getParameter("Gender"); // Gender
		String contact_no   = request.getParameter("contact_no"); // Date of Birth
		//String username = request.getParameter("username"); //Username
		//String pass  = request.getParameter("password"); // password
		
		response.setContentType("text/html");
		
		PrintWriter write =response.getWriter();
		
			DBConnection db=new DBConnection();
			Connection conn = db.createConnection();
			
			if(conn==null){
				write.write("Connection Not Established");
			}
			else{
				HttpSession session = request.getSession();
				if(session != null){
					if(session.getAttribute("username")!= null){
						String name = (String) session.getAttribute("username");
						String password = (String)session.getAttribute("password");
						
					/*	Object message = "Welcome " + name;
						request.setAttribute("message", message);
						request.getRequestDispatcher("/index.jsp").forward(request, response);
						request.getRequestDispatcher("/header.jsp").forward(request, response);*/
					}
					else{
						response.sendRedirect("test3.jsp");
					}
				}
				
				try{
					String UserName = (String) session.getAttribute("username");
					String sql2 = "update hotel2 set  price=? , contact_no=? "
							+ "where username = '"+UserName+"'";
					
					
					PreparedStatement pre = conn.prepareStatement(sql2);
					
					//pre.setString(1, fname);
					//pre.setString(2, lname);
					pre.setString(1, price);
					//pre.setString(4, nic);
					//pre.setString(5, gender);
					pre.setString(2, contact_no);
					//pre.setString(11, username);
					//pre.setString(12, pass);
					
					pre.execute();
					
					Object message = "Successfully updated";
					request.setAttribute("message", message);
					request.getRequestDispatcher("/homepage.jsp").forward(request, response);
					request.getRequestDispatcher("/header.jsp").forward(request, response);
				
				}
				catch(Exception e){
					System.out.println("Got an exception");
					System.out.println(e.getMessage());
				}
			}
	}
	}   
	


