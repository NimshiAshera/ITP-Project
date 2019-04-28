<%@page import="VehicleBook.VehicleBook"%>
<%@page import="Vehicle.Vehicle" %>

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

<link rel="stylesheet" type="text/css" href="getUserForUpdate.css">
<title>Get User</title>
<script type="text/javascript">

function dynamicdropdown(listindex)
{
    switch (listindex)
    {
    case "2" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("25 USD","25");
        
        break;
    case "5" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("20 USD","20");
        
        break;
    case "7" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("18 USD","18");
        
        break;
       
    }
    return true;
}


function calc(){
	
	
	var x= Number(document.getElementById("price").value);
 	var y= Number(document.getElementById("numd").value);
 
	var p = x * y;
	
	document.getElementById("amount").value = p;
}


function validateForm() {
	  var uname = document.forms["vehicle"]["uname"].value;
	  if (uname == "") {
	    alert("Customer Name must be filled out");
	    return false;
	  }
	  
	  var vname = document.forms["vehicle"]["vname"].value;
	  var Vname= /^[a-zA-Z]+$/;
	  
	  if (vname == "") {
	    alert("Vehicle Owner Name must be filled out");
	    return false;
	  }if(!vname.match(Vname)){
			alert("Please insert letters only for Vehicle Owner name");
			return false;
		}
	  
	  var type = document.forms["vehicle"]["type"].value;
	  var Type= /^[a-zA-Z]+$/;
	  
	  if (type == "") {
	    alert("Vehicle Type must be filled out");
	    return false;
	  }else if(!type.match(Type)){
			alert("Please insert letters only for Vehicle Type");
			return false;
		}
	  
	  var numd = document.forms["vehicle"]["numd"].value;
	  if (numd == "") {
	    alert("No. of Days must be filled out");
	    return false;
	  }
	 
	  var price = document.forms["vehicle"]["price"].value;
	  if (price == "") {
		  alert("price  must be filled out");
		  return false;
	  }					
}


</script>

<style type="text/css">
/*backgroung image fix*/
body{
      background-image: url("background/ve.jpg");
      background-size:100% 100%;
       background-repeat: no-repeat;
}
</style>

</head>

<body>
	
	<div class="container">
	
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
	

	
	<div class="form-style-5" style="max-width:800px;">

		
		<br> <br>
		<%
				VehicleBook vehicle=(VehicleBook)request.getAttribute("vehicle");
		%>

		<div class="form">
			<form action="updateUserSV" method="post" enctype="multipart/form-data" onsubmit="return validateForm()" >
				<h1>UPDATE VEHICLE BOOKING</h1>
	 
    					  <label><i class="fa fa-calendar-o"></i> Customer Name</label>
    					  <input class="w3-input w3-border" type="text" name=username id=username value='<%=vehicle.getUsername() %>' disabled="disabled" style="color:#FF0000;">
    					  
    					  <br/>
   
    					  <label><i class="fa fa-calendar-o"></i>Vehicle Owner Name</label>
    					  <input class="w3-input w3-border" type="text" name="vname" value='<%=vehicle.getvname() %>' id="vname" disabled="disabled" >
    					  <br/>
    					  
    					   <label><i class="fa fa-calendar-o"></i>Vehicle Type</label>
    					  <input class="w3-input w3-border" type="text" name="type" id="type" value='<%=vehicle.gettype() %>' disabled="disabled" >
    					  <br/>
    					  
    					  <label><i class="fa fa-calendar-o"></i>Service Required Date</label>
    					  <input class="w3-input w3-border" type="date" name="date" id="date" value='<%=vehicle.gettype() %>' >
    					  <br/>
    					  
    					  
    					  <label style="height:50px"><i class="fa fa-calendar-o"></i> No. of Days</label>
    					  
    					  <p><select id="numd" name="numd" value='<%=vehicle.getnumd() %>' onchange="javascript: dynamicdropdown(this.options[this.selectedIndex].value);">
        
    									<option value="">--Select--</option>
    									<option value="2">2 day</option>
    									<option value="5">5 days</option>
    									<option value="7">7 days</option> 
  								</select></p><br/>
    					  
   					  
    					  <label><i class="fa fa-calendar-o"></i>Price</label>
    					  <script type="text/javascript" language="JavaScript"> document.write('<select name="price"  id="price" value='<%=vehicle.getprice() %>' onchange="calc()"><option value="">Select </option></select>')
        					   </script>
        						
                               <p><noscript><select id="price" name="price">
            							<option value="25">25 USD</option>
            							<option value="1">1</option>
        						</select></noscript></p><br/>
    					  
    					  
    					  
    					     					  
    					  <label><i class="fa fa-male"></i> Total Price</label>
    					  USD<input class="w3-input w3-border" type="text" name="amount" id="amount" value='<%=vehicle.getamount() %>' onchange="calc()" placeholder="USD">
    					  <br/>
    				
				<br /> <input class="w3-button w3-block w3-black" type="submit" value="Update" name="submitButton"
					id="sButton">
			</form>
		</div>

		<h1 style="font-size: 40px; color: red;">${insertUnsuccess}</h1>

		<div class="form">
		<div class="table">
		<button class="w3-button w3-block w3-black" id="dButton" onclick="myFunction()">Delete Customer</button>
		<script>
		function myFunction() {
		    if (confirm("THINK TWICE ! If you pressed \"ok\" your user account will be deleted permanently..")) {
    			window.location.href = "deleteUserSV";
    		} else {
    			window.location.href = "Home.jsp";
    		}
		}
		</script>
		</div>
		</div>
		
		<br>
		<br>
		
	</div>
	</div>
</body>

</html>