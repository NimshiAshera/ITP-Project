<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="form-styles.css">
<script type="text/javascript" src=""></script>

<title>Vehicle</title>
</head>
	<%@include file="header.jsp"%>
<body>
	<div class="container" >
	
	<br><br><br><div class="form-style-5">
	
	<div class="form">
	
	<form action="" method="post" enctype="multipart/form-data">
	
	<h2><font color ="#E91370">Register Your Vehicle Step 01</font></h2>
	
								<label>First Name</label>
                                <p><input type="text" class="form-control"  name="fusername" placeholder="First Name" required   ></p>
                            
                            
                                <label> Last Name</label>
                               <p> <input type="text" class="form-control" name="lusername" placeholder="Last Name" required  ></p>
                            
                                                                                   
                               <label>NIC</label>
                               <p> <input type="text" class="form-control"  name="nic" placeholder="123456789V"  required ></p>
                               
                           
                               <label>Email</label>
                               <p><input type="text" class="form-control"  name="email" placeholder="tour@gmail.com" required  ></p>
                           
                            
                           
                                <label>Contact Number</label>
                               <p> <input type="text" class="form-control"  name="phone" placeholder="011999999" required  ></p>
                               
                                
                                
                                <label>User Name</label>
                               <p> <input type="text" class="form-control"  name="username" placeholder="UserName" required  ></p>
                               
                                
                              
                               <label>Password</label>
                               <p> <input type="text" class="form-control"  name="password" placeholder="Password" required  ></p>
                              
                                
                               
                                <label>Confirm Password</label>
                              <p>  <input type="text" class="form-control"  name="repassword" placeholder="Re-Password" required  ></p>
                             
	
	<input type="submit" value="Next" name="submitButton"
					id="sButton">		
	</form>
	</div>
	</div>
	</div>
	
	<%@include file="footer.jsp"%>
	
</body>
</html>