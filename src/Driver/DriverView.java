package Driver;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Vehicle.Vehicle;

/**
 * Servlet implementation class DriverView
 */
@WebServlet("/DriverView")
public class DriverView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Driver driver = new Driver();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			
			String sql = "select fname,lname,phone,avatar,license,dI,dE,part from driver ";
			
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			
			out.println("<html>");
            out.println("<head>");
            out.println("<title>Details</title>");
            out.println("<link href=2.css rel=stylesheet type=text/css>"); 
            out.println("</head>");
            
            RequestDispatcher rd = request
					.getRequestDispatcher("/Header.jsp");
			rd.include(request, response);

            
            out.println("<body>");
            out.print("<div class=\"form-style-5\" align='center' style='background:url(images/img01.gif) repeat'>");
            out.println("<br/><br/><br/><br/><br/><br/>");
    		out.print("<h1>Display the Price List</h1>");
    		out.print("<table border><tr><th>Below 7 Days : 65 USD per day</th></tr><tr><th>Trip of 7 Days  : 55 USD per day</th></tr><tr><th>Above 7 Days  : 50 USD per day</th></tr></table>");
    		out.println("<br/><br/><br/>");
    		out.println("<h1>View Registered Drivers</h1>");
			
    		
    		String st1 ="<table  border=2; width=200%;><tr><th>First Name</th><th>Last Name</th><th>Phone No.</th><th>Image</th><th>License</th><th>Date Issued</th><th>Data Expired</th><th>Availability</th><th>Book</th></tr>";
			
    		
    		while(rs.next()){
				  
    			st1 += "<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+"<img src=\"driver/"+rs.getString(7)+"\" width=\"300\" height=\"200\">"+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td><a href=\"driverBooking1.jsp\" class=\"btn btn-danger ml-2 btn-sm\"><i class=\"fas fa-spinner\"></i><font size=\"4\"> Booking</font></a></td></tr>";
    		}	
				
    			st1 += "</table>";
    			out.println(st1);
    			out.println("<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>");
    			out.print("<div class=\"w3-black w3-center w3-padding-24\"><h3><b>Powered by ECO Tours</b></h3></div>");
    			out.println("</body>");
                out.println("</html>");
    			
    		}catch(Exception p) {
    			System.out.println(p);
    		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
