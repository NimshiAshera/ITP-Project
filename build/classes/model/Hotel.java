package model;

import java.sql.ResultSet;



import com.mysql.cj.api.mysqla.result.Resultset;

import dao.DBConnection;
import dao.IValidation;

public class Hotel implements IValidation{

	private String part;
	private String name;
	private String hotel_id;
	private String dbimagelocation;
	private String facilities;
	private String activities;
	private String food;
	private String re_services;
	private String cleaning_services;
	private String pool;
	private String rooms;
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
	public String getHotel_id() {
		return hotel_id;
	}
	public void setHotel_id(String hotel_id) {
		this.hotel_id = hotel_id;
	}
	public String getDbimagelocation() {
		return dbimagelocation;
	}
	public void setDbimagelocation(String dbimagelocation) {
		this.dbimagelocation = dbimagelocation;
	}
	public String getFacilities() {
		return facilities;
	}
	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}
	public String getActivities() {
		return activities;
	}
	public void setActivities(String activities) {
		this.activities = activities;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getRe_services() {
		return re_services;
	}
	public void setRe_services(String re_services) {
		this.re_services = re_services;
	}
	public String getCleaning_services() {
		return cleaning_services;
	}
	public void setCleaning_services(String cleaning_services) {
		this.cleaning_services = cleaning_services;
	}
	public String getPool() {
		return pool;
	}
	public void setPool(String pool) {
		this.pool = pool;
	}
	public String getRooms() {
		return rooms;
	}
	public void setRooms(String rooms) {
		this.rooms = rooms;
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
			Resultset mail = (Resultset) DBConnection.DBquery("select * from hotel10");
			
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
