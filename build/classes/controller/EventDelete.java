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
 * Servlet implementation class EventDelete
 */
@WebServlet("/EventDelete")
public class EventDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventDelete() {
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
		
		PrintWriter out =response.getWriter();
		try {
			String buttonevent = request.getParameter("Dltbutton");
			String id=request.getParameter("id");
			
			if(buttonevent.equals("Delete")){	
				if(id != null) {
				
					DBConnection.createConnection().createStatement().executeUpdate("Delete From events Where idevents='"+id+"' ");
					RequestDispatcher rd=request.getRequestDispatcher("AdminViewEvent.jsp?erMsg=Request Deleted Success");
					rd.forward(request, response);
				}else {
					RequestDispatcher rd=request.getRequestDispatcher("AdminViewEvent.jsp?Message=No Previous Request");
					rd.forward(request, response);
				}
			}else{	
				RequestDispatcher rd=request.getRequestDispatcher("Home.jsp?Msg=Please Login");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
