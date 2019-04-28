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
 * Servlet implementation class FVehicleSearch
 */
@WebServlet("/FVehicleSearch")
public class FVehicleSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FVehicleSearch() {
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
        
        String vname=request.getParameter("vname");                           
        try{
               
               PreparedStatement ps=conn.prepareStatement("select * from foreign_vehicle_booking where vname =?");
               ps.setString(1, vname);                    
               
               
               out.println("<html>");
               out.println("<head>");
               out.println("<title>Details</title>");
               out.println("<link href=styles/1.css rel=stylesheet type=text/css>"); 
               out.println("</head>");
               
               RequestDispatcher rd = request
   					.getRequestDispatcher("/Header.jsp");
   				rd.include(request, response);

               
               out.println("<body>");

               out.println("<br/><br/><br/>");
               
               out.print("<center><h1>Bookings of Your Vehicle</h1></center>");
               
               out.println("<div class=\"table100\">\r\n"); 
               out.print("<table border=0; width=100%;><tr><th class=\"cell100 column1\">First Name of Customer</th><th class=\"cell100 column2\">Contact No.</th><th class=\"cell100 column3\">Email</th><th class=\"cell100 column4\">Vehicle Owners Name</th><th class=\"cell100 column5\">Booked Date</th><th class=\"cell100 column6\">No. of Days Booked</th><th class=\"cell100 column7\">Total Amount (USD)</th></tr>");
               
               ResultSet rs=ps.executeQuery();                 
               /* Printing column names */
               ResultSetMetaData rsmd=rs.getMetaData();
               
               out.println("<br/><br/><br/>");
       		
   
               while(rs.next())
                  {
               out.print("<tr class=\"row100 body\">");
               
               out.print("<td class=\"cell100 column1\">"+rs.getString(1)+"</td>");
               out.print("<td class=\"cell100 column2\">"+rs.getString(2)+"</td>");
               out.print("<td class=\"cell100 column3\">"+rs.getString(3)+"</td>");
               out.print("<td class=\"cell100 column4\">"+rs.getString(4)+"</td>");
               out.print("<td class=\"cell100 column5\">"+rs.getString(5)+"</td>");
               out.print("<td class=\"cell100 column6\">"+rs.getString(6)+"</td>");
               out.print("<td class=\"cell100 column7\">"+rs.getString(7)+"</td></tr>");
                                     
               }
               out.print("</table>");
               out.print("</div>");
               
               

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
		//doGet(request, response);
	}

}
