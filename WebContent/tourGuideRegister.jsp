<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="form-styles.css">
<script type="text/javascript" src=""></script>

<title>Tour Guide</title>
</head>
	<%@include file="header.jsp"%>
<body>
	<div class="container" >
	
	<br><br><br><div class="form-style-5">
	
	<div class="form">
	
	<form action="" method="post" enctype="multipart/form-data">
	
	<h2><font color ="#E91370">Register As A Tour Guide</font></h2>
	
								<label>First Name</label>
                                <p><input type="text" class="form-control"  name="fname" placeholder="First Name" required   ></p>
                            
                            
                                <label> Last Name</label>
                               <p> <input type="text" class="form-control" name="lname" placeholder="Last Name" required  ></p>
                            
                                                                                   
                               <label>NIC</label>
                               <p> <input type="text" class="form-control"  name="nic" placeholder="123456789V"  required ></p>
                               
                           
                               <label>Email</label>
                               <p><input type="text" class="form-control"  name="email" placeholder="tour@gmail.com" required  ></p>
                           
                            
                           
                                <label>Contact Number</label>
                               <p> <input type="text" class="form-control"  name="phone" placeholder="011999999" required  ></p>
                               
                               <label>Languages </label>
                               <p> <input type="text" class="form-control"  name="language" placeholder="english" required  ></p>
                                               
                               <label>Category</label>
                               <p><input type="radio" name="part" id="part" value="national" />National Tourist Guide</input></p>
							   <p><input type="radio" name="part" id="part" value="chauffeur" />Chauffeur Tourist Guide</input></p><br/>
					
                                                              
                               <label>License Number</label>
                               <p> <input type="text" class="form-control"  name="license" placeholder="X1111111" required  ></p>
                               
                               
                               <label>Date Issued</label>
                               <p> <input type="text" class="form-control"  name="dI" placeholder="01/01/2019" required  ></p>
                               
                               
                               <label>Date Expired</label>
                               <p> <input type="text" class="form-control"  name="dE" placeholder="01/01/2019" required  ></p>
                               
                               <label>Upload Image</label>
                                <p><input id="vehicle" type="file" name="image" required ></p><br/>
                                
                                
                               <label>Service Availability Status</label>
                               <p><input type="radio"  name="part" id="part" value="a1" />Available</input></p>
							   <p><input type="radio" name="part" id="part" value="a2" />Not available</input></p><br/>
					
                                                                                              
                                
                               <label>User Name</label>
                               <p> <input type="text" class="form-control"  name="uname" placeholder="UserName" required  ></p>
                               
                                
                              
                               <label>Password</label>
                               <p><input type="text" class="form-control"  name="password" placeholder="Password" required  ></p>
                              
                                
                               
                                <label>Confirm Password</label>
                                <p><input type="text" class="form-control"  name="cPassword" placeholder="Re-Password" required  ></p>
                             
								<label>Do you agree with our <a href="terms.jsp"><u>Terms & Conditions</u></a>???</label>
                                <p><input type="radio" id="part"  name="terms"  required  ></p>
                             
	
	
	<input type="submit" value="Register" name="submitButton"
					id="sButton">		
	</form>
	</div>
	</div>
	</div>
	
	<%@include file="footer.jsp"%>
	
</body>
</html>