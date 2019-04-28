package Gold;

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
 * Servlet implementation class GoldRegister
 */
@WebServlet("/GoldRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class GoldRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoldRegister() {
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
		
		
		Gold gold= new Gold();
		
		//HttpSession session = request.getSession();
		
		PrintWriter out= response.getWriter();
		
		gold.setPname(request.getParameter("pname"));
		gold.setPid(request.getParameter("pid"));
		gold.setPerson(request.getParameter("person"));
		gold.setView(request.getParameter("view"));
		gold.setBed(request.getParameter("bed"));
		gold.setD1(request.getParameter("d1"));
		gold.setD2(request.getParameter("d2"));
		gold.setD3(request.getParameter("d3"));
		gold.setD4(request.getParameter("d4"));
		gold.setD5(request.getParameter("d5"));

		
		//----------------------------------------
		
		out.write("Susccess " +request.getParameter("pname")+"\n");
		out.write("Susccess " +request.getParameter("pid")+"\n");
		out.write("Susccess " +request.getParameter("person")+"\n");
		out.write("Susccess " +request.getParameter("view")+"\n");
		out.write("Susccess " +request.getParameter("bed")+"\n");		
		out.write("Susccess " +request.getParameter("d1")+"\n");
		out.write("Susccess " +request.getParameter("d2")+"\n");
		out.write("Susccess " +request.getParameter("d3")+"\n");
		out.write("Susccess " +request.getParameter("d4")+"\n");
		out.write("Susccess " +request.getParameter("d5")+"\n");


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
				String sql = "select * from gold where pid = '"
						+ gold.getPid() + "'";
				ResultSet rs = st.executeQuery(sql);

				if (rs.next()) {
					Object message = "Package is already registered.";
					request.setAttribute("modelExist", message);
					request.getRequestDispatcher("/reggold.jsp").forward(
							request, response);
			   
	           }


				else  {
					String sql2 = "insert into gold (pname,pid,person,view,bed,avatar,path,d1,d2,d3,d4,d5)"
							+ "values (?,?,?,?,?,?,?,?,?,?,?,?)";


					PreparedStatement pre = conn.prepareStatement(sql2);

					pre.setString(1, gold.getPname());
					pre.setString(2, gold.getPid());
					pre.setString(3, gold.getPerson());
					pre.setString(4, gold.getView());
					pre.setString(5, gold.getBed()); 
					
					if (ServletFileUpload.isMultipartContent(request)) {
						Part part = request.getPart("avatar");
						gold.setAvatar(gold.extractAvatar(part));
						gold.setPath("C:\\Users\\Asus\\Desktop\\TOUR NEW\\tour\\WebContent\\package\\"
								+ File.separator + gold.getAvatar());
						File fileSaveDir = new File(gold.getPath());
						part.write(gold.getPath() + File.separator);
					
					pre.setString(6, gold.getAvatar());
					pre.setString(7, gold.getPath());
					pre.setString(8, gold.getD1());
					pre.setString(9, gold.getD2());
					pre.setString(10, gold.getD3());
					pre.setString(11, gold.getD4());
					pre.setString(12, gold.getD5());


					}
					
					pre.execute();

					
					request.getRequestDispatcher("/Home.jsp").forward(request,
							response);
				}

			} catch (Exception e) {
				System.out.println("Got an exception");
				System.out.println(e.getMessage());
				
			}
		}

		
		
	}

}
