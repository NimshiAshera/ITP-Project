package Gold;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Driver.DBManager;

/**
 * Servlet implementation class UpdateGold
 */
@WebServlet("/UpdateGold")
public class UpdateGold extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateGold() {
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
		
		Gold gold = new Gold();
		
		String pname=request.getParameter("pname");
		String person=request.getParameter("person");
		String view=request.getParameter("view");
		String bed=request.getParameter("bed");
		String d1=request.getParameter("d1");
		String d2=request.getParameter("d2");
		String d3=request.getParameter("d3");
		String d4=request.getParameter("d4");
		String d5=request.getParameter("d5");


		
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
				String sql2 = "update gold set  pname=? ,person=? , view=? , bed=? , d1=? , d2=? , d3=? , d4=? , d5=? "
						+ "where pid = '"+pid+"'";
		
				PreparedStatement pre = conn.prepareStatement(sql2);
				
				pre.setString(1, pname);
				pre.setString(2, person);
				pre.setString(3, view);
				pre.setString(4, bed);
				pre.setString(5, d1);
				pre.setString(6, d2);
				pre.setString(7, d3);
				pre.setString(8, d4);
				pre.setString(9, d5);


				
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
