<%@page import="Vehicle.Vehicle"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="styles/profile.css">

<title>Vehicle profile</title>

</head>

<body style="background: url(background/ac.jpg) repeat ;">
	
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
						Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");
					%>
				
					<div id="main">
    					<div id="box">
        					
					
							<br/><br/>
							<h1 align="center"><b>Details of <%=vehicle.getFname()%> <%=vehicle.getLname()%></b></h1><br>
				
							<h3 style="font-size:20px">Contact No. :<%=vehicle.getPhone()%></h3><br/>
							<h3 style="font-size:20px">Email. :<%=vehicle.getEmail()%></h3><br/>
							<h3 style="font-size:20px">Agree terms and Conditions :<%=vehicle.getTerms()%></h3><br/>
							<h3 style="font-size:20px">User Name :<%=vehicle.getUsername()%></h3><br/>
							<h3 style="font-size:20px">Password :<%=vehicle.getPassword()%></h3><br/>			
					
							<hr>
							
							<div id="Profile">
								<img src="vehicle/<%=vehicle.getAvatar() %>">
							</div>	
							
							<h1 align="center"><b>Details of the vehicle</b></h1><br>
							
							<h3 style="font-size:20px;">Type :<%=vehicle.getType()%></h3><br/>
							<h3 style="font-size:20px">Model :<%=vehicle.getStatus()%></h3><br/>
							<h3 style="font-size:20px">Register No. :<%=vehicle.getNoPlate()%></h3><br/>
							<h3 style="font-size:20px">Availability Status :<%=vehicle.getPart()%></h3><br/>
							<h3 style="font-size:20px">Features :<%=vehicle.getFeatures()%></h3><br/>
							
							
							
							<div id="social"> 
        		 				
 									<div class="low">
										<form method="post" action="VehicleImage">
												<br/>
													<input type="hidden" name="username" value="<%=session.getAttribute("username")%>" /> 
													<input type="submit" value="Edit Image" class="select-button1" />
										</form>
									</div>
									<div class="low">	
										<form method="POST" action="VehicleProfile">
												<br/>
													<input type="hidden" name="username" value="<%=session.getAttribute("username")%>" /> 
													<input type="submit" value="Edit Your Details" class="select-button2" />
										</form>
									</div>
									<br>
									<div class="low">
									<input type="submit" class="select-button5" id="dButton" onclick="myFunction()" value="Delete Your Profile">
										<script>
											function myFunction() {
		 									   if (confirm("THINK TWICE ! If you pressed \"ok\" your account will be deleted permanently..")) {
    											window.location.href = "DeleteVehicle";
    										} else {
    											window.location.href = "Home.jsp";
    											window.location.href = "Header.jsp";
    										}
											}
										</script>
									</div>
									<div class="low">
										
											<br/>
												
												<a href="localVBooking.jsp"><input type="submit" value="View Local Customer Bookings" class="select-button3" /></a>		
										
									</div>
									<div class="low">
										
											<br/>
												
												<a href="foreignVBooking.jsp"><input type="submit" value="View Foreign Customer Bookings" class="select-button4" /></a>	
										
									</div>
        					</div>	  
					
			
    		</div>
		</div>

	<br/>
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->

</body>
</html>