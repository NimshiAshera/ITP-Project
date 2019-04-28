<%@page import="TourGuide.TourGuide"%>
<%@page import="TourguideBook.TourguideBook" %>

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
    case "1" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("40 USD","40");
        
        break;
    case "5" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("40 USD","40");
        
        break;
    case "7" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("45 USD","45");
        
        break;
    case "10" :
    	  document.getElementById("price").options[0]=new Option("Select ","");
          document.getElementById("price").options[1]=new Option("45 USD","45");        
          break;
    case "14" :
  	    document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("50 USD","50");        
        break;
    case "30" :
  	  	document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("50 USD","50");        
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
	  var uname = document.forms["tour"]["uname"].value;
	  if (uname == "") {
	    alert("Customer Name must be filled out");
	    return false;
	  }
	  
	  var gname = document.forms["tour"]["gname"].value;
	  var Gname= /^[a-zA-Z]+$/;
	  
	  if (gname == "") {
	    alert("Guide Name must be filled out");
	    return false;
	  }else if(!gname.match(Gname)){
			alert("Please insert letters only for Guide name");
			return false;
	  }
	  
	  var numd = document.forms["tour"]["numd"].value;
	  if (numd == "") {
	    alert("No. of Days must be filled out");
	    return false;
	  }
	 
	  var price = document.forms["tour"]["price"].value;
	  if (price == "") {
		  alert("price  must be filled out");
		  return false;
	  }	  
}


</script>

<style type="text/css">
/*backgroung image fix*/
body{
      background-image: url("background/23.jpg");
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
				TourguideBook tour=(TourguideBook)request.getAttribute("tour");
			%>

		<div class="form">
			<form action="updateUserST" method="post" enctype="multipart/form-data" onsubmit="return validateForm()" >
				<h1>UPDATE TOURGUIDE BOOKING</h1>
	 
    					  <label><i class="fa fa-calendar-o"></i> Customer Name</label>
    					  <input class="w3-input w3-border" type="text" name=username id=username value='<%=tour.getUsername() %>' disabled="disabled" style="color:#FF0000;">
    					  
    					  <br/>
   
    					  <label><i class="fa fa-calendar-o"></i>Guide Name</label>
    					  <input class="w3-input w3-border" type="text" name="gname" value='<%=tour.getgname() %>' id="gname" disabled="disabled" >
    					  <br/>
    					  
    					   
    					  <label><i class="fa fa-calendar-o"></i>Service Required Date</label>
    					  <input class="w3-input w3-border" type="date" name="date" value='<%=tour.getdate() %>' id="date" >
    					  <br/>
    					  
    					  
    					  <label style="height:50px"><i class="fa fa-calendar-o"></i> No. of Days</label>
    					  
    					  <p><select id="numd" name="numd" value='<%=tour.getnumd() %>' onchange="javascript: dynamicdropdown(this.options[this.selectedIndex].value);">
        
    									 <option value="">--Select--</option>
    									<option value="1">1 day</option>
    									<option value="2">2 days</option>
    									<option value="3">3 days</option>
    									<option value="4">4 days</option>
    									<option value="5">5 days</option>
    									<option value="6">6 days</option>
    									<option value="7">7 days</option>
    									<option  value="10">10 days</option>
    									<option  value="15">15 days</option>
    									<option  value="30">1 month</option> 
  								</select></p><br/>
    					  
   					  
    					  <label><i class="fa fa-calendar-o"></i>Price</label>
    					  <script type="text/javascript" language="JavaScript"> document.write('<select name="price"  id="price"  value='<%=tour.getprice() %>' onchange="calc()"><option value="">Select </option></select>')
        					   </script>
        						
                               <p><noscript><select id="price" name="price" value='<%=tour.getprice() %>'>
            							<option value="40 ">40 USD</option>
            							<option value="1">1</option>
        						</select></noscript></p><br/>
    					  
    					  
    					  
    					     					  
    					  <label><i class="fa fa-male"></i> Total Price</label>
    					  USD<input class="w3-input w3-border" type="text" name="amount" id="amount" value='<%=tour.getamount() %>' onchange="calc()" placeholder="USD">
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
    			window.location.href = "deleteUserST";
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