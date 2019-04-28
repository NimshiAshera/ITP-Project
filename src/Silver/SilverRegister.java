package Silver;

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
 * Servlet implementation class SilverRegister
 */
@WebServlet("/SilverRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)


public class SilverRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SilverRegister() {
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
		
		
		Silver silver= new Silver();
		
		//HttpSession session = request.getSession();
		
		PrintWriter out= response.getWriter();
		
		silver.setPname(request.getParameter("pname"));
		silver.setPid(request.getParameter("pid"));
		silver.setPerson(request.getParameter("person"));
		silver.setView(request.getParameter("view"));
		silver.setBed(request.getParameter("bed"));
		silver.setD1(request.getParameter("d1"));
		silver.setD2(request.getParameter("d2"));
		silver.setD3(request.getParameter("d3"));

		//----------------------------------------
		
		out.write("Susccess " +request.getParameter("pname")+"\n");
		out.write("Susccess " +request.getParameter("pid")+"\n");
		out.write("Susccess " +request.getParameter("person")+"\n");
		out.write("Susccess " +request.getParameter("view")+"\n");
		out.write("Susccess " +request.getParameter("bed")+"\n");		
		out.write("Susccess " +request.getParameter("d1")+"\n");
		out.write("Susccess " +request.getParameter("d2")+"\n");
		out.write("Susccess " +request.getParameter("d3")+"\n");


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
				String sql = "select * from silver where pid = '"
						+ silver.getPid() + "'";
				ResultSet rs = st.executeQuery(sql);

				if (rs.next()) {
					Object message = "Package is already registered.";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/regsilver.jsp").forward(
							request, response);
			   
	           }


				else  {
					String sql2 = "insert into silver (pname,pid,person,view,bed,avatar,path,d1,d2,d3)"
							+ "values (?,?,?,?,?,?,?,?,?,?)";


					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, silver.getPname());
					pre.setString(2, silver.getPid());
					pre.setString(3, silver.getPerson());
					pre.setString(4, silver.getView());
					pre.setString(5, silver.getBed()); 
					
					if (ServletFileUpload.isMultipartContent(request)) {
						Part part = request.getPart("avatar");
						silver.setAvatar(silver.extractAvatar(part));
						silver.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\package\\"
								+ File.separator + silver.getAvatar());
						File fileSaveDir = new File(silver.getPath());
						part.write(silver.getPath() + File.separator);
					
					pre.setString(6, silver.getAvatar());
					pre.setString(7, silver.getPath());
					pre.setString(8, silver.getD1());
					pre.setString(9, silver.getD2());
					pre.setString(10, silver.getD3());



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
