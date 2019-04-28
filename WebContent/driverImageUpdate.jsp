<%@page import="Driver.Driver"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>


<title>Driver Image Update</title>

</head>

<body style="background:url(images/img01.gif) repeat;">

<div class="container" >
	
<!-- Navbar -->

	<%
		if (session.getAttribute("username") == null) {
	%>
		<jsp:include page="Header-Before.jsp"></jsp:include>
	<%
		} else {
	%>
		<jsp:include page="Header.jsp"></jsp:include>
	<%
		}
	%>
	
	<br><br><br><br><br><br>

<h1 style="text-align: center; font-size: 50px; color: green">Update Driver Image</h1>
		<br> <br><br> <br>
		<%
			Driver driver=(Driver)request.getAttribute("driver");
		%>
	
		<div class="form-style-5">
			<div class="form">
				<form action="UpdateDriverImage" method="post" enctype="multipart/form-data">
										
						<lable>User Name</lable>
						<p><input id="input" type="text"
							value="<%=driver.getUsername() %>" name="username" disabled="disabled"></p>
						
					 
 						<lable>Upload Image</lable> 
 						<p><input id="input" type="file" name="avatar" required></p> 
 					

				       <br/> <input type="submit" value="Update Image" name="submitButton" id="sButton">
				</form>
			</div>
		</div>

		<h1 style="font-size: 40px; color: red;">${insertUnsuccess}</h1>
		
		<br> <br><br> <br><br> <br><br> <br>
		
		<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->

	</div>
</body>
</html>