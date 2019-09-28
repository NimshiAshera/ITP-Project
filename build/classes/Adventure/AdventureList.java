package Adventure;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Driver.DBManager;

/**
 * Servlet implementation class AdventureList
 */
@WebServlet("/AdventureList")
public class AdventureList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdventureList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		response.setContentType("text/html");
				

		PrintWriter out = response.getWriter();
		
		try {
			
			String sql = "select name,contact_no,Details,season,see,time from adventure ";
			
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			out.println("<html>");
            out.println("<head>");
            out.println("<title>Details</title>");
            out.println("<link href=styles/2.css rel=stylesheet type=text/css>"); 
            out.println("</head>");
            out.println("<body>");
            
            out.println("<div class=\"container-table100\">\r\n");
            out.println("<div class=\"wrap-table100\">\r\n");
            out.println("<div class=\"table100\">\r\n");     
            
            out.println("<h1>List of Registered Adventure Companies</h1>");
            
			String st1 ="<table class=\"new\" border=0; width=100%;><tr class=\"tab\"><th class=\"col1\">Company Name</th><th class=\"col2\">Contact Person</th><th class=\"col3\">Adventure Details</th><th class=\"col4\">Best Seasons</th><th class=\"col5\">Views</th><th class=\"col6\">Tour Times</th></tr>";
			
			while(rs.next()){
				
				st1 += "<tr><td class=\"col1\"><p class=\"font\">"+rs.getString(1)+"</td><td class=\"col2\"><p class=\"font\">"+rs.getString(2)+"</td><td class=\"col3\"><p class=\"font\">"+rs.getString(3)+"</td><td class=\"col4\"><p class=\"font\">"+rs.getString(4)+"</td><td class=\"col5\"><p class=\"font\">"+rs.getString(5)+"</td><td class=\"col6\"><p class=\"font\">"+rs.getString(6)+"</td></tr>";
				
			}
			
			st1 += "</table>";
			out.println(st1);
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
