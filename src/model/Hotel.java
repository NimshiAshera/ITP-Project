package model;

import java.sql.ResultSet;

import com.mysql.cj.protocol.Resultset;

import dao.DBConnection;
import dao.IValidation;

public class Hotel implements IValidation{

	private String part;
	private String name;
	private String price;
	private String contact_no;
	private String hotel_id;
	private String address;
	private String username;
	private String password;
	

	
	
	
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	public String getHotel_id() {
		return hotel_id;
	}
	public void setHotel_id(String hotel_id) {
		this.hotel_id = hotel_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@SuppressWarnings("null")
	public boolean isEMailExist(String email) {
		
		try{
			Resultset mail = (Resultset) DBConnection.DBquery("select * from hotel2");
			
			//process results
			
			while(((ResultSet) mail).next()){
				if(email.equals(((ResultSet) mail).getString("email")))
					return true;
		}
			
		return false;
		
	}catch(Exception ex){
		ex.printStackTrace();
		return (Boolean) null;
}
		
	}
	public static Hotel getHotel(String name) {
		// TODO Auto-generated method stub
		return null;
	}
		
	
}
