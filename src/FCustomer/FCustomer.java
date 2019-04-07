package FCustomer;

import javax.servlet.http.Part;

public class FCustomer {
	
	private String fname;
	private String lname;
	private String pass;
	private String avatar;
	private String path;
	private String phone;
	private String gender;
	private String email;
	private String uname;
	private String password;
	private String cPassword;
	
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getcPassword() {
		return cPassword;
	}
	public void setcPassword(String cPassword) {
		this.cPassword = cPassword;
	}
	
	
	public String toString(){
		return "Fname " + fname+ "\n" + "Lname " + lname + "\n" +" Passport" + pass+ "\n"+"Image"+ avatar +"\n" +"Path " + path  + "\n" + "Phone " + phone +"\n"+ "Gender " + gender + "\n" +"Email " + email + "\n"
				 + "Username" +uname+"\n"+ "Password" + password + "\n" + "Confirm Password" + cPassword;
		
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
