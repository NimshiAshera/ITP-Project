package model;

import java.sql.ResultSet;

import com.mysql.cj.protocol.Resultset;

import dao.DBConnection;
import dao.IValidation;

public class OwnerK implements IValidation{

	private String fusername;
	private String lusername;
	private String address;
	private String nic;
	private String gender;
	private String dateofbirth;
	private String email;
	private String phone;
	private String accountnum;
	private String amount;
	private String username;
	private String password;
	
	public String getFusername() {
		return fusername;
	}
	
	public void setFusername(String fusername) {
		this.fusername = fusername;
	}
	
	public String getLusername() {
		return lusername;
	}
	
	public void setLusername(String lusername) {
		this.lusername = lusername;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getNic() {
		return nic;
	}
	
	public void setNic(String nic) {
		this.nic = nic;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getDateofbirth() {
		return dateofbirth;
	}
	
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
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
	
	public String getAccountnum() {
		return accountnum;
	}
	
	public void setAccountnum(String accountnum) {
		this.accountnum = accountnum;
	}
	
	public String getAmount() {
		return amount;
	}
	
	public void setAmount(String amount) {
		this.amount = amount;
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
			Resultset mail = (Resultset) DBConnection.DBquery("select * from owner");
			
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
	public static OwnerK getOwnerK(String name) {
		// TODO Auto-generated method stub
		return null;
	}
		
	
}
