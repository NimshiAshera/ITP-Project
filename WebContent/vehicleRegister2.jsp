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
		
	
		var noPlate = document.form.noPlate.value;
		var NoPlate =  /^[0-9]{4}[A-Z]{1}[a-z]{1}$/;
		
		
			if(noPlate==""){
				alert("Please insert the vehicle registered number");
				return false;
			}else if(!noPlate.match(NoPlate)){
				alert("Please insert a valid vehicle registered number");
				return false;
			}
			
		var hire = document.form.hire.value;
			
			if(hire==""){
				alert("Please enter the per a kilometer");
				return false;
			}else if(hire==0 || hire<50){
				alert("Please enter the per a kilometer. Hire should be greater then 50.00 rupees.");
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
			
			
	}
    
    
    </script>



</head>
			

<body>
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
    <a href="customerRegister.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">SIGN IN</a>
    
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
	
	<form action="" name="form" method="post" enctype="multipart/form-data" onSubmit="return validation()">
	
	<h2><font color ="#00cc7a" size="8" >Register Your Vehicle</font></h2><br/>

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
                               
                           
                               <label>Hire per Kilometer</label>
                               <p><input type="number" class="form-control"  min="0" name="hire" id="hire"  placeholder="50.00" ></p>
                           
                            
                           
                                <label>Upload Image</label>
                                <p><input id="vehicle" type="file" name="image" id="image" ></p><br/>
                               
                                <label>Service Availability Status</label>
                               <p><input type="radio"  name="part" id="part" value="a1" />Available</input></p>
							   <p><input type="radio" name="part" id="part" value="a2" />Not available</input></p><br/>
                                
                                <label>Facilities</label>
                                <p><textarea id="vehicle" type="text" placeholder="Features" name="features" id="features" ></textarea></p>                                                                                                                        
	
								<label>Do you agree with our <a href="terms.jsp"><u>Terms & Conditions</u></a>???</label>
                                <p><input type="radio"  name="terms" id="terms" value="t1" />Yes</input></p>
							   	<p><input type="radio" name="terms" id="terms" value="t2" />No</input></p><br/>
				
	<input type="submit" value="Register" name="submitButton" id="sButton">	
	
	</form>
	</div>
	</div>
	
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	
	</div>
	
	
</body>
</html>