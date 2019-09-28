package Adventure;

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
 * Servlet implementation class AdventureSafariView
 */
@WebServlet("/AdventureSafariView")
public class AdventureSafariView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdventureSafariView() {
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
		
		Adventure adventure =new Adventure();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
	
		try{
			
			
			String sql = "select avatar,name,contact_no,Details,season,see,time from adventure where avb='Available' and part='Wild Safari' ";
			
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			
			out.println("<html>");
            out.println("<head>");
            out.println("<title>Details</title>");
            out.println("<link href=styles/21.css rel=stylesheet type=text/css>"); 
            out.println("</head>");
            
            RequestDispatcher rd = request
					.getRequestDispatcher("/Header.jsp");
			rd.include(request, response);

            
            out.println("<body>");
                    			
            out.println("<br/><br/><br/><br/><br/><br/>");
    		String st1 ="<table class=\"new\" border=0; width=100%; cellspacing=0;><tr><th class=\"col1\">Image</th><th class=\"col2\">Company Name</th><th class=\"col3\">Contact Person No.</th><th class=\"col4\">Adventure Detaisl</th><th class=\"col5\">Best Season</th><th class=\"col6\">View</th><th class=\"col7\">Tour Duration</th></tr>";
			out.print("<div class=\"header\">Safari</div>");
    		
    		while(rs.next()){
				  
    			st1 += "<tr><td >"+"<img src=\"Adventure/"+rs.getString(1)+"\" width=\"400\" height=\"300\">"+"</td><td class=\"col2\"><p class=\"font\">"+rs.getString(2)+"</td><td class=\"col3\"><p class=\"font\">"+rs.getString(3)+"</td><td class=\"col4\"><p class=\"font\">"+rs.getString(4)+"</td><td class=\"col5\"><p class=\"font\">"+rs.getString(5)+"</td><td class=\"col6\"><p class=\"font\">"+rs.getString(6)+"</td><td class=\"col7\"><p class=\"font\">"+rs.getString(7)+"</td></tr>";
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
		
	}

}
