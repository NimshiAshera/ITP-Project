package Travel;

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
 * Servlet implementation class TravelView
 */
@WebServlet("/TravelView")
public class TravelView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		response.setContentType("text/html");
				

		PrintWriter out = response.getWriter();
		
	
		try {
			
			String sql = "select name,details,avatar from travel";
			
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			out.println("<html>");
            out.println("<head>");
            out.println("<title>Details</title>");
            
             
            out.println("<link href=3.css rel=stylesheet type=text/css>"); 
            
            out.println("</head>");
            out.println("<body>");
	
            RequestDispatcher rd = request
					.getRequestDispatcher("/Header.jsp");
			rd.include(request, response);

			out.println("<br/><br/><br/>");
            			
                        
            String st1 ="<table><tr><th></th><th></th><th></th></tr>";
			
			while(rs.next()){
				
				st1 += "<tr><th>"+rs.getString(1)+"</th><th>"+rs.getString(2)+"</th><th>"+"<img src=\"travel/"+rs.getString(3)+"\" width=\"300\" height=\"200\">"+"</th></tr>";
			
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
