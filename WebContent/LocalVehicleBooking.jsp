<%@page import="VehicleBook.VehicleBook"%>
<%@page import="LCustomer.LCustomer"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LV Booking</title>

<style type="text/css">
/*backgroung image fix*/
body{
      background-image: url("background/ac.jpg");
      background-size:100% 100%;
       background-repeat: no-repeat;
}
</style>

</head>
<body>

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
	
	<br><br><br><br>
	

	<table border="5" style="border-color:white; width: 80%;" cellpadding="12">
			
				<%
					VehicleBook vehicle = (VehicleBook) request.getAttribute("vehicle");			
				%>
				<%
					LCustomer lcustomer = (LCustomer) request.getAttribute("lcustomer");
				%>
				
				
				<tr style="color:black">
					<th style="color:black"><font size="10px">Customer Name</font></th>
					<th style="color:black"><font size="10px">Contact No.</font></th>
					<th style="color:black"><font size="10px">Email</font></th>
					<th style="color:black"><font size="10px">Service Required Date</font></th>
					<th style="color:black"><font size="10px">No. of Days</font></th>
					<th style="color:black"><font size="10px">Total Price</font></th>
					 
				</tr>
				
				<tr  style="color:black">
					<td  style="color:black"><font size="10px"><%=lcustomer.getFname()%></font></td>
					<td  style="color:black"><font size="10px"><%=lcustomer.getPhone()%></font></td>
					<td  style="color:black"><font size="10px"><%=lcustomer.getEmail()%></font></td>
					<td  style="color:black"><font size="10px"><%=vehicle.getdate()%></font></td>
					<td  style="color:black"><font size="10px"><%=vehicle.getnumd()%></font></td>
					<td  style="color:black"><font size="10px"><%=vehicle.getamount()%></font></td>
				
					
				</tr>

			</table>
			
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->

</body>
</html>