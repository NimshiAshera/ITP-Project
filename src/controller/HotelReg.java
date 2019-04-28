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


import dao.HotelDao;
import model.Hotel;

/**
 * Servlet implementation class 
 * 
 */
@MultipartConfig
@WebServlet("/HotelReg")


public class HotelReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelReg() {
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
		String hotel_id = request.getParameter("hotel_id");
		String facilities = request.getParameter("facilities");
		String activities = request.getParameter("activities");
		String food = request.getParameter("food");
		String re_services = request.getParameter("re_services");
		String cleaning_services = request.getParameter("cleaning_services");
		String pool = request.getParameter("pool");
		String rooms = request.getParameter("rooms");
		String address = request.getParameter("address");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		InputStream inputStream = null;
		
		Part filePart = request.getPart("avatar");
		
		inputStream = filePart.getInputStream();
		
		String member_avatar ="C://Users//Asus//Desktop//TOUR NEW//tour//WebContent//hotel//" + hotel_id + ".png";
		
		String dbImageLocation =  "hotel/" + hotel_id + ".png";
		
		OutputStream output = new FileOutputStream(member_avatar);
		byte[] buffer = new byte[1024];
		while(inputStream.read(buffer) > 0){
			output.write(buffer);
		}
		
		//2. Set all the values in Model class, object
		
		Hotel c = new Hotel();
		
		c.setPart(part);
		c.setName(name);
		c.setHotel_id(hotel_id);
		c.setDbimagelocation(dbImageLocation);
		c.setFacilities(facilities);
		c.setActivities(activities);
		c.setFood(food);
		c.setRe_services(re_services);
		c.setCleaning_services(cleaning_services);
		c.setPool(pool);
		c.setRooms(rooms);
		c.setAddress(address);
		c.setUsername(username);
		c.setPassword(password);
		
		//3. call a method in Dao class to insert data in table
		String sql="insert into hotel10 values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int i = HotelDao.registerUser(c,sql);
		
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
