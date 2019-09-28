<%@page import="Packages.PackageBook"%>
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

<title>Booking</title>
 <style type="text/css">
/*backgroung image fix*/
body{
      background-image: url("vehicle/v3.png");
      background-size:100% 100%;
       background-repeat: no-repeat;
}
</style>
 
</head>

<body>
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
	



<div>
	<div class="containerForUserDetails">
		<br> <br>
		<div  class="userDetailsST" align="center">
			<table border="5" style="border-color:white" cellpadding="12">
			
			<%
			PackageBook pack = (PackageBook) request.getAttribute("pack");
					
				%>
				<caption>
					<I><h2 style="color:white">Details of Booking</h2></I>
				</caption>
				<tr style="color:white">
					<th style="color:white">Customer Name</th>
					<th style="color:white">Package ID</th>
					 <th style="color:white">Package Type</th>
					<th style="color:white">Price</th>
					<th style="color:white">Total Price</th>
					 
				</tr>
				
				<tr  style="color:33FFE6">
					<td  style="color:#33FFE6"><%=pack.getUsername()%></td>
					<td  style="color:#33FFE6"><%=pack.getpid()%></td>
					<td  style="color:#33FFE6"><%=pack.getpt()%></td>
					<td  style="color:#33FFE6"><%=pack.getprice()%></td>
					<td  style="color:#33FFE6"><%=pack.getamount()%></td>
					
					
						</td>
					<td>
						<form method="POST" action="getUserSP">
							<input type="hidden" name="username>"
								value="<%=session.getAttribute("username")%>" /> <input class="w3-button w3-block w3-black" type="submit"
								value="Edit Booking" class="select-button" />
						</form>
					</td>
				</tr>

			</table>
		</div>

	</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	</div>
		
</body>
 
</html>