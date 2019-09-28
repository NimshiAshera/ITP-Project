package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import java.util.UUID;
import java.sql.SQLException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.InputStream;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;


import dao.SpaDao;
import model.Spa;

/**
 * Servlet implementation class 
 * 
 */
@MultipartConfig
@WebServlet("/SpaRegis")
public class SpaRegis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaRegis() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.retrive all parameters from JSp page
		
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String facials = request.getParameter("facials");
		String waxing = request.getParameter("waxing");
		String body = request.getParameter("body");
		String massage = request.getParameter("massage");
		String tinting = request.getParameter("tinting");
		String address = request.getParameter("address");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		InputStream inputStream = null;
		
		Part filePart = request.getPart("avatar");
		
		inputStream = filePart.getInputStream();
		
		String member_avatar ="C:/Users/Asus/Desktop/TOUR NEW/tour/WebContent/hotel/" + id + ".png";
		
		String dbImageLocation =  "hotel/" + id + ".png";
		
		OutputStream output = new FileOutputStream(member_avatar);
		byte[] buffer = new byte[1024];
		while(inputStream.read(buffer) > 0){
			output.write(buffer);
		}
		
		//2. Set all the values in Model class, object
		
		Spa c = new Spa();
		
		
		c.setName(name);
		c.setId(id);
		c.setDbimagelocation(dbImageLocation);
		c.setFacials(facials);
		c.setWaxing(waxing);
		c.setBody(body);
		c.setMassage(massage);
		c.setTinting(tinting);
		c.setAddress(address);
		c.setUsername(username);
		c.setPassword(password);
		
		//3. call a method in Dao class to insert data in table
		String sql="insert into spa values(?,?,?,?,?,?,?,?,?,?,?)";
		int i = SpaDao.registerUser(c,sql);
		
		if(i!=0){
			System.out.println("value inserted");
			request.setAttribute("msg", "Registration Succesful.....");
			getServletContext().getRequestDispatcher("/ownerSignin.jsp").forward(request, response);
			
		}
		else{
			System.out.println("value not inserted");
		}
		
	}

}
