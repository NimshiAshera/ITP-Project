package LCustomer;

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
 * Servlet implementation class LCustomerRegister
 */
@WebServlet("/LCustomerRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class LCustomerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LCustomerRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		LCustomer lcustomer = new LCustomer();
		
		PrintWriter out = response.getWriter();
		
		lcustomer.setFname(request.getParameter("fname"));
		lcustomer.setLname(request.getParameter("lname"));
		lcustomer.setNic(request.getParameter("nic"));
		lcustomer.setPhone(request.getParameter("phone"));
		lcustomer.setGender(request.getParameter("gender"));
		lcustomer.setEmail(request.getParameter("email"));
		lcustomer.setUsername(request.getParameter("username"));
		lcustomer.setPassword(request.getParameter("password"));
		
		//--------------------------------
		
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
				String sql= "select * from lcustomer where username= '"
						+lcustomer.getUsername()+"'";
				
				ResultSet rs= st.executeQuery(sql);
				
				if (rs.next()) {
					Object message = "Already registered.";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/customerRegister.jsp").forward(
							request, response);
			   
	           }
				
				else  {
					String sql2 = "insert into lcustomer (fname,lname,nic,avatar,path,phone,gender,email,username,password)"
							+ "values (?,?,?,?,?,?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, lcustomer.getFname());
					pre.setString(2, lcustomer.getLname());
					pre.setString(3, lcustomer.getNic());
					
					
					
					if (ServletFileUpload.isMultipartContent(request)) {
						Part part = request.getPart("avatar");
						lcustomer.setAvatar(lcustomer.extractAvatar(part));
						lcustomer.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\customer\\"
								+ File.separator + lcustomer.getAvatar());
						File fileSaveDir = new File(lcustomer.getPath());
						part.write(lcustomer.getPath() + File.separator);
					
					pre.setString(4, lcustomer.getAvatar());
					pre.setString(5, lcustomer.getPath());
					pre.setString(6, lcustomer.getPhone()); 
					pre.setString(7, lcustomer.getGender());
					pre.setString(8, lcustomer.getEmail());					
					pre.setString(9, lcustomer.getUsername());
					pre.setString(10, lcustomer.getPassword());

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
