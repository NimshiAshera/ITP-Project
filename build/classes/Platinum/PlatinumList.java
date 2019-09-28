package Platinum;

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
 * Servlet implementation class PlatinumList
 */
@WebServlet("/PlatinumList")
public class PlatinumList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlatinumList() {
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
			
			String sql = "select pname,pid,person,bed,avatar,d1,d2,d3,d4,d5,d6,d7 from platinum";
			
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			out.println("<html>");
            out.println("<head>");
            out.println("<title>Details</title>");
            out.println("<link href=profile.css rel=stylesheet type=text/css>"); 
            out.println("</head>");
            out.println("<body>");
            
            out.println("<h1>List of Packages Under Platinum </h1>");
            
			String st1 ="<table border=2; width=100%;><tr><th>Name</th><th>PID</th><th>NO. of persons</th><th>No. of Beds</th><th>Image</th><th>Day 01</th><th>Day 02</th><th>Day 03</th><th>Day 04</th><th>Day 05</th><th>Day 06</th><th>Day 07</th><th>Update</th><th>Delete</th></tr>";
			
			while(rs.next()){
				
				st1 += "<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+"<img src=\"package/"+rs.getString(5)+"\" width=\"300\" height=\"200\">"+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td><td>"+rs.getString(11)+"</td><td>"+rs.getString(12)+"</td><td><a href=\"PlatinumProfile\" class=\"btn btn-danger ml-2 btn-sm\"><font size=\"4\">Update</font></a></td><td><a href=\"packageBooking.jsp\" class=\"btn btn-danger ml-2 btn-sm\"><font size=\"4\"> Delete</font></a></td></tr>";
				
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
		//doGet(request, response);
	}

}
