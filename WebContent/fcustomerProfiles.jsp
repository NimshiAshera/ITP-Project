<%@page import="FCustomer.FCustomer"%>
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

<title>Profile</title>

</head>

<body style="background-color:white">

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
	
	<div class="form-style-5">
		<div class="form">
	
				<table border="1" cellpadding="12">
					<%
						FCustomer fcustomer=(FCustomer)request.getAttribute("fcustomer");
					%>
				
					
					<h2 align="center" style="color:green"><b>Details of <%=fcustomer.getFname()%> <%=fcustomer.getLname()%></b></h2>
				
				
				
					<label style="font-size:20px"><b>First Name :</b><%=fcustomer.getFname()%></label>
					<label style="font-size:20px"><b>Last Name :</b> <%=fcustomer.getLname()%></label>
					<label style="font-size:20px"><b>Passport :</b> <%=fcustomer.getPass()%></label>
					
					<label style="font-size:20px"><b>Image :</b> <img src="customer/<%=fcustomer.getAvatar() %>"  width="200" height="300">
												
												
												<form method="post" action="FCustomerImage">
												<br/>
													<input type="hidden" name="username" value="<%=session.getAttribute("username")%>" /> 
													<input type="submit" value="Edit Image" class="select-button" />
												</form>
					</label>
					
					
					<label style="font-size:20px"><b>Contact No. :</b> <%=fcustomer.getPhone()%> </label>
					<label style="font-size:20px"><b>Gender :</b> <%=fcustomer.getGender()%> </label>
					<label style="font-size:20px"><b>Email : </b><%=fcustomer.getEmail()%> </label>
					<label style="font-size:20px"><b>User Name : </b><%=fcustomer.getUsername()%> </label>
					<label style="font-size:20px"><b>Password : </b><%=fcustomer.getPassword()%> </label>				
					
												
												<form method="POST" action="FCustomerProfile">
													<input type="hidden" name="username" value="<%=session.getAttribute("username")%>" /> 
													<input type="submit" value="Edit Your Details" class="select-button" />
												</form>
										  
					
				</table>
		</div>		
	</div>
	
	<div class="form-style-5">
		<div class="form">
	
	
		<h2 align="center" style="color:green"><b>Booking history <%=fcustomer.getFname()%> <%=fcustomer.getLname()%></b></h2>
	
	
		</div>
	</div>	
	
	
	
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	</div>
		
</body>
</html>