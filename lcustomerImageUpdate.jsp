<%@page import="LCustomer.LCustomer"%>
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


<title>Update</title>

</head>

<body>

<div class="container" >
	
	<!-- Navbar -->

<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">ABOUT SRILANKA</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">MAP</a>
    <a href="Gallery_01.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">GALLERY</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">THINGS TO DO <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">HOTEL & RESORT</a>
        <a href="#" class="w3-bar-item w3-button">SPA</a>
        <a href="#" class="w3-bar-item w3-button">ADVENTURS</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">HIRE FOR YOU <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">VEHICLE</a>
        <a href="#" class="w3-bar-item w3-button">TOUR GUIDE</a>
        <a href="#" class="w3-bar-item w3-button">DRIVERS</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">BOOK & REQUEST <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">TOUR PACKAGES</a>
        <a href="#" class="w3-bar-item w3-button">EVENT</a>
      </div>
    </div>
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG OUT</a>
    <a href="customerLogin.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG IN</a>   
    <a href="customerRegister.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">SIGN IN</a>
    
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  </div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">ABOUT SRILANKA</a>
  <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MAP</a>
  <a href="Contacts.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">CONTACT</a>
  <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MERCH</a>
</div>
	
	
	<br><br><br><br><br><br>

<h1 style="text-align: center; font-size: 50px; color: green">Update Customer Image</h1>
		<br> <br><br> <br>
		<%
			LCustomer lcustomer=(LCustomer)request.getAttribute("lcustomer");
		%>
	
		<div class="form-style-5">
			<div class="form">
				<form action="UpdateLCustomerImage" method="post" enctype="multipart/form-data">
										
						<lable>User Name</lable>
						<p><input id="input" type="text"
							value="<%=lcustomer.getUname() %>" name="uname" disabled="disabled"></p>
						
					 
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