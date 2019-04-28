package Adventure;

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
 * Servlet implementation class AdventureRegister
 */
@WebServlet("/AdventureRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class AdventureRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdventureRegister() {
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
		
		Adventure adventure = new Adventure();
		
		PrintWriter out= response.getWriter();
		
		adventure.setPart(request.getParameter("part"));
		adventure.setName(request.getParameter("name"));
		adventure.setContact_no(request.getParameter("contact_no"));
		adventure.setDetails(request.getParameter("details"));
		adventure.setAvb(request.getParameter("avb"));		
		adventure.setUsername(request.getParameter("username"));
		adventure.setPassword(request.getParameter("password"));
		
		//-----------------------------------------------------
		
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
						String sql = "select * from adventure where username = '"
								+ adventure.getUsername() + "'";
						ResultSet rs = st.executeQuery(sql);

						if (rs.next()) {
							Object message = "Already registered.";
							request.setAttribute("modelExist", message);
							request.getRequestDispatcher("/adventureRegister.jsp").forward(
									request, response);
					   
			           }
						
					   else  {
							String sql2 = "insert into adventure (part,name,contact_no,avatar,path,details,avb,username,password)"
									+ "values (?,?,?,?,?,?,?,?,?)";

							PreparedStatement pre = conn.prepareStatement(sql2);

							pre.setString(1, adventure.getPart());
							pre.setString(2, adventure.getName());
							pre.setString(3, adventure.getContact_no()); 
							
							if (ServletFileUpload.isMultipartContent(request)) {
								Part part = request.getPart("avatar");
								adventure.setAvatar(adventure.extractAvatar(part));
								adventure.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\Adventure\\"
										+ File.separator + adventure.getAvatar());
								File fileSaveDir = new File(adventure.getPath());
								part.write(adventure.getPath() + File.separator);
								
							pre.setString(4, adventure.getAvatar());
							pre.setString(5, adventure.getPath());
							pre.setString(6, adventure.getDetails());
							pre.setString(7, adventure.getAvb());
							pre.setString(8, adventure.getUsername());
							pre.setString(9, adventure.getPassword());
							
							}
							
							pre.execute();

							
							request.getRequestDispatcher("/Home.jsp").forward(request,
									response);
						}

					} catch (Exception e) {
						System.out.println("Got an exception");
						System.out.println(e.getMessage());
						
					}
				}
		
	}

}
