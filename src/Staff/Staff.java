package Staff;

import javax.servlet.http.Part;

public class Staff {

	private String role;
	private String fname;
	private String lname;
	private String nic;
	private String phoneno;
	private String email;
	private String username;
	private String password;
	private String cPassword;
	
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
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
	
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
		return "Fname " + fname+ "\n" + "Lname " + lname + "\n" +" Nic" + nic+ "\n"+ "Phone " + phoneno +"\n"+ "Email " + email + "\n"
				+ "Username" +username+"\n"+ "Password" + password + "\n" + "Confirm Password" + cPassword;
		
	}


	
	
}
