package Vehicle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Driver.DBManager;

/**
 * Servlet implementation class VehicleSearch
 */
@WebServlet("/VehicleSearch")
public class VehicleSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleSearch() {
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
        
        DBManager db = new DBManager();
		Connection conn = db.getConnection();
        
        String type =request.getParameter("type");
        
        try{
            
            PreparedStatement ps=conn.prepareStatement("select fname,lname,phone,type,status,noPlate,avatar,part,features from vehicle where type =?");
            ps.setString(1, type);                    
            
            
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
            out.println("<br/><br/>");
            
            out.print("<table class=\"new\" border=0; width=100%;><tr class=\"tab\"><th class=\"col1\">First Name</th><th class=\"col2\">Last Name</th><th class=\"col3\">Phone No.</th><th class=\"col4\">Vehicle Type</th><th class=\"col5\">Vehicle Model</th><th class=\"col6\">Register No.</th><th class=\"col7\">Features</th><th class=\"col8\">Image</th><th class=\"col9\">Availability</th><th class=\"col10\">Book</th></tr>");
            
            ResultSet rs=ps.executeQuery();                 
            /* Printing column names */
            ResultSetMetaData rsmd=rs.getMetaData();
            
            out.println("<br/>");
    		

            while(rs.next())
               {
            out.print("<tr class=\"tab\">");
            
            out.print("<td class=\"col1\" style=\"font-size:24px\">"+rs.getString(1)+"</td>");
            out.print("<td class=\"col2\" style=\"font-size:24px\">"+rs.getString(2)+"</td>");
            out.print("<td class=\"col3\" style=\"font-size:24px\">"+rs.getString(3)+"</td>");
            out.print("<td class=\"col4\"style=\"font-size:24px\">"+rs.getString(4)+"</td>");
            out.print("<td class=\"col5\" style=\"font-size:24px\">"+rs.getString(5)+"</td>");
            out.print("<td class=\"col6\" style=\"font-size:24px\">"+rs.getString(6)+"</td>");
            out.print("<td class=\"col7\" style=\"font-size:24px\">"+rs.getString(9)+"</td>");
            out.print("<td>"+"<img src=\"vehicle/"+rs.getString(7)+"\" width=\"300\" height=\"200\">"+"</td>");
            out.print("<td class=\"col9\" style=\"font-size:24px\">"+rs.getString(8)+"</td>");
            out.print("<td class=\"col10\" style=\"font-size:24px\"><a href=\"vehicleBooking.jsp\" class=\"btn btn-danger ml-2 btn-sm\"><i class=\"fas fa-spinner\" style=\"font-size:30px\"></i><font size=\"6\"> Booking</font></a></td></tr>");
                                  
            }
            out.print("</table>");
            out.print("</div>");
            out.println("</div>");
			out.println("</div>");
			out.println("</div>");
            
            

     }catch (Exception e2)
       {
           e2.printStackTrace();
       }

     
    	   out.println("<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>");
		   out.print("<div class=\"w3-black w3-center w3-padding-24\"><h3><b>Powered by ECO Tours</b></h3></div>");
		   out.println("</body>");
        out.println("</html>");
        
        
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
