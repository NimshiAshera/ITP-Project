package model;

import java.sql.ResultSet;



import com.mysql.cj.api.mysqla.result.Resultset;

import dao.DBConnection;
import dao.IValidation;

public class Spa implements IValidation{

	
	private String name;
	private String id;
	private String dbimagelocation;
	private String facials;
	private String waxing;
	private String body;
	private String massage;
	private String tinting;
	private String address;
	private String username;
	private String password;
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDbimagelocation() {
		return dbimagelocation;
	}
	public void setDbimagelocation(String dbimagelocation) {
		this.dbimagelocation = dbimagelocation;
	}
	public String getFacials() {
		return facials;
	}
	public void setFacials(String facials) {
		this.facials = facials;
	}
	public String getWaxing() {
		return waxing;
	}
	public void setWaxing(String waxing) {
		this.waxing = waxing;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getMassage() {
		return massage;
	}
	public void setMassage(String massage) {
		this.massage = massage;
	}
	public String getTinting() {
		return tinting;
	}
	public void setTinting(String tinting) {
		this.tinting = tinting;
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
			Resultset mail = (Resultset) DBConnection.DBquery("select * from spa");
			
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
