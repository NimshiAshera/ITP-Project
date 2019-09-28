package TourGuide;

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
import TourGuide.TourGuide;

/**
 * Servlet implementation class UpdateTourGuide
 */
@WebServlet("/UpdateTourGuide")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class UpdateTourGuide extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTourGuide() {
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
		
		TourGuide guide = new TourGuide();

		String email = request.getParameter("email");
		String phone =request.getParameter("phone");
		String language= request.getParameter("language");
		String part = request.getParameter("part");
		String dI = request.getParameter("dI");
		String dE =request.getParameter("dE");
		String part1 = request.getParameter("part1");


		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();

		if (conn == null) {
			out.write("Connection Not Established");
		} else {
			HttpSession session = request.getSession();
			if(session != null){
				if(session.getAttribute("username")!= null){
					String username = (String) session.getAttribute("username");
					//String password = (String)session.getAttribute("password");
				}
				else{
					response.sendRedirect("tourGuideSignin.jsp");
				}
			}
			try{
				String username = (String) session.getAttribute("username");
				String sql2 = "update guide set email=? , phone=? , language=? , part=? , dI=? , dE=? , part1=? "
						+ " where username = '"+ username +"'";
		
				PreparedStatement pre = conn.prepareStatement(sql2);
				
				
				pre.setString(1, email);
				pre.setString(2, phone);
				pre.setString(3, language);
				pre.setString(4, part);
				pre.setString(5, dI);
				pre.setString(6, dE);
				pre.setString(7, part1);
			
				
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
