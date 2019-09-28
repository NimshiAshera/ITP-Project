<%@page import="Vehicle.Vehicle"%>
<%@page import="VehicleBook.VehicleBook"%>

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
      background-image: url("background/ac.jpg");
      background-size:100% 100%;
       background-repeat: no-repeat;
}

.w3-button {
	width:700px;
	height:80px;
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
	
	<br/>
	



<div>
	<div class="containerForUserDetails">
		<br> <br>
		<div  class="userDetailsVS" align="center">
	
				<%
					VehicleBook vehicle = (VehicleBook) request.getAttribute("vehicle");	
				%>
				<caption>
					<I><h2 style="color:black"><font size="15px">Details of The Booking</h2></I>
				</caption>
				
					<font size="10px" color="red">Customer Name : </font><font size="8px"><%=vehicle.getUsername()%></font><br>
					<font size="10px" color="red">Vehicle Owner Name : </font><font size="8px"><%=vehicle.getvname()%></font><br>
					<font size="10px" color="red">Vehicle Type : </font><font size="8px"><%=vehicle.gettype()%></font><br>
					<font size="10px" color="red">Service Required Date : </font><font size="8px"><%=vehicle.getdate()%></font><br>
					<font size="10px" color="red">No. of Days : </font><font size="8px"><%=vehicle.getnumd()%></font><br>
					<font size="10px" color="red">Price : </font><font size="8px"><%=vehicle.getprice()%></font><br>
					<font size="10px" color="red">Total Price : </font><font size="8px"><%=vehicle.getamount()%></font><br>
					 
					<br>
					
						<form method="POST" action="getUserSV">
							<input type="hidden" name="username>"
								value="<%=session.getAttribute("username")%>" /> <input class="w3-button w3-block w3-teal" type="submit"
								value="Edit Booking" class="select-button" style="font-size:30px"/>
						</form>
			
						<br>
						
						<button class="w3-button w3-teal" onclick="myFunction()"><font size="6px">Print the Booking Detail</font></button>
				
		</div>

	</div>
	</div>
	
	<br><br>
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	</div>
	
	<script>
		function myFunction() {
  			window.print();
		}
	</script>
		
</body>
 
</html>