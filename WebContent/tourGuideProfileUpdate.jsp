<%@page import="TourGuide.TourGuide"%>
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

<title>Tour Guide Profile Update</title>

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

<h1 style="text-align: center; font-size: 50px; color: green">Update Tour Guide Profile</h1>
		<br> <br>
		<%
			TourGuide guide=(TourGuide)request.getAttribute("guide");
		%>
	
		<div class="form-style-5">
			<div class="form">
				<form action="UpdateTourGuide" method="post" enctype="multipart/form-data">
																
					
						<lable>First Name</lable>
						<p><input id="input" type="text"
							value='<%=guide.getFname() %>' name="fname"></p>
					
						<lable>Last Name</lable>
						<p><input id="input" type="text"
							value='<%=guide.getLname() %>' name="lname"></p>
							
						<lable>NIC</lable>
						<p><input id="input" type="text" value='<%=guide.getNic() %>'
							name="nic" disabled="disabled"></p>	
							
					
						<lable>E mail</lable>
						<p><input id="input" type="text"
							value='<%=guide.getEmail() %>' name="email"></p>
				
						<lable></lable>
						<p style="font-size: 20px; color: red;">${emailErr}</p>
						
						<lable>Phone</lable>
						<p><input id="input" type="text"
							value='<%=guide.getPhone() %>' name="phone"></p>
						
						<lable>Language</lable>
						<p><input id="input" type="text"
							value='<%=guide.getLanguage() %>' name="language"></p>
						
						<lable>Category</lable>
						<p><input style="height: 20px; width: 20px;" type="radio" name="part" value="National Tourist Guide" disabled="disabled">National Tourist Guide</p>
						<p><input style="height: 20px; width: 20px;" type="radio" name="part" value="Chauffeur Tourist Guide" disabled="disabled">Chauffeur Tourist Guide</p>
						
										
						<lable>License</lable>
						<p><input id="input" type="text"
							value='<%=guide.getLicense() %>' name="license" disabled="disabled"></p>
					
						<lable>Date Issued</lable>
						<p><input id="input" type="text"
							value='<%=guide.getdI() %>' name="dI" disabled="disabled"></p>
					
						<lable>Date Expired</lable>
						<p><input id="input" type="text"
							value='<%=guide.getdE() %>' name="dE" disabled="disabled"></p>
							
						<lable>Service Availability</lable>
						<p><input style="height: 20px; width: 20px;" type="radio" name="part1" value="Available">Available</p>
						<p><input style="height: 20px; width: 20px;" type="radio" name="part1" value="Not available">Not available</p>
							
						<lable>Terms & Conditions</lable>
						<p><input style="height: 20px; width: 20px;" type="radio" name="terms" value="Yes" disabled="disabled">Yes</p>
						<p><input style="height: 20px; width: 20px;" type="radio" name="terms" value="No" disabled="disabled">No</p>		
							
					
						<lable>User name</lable>
						<p><input id="input" type="text"
							value='<%=guide.getUsername() %>' name="username"></p>
					
						<lable></lable>
						<p style="font-size: 15px; color: black;">${unameExist}</td>
					
						<lable>Password</lable>
						<p><input id="input" type="text"
							value='<%=guide.getPassword() %>' name="password"></p>
					
						<lable>Confirm password</lable>
						<p><input id="input" type="text"
							value='<%=guide.getcPassword() %>' name="cPassword" required></p>
					
						<lable></lable>
						<p style="font-size: 15px; color: black;">${passwordMatchingErr}</p>
					
					
				       <br/> <input type="submit" value="Update" name="submitButton" id="sButton">
				</form>
			</div>
		</div>

		<h1 style="font-size: 40px; color: red;">${insertUnsuccess}</h1>
		
		<div class="form-style-5">
		<div class="form">
		<input type="submit" id="dButton" onclick="myFunction()" value="Delete Your Profile">
		<script>
		function myFunction() {
		    if (confirm("THINK TWICE ! If you pressed \"ok\" your user account will be deleted permanently..")) {
    			window.location.href = "DeleteTourGuide";
    		} else {
    			window.location.href = "Home-AfterLogin.jsp";
    		}
		}
		</script>
		</div>
		</div>
		
		<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->

	</div>



</body>
</html>