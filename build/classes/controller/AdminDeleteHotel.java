package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBConnection;
import model.Hotel;

/**
 * Servlet implementation class AdminDelete
 */
@WebServlet("/AdminDeleteHotel")
public class AdminDeleteHotel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteHotel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter write = response.getWriter();
		
		Hotel c = new Hotel();
		
		c.setUsername(request.getParameter("username"));
		DBConnection db = new DBConnection();
		Connection conn = db.createConnection();
		
		if(conn == null)
			write.write("Connection Not Established");
		
		else{
			write.write("Connection Established"+c.getUsername());
			
			String sql2 = "delete from hotel10 where UserName='"+c.getUsername()+"'";
			try{
				Statement st = conn.createStatement();
				st.executeUpdate(sql2);
				
				RequestDispatcher rd = request.getRequestDispatcher("/AdminDashBoard.jsp");
				rd.forward(request, response);
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
