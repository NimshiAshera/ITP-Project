<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="formcss.css">





<title>Hotel</title>
</head>
	<%@include file="header.jsp"%>
	
	
	
	
<body>
  <div id="wrapper">
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					
					<div class="post">
					
					
					<br><br><br><div class="form-style-5">

	
	<div class="form">
	
	<form action="HotelReg" method="post">
	
	<h2><font color ="#E91370">Registration of Hotel/ Restaurant</font></h2>
	
	                          <label>Hotel Or Restaurant</label>
                              <p><input type="radio" name="part" id="part" value="Hotel" />Hotel</input></p>
							  <p><input type="radio" name="part" id="part" value="Restaurant" />Restaurant</input></p>
					
                            
	
		                      <label>Name</label>
                                <p><input type="text" class="form-control"  name="name" placeholder=" Name"  ></p>
                            
                            
                                <label> Price</label>
                               <p> <input type="text" class="form-control" name="price" placeholder="Price"  ></p>
                            
                            
                               <label>Contact_No  </label>
                              <p>  <input type="text" class="form-control"  name="contact_no" placeholder="Contact No"></p>
                            
                            
                               <label>Hotel ID</label>
                               <p> <input type="text" class="form-control"  name="hotel_id" placeholder="Hotel ID"></p>
                               
                    
                           
                            
                                <label>Address</label>
                                <p><input type="text" class="form-control"  name="address" placeholder="Address"></p>
                           
                            
                                <label>User Name</label>
                             <p>   <input type="text" class="form-control"  name="username" placeholder="User Name"></p>
                           
                            
                           
                                <label>Password</label>
                               <p> <input type="text" class="form-control"  name="password" placeholder="Password"></p>
                               
                                <label>Do you agree with our <a href="terms.jsp"><u>Terms & Conditions</u></a>???</label>
                                <p><input type="radio" id="part"  name="terms"  required  ></p>
		
	
	<input type="submit" value="Submit" name="submitButton"
					id="sButton">	
	</form>
	</div>
	</div>
	
	</div>
					</div>
					</div>
					</div>
					</div>
					</div>
<%@include file="footer.jsp"%>
</body>
	

</html>