<%@page import="Driver.Driver"%>
<%@page import="DriverBook.DriverBook" %>

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
      background-image: url("background/20.jpg");
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
	
	<br><br><br><br><br><br>
	



<div>
	<div class="containerForUserDetails">
		<br/> <br/> 
		<div  class="userDetailsVS" align="center">
			
				<%
					DriverBook driver = (DriverBook) request.getAttribute("driver");
					
				%>
				
				<caption>
					<I><h2 style="color:black"><font size="15px">Details of Booking</font></h2></I>
				</caption>
				
					<font size="10px" color="red">Customer Name</font><font size="8px"><%=driver.getUsername()%></font><br>
					<font size="10px" color="red">Driver Name</font><font size="8px"><%=driver.getdname()%></font><br>
					<font size="10px" color="red">Service Required Date</font><font size="8px"><%=driver.getdate()%></font><br>
					<font size="10px" color="red">No. of Days</font><font size="8px"><%=driver.getnumd()%></font><br>
					<font size="10px" color="red">Price Per Day</font><font size="8px"><%=driver.getprice()%></font><br>
					<font size="10px" color="red">Total Price</font><font size="8px"><%=driver.getamount()%></font><br>
					 
					 <br>
				
						<form method="POST" action="getUserSD">
							<input type="hidden" name="username>"
								value="<%=session.getAttribute("username")%>" /> <input class="w3-button w3-block w3-black" type="submit"
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