package TourguideBook;

import javax.servlet.http.Part;

public class TourguideBook {		
			private String username;
			private String gname;
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
		
		public String getgname() {
			// TODO Auto-generated method stub
			return gname;
		}
		
		public void setgname(String gname){
			this.gname=gname;
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
			return "username = " + username + "\n" + "gname = " + gname + "\n" + "date = " + date + "\n" + "numd="+ numd +"\n" +"price = " + price  + "\n" + "amount= " + amount;
		}
		
		


}
