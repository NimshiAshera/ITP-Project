package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBConnection;

/**
 * Servlet implementation class EventUpdate
 */
@WebServlet("/EventUpdate")
public class EventUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventUpdate() {
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
		
		String id=request.getParameter("id");
		String type=request.getParameter("etype");
		String discount=request.getParameter("ediscount");
		
		String button=request.getParameter("submit");
		
		//out.print(email+" -----"+date+" ----- "+day+"---"+cap+"-----------"+nov+"------"+budget+"-------"+button);
		
		if(button.equals("Update")) {
		try {
			DBConnection.createConnection().createStatement().executeUpdate("UPDATE events SET name='"+type+"',discount='"+discount+"' WHERE idevents='"+id+"' ");
			 
			 RequestDispatcher rd=request.getRequestDispatcher("AdminViewEvent.jsp?Msg=Your Details Updated Successfully");
		     rd.forward(request, response);
		     
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		}else {
			RequestDispatcher rd=request.getRequestDispatcher("AdminViewEvent.jsp?errMsg=Please Update Your Details Correctly");
			rd.forward(request, response);
			
			
		}
		
	}

}
