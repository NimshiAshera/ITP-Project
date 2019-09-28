<%@page import="Adventure.Adventure" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>
<head>

<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>


<meta charset="ISO-8859-1">
<title>Adventure Company</title>

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
	
	<br><br><br>

<h1 style="text-align: center; font-size: 50px; color: green">Update Profile</h1>
		<br> <br>
		<%
			Adventure adventure=(Adventure)request.getAttribute("adventure");
		%>
	
		<div class="form-style-5">
			<div class="form">
				<form action="UpdateAdventure" method="post" enctype="multipart/form-data">
																

						<lable>User Name</lable>
						<p><input id="input" type="text"
							value="<%=adventure.getUsername() %>" name="username" disabled="disabled"></p>
						
					 
 						<lable>Update Availability Status</lable> 
 						<p><input type="radio"  name="avb" id="avb" value="Available" />Available</input></p>
						<p><input type="radio" name="avb" id="avb" value="Not available" />Not available</input></p><br/>
                                  	

				       <br/> <input type="submit" value="Update" name="submitButton" id="sButton">
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