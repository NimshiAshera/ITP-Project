<%@page import="Driver.Driver"%>
<%@page import="DriverBook.DriverBook"%>

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
    case "1" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("20 USD","20");
        
        break;
    case "2" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("20 USD","20");
        
        break;
    case "3" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("20 USD","20");
        
        break;
    case "4" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("20 USD","20");
        
        break;
    case "5" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("20 USD","20");
        
        break;
    case "6" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("20 USD","20");
        
        break;
    case "7" :
        document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("18 USD","18");
        
        break;
    case "10" :
    	  document.getElementById("price").options[0]=new Option("Select ","");
          document.getElementById("price").options[1]=new Option("15 USD","15");        
          break;
    case "15" :
  	    document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("15 USD","15");        
        break;
    case "30" :
  	  	document.getElementById("price").options[0]=new Option("Select ","");
        document.getElementById("price").options[1]=new Option("15 USD","15");        
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
	  var uname = document.forms["driver"]["uname"].value;
	  if (uname == "") {
	    alert("Customer Name must be filled out");
	    return false;
	  }
	  
	  var dname = document.forms["driver"]["dname"].value;
	  var Dname= /^[a-zA-Z]+$/;
	  
	  if (dname == "") {
	    alert("Driver Name must be filled out");
	    return false;
	  }else if(!dname.match(Dname)){
		 alert("Please insert letters only for Driver name");
		 return false;
	  }
	  
	  var numd = document.forms["driver"]["numd"].value;
	  if (numd == "") {
	    alert("Adventure Name must be filled out");
	    return false;
	  }
	 
	  var price = document.forms["driver"]["price"].value;
	  if (price == "") {
		  alert("price  must be filled out");
		  return false;
	  }
}


</script>

<style type="text/css">
/*backgroung image fix*/
body{
      background-image: url("background/20.jpg");
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
		
			<form action="DriverBooks"  method="post" enctype="multipart/form-data" onsubmit="return validateForm()" >
	 
	 					   <h1>DRIVER BOOKING</h1>
	 					 	 	 
    					  <label><i class="fa fa-calendar-o"></i> Customer Name</label>
    					  <input class="w3-input w3-border" type="text" name=username id=username placeholder="" value="<%= username %>" readonly="readonly" style="color:#FF0000;">
    					  
    					  <br/>
   
    					  <label><i class="fa fa-calendar-o"></i> Driver Name</label>
    					  <input class="w3-input w3-border" type="text" name="dname" id="dname" >
    					  
    					  <br/>
    					  
    					  
    					  <label><i class="fa fa-calendar-o"></i> Service Required Date</label>
    					  <input class="w3-input w3-border" type="date" name="date" id="date" >
    					  
    					  <br/>
    					  
    					  
    					  <label style="height:50px"><i class="fa fa-calendar-o"></i> No. of Days</label>
    					  <p><select id="numd" name="numd" onchange="javascript: dynamicdropdown(this.options[this.selectedIndex].value);">
        
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
  								</select></p>
  								
  						  <br/>

    					  <label><i class="fa fa-calendar-o"></i>Price</label>
    					  <script type="text/javascript" language="JavaScript"> document.write('<select name="price"  id="price" onchange="calc()"><option value="">Select </option></select>')
        					   </script>
        						
                               <p><noscript><select id="price" name="price">
            							<option value="60 ">20 USD</option>
            							<option value="1">1</option>
        						</select></noscript></p>
        						
        				  <br/>  					  
					     					  
    					  <label><i class="fa fa-male"></i> Total Price</label>
    					  USD<input class="w3-input w3-border" type="text" name="amount" id="amount" onchange="calc()" placeholder="USD">
    					  <br/>
    				
    				  
    					  <button class="w3-button w3-block w3-black">Book</button>
    			
    				
    	</form>	
    	
    	<br/>
    	
    	<form  action="userDetailsDS"><input class="w3-button w3-block w3-black" type="submit" value="Click Here To Update" ></a>

		</form>				  
    				 
		</div>		
	
	</div>
	<br><br><br><br><br><br><br><br><br>
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	</div>
		
</body>
</html>