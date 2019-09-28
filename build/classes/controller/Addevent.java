package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;
import model.Events;

/**
 * Servlet implementation class Addevent
 */
@WebServlet("/Addevent")
public class Addevent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addevent() {
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
		
		String uname=(String)hs.getAttribute("staff");
		String type = request.getParameter("etype");
		
		int discount = Integer.parseInt(request.getParameter("ediscount"));
	
		
		String buttonevent = request.getParameter("submit");
		
        if(buttonevent.equals("ADD")){
			
		try {  

					Events ev = new Events();
		            ev.setType(type);
				    ev.setDiscount(discount);
					
					DBConnection.createConnection().createStatement().executeUpdate("insert into events (name,discount,uname) values('"+type+"','"+discount+"','"+uname+"')");
					RequestDispatcher rd=request.getRequestDispatcher("AdminViewEvent.jsp?Msg=Event Add Successfully");
					rd.forward(request, response);
			         
			
				
			} 
			
			catch (Exception e) {
				
				e.printStackTrace();
			}
		  }	
		  else{
			  RequestDispatcher rd = request.getRequestDispatcher("eventrequest.jsp");
              rd.forward(request, response);
		  }
	}

}
