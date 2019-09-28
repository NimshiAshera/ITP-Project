package TourGuide;

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

import Driver.DBManager;

/**
 * Servlet implementation class TourGuideView
 */
@WebServlet("/TourGuideView")
public class TourGuideView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourGuideView() {
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
		
		TourGuide guide = new TourGuide();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
	
		try{
			
			
			String sql = "select fname,lname,avatar,phone,language,part,license,dI,dE,part1 from guide ";
			
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			
			out.println("<html>");
            out.println("<head>");
            out.println("<title>Details</title>");
            out.println("<link href=styles/15.css rel=stylesheet type=text/css>"); 
            out.println("</head>");
            
            RequestDispatcher rd = request
					.getRequestDispatcher("/Header.jsp");
			rd.include(request, response);

            
            out.println("<body>");
            
            out.println("<div class=\"container-table100\">\r\n");
            out.println("<div class=\"wrap-table100\">\r\n");
            out.println("<div class=\"table100\">\r\n");   
            
            
            out.println("<br/><br/><br/><br/><br/><br/>");
    		out.print("<h1>Display the Price List(Per Person)</h1>");
    		out.print("<table border=0; width=100%; position=\"center\"><tr><th>40 USD per 1 day</th></tr><tr><th>200 USD per 5 days</th></tr><tr><th>300 USD per 7 days</th></tr><tr><th>450 USD per 10 days</th></tr><tr><th>600 USD per 14 days</th></tr><tr><th>1500 USD per 1 month</th></tr></table>");
    		out.println("<br/><br/><br/>");
    		out.println("<h1>View Registered Tour Guides</h1>");
			
    		
    		String st1 ="<table class=\"new\" border=0; width=80%;><tr class=\"tab\"><th class=\"col1\">First Name</th><th class=\"col2\">Last Name</th><th class=\"col3\">Image</th><th class=\"col4\">Phone</th><th class=\"col5\">Languages</th><th class=\"col6\">Category</th><th class=\"col7\">License</th><th class=\"col8\">Date Issued</th><th class=\"col9\">Data Expired</th><th class=\"col10\">Availability</th><th class=\"col11\">Book</th></tr>";
			
    		
    		while(rs.next()){
				  
    			st1 += "<tr class=\"tab\"><td class=\"col1\"><p class=\"font\">"+rs.getString(1)+"</td><td class=\"col2\"><p class=\"font\">"+rs.getString(2)+"</td><td>"+"<img src=\"tourguide/"+rs.getString(3)+"\" width=\"200\" height=\"300\">"+"</td><td class=\"col4\"><p class=\"font\">"+rs.getString(4)+"</td><td class=\"col5\"><p class=\"font\">"+rs.getString(5)+"</td><td class=\"col6\"><p class=\"font\">"+rs.getString(6)+"</td><td class=\"col7\"><p class=\"font\">"+rs.getString(7)+"</td><td class=\"col8\"><p class=\"font\">"+rs.getString(8)+"</td><td class=\"col9\"><p class=\"font\">"+rs.getString(9)+"</td><td class=\"col10\"><p class=\"font\">"+rs.getString(10)+"</td><td class=\"col11\"><a href=\"tourguidebooking.jsp\" class=\"btn btn-danger ml-2 btn-sm\"><i class=\"fas fa-spinner\" style=\"font-size:30px\"></i><font size=\"6\"> Booking</font></a></td></tr>";
    		}	
				
    			st1 += "</table>";
    			out.println(st1);
    			
    			out.println("<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>");
    			out.print("</div>");
    			out.print("</div>");
    			out.print("</div>");
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
