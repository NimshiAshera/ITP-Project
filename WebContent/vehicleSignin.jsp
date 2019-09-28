<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="login-styles.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Vehicle Signin</title>
</head>


<body style=background-image:url("background/vehicle.jpg") >

<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">Vehicle Owner Login<span></span></span></h1>
		</div>
		
		<form action="loginCheck1" method="post"  >
		
		<div class="login-box animated fadeInUp">
			<div class="box-header">			
				
					<h2>Log In</h2>
			
			</div>
			
			<label for="username">Username</label>
			<br/>
			
			<input type="text"  placeholder="Username" name="username" required autofocus>
			<br/>
			
			<label for="password">Password</label>
			<br/>
			
			 <input type="password"  placeholder="Password" name="password" required>
			 <br/>
			 
			 <span style="color:black"><%=(request.getAttribute("errmessage") == null) ? "" : request.getAttribute("errmessage")%></span>
			 <br/>
			
			 <button type="submit">Sign In</button>
				
		</div>
	</form>
</div>
</body>
</html>