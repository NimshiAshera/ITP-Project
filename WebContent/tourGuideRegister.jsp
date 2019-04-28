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

<script type="text/javascript" >
		function validation(){
			
			
			var fname=document.form.fname.value;
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
			
			
			var lname=document.form.lname.value;
			var Lname= /^[a-zA-Z]+$/;
			
				if(lname==""){
					alert("Please insert the last name");
					return false;
				}else if(!isNaN(lname)){
					alert("Please insert a valid last name");
					return false;
				}else if(!lname.match(Lname)){
					alert("Please insert letters only for last name");
					return false;
				}
			
			
			var nic = document.form.nic.value;
			var NIC =  /^[0-9]{9}[vV]$/;
			
			
				if(nic==""){
					alert("Please insert the NIC");
					return false;
				}else if(!nic.match(NIC)){
					alert("Please insert a valid NIC");
					return false;
				}
				
				var image = document.form.image.value;
				
				if(image==""){				
					alert("Insert a image");
					return false;
				}	
				
			var email = document.form.email.value;
			var Email =  /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			
				if(email==""){
					alert("Please insert the email address.");
					return false;
				}else if(!email.match(Email)){
					alert("Please insert a valid email address");
					return false;
				}
				
			
			var phone = document.form.phone.value;
			var Phone =  /^[0-9]{10}$/;
				
				if(phone==""){
					alert("Please insert the contact number");
					return false;
				}else if(!phone.match(Phone)){
					alert("Please insert a correct contact number");
					return false;
				}
			
				
			var language = document.form.language.value;
			var Language= /^[a-zA-Z\,]+$/;
			
				if(language==""){
					alert("Please fill remaining fields");
					return false;
				}else if(!language.match(Language)){
					alert("Please insert letters only");
					return false;
				}
				
			var part = document.form.part.value;
			
				if(part==""){
					alert("Please select the category you belong");
					return false;
				}
				
			var license = document.form.license.value;
			var License = /^[A-Z]{1}[-]{1}[0-9]{4}$/;
			
				if(license==""){
					alert("Please insert the tourism ID number");
					return false;
				}else if(!license.match(License)){
					alert("Please insert a valid tourism ID number");
					return false;
				}
			
				
			var dI = document.form.dI.value;
		
			
			
				if(dI==""){
					alert("Insert the license issued date");
					return false;
				}
				
				
			var dE = document.form.dE.value;
			 
			
				if(dE==""){				
					alert("Insert the license expire date");
					return false;
				}
				
				
			
			
			
				
			var part1 = document.form.part1.value;
			
				if(part1==""){
					alert("Please select the availability status");
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
			
			var uname = document.form.uname.value;
			
				if(uname==""){
					alert("Please insert a user name");
					return false;
				}
				
				
			var password = document.form.password.value;
				
				if(password==""){
					alert("Please insert a password");
					return false;
				}	
			
			var cPassword = document.form.cPassword.value;
				
				if(cPassword==""){
					alert("Please insert your password again");
					return false;
				}else if(!password.match(cPassword)){
					alert("Password not matching. Check again");
					return false;
				}	
				
		
				
				
		}


</script>

<title>Tour Guide</title>
</head>

<body style="background:url(images/img01.gif) repeat;">
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
	
	
	<br><br><br><div class="form-style-5">
	
	<div class="form">
	
	<form action="TourGuideRegister" name="form1" method="post" enctype="multipart/form-data" onSubmit="return validation()">
	
	<i style='font-size:48px' class='fas'>&#xf3c5;</i><h2><font color ="#00cc7a" size="8" >Register As A Tour Guide</font></h2><br/>
	
								<label>First Name</label>
                                <p><input type="text" class="form-control"  id="fname" name="fname" placeholder="First Name"    ></p>
                            
                            
                                <label> Last Name</label>
                               <p> <input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name"   ></p>
                            
                                                                                   
                               <label>NIC</label>
                               <p> <input type="text" class="form-control"  id="nic" name="nic" placeholder="123456789V"   ></p>
                                <tr>
								<td></td>
								<td style="font-size: 20px; color: red;">${modelExist}</td>
							    </tr>
                               
                               
                               <label>Upload Image</label>
                               <p><input type="file" class="form-control"  name="avatar" id="avatar" size="4000000" accept="image/x-png,image/jpg,image/jpeg"></p><br/>
                           
                               <label>Email</label>
                               <p><input type="text" class="form-control"  id="email" name="email" placeholder="tour@gmail.com"   ></p>
                           
                                                      
                               <label>Contact Number</label>
                               <p> <input type="text" class="form-control"  id="phone" name="phone" placeholder="011999999"   ></p>
                               
                               <hr><br/>
                               
                               <label>Languages </label>
                               <p> <input type="text" class="form-control"  id="language" name="language" placeholder="English"   ></p>
                                               
                               <label>Category</label>
                               <p><input type="radio" name="part" id="part" value="National Tourist Guide" />National Tourist Guide</input></p>
							   <p><input type="radio" name="part" id="part" value="Chauffeur Tourist Guide" />Chauffeur Tourist Guide</input></p><br/>
					
                                                              
                               <label>License Number</label>
                               <p> <input type="text" class="form-control"  id="license" name="license" placeholder="X-1111"   ></p>
                               
                               
                               <label>Date Issued</label>
                               <p> <input type="date" class="form-control"  id="dI" name="dI"    ></p>
                               
                               
                               <label>Date Expired</label>
                               <p> <input type="date" class="form-control"  id="dE" name="dE"  ></p>
                               
                               
                                
                                
                               <label>Service Availability Status</label>
                               <p><input type="radio"  name="part1" id="part1" value="Available" />Available</input></p>
							   <p><input type="radio" name="part1" id="part1" value="Not available" />Not available</input></p><br/>
					
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
                             
								
                             
	
	
	<input type="submit" value="Register" name="submitButton"
					id="sButton">		
	</form>
	</div>
	
	<h1 style="font-size: 40px; color: red;">${insertUnsuccess}</h1>
	
	</div>
	
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	
	</div>
		
</body>
</html>