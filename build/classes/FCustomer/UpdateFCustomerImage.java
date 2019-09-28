package FCustomer;

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
 * Servlet implementation class UpdateFCustomerImage
 */
@WebServlet("/UpdateFCustomerImage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class UpdateFCustomerImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFCustomerImage() {
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
		
		FCustomer fcustomer = new FCustomer();
		
		HttpSession session = request.getSession();

		fcustomer.setUsername((String) session.getAttribute("username"));

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();

		if (ServletFileUpload.isMultipartContent(request)) {
			Part part = request.getPart("avatar");
			fcustomer.setAvatar(fcustomer.extractAvatar(part));
			fcustomer.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\customer"
					+ File.separator + fcustomer.getAvatar());
			File fileSaveDir = new File(fcustomer.getPath());
			part.write(fcustomer.getPath() + File.separator);
		}


		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			try {
				String sql = "update fcustomer set " + "avatar='"
						+ fcustomer.getAvatar() + "'," + "path='"
						+ fcustomer.getPath() + "'" + " where username='" + fcustomer.getUsername()
						+ "'";

				Statement st = conn.createStatement();
				st.executeUpdate(sql);

				session.setAttribute("loggedAs", "fcustomer");
				session.setAttribute("avatar", fcustomer.getAvatar());

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
