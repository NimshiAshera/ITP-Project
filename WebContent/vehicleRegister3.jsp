<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="vehicleRegister1.css">
<script type="text/javascript" src=""></script>

<title>Vehicle</title>
</head>
		<%@include file="header.jsp"%>
<body>
	<div class="container">
	
	<div class="form">
	
	<form action="" method="post" enctype="multipart/form-data">
	
	<h2>Register Your Vehicle Step 03</h2>
	
	<div class="tab"> User Account Details :
	
		<p><input id="vehicle" type="text" placeholder="User Name" name="uname" required oninput="this.className = ''"></p>
		<p><input id="vehicle" type="password" placeholder="Password" name="password" required oninput="this.className = ''"></p>
		<p><input id="vehicle" type="password" placeholder="Confirm Password" name="cPassword" required oninput="this.className = ''"></p>
		</div>

<input type="submit" value="Register" name="submitButton" id="sButton">	
	
	</form>
	</div>
	</div>
</body>
	<%@include file="footer.jsp"%>

</html>