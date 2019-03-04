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
	<div class="container">
	
	<br><br><br><div class="form-style-5">
	
	<div class="form">
	
	<form action="" method="post" enctype="multipart/form-data">
	
	<h2><font color ="#E91370">Register Your Vehicle Step 02</font></h2>

								<label>Vehicle Type</label>
                                <p><input type="text" class="form-control"  name="vType" placeholder="Car/Van/Bus" required  ></p>
                            
                            
                                <label>Model</label>
                               <p> <input type="text" class="form-control" name="vModel" placeholder="BMW" required  ></p>
                            
                                                                                   
                               <label>Register No</label>
                               <p> <input type="text" class="form-control"  name="noPlate" placeholder="1234Xx" required ></p>
                               
                           
                               <label>Hire per Kilometer</label>
                               <p><input type="text" class="form-control"  min="0" name="hire" placeholder="500.00" required ></p>
                           
                            
                           
                                <label>Upload Image</label>
                                <p><input id="vehicle" type="file" name="image" required ></p><br/>
                               
                                <label>Service Availability Status</label>
                               <p><input type="radio"  name="part" id="part" value="a1" />Available</input></p>
							   <p><input type="radio" name="part" id="part" value="a2" />Not available</input></p><br/>
                                
                                <label>Facilities</label>
                                <p><textarea id="vehicle" type="text" placeholder="Features" name="features" ></textarea></p>                                                                                                                        
	
								<label>Do you agree with our <a href="terms.jsp"><u>Terms & Conditions</u></a>???</label>
                                <p><input type="radio" id="part"  name="terms"  required  ></p>
				
	<input type="submit" value="Register" name="submitButton" id="sButton">	
	
	</form>
	</div>
	</div>
	</div>
	
	<%@include file="footer.jsp"%>
	
</body>
</html>