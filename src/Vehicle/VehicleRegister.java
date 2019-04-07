package Vehicle;

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
 * Servlet implementation class VehicleRegister
 */
@WebServlet("/VehicleRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class VehicleRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleRegister() {
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
		
		Vehicle vehicle = new Vehicle();
		
		PrintWriter out= response.getWriter();
		
		vehicle.setFname(request.getParameter("fname"));
		vehicle.setLname(request.getParameter("lname"));
		vehicle.setPhone(request.getParameter("phone"));
		vehicle.setType(request.getParameter("type"));
		vehicle.setStatus(request.getParameter("status"));		
		vehicle.setNoPlate(request.getParameter("noPlate"));		
		vehicle.setPart(request.getParameter("part"));
		vehicle.setFeatures(request.getParameter("features"));
		vehicle.setTerms(request.getParameter("terms"));
		vehicle.setUsername(request.getParameter("username"));
		vehicle.setPassword(request.getParameter("password"));
		
		
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
				String sql = "select * from vehicle where username = '"
						+ vehicle.getUsername() + "'";
				ResultSet rs = st.executeQuery(sql);

				if (rs.next()) {
					Object message = "Vehicle is already registered.";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/vehicleRegister2.jsp").forward(
							request, response);
			   
	           }
				
			   else  {
					String sql2 = "insert into vehicle (fname,lname,phone,type,status,noPlate,avatar,path,part,features,terms,username,password)"
							+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, vehicle.getFname());
					pre.setString(2, vehicle.getLname());
					pre.setString(3, vehicle.getPhone()); 
					pre.setString(4, vehicle.getType());
					pre.setString(5, vehicle.getStatus());
					pre.setString(6, vehicle.getNoPlate());
					
					if (ServletFileUpload.isMultipartContent(request)) {
						Part part = request.getPart("avatar");
						vehicle.setAvatar(vehicle.extractAvatar(part));
						vehicle.setPath("C:\\Users\\Asus\\Desktop\\ECO Pro\\gallery\\WebContent\\vehicle\\"
								+ File.separator + vehicle.getAvatar());
						File fileSaveDir = new File(vehicle.getPath());
						part.write(vehicle.getPath() + File.separator);
						
					pre.setString(7, vehicle.getAvatar());
					pre.setString(8, vehicle.getPath());
					pre.setString(9, vehicle.getPart());
					pre.setString(10, vehicle.getFeatures());
					pre.setString(11, vehicle.getTerms());
					pre.setString(12, vehicle.getUsername());
					pre.setString(13, vehicle.getPassword());
					
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
