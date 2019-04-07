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


<title>Vehicle</title>

<script language="javascript" type="text/javascript">
    function dynamicdropdown(listindex)
    {
        switch (listindex)
        {
        case "car" :
            document.getElementById("status").options[0]=new Option("Select ","");
            document.getElementById("status").options[1]=new Option("BMW","bmw");
            document.getElementById("status").options[2]=new Option("Sedan","sedan");
            document.getElementById("status").options[3]=new Option("CrossOver","crossover");
            document.getElementById("status").options[4]=new Option("Coupe","coupe");
            break;
        case "van" :
            document.getElementById("status").options[0]=new Option("Select ","");
            document.getElementById("status").options[1]=new Option("Mercedes Benz Metris","mbm");
            document.getElementById("status").options[2]=new Option("Ford Transit Connect","ftc");
            document.getElementById("status").options[3]=new Option("RAM ProMaster 3500","ram");
            document.getElementById("status").options[4]=new Option("Chrysler Pacifica","cp");
            break;
        case "bus" :
            document.getElementById("status").options[0]=new Option("Select ","");
            document.getElementById("status").options[1]=new Option("Coach ","coach");
            document.getElementById("status").options[2]=new Option("Double Decker","dd");
            document.getElementById("status").options[3]=new Option("Low Flat ","lf");
            document.getElementById("status").options[4]=new Option("Party","party");
            break;
        case "jeep" :
            document.getElementById("status").options[0]=new Option("Select ","");
            document.getElementById("status").options[1]=new Option("Compass","compass");
            document.getElementById("status").options[2]=new Option("Wrangler","wrangler");
            document.getElementById("status").options[3]=new Option("Renegade","renegade");
            document.getElementById("status").options[4]=new Option("Cherokee","cherokee");
            break;
        }
        return true;
    }
    
    
    function validation(){
		
    	var fname=document.form1.fname.value;
		var Fname= /^[a-zA-Z]+$/;
					
			if(fname==""){
				alert("Please insert the first name");
				return false;
			}else if(!isNaN(fname)){
				alert("Please insert a valid first name");
				return false;
			}else if(!fname.match(Fname)){
				alert("Please insert letters only for first name");
				return false;
			}
		
		
		var lname=document.form1.lname.value;
		var Lname= /^[a-zA-Z]+$/;
		
			if(lname==""){
				alert("Please insert the last name");
				return false;
			}else if(!isNaN(lname)){
				alert("Please insert a valid last name");
				return false;
			}else if(!lname.match(Lname)){
				alert("Please insert letters only for first name");
				return false;
			}
			
		var phone = document.form1.phone.value;
		var Phone =  /^[0-9]{10}$/;
				
				if(phone==""){
					alert("Please insert the contact number");
					return false;
				}else if(!phone.match(Phone)){
					alert("Please insert a correct contact number");
					return false;
				}	
	
		var noPlate = document.form.noPlate.value;
		var NoPlate =  /^[0-9]{4}[A-Z]{1}[a-z]{1}$/;
		
		
			if(noPlate==""){
				alert("Please insert the vehicle registered number");
				return false;
			}else if(!noPlate.match(NoPlate)){
				alert("Please insert a valid vehicle registered number");
				return false;
			}
				
			
		var image = document.form.image.value;
		
			if(image==""){				
				alert("Insert a image");
				return false;
			}	
			
			
		var part = document.form.part.value;
		
			if(part==""){
				alert("Please select the availability status");
				return false;
			}
		
		
		var features = document.form.features.value;
		
			if(features==""){
				alert("Please insert the facilities & extra details of your vehicle");
				return false;
			}
			
					
			
		var terms = document.form.terms.value;
			
			if(terms==""){
				alert("You must agree to our terms & conditions to proceed your registration.");
				return false;
			}else if(terms=="t2")	{
				alert("You must agree to our terms & conditions to proceed your registration");
				return false;
			}
			
			
		var uname = document.form1.uname.value;
			
			if(uname==""){
				alert("Please insert a user name");
				return false;
		}
			
			
		var password = document.form1.password.value;
			
			if(password==""){
				alert("Please insert a password");
				return false;
			}	
		
		var cPassword = document.form1.cPassword.value;
			
			if(cPassword==""){
				alert("Please insert your password again");
				return false;
			}else if(!password.match(cPassword)){
				alert("Password not matching. Check again");
				return false;
			}	
							
			
			
	}
    
    
    </script>



</head>
			

<body style="background:url(images/img01.gif) repeat;">
	<div class="container">
	
		<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">ABOUT SRILANKA</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">MAP</a>
    <a href="Gallery_01.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">GALLERY</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">THINGS TO DO <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">HOTEL & RESORT</a>
        <a href="#" class="w3-bar-item w3-button">SPA</a>
        <a href="#" class="w3-bar-item w3-button">ADVENTURS</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">HIRE FOR YOU <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">VEHICLE</a>
        <a href="#" class="w3-bar-item w3-button">TOUR GUIDE</a>
        <a href="#" class="w3-bar-item w3-button">DRIVERS</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">BOOK & REQUEST <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">TOUR PACKAGES</a>
        <a href="#" class="w3-bar-item w3-button">EVENT</a>
      </div>
    </div>
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG OUT</a>
    <a href="customerLogin.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG IN</a>   
    <a href="Register.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">SIGN IN</a>
    
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  </div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">ABOUT SRILANKA</a>
  <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MAP</a>
  <a href="Contacts.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">CONTACT</a>
  <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MERCH</a>
</div>
	
	
	
	<br><br><br><div class="form-style-5">
	
	<div class="form">
	
	<form action="VehicleRegister" name="form" method="post" enctype="multipart/form-data" onSubmit="return validation()">
	
	<h2><font color ="#00cc7a" size="8" >Register Your Vehicle</font></h2><br/>

								<label>Owner First Name</label>
                                <p><input type="text" class="form-control"  id="fname" name="fname" placeholder="First Name"    ></p>
                            
                            
                                <label>Owner Last Name</label>
                               <p> <input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name"   ></p>
                            
								<label>Contact Number</label>
                               <p> <input type="text" class="form-control"  id="phone" name="phone" placeholder="011999999"   ></p>
                               
                               <hr><br/>
                               								
								<label>Vehicle Type</label>
                                <p><select id="type" name="type" onchange="javascript: dynamicdropdown(this.options[this.selectedIndex].value);">
        
    									<option value="car">Car</option>
    									<option value="van">Van</option>
    									<option value="bus">Bus</option>
    									<option value="jeep">Jeep</option>
  								</select></p>
                                                       	                          
                            
                               <label>Model</label>
                               
                               <script type="text/javascript" language="JavaScript"> document.write('<select name="status" id="status"><option value="">Select </option></select>')
        					   </script>
        						
                               <p><noscript><select id="status" name="status">
            							<option value="bmw">BMW</option>
            							<option value="2">2</option>
        						</select></noscript></p>
                            
                                                                                   
                               <label>Register No</label>
                               <p> <input type="text" class="form-control"  name="noPlate" id="noPlate" placeholder="1234Xx" ></p>
                               
                           
                           
                                <label>Upload Image</label>
                                <p><input id="vehicle" type="file" name="avatar" id="avatar" ></p><br/>
                               
                                <label>Service Availability Status</label>
                               <p><input type="radio"  name="part" id="part" value="Available" />Available</input></p>
							   <p><input type="radio" name="part" id="part" value="Not available" />Not available</input></p><br/>
                                
                                <label>Facilities</label>
                                <p><textarea id="vehicle" type="text" placeholder="Features" name="features" id="features" ></textarea></p>   
                                
                                <hr><br/>                                                                                                                     
	
								<label>Do you agree with our <a href="terms.jsp"><u>Terms & Conditions</u></a>???</label>
                                <p><input type="radio"  name="terms" id="terms" value="Yes" />Yes</input></p>
							   	<p><input type="radio" name="terms" id="terms" value="No" />No</input></p><br/>
							   	
							   	<label>User Name</label>
                               <p> <input type="text" class="form-control"  id="username" name="username" placeholder="UserName" ></p>
                               
                               
                              
                               <label>Password</label>
                               <p><input type="text" class="form-control"  id="password" name="password" placeholder="Password"  ></p>
                              
                                
                               
                                <label>Confirm Password</label>
                                <p><input type="text" class="form-control"  id="cPassword" name="cPassword" placeholder="Re-Password" ></p>
                                
				
	<input type="submit" value="Register" name="submitButton" id="sButton">	
	
	</form>
	</div>
	</div>
	
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	
	</div>
	
	
</body>
</html>