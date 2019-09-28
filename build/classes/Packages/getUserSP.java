package Packages;

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
@WebServlet("/getUserSP")
public class getUserSP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getUserSP() {
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
		
		PackageBook pack=new PackageBook();
		
		HttpSession session=request.getSession();  
		pack.setUsername((String)session.getAttribute("username"));
		
		DBManager db = new DBManager();
		Connection conn = db.getConnection();
		
		try{
			
			Statement st = conn.createStatement();
			String sql = "select pid,pt,price,amount from packagebook where username = '"+pack.getUsername()+"'";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				
				pack.setpid(rs.getString(1));
				 
				pack.setpt(rs.getString(2));
				pack.setprice(rs.getString(3));
				pack.setamount(rs.getString(4));
				
				
			}
			
			request.setAttribute("pack", pack);
			request.getRequestDispatcher("/getUserForUpdateP.jsp").forward(request,response);
		}
		catch(Exception p){
			System.out.println(p);
		}
		
		
	}

}
