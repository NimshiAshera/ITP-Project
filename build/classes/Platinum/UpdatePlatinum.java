package Platinum;

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

/**
 * Servlet implementation class UpdatePlatinum
 */
@WebServlet("/UpdatePlatinum")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class UpdatePlatinum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePlatinum() {
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
		
		Platinum platinum = new Platinum();
		
		String d1=request.getParameter("d1");
		String d2=request.getParameter("d2");
		String d3=request.getParameter("d3");
		String d4=request.getParameter("d4");
		String d5=request.getParameter("d5");
		String d6=request.getParameter("d6");
		String d7=request.getParameter("d7");

		
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
				if(session.getAttribute("pid")!= null){
					String pid = (String) session.getAttribute("pid");
				}
				else{
					response.sendRedirect("dashBOwner.jsp");
				}
			}
			
			try{
				String pid = (String) session.getAttribute("pid");
				String sql2 = "update platinum set   d1=? , d2=? , d3=? , d4=? , d5=? , d6=? , d7=? "
						+ "where pid = '"+pid+"'";
		
				PreparedStatement pre = conn.prepareStatement(sql2);
				
			
				pre.setString(1, d1);
				pre.setString(2, d2);
				pre.setString(3, d3);
				pre.setString(4, d4);
				pre.setString(5, d5);
				pre.setString(6, d6);
				pre.setString(7, d7);

				
				pre.execute();
				
				Object message = "Successfully updated";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/dashBOwner.jsp").forward(request, response);
				
			}
			catch(Exception e){
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
			}
				
	}


		
	}

}
