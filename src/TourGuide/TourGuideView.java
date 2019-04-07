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
            out.println("<link href=2.css rel=stylesheet type=text/css>"); 
            out.println("</head>");
            
            RequestDispatcher rd = request
					.getRequestDispatcher("/Header.jsp");
			rd.include(request, response);

            
            out.println("<body>");
            out.print("<div class=\"form-style-5\" align='center' style='background:url(images/img01.gif) repeat'>");
            out.println("<br/><br/><br/><br/><br/><br/>");
    		out.print("<h1>Display the Price List(Per Person)</h1>");
    		out.print("<table border><tr><th>40 USD per 1 day</th></tr><tr><th>500 USD per 5 days</th></tr><tr><th>750 USD per 7 days</th></tr><tr><th>950 USD per 10 days</th></tr><tr><th>1400 USD per 14 days</th></tr><tr><th>3000 USD per 1 month</th></tr></table>");
    		out.println("<br/><br/><br/>");
    		out.println("<h1>View Registered Tour Guides</h1>");
			
    		
    		String st1 ="<table border=2; width=200%;><tr><th>First Name</th><th>Last Name</th><th>Image</th><th>Phone</th><th>Languages</th><th>Category</th><th>License</th><th>Date Issued</th><th>Data Expired</th><th>Availability</th><th></th></tr>";
			
    		
    		while(rs.next()){
				  
    			st1 += "<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+"<img src=\"driver/"+rs.getString(3)+"\" width=\"300\" height=\"200\">"+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td><td></td></tr>";
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
