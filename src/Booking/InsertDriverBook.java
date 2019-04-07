package Booking;

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
 * Servlet implementation class InsertDriverBook
 */
@WebServlet("/InsertDriverBook")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class InsertDriverBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDriverBook() {
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
		
		BookDriver driverBook = new BookDriver();
		
		PrintWriter out= response.getWriter();
		
		driverBook.setUname(request.getParameter("uname"));
		driverBook.setDname(request.getParameter("dname"));
		driverBook.setNumd(request.getParameter("numd"));
		driverBook.setPrice(request.getParameter("price"));
		driverBook.setAmount(request.getParameter("amount"));
		
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
				String sql = "select * from driverBook where uname = '"
						+ driverBook.getUname() + "'";
				//ResultSet rs = st.executeQuery(sql);

				String sql2 = "insert into driverBook (uname,dname,numd,price,amount)"
							+ "values (?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, driverBook.getUname());
					pre.setString(2, driverBook.getDname());
					pre.setString(3, driverBook.getNumd());
					pre.setString(4, driverBook.getPrice());
					pre.setString(5, driverBook.getAmount()); 
					

					pre.execute();

					
					request.getRequestDispatcher("Home-AfterLogin.jsp").forward(request,
							response);
				

			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
				
			}
		}
		
	}

}
