<%@page import="Driver.Driver"%>
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

<title>Booking</title>
<script type="text/javascript">
function dynamicdropdown(listindex)
{
    switch (listindex)
    {
    case "Platinum" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("120 USD","120");
        
        break;
    case "Gold" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("100 USD","100");
        
        break;
    case "Silver" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("80 USD","80");
        
        break;
   
     
    
    }
    return true;
}


function calc(){
	
	
	var x= Number(document.getElementById("price").value);
 	 	 
	 
	var p = x * 1;
	
	document.getElementById("amount").value = p;
}


function validateForm() {
	  var a = document.forms["pack"]["uname"].value;
	  if (a == "") {
	    alert("Customer Name must be filled out");
	    return false;
	  }
	  
	  var b = document.forms["pack"]["pid"].value;
	  if (b == "") {
	    alert("Package ID must be filled out");
	    return false;
	  }
	  
	  var b = document.forms["pack"]["pt"].value;
	  if (b == "") {
	    alert("Package Type must be filled out");
	    return false;
	  }
	 
	  var e = document.forms["pack"]["price"].value;
	  if (e == "") {
		  alert("price  must be filled out");
		  return false;
	  }
	  
	  var pid=document.pack.pid.value;
		var Pid= /^[0-9]$/;
		
		
			if(!pid.match(Pid)){
				alert("Please insert numbers only for package ID name");
				return false;
			}
		
							
			
	}




</script>

 <style type="text/css">
/*backgroung image fix*/
body{
      background-image: url("images/dri.jpg");
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
	
	<br><br><br><br><br><br>
	

	
	<div class="form-style-5" style="max-width:800px;">
		<div class="form">
		
			<form id="pack" name="pack" action="PackageBookS"  method="post" enctype="multipart/form-data" onsubmit="return validateForm()" >
	 <h1>PACKAGES BOOKING</h1>
    					  <label><i class="fa fa-calendar-o"></i> Customer Name</label>
    					  <input class="w3-input w3-border" type="text" name=username id=username placeholder="" value="<%= username %>"readonly="readonly" style="color:#FF0000;">
    					  
    					  <br/>
   
    					  <label><i class="fa fa-calendar-o"></i>Package ID</label>
    					  <input class="w3-input w3-border" type="text" name="pid" id="pid" >
    					  <br/>
    					  
    					  
    					  <label style="height:50px"><i class="fa fa-calendar-o"></i>Package Type</label>
    					  
    					  <p><select id="pt" name="pt" onchange="javascript: dynamicdropdown(this.options[this.selectedIndex].value);">
        
    									 <option value="">--Select--</option>
    									<option value="Platinum">Platinum</option>
    									<option value="Gold">Gold</option>
    									<option value="Silver">Silver</option>
    									 
  								</select></p><br/>
    					  
   					  
    					  <label><i class="fa fa-calendar-o"></i> Package Price</label>
    					  <script type="text/javascript" language="JavaScript"> document.write('<select name="price"  id="price" onchange="calc()"><option value="">Select </option></select>')
        					   </script>
        						
                               <p><noscript><select id="price" name="price">
            							<option value="120 ">120 USD</option>
            							<option value="1">1</option>
        						</select></noscript></p><br/>
    					  
    					  
    					  
    					     					  
    					  <label><i class="fa fa-male"></i> Total Price</label>
    					  USD<input class="w3-input w3-border" type="text" name="amount" id="amount" onchange="calc()" placeholder="USD">
    					  <br/>
    				
    				  
    					  <button class="w3-button w3-block w3-black">Book</button>
    			
    				
    	</form>
    		<br/>
    	
    	<form  action="userDetailsSP"><input class="w3-button w3-block w3-black" type="submit" value="Click Here To Update" ></a>

</form>			  			  
    						  
    				 
		</div>		
	
	</div>
	<br><br><br><br><br><br><br><br><br>
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	</div>
		
</body>
</html>


