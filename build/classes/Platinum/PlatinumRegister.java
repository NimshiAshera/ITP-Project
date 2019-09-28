package Platinum;

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
 * Servlet implementation class PlatinumRegister
 */
@WebServlet("/PlatinumRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class PlatinumRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlatinumRegister() {
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
		
		
		Platinum platinum= new Platinum();
		
		//HttpSession session = request.getSession();
		
		PrintWriter out= response.getWriter();
		
		platinum.setPname(request.getParameter("pname"));
		platinum.setPid(request.getParameter("pid"));
		platinum.setPerson(request.getParameter("person"));
		platinum.setBed(request.getParameter("bed"));
		platinum.setD1(request.getParameter("d1"));
		platinum.setD2(request.getParameter("d2"));
		platinum.setD3(request.getParameter("d3"));
		platinum.setD4(request.getParameter("d4"));
		platinum.setD5(request.getParameter("d5"));
		platinum.setD6(request.getParameter("d6"));
		platinum.setD7(request.getParameter("d7"));
		
		//----------------------------------------
		
		out.write("Susccess " +request.getParameter("pname")+"\n");
		out.write("Susccess " +request.getParameter("pid")+"\n");
		out.write("Susccess " +request.getParameter("person")+"\n");
		out.write("Susccess " +request.getParameter("bed")+"\n");		
		out.write("Susccess " +request.getParameter("d1")+"\n");
		out.write("Susccess " +request.getParameter("d2")+"\n");
		out.write("Susccess " +request.getParameter("d3")+"\n");
		out.write("Susccess " +request.getParameter("d4")+"\n");
		out.write("Susccess " +request.getParameter("d5")+"\n");
		out.write("Susccess " +request.getParameter("d6")+"\n");
		out.write("Susccess " +request.getParameter("d7")+"\n");

		//-----------------------------------------
		
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
				String sql = "select * from platinum where pid = '"
						+ platinum.getPid() + "'";
				ResultSet rs = st.executeQuery(sql);

				if (rs.next()) {
					Object message = "Package is already registered.";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/regplatinum.jsp").forward(
							request, response);
			   
	           }


				else  {
					String sql2 = "insert into platinum (pname,pid,person,bed,avatar,path,d1,d2,d3,d4,d5,d6,d7)"
							+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";


					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, platinum.getPname());
					pre.setString(2, platinum.getPid());
					pre.setString(3, platinum.getPerson());
					pre.setString(4, platinum.getBed()); 
					
					if (ServletFileUpload.isMultipartContent(request)) {
						Part part = request.getPart("avatar");
						platinum.setAvatar(platinum.extractAvatar(part));
						platinum.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\package\\"
								+ File.separator + platinum.getAvatar());
						File fileSaveDir = new File(platinum.getPath());
						part.write(platinum.getPath() + File.separator);
					
					pre.setString(5, platinum.getAvatar());
					pre.setString(6, platinum.getPath());
					pre.setString(7, platinum.getD1());
					pre.setString(8, platinum.getD2());
					pre.setString(9, platinum.getD3());
					pre.setString(10, platinum.getD4());
					pre.setString(11, platinum.getD5());
					pre.setString(12, platinum.getD6());
					pre.setString(13, platinum.getD7());


					}
					
					pre.execute();

					
					request.getRequestDispatcher("/dashBOwner.jsp").forward(request,
							response);
				}

			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
				
			}
		}

		
		
	}

}
