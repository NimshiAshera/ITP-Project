package LCustomer;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * Servlet implementation class UpdateLCustomerImage
 */
@WebServlet("/UpdateLCustomerImage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class UpdateLCustomerImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLCustomerImage() {
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
		
		LCustomer lcustomer = new LCustomer();
		
		HttpSession session = request.getSession();

		lcustomer.setUsername((String) session.getAttribute("username"));

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();

		if (ServletFileUpload.isMultipartContent(request)) {
			Part part = request.getPart("avatar");
			lcustomer.setAvatar(lcustomer.extractAvatar(part));
			lcustomer.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\customer"
					+ File.separator + lcustomer.getAvatar());
			File fileSaveDir = new File(lcustomer.getPath());
			part.write(lcustomer.getPath() + File.separator);
		}


		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			try {
				String sql = "update lcustomer set " + "avatar='"
						+ lcustomer.getAvatar() + "'," + "path='"
						+ lcustomer.getPath() + "'" + " where username='" + lcustomer.getUsername()
						+ "'";

				Statement st = conn.createStatement();
				st.executeUpdate(sql);

				session.setAttribute("loggedAs", "lcustomer");
				session.setAttribute("avatar", lcustomer.getAvatar());

				request.getRequestDispatcher("/Home.jsp").forward(request,
						response);
				request.getRequestDispatcher("/Header.jsp").forward(request,
						response);
				
			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}
		
		
		
	}

}
