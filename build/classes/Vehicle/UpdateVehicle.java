package Vehicle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Driver.DBManager;
import Vehicle.Vehicle;

/**
 * Servlet implementation class UpdateVehicle
 */
@WebServlet("/UpdateVehicle")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class UpdateVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVehicle() {
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

		String phone=request.getParameter("phone");
		String type=request.getParameter("type");
		String status=request.getParameter("status");
		String noPlate=request.getParameter("noPlate");
		String part=request.getParameter("part");
		String features=request.getParameter("features");
		
		response.setContentType("text/html");
		PrintWriter write =response.getWriter();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		if(conn==null){
			write.write("Connection Not Established");
		}
		else{
			HttpSession session = request.getSession();
			if(session != null){
				if(session.getAttribute("username")!= null){
					String username = (String) session.getAttribute("username");
					//String password = (String)session.getAttribute("password");
				}
				else{
					response.sendRedirect("vehicleSignin.jsp");
				}
			}
			try{
				String username = (String) session.getAttribute("username");
				String sql2 = "update vehicle set  phone=?, type=?, status=?, noPlate=?, part=?, features=? "
						+ " where username = '"+ username +"'";
		
				PreparedStatement pre = conn.prepareStatement(sql2);
				
				pre.setString(1, phone);
				pre.setString(2, type);
				pre.setString(3, status);
				pre.setString(4, noPlate);
				pre.setString(5, part);
				pre.setString(6, features);
				
				pre.execute();
				
				Object message = "Successfully updated";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/Home.jsp").forward(request, response);
				request.getRequestDispatcher("/Header.jsp").forward(request,
						response);
				
			}
			catch(Exception e){
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
		}	
		
	}

}
