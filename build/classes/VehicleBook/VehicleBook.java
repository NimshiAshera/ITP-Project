package VehicleBook;

import javax.servlet.http.Part;

public class VehicleBook {		
			private String username;
			private String vname;
			private String type;
			private String date;
			private String numd; 
			private String price; 
			private String amount;
			
		public String getUsername() {
			// TODO Auto-generated method stub
			return username;
		}
		
		public void setUsername(String username){
			this.username=username;
		}
		
		public String getvname() {
			// TODO Auto-generated method stub
			return vname;
		}
		
		public void setvname(String vname){
			this.vname=vname;
		}

		public String gettype() {
			// TODO Auto-generated method stub
			return type;
		}
		
		public void settype(String type){
			this.type=type;
		}

		public String getdate() {
			return date;
		}

		public void setdate(String date) {
			this.date = date;
		}

		public String getnumd() {
			return numd;
		}

		public void setnumd(String numd) {
			this.numd = numd;
		}
		
		public String getprice(){
			return price;
		}
		
		public void setprice(String price){
			this.price=price;
		}
		
		public String getamount() {
			return amount;
		}
		
		public void setamount(String amount){
			this.amount=amount;
		}
		
		
		public String toString(){
			return "uname = " + username + "\n" + "vname = " + vname  +" type=" + type+ "\n"+ " date=" + date+ "\n"+ "numd="+ numd +"\n" +"price = " + price  + "\n" + "amount= " + amount;
		}
		
		


}
