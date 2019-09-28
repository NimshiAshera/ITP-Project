<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<title>adventure Booking</title>
<script type="text/javascript">
 

 
function calc(){
	
	
	var x= Number(document.getElementById("adul").value);
	var y= Number(document.getElementById("chil").value);
	 
	var p = (x * 30)+(y * 30);
	
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
<style type="text/css">
/*backgroung image fix*/
body{
      background-image: url("images/add5.jpg");
      background-size:100% 100%;
       background-repeat: no-repeat;
}


</style>
</head>

<body>


<%
		 
		 
		String username=(String)session.getAttribute("username");
	%>

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

	<!-- <img src="background/end.jpg" class="w3-image w3-greyscale-min" style="width:100%">-->
	<br><br><br><br><br><br>
	
	<div class="form-style-5" style="max-width:800px">
		<div class="form">
		<h1 style="font-size:"">ADVENTURE PlACES BOOKING</h1>
	
				 <form  name ="adventure" id="adventure" action="adventureBookS" method="post" enctype="multipart/form-data"  onsubmit="return validateForm()">
    					  <label><i class="fa fa-calendar-o"></i> Customer Name</label>
    					  <input class="w3-input w3-border" type="text" name=username id=username value="<%= username %>"readonly="readonly" style="color:#FF0000;">
    					   
    					  
    					   
   
    					  <label><i class="fa fa-calendar-o"></i> Adventure Name</label>
    					  <input class="w3-input w3-border" type="text" name="part" id="part" placeholder="">
    					  
    					  <br/>
    					  
    					  <label><i class="fa fa-calendar-o"></i>Company Name</label>
    					  <input class="w3-input w3-border" type="text" name="cname" id="cname" placeholder="Type">
    					  
    					  <br/>
    					  
    					  
    					    <label><i class="fa fa-calendar-o"></i>Date</label>
    					  <input class="w3-input w3-border" type="date" name="date" id="date" placeholder="Type">
    					  
    					  <br/>
    					  
    					   
    					  
    					  
    					  
    					<label>No. of Passengers</label>
    					
    					<label><i class="fa fa-calendar-o"></i>Adults</label>
    					  
    					  <p><input class="w3-input w3-border" type=number min="0" id="adul" name="adul" onchange="calc()">
    					  
    					  
    					  <label><i class="fa fa-calendar-o"></i>Children</label>
    					   <p><input class="w3-input w3-border" type=number min="0" id="chil" name="chil" onchange="calc()">
                            <br/>
  								

    					     					  
    					  <label><i class="fa fa-male"></i> Total Price</label>
    					  USD<input class="w3-input w3-border" type="text" name="amount" id="amount"   onchange="calc()" placeholder="USD">
    					  <br/>
    				
    					   
    					  
    					 
    					  <button class="w3-button w3-block w3-black" value="book">Book</button>
    					</form>  
    					<br/> 
    				
    				<form  action="userDetailsSA">
    				<button class="w3-button w3-block w3-black" value="Click Here To Update">Click Here To Update</button>
    				</form>
  				 </div>
    				
    				</div>
	<br><br><br><br><br><br><br><br><br>
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	</div>
		
</body>
</html>