package Silver;

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
import Platinum.Platinum;

/**
 * Servlet implementation class Silver_View
 */
@WebServlet("/Silver_View")
public class Silver_View extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Silver_View() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Platinum platinum = new Platinum();
	
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			
			String sql = "select pid,avatar,d1,d2,d3 from silver where person='6' and bed='3' ";
			
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
            out.print("<div class=\"form-style-5\" align='center' style='background:url(images/bg8.jpg) repeat'>");
            out.println("<br/><br/><br/><br/><br/><br/>");
    		
    		
    		out.print("<table border><tr><th>80 USD Valued Silver Package(Per Person)</th></tr></table>");
    		
    		
    		String st1 ="<table border=2; width=200%;><tr><th>ID</th><th>Image</th><th>Day 1</th><th>Day 2</th><th>Day 3</th><th>Book Package</th></tr>";
			
    		
    		while(rs.next()){
    			
    			
    			out.print("<br/><br/><br/>");  
    			st1 += "<tr><td>"+rs.getString(1)+"</td><td>"+"<img src=\"package/"+rs.getString(2)+"\" width=\"300\" height=\"200\">"+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td><a href=\"packagebooking.jsp\" class=\"btn btn-danger ml-2 btn-sm\"><font size=\"4\"> Booking</font></a></td></tr>\r\n" + 
    					"</tr>";
    				
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
		
	}

}
