<%@page import="Driver.Driver"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Driver Profile</title>

<link rel="stylesheet" type="text/css" href="styles/profile.css">

</head>
<body style="background: url(background/drive.jpg) repeat ;">

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
	
		<%
			Driver driver = (Driver) request.getAttribute("driver");
		%>
	

		<div id="main">
    		<div id="box">
        		
        		<div id="Profile">
        		<img src="driver/<%=driver.getAvatar() %>"  >
        		</div>

         		<h1 align="center"><b>Details of <%=driver.getFname()%> <%=driver.getLname()%></b></h1><br>

         		<h3 style="font-size:20px;">NIC :<%=driver.getNic()%></h3><br/>
				<h3 style="font-size:20px;">Email :<%=driver.getEmail()%></h3><br/>
				<h3 style="font-size:20px;">Contact No. :<%=driver.getPhone()%></h3><br/>
				<h3 style="font-size:20px;">Agree terms and Conditions :<%=driver.getTerms()%></h3><br/>
				<h3 style="font-size:20px;">User Name :<%=driver.getUsername()%></h3><br/>
				<h3 style="font-size:20px;">Password :<%=driver.getPassword()%></h3><br/><br>
				
				<h3 style="font-size:20px;">License No. :<%=driver.getLicense()%></h3><br/>
				<h3 style="font-size:20px;">Date Issued : <%=driver.getdI()%></h3><br/>
				<h3 style="font-size:20px;">Date Expired :<%=driver.getdE()%></h3><br/>
				<h3 style="font-size:20px;">Availability Status :<%=driver.getPart()%></h3><br/>
				
				



        		<div id="social"> 
        		 				
 					<div class="low">
 						<form method="post" action="DriverImage">
							<br/>										
								<input type="hidden" name="nic" value="<%=session.getAttribute("nic")%>" /> 
								<input type="submit" value="Edit Image" class="select-button1" />
						</form>
					</div>
					<div class="low">
						<form method="POST" action="DriverProfile">
							<br/>
								<input type="hidden" name="username" value="<%=session.getAttribute("username")%>" /> 
								<input type="submit" value="Edit Your Details" class="select-button2" />
						</form>
					</div>
					<div  class="low">
							
						<input type="submit" class="select-button3" id="dButton" onclick="myFunction()" value="Delete Your Profile">
							<script>
								function myFunction() {
		    						if (confirm("THINK TWICE ! If you pressed \"ok\" your account will be deleted permanently..")) {
    								window.location.href = "DeleteDriver";
    								} else {
    								window.location.href = "Home.jsp";
    								window.location.href = "Header.jsp";
    								}
								}
							</script>
	
					</div>
					<div class="low">
										
							<br/>
											
								<a href="localDBooking.jsp"><input type="submit" value="View Local Customer Bookings" class="select-button4" /></a>		
					</div>
					<div class="low">
										
							<br/>
												
								<a href="foreignDBooking.jsp"><input type="submit" value="View Foreign Customer Bookings" class="select-button5" /></a>	
					</div>
        		</div>
        		
        		
    		</div>
		</div>

	<br/>
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->

</body>
</html>