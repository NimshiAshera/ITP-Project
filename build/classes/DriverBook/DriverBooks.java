package DriverBook;

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

import Driver.DBManager;
import DriverBook.DriverBook;


/**
 * Servlet implementation class DriverBooks
 */

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/DriverBooks")

public class DriverBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverBooks() {
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
		
		DriverBook driver = new DriverBook();
		
		HttpSession session = request.getSession();
		
		PrintWriter out= response.getWriter();

		driver.setUsername((String) session.getAttribute("username"));
		driver.setdname(request.getParameter("dname"));
		driver.setdate(request.getParameter("date"));
		driver.setnumd(request.getParameter("numd"));
		driver.setprice(request.getParameter("price"));
		driver.setamount(request.getParameter("amount"));
		
		out.write("Susccess " +request.getParameter("username")+"\n");
	    out.write("Susccess " +request.getParameter("dname")+"\n");
	    out.write("Susccess " +request.getParameter("date")+"\n");
		out.write("Susccess " +request.getParameter("numd")+"\n");
		out.write("Susccess " +request.getParameter("price")+"\n");
		out.write("Susccess " +request.getParameter("amount")+"\n");
	
		//----------------------------------------
	
		response.setContentType("text/html");

		PrintWriter write = response.getWriter();

		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			write.write("Connection Not Established");
		}
		
		else {
					
			try {
						Statement st = conn.createStatement();
						String sql = "select * from driverbook where username = '"
								+ driver.getUsername() + "'";
					ResultSet rs = st.executeQuery(sql);
					
					String sql2 = "insert into driverbook (username,dname,date,numd,price,amount)"
							+ "values (?,?,?,?,?,?)";

					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, driver.getUsername());
					pre.setString(2, driver.getdname());
					pre.setString(3, driver.getdate());
				    pre.setString(4, driver.getnumd());
                    pre.setString(5, driver.getprice());
					pre.setString(6, driver.getamount());
					

					pre.execute();

					Object message = driver.getUsername() + " Registered";
					request.setAttribute("message", message);
					
					
					request.getRequestDispatcher("/driverbooking.jsp").forward(request,
							response);
				

			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			
			}
		
		}
	
	}

}
