<%@page import="TourGuide.TourGuide"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<title>Tour Guide Profile</title>
</head>

<body style="background-color:white">

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
	
	
	<br><br><br>


	<div class="form-style-5">
		<div class="form">
		
				<table border="1" cellpadding="12">
					<%
						TourGuide guide = (TourGuide) request.getAttribute("guide");
					%>
				
					
					<h2 align="center" style="color:green"><b>Details of <%=guide.getFname()%> <%=guide.getLname()%></b></h2>
				
				
				
					<label style="font-size:20px">First Name : <%=guide.getFname()%></label>
					<label style="font-size:20px">Last Name : <%=guide.getLname()%></label>
					<label style="font-size:20px">NIC : <%=guide.getNic()%></label>
					<label style="font-size:20px">Image : <img src="tourguide/<%=guide.getAvatar() %>"  width="150" height="200">
												
												
												<form method="post" action="TourGuideImage">
												<br/>
													<input type="hidden" name="username" value="<%=session.getAttribute("username")%>" /> 
													<input type="submit" value="Edit Image" class="select-button" />
												</form>
										 </label>
					
					
					
					<label style="font-size:20px">Email : <%=guide.getEmail()%> </label>
					<label style="font-size:20px">Contact No. : <%=guide.getPhone()%> </label>
					<label style="font-size:20px">Languages : <%=guide.getLanguage()%> </label> 
					<label style="font-size:20px">Category : <%=guide.getPart()%> </label> 
					<label style="font-size:20px">License No. : <%=guide.getLicense()%> </label> 
					<label style="font-size:20px">Date Issued : <%=guide.getdI()%> </label> 
					<label style="font-size:20px">Date Expired :<%=guide.getdE()%>  </label> 
					<label style="font-size:20px">Availability Status : <%=guide.getPart1()%>  </label> 
					<label style="font-size:20px">Agree terms and Conditions : <%=guide.getTerms()%> </label> 
					<label style="font-size:20px">User Name : <%=guide.getUsername()%> </label>
					<label style="font-size:20px">Password : <%=guide.getPassword()%> </label>				
					
												
												<form method="POST" action="TourGuideProfile">
													<input type="hidden" name="username" value="<%=session.getAttribute("username")%>" /> 
													<input type="submit" value="Edit Your Details" class="select-button" />
												</form>
										  
					
				</table>
		
		
		</div>
	</div>
	
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	
</div>

</body>
</html>