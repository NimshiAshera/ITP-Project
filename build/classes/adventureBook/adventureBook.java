package adventureBook;

import javax.servlet.http.Part;

public class adventureBook {		
			private String username;
			private String part;
			private String cname;
			private String date; 
			private String adul;
			private String chil;
			private String amount;
			
		public String getUsername() {
			// TODO Auto-generated method stub
			return username;
		}
		
		public void setUsername(String username){
			this.username=username;
		}
		
		public String getpart() {
			// TODO Auto-generated method stub
			return part;
		}
		
		public void setpart(String part){
			this.part=part;
		}

		public String getcname() {
			// TODO Auto-generated method stub
			return cname;
		}
		
		public void setcname(String cname){
			this.cname=cname;
		}

		public String getdate() {
			return date;
		}

		public void setdate(String date) {
			this.date = date;
		}
		
		public String getadul(){
			return adul;
		}
		
		public void setadul(String adul){
			this.adul=adul;
		}
		
		public String getchil(){
			return chil;
		}
		
		public void setchil(String chil){
			this.chil=chil;
		}
		
		public String getamount() {
			return amount;
		}
		
		public void setamount(String amount){
			this.amount=amount;
		}
		
		
		public String toString(){
			return "username = " + username + "\n" + "part = " + part  + "\n" +" cname=" + cname+ "\n" + "date=" + date + "\n" + "adul = " + adul  + "\n" + "chil = " + chil  + "\n" + "amount= " + amount;
		}
		
		


}
