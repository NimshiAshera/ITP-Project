package Driver;

import javax.servlet.http.Part;

public class Driver {

	private String fname;
	private String lname;
	private String nic;
	private String email;
	private String phone;
	private String avatar;
	private String path;
	private String license;
	private String dI;
	private String dE;	
	private String part;
	private String terms;
	private String username;
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

	
	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	
	public String getdI() {
		return dI;
	}

	public void setdI(String dI) {
		this.dI = dI;
	}

	
	public String getdE() {
		return dE;
	}

	public void setdE(String dE) {
		this.dE = dE;
	}

	
	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}
	
	public String getTerms() {
		return terms;
	}

	public void setTerms(String terms) {
		this.terms = terms;
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

	
	
	public String getcPassword() {
		return cPassword;
	}

	public void setcPassword(String cPassword) {
		this.cPassword = cPassword;
	}

	
	public String toString(){
		return "Fname " + fname+ "\n" + "Lname " + lname + "\n" +" Nic" + nic+ "\n"+"Email"+ email +"\n" +"Phone " + phone  + "\n" + "Image " + avatar +"\n"+ "Path " + path + "\n" +"License " + license +"\n" + "Date Issued " + dI + "\n" + "Date Expired = " +dE + "\n"
				+ "Available"+ part + "\n" + "Username" +username+"\n"+ "Password" + password + "\n" + "Confirm Password" + cPassword;
		
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
