package TourguideBook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Driver.DBManager;

/**
 * Servlet implementation class getUserServlet
 */
@WebServlet("/getUserST")
public class getUserST extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getUserST() {
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
		PrintWriter out = response.getWriter();
		
		TourguideBook tour=new TourguideBook();
		
		HttpSession session=request.getSession();  
		tour.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select gname,date,numd,price,amount from tourguidebook where username = '"+tour.getUsername()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				tour.setgname(rs.getString(1));
				tour.setdate(rs.getString(2)); 
				tour.setnumd(rs.getString(3));
				tour.setprice(rs.getString(4));
				tour.setamount(rs.getString(5));
				
				
			}
			
			request.setAttribute("tour", tour);
			request.getRequestDispatcher("/getUserForUpdateT.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
		
		
	}

}
