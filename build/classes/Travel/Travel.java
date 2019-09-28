package Travel;

import javax.servlet.http.Part;

public class Travel {
	
	
	private String name;
	private String details;
	private String avatar;
	private String path;

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
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
	

	public String toString(){
		return "Name " + name+ "\n" + "Details " + details + "\n" + "Image " + avatar +"\n"+ "Path " + path ;
		
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
