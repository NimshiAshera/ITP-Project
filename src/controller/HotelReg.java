package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.HotelDao;
import model.Hotel;

/**
 * Servlet implementation class DisplayOne
 */
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
		String price = request.getParameter("price");
		String contact_no = request.getParameter("contact_no");
		String hotel_id = request.getParameter("hotel_id");
		String address = request.getParameter("address");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//2. Set all the values in Model class, object
		
		Hotel c = new Hotel();
		
		c.setPart(part);
		c.setName(name);
		c.setPrice(price);
		c.setContact_no(contact_no);
		c.setHotel_id(hotel_id);
		c.setAddress(address);
		c.setUsername(username);
		c.setPassword(password);
		
		//3. call a method in Dao class to insert data in table
		String sql="insert into hotel2 values(?,?,?,?,?,?,?,?)";
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
