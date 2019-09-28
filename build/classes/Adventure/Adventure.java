package Adventure;

import java.sql.ResultSet;

import javax.servlet.http.Part;

import com.mysql.cj.protocol.Resultset;

import dao.DBConnection;

public class Adventure {
	private String part;
	private String name;
	private String contact_no;
	private String avatar;
	private String path;
	private String details;
	private String season;
	private String see;
	private String time;
	private String avb;
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
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getSee() {
		return see;
	}
	public void setSee(String see) {
		this.see = see;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAvb() {
		return avb;
	}
	public void setAvb(String avb) {
		this.avb = avb;
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
	
	
	public String toString(){
		return "Part " + part+ "\n" + "Name " + name + "\n" + "Phone " + contact_no  + "\n" + "Image " + avatar +"\n"+ "Path " + path + "\n"+ "Details "+  details + "\n" 
				+ "Season"+ season + "\n" + "See" + see + "\n" + "Time" + time + "\n" + "Available"+ avb + "\n" + "Username" +username+"\n"+ "Password" + password + "\n" ;
		
	}

	public String extractAvatar(Part part) {
		
		String contentDisp=part.getHeader("content-disposition");
		String[] items=contentDisp.split(";");
		for(String s:items){
			if(s.trim().startsWith("filename")){
				return s.substring(s.indexOf("=") + 2,s.length() -1);
			}
		}
		return "";
	}
		
	
	
	
}
