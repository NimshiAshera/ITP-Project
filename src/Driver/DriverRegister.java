package Driver;

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

/**
 * Servlet implementation class DriverRegister
 */

@WebServlet("/DriverRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class DriverRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverRegister() {
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
		
		
		Driver driver= new Driver();
		
		//HttpSession session = request.getSession();
		
		PrintWriter out= response.getWriter();
		
		driver.setFname(request.getParameter("fname"));
		driver.setLname(request.getParameter("lname"));
		driver.setNic(request.getParameter("nic"));
		driver.setEmail(request.getParameter("email"));
		driver.setPhone(request.getParameter("phone"));
		driver.setLicense(request.getParameter("license"));
		driver.setdI(request.getParameter("dI"));
		driver.setdE(request.getParameter("dE"));
		driver.setPart(request.getParameter("part"));
		driver.setTerms(request.getParameter("terms"));
		driver.setUsername(request.getParameter("username"));
		driver.setPassword(request.getParameter("password"));
		
		//----------------------------------------
		
		out.write("Susccess " +request.getParameter("fname")+"\n");
		out.write("Susccess " +request.getParameter("lname")+"\n");
		out.write("Susccess " +request.getParameter("nic")+"\n");
		out.write("Susccess " +request.getParameter("email")+"\n");
		out.write("Susccess " +request.getParameter("phone")+"\n");
		out.write("Susccess " +request.getParameter("license")+"\n");
		out.write("Susccess " +request.getParameter("dI")+"\n");
		out.write("Susccess " +request.getParameter("dE")+"\n");
		out.write("Susccess " +request.getParameter("part")+"\n");
		out.write("Susccess " +request.getParameter("terms")+"\n");
		out.write("Susccess " +request.getParameter("username")+"\n");
		out.write("Susccess " +request.getParameter("password")+"\n");
		
		//-----------------------------------------
		
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
				String sql = "select * from driver where nic = '"
						+ driver.getNic() + "'";
				ResultSet rs = st.executeQuery(sql);

				if (rs.next()) {
					Object message = "Driver is already registered.";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/driverRegister.jsp").forward(
							request, response);
			   
	           }

				else if (!driver.getNic().matches("^[0-9]{9}[vV]$")) {
					Object message = "Invalid NIC.";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/driverRegister.jsp").forward(
							request, response);
				
				}

				else  {
					String sql2 = "insert into driver (fname,lname,nic,email,phone,avatar,path,license,dI,dE,part,terms,username,password)"
							+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, driver.getFname());
					pre.setString(2, driver.getLname());
					pre.setString(3, driver.getNic());
					pre.setString(4, driver.getEmail());
					pre.setString(5, driver.getPhone()); 
					
					if (ServletFileUpload.isMultipartContent(request)) {
						Part part = request.getPart("avatar");
						driver.setAvatar(driver.extractAvatar(part));
						driver.setPath("C:\\Users\\Asus\\Desktop\\ECO Pro\\gallery\\WebContent\\driver\\"
								+ File.separator + driver.getAvatar());
						File fileSaveDir = new File(driver.getPath());
						part.write(driver.getPath() + File.separator);
					
					pre.setString(6, driver.getAvatar());
					pre.setString(7, driver.getPath());
					pre.setString(8, driver.getLicense());
					pre.setString(9, driver.getdI());
					pre.setString(10, driver.getdE());
					pre.setString(11, driver.getPart());
					pre.setString(12, driver.getTerms());
					pre.setString(13, driver.getUsername());
					pre.setString(14, driver.getPassword());

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
