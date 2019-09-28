package FCustomer;

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
import LCustomer.LCustomer;

/**
 * Servlet implementation class FCustomerRegister
 */
@WebServlet("/FCustomerRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class FCustomerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FCustomerRegister() {
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
		
		FCustomer fcustomer = new FCustomer();
		
		PrintWriter out = response.getWriter();
		
		fcustomer.setFname(request.getParameter("fname"));
		fcustomer.setLname(request.getParameter("lname"));
		fcustomer.setPass(request.getParameter("pass"));
		fcustomer.setPhone(request.getParameter("phone"));
		fcustomer.setGender(request.getParameter("gender"));
		fcustomer.setEmail(request.getParameter("email"));
		fcustomer.setUsername(request.getParameter("username"));
		fcustomer.setPassword(request.getParameter("password"));
		
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
				String sql= "select * from fcustomer where username= '"
						+fcustomer.getUsername()+"'";
				
				ResultSet rs= st.executeQuery(sql);
				
				if (rs.next()) {
					Object message = "Already registered.";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/customerRegister2.jsp").forward(
							request, response);
			   
	           }
				
				else  {
					String sql2 = "insert into fcustomer (fname,lname,pass,avatar,path,phone,gender,email,username,password)"
							+ "values (?,?,?,?,?,?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, fcustomer.getFname());
					pre.setString(2, fcustomer.getLname());
					pre.setString(3, fcustomer.getPass());
					
					
					
					if (ServletFileUpload.isMultipartContent(request)) {
						Part part = request.getPart("avatar");
						fcustomer.setAvatar(fcustomer.extractAvatar(part));
						fcustomer.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\customer\\"
								+ File.separator + fcustomer.getAvatar());
						File fileSaveDir = new File(fcustomer.getPath());
						part.write(fcustomer.getPath() + File.separator);
					
					pre.setString(4, fcustomer.getAvatar());
					pre.setString(5, fcustomer.getPath());
					pre.setString(6, fcustomer.getPhone()); 
					pre.setString(7, fcustomer.getGender());
					pre.setString(8, fcustomer.getEmail());					
					pre.setString(9, fcustomer.getUsername());
					pre.setString(10, fcustomer.getPassword());

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
