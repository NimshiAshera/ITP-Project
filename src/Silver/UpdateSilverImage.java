package Silver;

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
 * Servlet implementation class UpdateSilverImage
 */
@WebServlet("/UpdateSilverImage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class UpdateSilverImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSilverImage() {
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
		
		Silver silver = new Silver();

		HttpSession session = request.getSession();

		silver.setPid((String) session.getAttribute("pid"));

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();

		if (ServletFileUpload.isMultipartContent(request)) {
			Part part = request.getPart("avatar");
			silver.setAvatar(silver.extractAvatar(part));
			silver.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\package"
					+ File.separator + silver.getAvatar());
			File fileSaveDir = new File(silver.getPath());
			part.write(silver.getPath() + File.separator);
		}


		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			try {
				String sql = "update silver set " + "avatar='"
						+ silver.getAvatar() + "'," + "path='"
						+ silver.getPath() + "'" + " where pid='" + silver.getPid()
						+ "'";

				Statement st = conn.createStatement();
				st.executeUpdate(sql);

				session.setAttribute("loggedAs", "silver");
				session.setAttribute("pic", silver.getAvatar());

				request.getRequestDispatcher("/dashBOwner.jsp").forward(request,
						response);
				
			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}
		
	}

}
