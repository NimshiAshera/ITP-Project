<%@page import="Driver.Driver"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

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

<title>Driver profile</title>

</head>

<body style="background:url(images/img01.gif) repeat;">

	<div class="container" >
	
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
						Driver driver = (Driver) request.getAttribute("driver");
					%>
				
					
					<h2 align="center" style="color:green"><b>Book As You Prefer</b></h2>
				
				
				
					<label style="font-size:20px;"><b>First Name :</b><%=driver.getFname()%></label>
					<label style="font-size:20px"><b>Last Name :</b> <%=driver.getLname()%></label>
					<label style="font-size:20px"><b>NIC :</b> <%=driver.getNic()%></label>
					<label style="font-size:20px"><b>Email : </b><%=driver.getEmail()%> </label>
					<label style="font-size:20px"><b>Contact No. :</b> <%=driver.getPhone()%> </label>
					<label style="font-size:20px"><b>Image :</b> <img src="driver/<%=driver.getAvatar() %>"  width="200" height="150">
					<label style="font-size:20px"><b>License No. :</b> <%=driver.getLicense()%> </label> 
					<label style="font-size:20px"><b>Date Issued :</b> <%=driver.getdI()%> </label> 
					<label style="font-size:20px"><b>Date Expired :</b><%=driver.getdE()%>  </label> 
					<label style="font-size:20px"><b>Availability Status :</b> <%=driver.getPart()%>  </label> 
					<label style="font-size:20px"><b>Agree terms and Conditions : </b><%=driver.getTerms()%> </label> 
					<label style="font-size:20px"><b>User Name : </b><%=driver.getUsername()%> </label>
					<label style="font-size:20px"><b>Password : </b><%=driver.getPassword()%> </label>				
					
												
											
				</table>
		</div>		
	</div>
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	</div>
		
</body>
</html>