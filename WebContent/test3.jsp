<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="ownerlog.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="top">
			<br><br><br><br> <br><center><font size="6"><font color="black">Before Update Your Hotel Details Please Enter Your User Name & Password</font></font></center>
		</div><br><br>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
			<form action="HotelCheck" method="post"  >
				<h2>Log In</h2>
			</div>
			<label for="username">Username</label>
			<br/>
			<input type="text"  placeholder="Username" name="username" required autofocus>
			<br/>
			<label for="password">Password</label>
			<br/>
			 <input type="text"  placeholder="Password" name="password" required>
			 
			  
			<br/>
			<span style="color:black"><%=(request.getAttribute("errmessage") == null) ? "" : request.getAttribute("errmessage")%></span>
			<br/>
			<button type="submit">Sign In</button>
			
		</div>
	</div>

</body>
</html>