package Staff;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Driver.DBManager;


/**
 * Servlet implementation class StaffProfile
 */
@WebServlet("/StaffProfile")
public class StaffProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffProfile() {
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
			
			String sql = "select * from staff";
			
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			out.println("<html>");
            out.println("<head>");
            out.println("<title>Details</title>");
            out.println("<link href=styles/11.css rel=stylesheet type=text/css>"); 
            out.println("</head>");
            out.println("<body>");
   
            out.println("<div class=\"container-table100\">\r\n");
            out.println("<div class=\"wrap-table100\">\r\n");
            out.println("<div class=\"table100\">\r\n");
            
            out.println("<h1>Staff Details</h1>");
            
			String st1 ="<table class=\"new\" border=2; width=100%;><tr class=\"tab\"><th class=\"col1\">Role</th><th class=\"col2\">First Name</th><th class=\"col3\">Last Name</th><th class=\"col4\">NIC</th><th class=\"col5\">Email</th><th class=\"col6\">Phone No.</th><th class=\"col7\">User Name</th><th class=\"col8\">Password</th></tr>";
			
			while(rs.next()){
				
				st1 += "<tr><td><p class=\"font\">"+rs.getString(1)+"</p></td><td><p class=\"font\">"+rs.getString(2)+"</p></td><td><p class=\"font\">"+rs.getString(3)+"</p></td><td><p class=\"font\">"+rs.getString(4)+"</p></td><td><p class=\"font\">"+rs.getString(5)+"</p></td><td><p class=\"font\">"+rs.getString(6)+"</td><td><p class=\"font\">"+rs.getString(7)+"</p></td><td><p class=\"font\">"+rs.getString(8)+"</p></td></tr>";
				
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
