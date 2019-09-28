package Vehicle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Driver.DBManager;

/**
 * Servlet implementation class VehicleView
 */
@WebServlet("/VehicleView")
public class VehicleView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleView() {
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
		
		Vehicle vehicle=new Vehicle();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			
			String sql = "select fname,lname,phone,type,status,noPlate,avatar,part,features from vehicle where part='Available' ";
			
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			
			out.println("<html>");
            out.println("<head>");
            out.println("<title>Details</title>");
            out.println("<link href=styles/17.css rel=stylesheet type=text/css>"); 
            out.println("</head>");
            
            RequestDispatcher rd = request
					.getRequestDispatcher("/Header.jsp");
			rd.include(request, response);

            
            out.println("<body>");
            
            out.println("<div class=\"container-table100\">\r\n");
            out.println("<div class=\"wrap-table100\">\r\n");
            out.println("<div class=\"table100\">\r\n"); 
            
            out.print("<div class=\"form-style-5\" align='center' style='background:url(images/img01.gif) repeat'>");
            out.println("<br/><br/><br/><br/><br/><br/>");
            
    		out.print("<h1>Display the Price List</h1>");
    		out.print("<table border><tr><th>For 2 Days : 25 USD per day</th></tr><tr><th>For 5 Days : 20 USD per day</th></tr><tr><th>For 7 Days : 18 USD per day</th></tr></table>");
    		out.println("<br/><br/><br/>");
    		
    		
    		out.print("<div class=\"new\">");
    		out.print("<form action=\"VehicleSearch\" class=\"example\">");
    		out.print("<input type=\"text\" style=\"font-size:40px\" class=\"form-control\" name=\"type\" placeholder=\"Enter Vehicle Type\">");
    		out.print("</form>");
    		out.print("</div>");
    		
    		out.println("<h1>View Registered Vehicles</h1>");
    		
    		String st1 ="<table class=\"new\" border=0; width=100%;><tr class=\"tab\"><th class=\"col1\">First Name</th><th class=\"col2\">Last Name</th><th class=\"col3\">Phone No.</th><th class=\"col4\">Vehicle Type</th><th class=\"col5\">Vehicle Model</th><th class=\"col6\">Register No.</th><th class=\"col7\">Features</th><th class=\"col8\">Image</th><th class=\"col9\">Availability</th><th class=\"col10\">Book</th></tr>";
			
    		
    		while(rs.next()){
				  
    			st1 += "<tr class=\"tab\"><td class=\"col1\"><p class=\"font\">"+rs.getString(1)+"</td><td class=\"col2\"><p class=\"font\">"+rs.getString(2)+"</td><td class=\"col3\"><p class=\"font\">"+rs.getString(3)+"</td><td class=\"col4\"><p class=\"font\">"+rs.getString(4)+"</td><td class=\"col5\"><p class=\"font\">"+rs.getString(5)+"</td><td class=\"col6\"><p class=\"font\">"+rs.getString(6)+"</td><td class=\"col7\"><p class=\"font\">"+rs.getString(9)+"</td><td >"+"<img src=\"vehicle/"+rs.getString(7)+"\" width=\"300\" height=\"200\">"+"</td><td class=\"col9\"><p class=\"font\">"+rs.getString(8)+"</td><td class=\"col10\"><a href=\"vehicleBooking.jsp\" class=\"btn btn-danger ml-2 btn-sm\"><i class=\"fas fa-spinner\" style=\"font-size:30px\"></i><font size=\"6\"> Booking</font></a></td></tr>";
    		}	
				
    			st1 += "</table>";
    			out.println(st1);
    			out.println("</div>");
    			out.println("</div>");
    			out.println("</div>");
    			out.println("</div>");
    			out.println("<br/><br/><br/><br/><br/>");
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
