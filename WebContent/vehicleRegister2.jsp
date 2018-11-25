<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="vehicleRegister123.css">
<script type="text/javascript" src=""></script>

<title>Vehicle</title>
</head>

<body style="background:url(background-images/b2.jpg)">
	<div class="container">
	
	<div class="form">
	
	<form action="" method="post" enctype="multipart/form-data">
	
	<h2>Register Your Vehicle Step 02</h2>

		<div class="tab">Vehicle Details :
	
		<p><input id="vehicle" type="text" placeholder="Vehicle Type" name="type" required ></p>	
		<p><input id="vehicle" type="text" placeholder="Vehicle Model" name="model" required ></p>
		<p><input id="vehicle" type="text" placeholder="No. Plate" name="number" required ></p>
		<p><input id="vehicle" type="number" min="0" placeholder="Hire per kilometer" name="hire" required ></p>
		<p>Upload Image :<input id="vehicle" type="file" name="image" required ></p>
		<p><textarea id="vehicle" type="text" placeholder="Features" name="features" ></textarea></p>
		</div>
				
	<input type="submit" value="Next" name="submitButton" id="sButton">	
	
	</form>
	</div>
	</div>
</body>
	<%@include file="footer.jsp"%>

</html>