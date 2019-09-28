package Packages;

import javax.servlet.http.Part;

public class PackageBook {		
			private String username;
			private String pid;
		    private String pt; 
			private String price; 
			private String amount;
			
		public String getUsername() {
			// TODO Auto-generated method stub
			return username;
		}
		
		public void setUsername(String username){
			this.username=username;
		}
		
		public String getpid() {
			// TODO Auto-generated method stub
			return pid;
		}
		
		public void setpid(String pid){
			this.pid=pid;
		}

		

		public String getpt() {
			return pt;
		}

		public void setpt(String pt) {
			this.pt = pt;
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
			return "username = " + username + "\n" + "pid = " + pid +"\n" +"pt="+ pt +"\n" +"price = " + price  + "\n" + "amount= " + amount;
		}
		
		


}
