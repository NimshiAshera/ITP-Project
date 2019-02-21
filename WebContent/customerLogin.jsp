<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="log.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">Login<span></span></span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
			<form action="" method="post"  >
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
			<br/>
			<a href="#"><p class="small">Login As A Driver</p></a>
			<p class="small">Login As A Owner</p><br>
			
			
			<a href="">Spa..</a><br/>
			
			<a href="ownerSignin.jsp">Hotel</a>
			
			</div>
		</div>
	</div>

</body>
</html>