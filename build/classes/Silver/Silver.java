package Silver;

import javax.servlet.http.Part;

public class Silver {


	private String pname;
	private String pid;
	private String person;
	private String bed;
	private String avatar;
	private String path;
	private String d1;
	private String d2;
	private String d3;


	
	
	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	
	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}


	public String getBed() {
		return bed;
	}

	public void setBed(String bed) {
		this.bed = bed;
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
	
	public String getD1() {
		return d1;
	}

	public void setD1(String d1) {
		this.d1 = d1;
	}

	public String getD2() {
		return d2;
	}

	public void setD2(String d2) {
		this.d2 = d2;
	}
	public String getD3() {
		return d3;
	}

	public void setD3(String d3) {
		this.d3 = d3;
	}


	
	public String toString(){
		return "Pname " + pname+ "\n" + "Pid " + pid + "\n" +" Person" + person+ "\n" +"Bed " + bed  + "\n" + "Pic " + avatar +"\n" + "Path " + path +"\n"+ "D1 " + d1 + "\n" +"D2 " + d2 +"\n" + "D3" + d3;
		
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
