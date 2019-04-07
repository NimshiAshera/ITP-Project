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


import dao.AdDao;
import model.Adventure;

/**
 * Servlet implementation class 
 * 
 */
@MultipartConfig
@WebServlet("/AdventureServelet")


public class AdventureServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdventureServelet() {
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
		
		String part = request.getParameter("part");
		String name = request.getParameter("name");
		String company_id = request.getParameter("company_id");
		String contact_no = request.getParameter("contact_no");
		String address = request.getParameter("address");
		String Details = request.getParameter("Details");
		String price = request.getParameter("price");
		String avb = request.getParameter("avb");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		InputStream inputStream = null;
		
		Part filePart = request.getPart("avatar");
		
		inputStream = filePart.getInputStream();
		
		String member_avatar ="C:/Users/Asus/Desktop/workspace3/new/WebContent/Adventure/" + company_id + ".png";
		
		String dbImageLocation =  "Adventure/" + company_id + ".png";
		
		OutputStream output = new FileOutputStream(member_avatar);
		byte[] buffer = new byte[1024];
		while(inputStream.read(buffer) > 0){
			output.write(buffer);
		}
		
		//2. Set all the values in Model class, object
		
		Adventure c = new Adventure();
		
		c.setPart(part);
		c.setName(name);
		c.setCompany_id(company_id);
		c.setDbimagelocation(dbImageLocation);
		c.setContact_no(contact_no);
		c.setAddress(address);
		c.setDetails(Details);
		c.setPrice(price);
		c.setAvb(avb);
		c.setUsername(username);
		c.setPassword(password);
		
		//3. call a method in Dao class to insert data in table
		String sql="insert into adcom values(?,?,?,?,?,?,?,?,?,?,?)";
		int i = AdDao.registerUser(c,sql);
		
		if(i!=0){
			System.out.println("value inserted");
			request.setAttribute("msg", "Registration Succesful.....");
			getServletContext().getRequestDispatcher("/AdventureLogin.jsp").forward(request, response);
			
		}
		else{
			System.out.println("value not inserted");
		}
		
	}

}
