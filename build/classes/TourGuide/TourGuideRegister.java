package TourGuide;

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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import Driver.DBManager;

/**
 * Servlet implementation class DriverRegister
 */

@WebServlet("/TourGuideRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class TourGuideRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourGuideRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		TourGuide guide= new TourGuide();
		
		//HttpSession session = request.getSession();
		
		PrintWriter out= response.getWriter();
		
		guide.setFname(request.getParameter("fname"));
		guide.setLname(request.getParameter("lname"));
		guide.setNic(request.getParameter("nic"));
		guide.setEmail(request.getParameter("email"));
		guide.setPhone(request.getParameter("phone"));
		guide.setLanguage(request.getParameter("language"));
		guide.setPart(request.getParameter("part"));
		guide.setLicense(request.getParameter("license"));
		guide.setdI(request.getParameter("dI"));
		guide.setdE(request.getParameter("dE"));
		guide.setPart1(request.getParameter("part1"));
		guide.setTerms(request.getParameter("terms"));
		guide.setUsername(request.getParameter("username"));
		guide.setPassword(request.getParameter("password"));
		
		//----------------------------------------
		
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
				String sql = "select * from guide where nic = '"
						+ guide.getNic() + "'";
				ResultSet rs = st.executeQuery(sql);

				if (rs.next()) {
					Object message = "Tour Guide is already registered.";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/tourGuideRegister.jsp").forward(
							request, response);
			   
	           }

				else if (!guide.getNic().matches("^[0-9]{9}[vV]$")) {
					Object message = "Please .";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/tourGuideRegister.jsp").forward(
							request, response);
				
				}

				else  {
					String sql2 = "insert into guide (fname,lname,nic,avatar,path,email,phone,language,part,license,dI,dE,part1,terms,username,password)"
							+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, guide.getFname());
					pre.setString(2, guide.getLname());
					pre.setString(3, guide.getNic());
					
					if (ServletFileUpload.isMultipartContent(request)) {
						Part part = request.getPart("avatar");
						guide.setAvatar(guide.extractAvatar(part));
						guide.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\tourguide\\"
								+ File.separator + guide.getAvatar());
						File fileSaveDir = new File(guide.getPath());
						part.write(guide.getPath() + File.separator);
					
					pre.setString(4, guide.getAvatar());
					pre.setString(5, guide.getPath());	
					pre.setString(6, guide.getEmail());
					pre.setString(7, guide.getPhone()); 
					pre.setString(8, guide.getLanguage());
					pre.setString(9, guide.getPart());
					pre.setString(10, guide.getLicense());
					pre.setString(11, guide.getdI());
					pre.setString(12, guide.getdE());
					pre.setString(13, guide.getPart1());
					pre.setString(14, guide.getTerms());
					pre.setString(15, guide.getUsername());
					pre.setString(16, guide.getPassword());

					}
					
					pre.execute();

					
					request.getRequestDispatcher("/Home.jsp").forward(request,
							response);
					request.getRequestDispatcher("/Header.jsp").forward(request,
							response);
					
				}

			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
				
			}
		}
	
	}

}
