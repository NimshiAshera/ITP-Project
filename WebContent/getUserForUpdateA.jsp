<%@page import="Adventure.Adventure %>
<%@page import="adventureBook.adventureBook"%>

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


function calc(){
	
	
	var x= Number(document.getElementById("adul").value);
	var y= Number(document.getElementById("chil").value);
	
	


	 
	 
	 
	var p = (x+y) * 30;
	
	document.getElementById("amount").value = p;
}


function validateForm() {
	  var a = document.forms["adventure"]["uname"].value;
	  if (a == "") {
	    alert("Customer Name must be filled out");
	    return false;
	  }
	  
	  var b = document.forms["adventure"]["part"].value;
	  if (b == "") {
	    alert("Adventure Name must be filled out");
	    return false;
	  }
	  
	  var e = document.forms["adventure"]["cname"].value;
	  if (b == "") {
	    alert("Company Name must be filled out");
	    return false;
	  }
	
	  var c = document.forms["adventure"]["date"].value;
	  if (c =="") {
	    alert("Date must be filled out");
	    return false;
	  }
	  
	  
			  var cname=document.adventure.cname.value;
				var Cname= /^[a-zA-Z]+$/;
							
					
					if(!cname.match(Cname)){
						alert("Please insert letters only for Company name");
						return false;
					}
		

	  
	}


</script>

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

	

	
	<div class="form-style-5" style="max-width:800px;">

		
		<br> <br>
		<%
			adventureBook add= (adventureBook)request.getAttribute("add");
		%>

		<div class="form">
			<form action="updateUserSA" method="post" enctype="multipart/form-data" onsubmit="return validateForm()" >
				<h1>UPDATE ADVENTURE BOOKING</h1>
	 
    					 <label><i class="fa fa-calendar-o"></i> Customer Name</label>
    					  <input class="w3-input w3-border" type="text" name=username value='<%=add.getuname() %>' id=username placeholder="username" disabled="disabled" style="color:#FF0000;">
    					   
    					  
    					   
   
    					  <label><i class="fa fa-calendar-o"></i> Adventure Name</label>
    					  <input class="w3-input w3-border" type="text" name="part" value='<%=add.getpart() %>' id="part" placeholder="" disabled="disabled">
    					  
    					  <br/>
    					  
    					  <label><i class="fa fa-calendar-o"></i>Company Name</label>
    					  <input class="w3-input w3-border" type="text" name="cname" value='<%=add.getcname() %>' id="cname" placeholder="Company Name" disabled="disabled">
    					  
    					  <br/>
    					  
    					  
    					    <label><i class="fa fa-calendar-o"></i>Date</label>
    					  <input class="w3-input w3-border" type="date" name="date" value='<%=add.getdate() %>' id="date" placeholder="Type" disabled="disabled">
    					  
    					  <br/>
  
    					<label>No. of Passengers</label>
    					
    					<label><i class="fa fa-calendar-o"></i>Adults</label>
    					  
    					  <p><input class="w3-input w3-border" type=number min="0" id="adul" name="adul" value='<%=add.getadul() %>' onchange="calc()">
    					  
    					  
    					  <label><i class="fa fa-calendar-o"></i>Children</label>
    					   <p><input class="w3-input w3-border" type=number min="0" id="chil" name="chil" value='<%=add.getchil() %>' onchange="calc()">
                            <br/>
  								
  								
  			           <label><i class="fa fa-male"></i> Total Price</label>
    					  USD<input class="w3-input w3-border" type="text" name="amount" value='<%=add.getamount() %>' id="amount"   onchange="calc()" placeholder="USD">
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
    			window.location.href = "deleteUserSA";
    		} else {
    			window.location.href = "Home.jsp";
    		}
		}
		</script> 
		
		<br /> <a href="Home.jsp"></a><input class="w3-button w3-block w3-black" type="submit" value="Go Back To Home" name="submitButton"
					id="sButton"> 
		
							 					
					  
		</div>
		</div>
		
		<br>
		<br>
		


	</div>
</body>

</html>