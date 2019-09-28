package Travel;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import Driver.DBManager;

/**
 * Servlet implementation class TravelRegister
 */
@WebServlet("/TravelRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class TravelRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Travel travel = new Travel();
		
		PrintWriter out= response.getWriter();
		
		travel.setName(request.getParameter("name"));
		travel.setDetails(request.getParameter("details"));
		
		response.setContentType("text/html");
		
		PrintWriter write = response.getWriter();

		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		if (conn == null) {
			System.out.println("connect");
			write.write("Connection Not Established");
			System.out.println("connected");
		} 
		else {
			
			try {
				Statement st = conn.createStatement();
				String sql = "select * from travel where name = '"
						+ travel.getName() + "'";
				ResultSet rs = st.executeQuery(sql);

				String sql2 = "insert into travel (name,details,avatar,path)"
							+ "values (?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, travel.getName());
					pre.setString(2, travel.getDetails());
					
					
					if (ServletFileUpload.isMultipartContent(request)) {
						Part part = request.getPart("avatar");
						travel.setAvatar(travel.extractAvatar(part));
						travel.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\travel\\"
								+ File.separator + travel.getAvatar());
						File fileSaveDir = new File(travel.getPath());
						part.write(travel.getPath() + File.separator);
					
					pre.setString(3, travel.getAvatar());
					pre.setString(4, travel.getPath());
					

					}
					
					pre.execute();

					
					request.getRequestDispatcher("/dashBOwner.jsp").forward(request,
							response);
				

			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
				
			}
		}
		
	}

}
