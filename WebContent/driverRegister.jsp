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
			
			
			var nic = document.form1.nic.value;
			var NIC =  /^[0-9]{9}[vV]$/;
			
			
				if(nic==""){
					alert("Please insert the NIC");
					return false;
				}else if(!nic.match(NIC)){
					alert("Please insert a valid NIC");
					return false;
				}
				
			var email = document.form1.email.value;
			var Email =  /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			
				if(email==""){
					alert("Please insert the email address.");
					return false;
				}else if(!email.match(Email)){
					alert("Please insert a valid email address");
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
			
				
				
			var avatar = document.form1.avatar.value;
				
				if(avatar==""){				
					alert("Insert a image");
					return false;
				}	
						
			

			var license = document.form1.license.value;
			var License = /^[A-Z]{1}[0-9]{7}$/;
			
				if(license==""){
					alert("Please insert the driving license number");
					return false;
				}else if(!license.match(License)){
					alert("Please insert a valid driving license number");
					return false;
				}
			
				
			var dI = document.form1.dI.value;
		
			
			
				if(dI==""){
					alert("Insert the license issued date");
					return false;
				}
				
				
			var dE = document.form1.dE.value;
		
			
				if(dE==""){				
					alert("Insert the license expire date");
					return false;
				}
				
		
				
			var part = document.form1.part.value;
			
				if(part==""){
					alert("Please select the availability status");
					return false;
				}
				
				
			var part1 = document.form1.part1.value;
				
				if(part1==""){
					alert("You must agree to our terms & conditions to proceed your registration.");
					return false;
				}else if(part1=="t2")	{
					alert("You must agree to our terms & conditions to proceed your registration");
					return false;
				}	
			
			
			var username = document.form1.username.value;
			
				if(username==""){
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

<title>Driver</title>

</head>
	

<body style="background:url(images/img01.gif) repeat;">


<!----Register form------------>

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
	
	<form action="DriverRegister" name="form1" method="post" enctype="multipart/form-data" onSubmit="return validation()">
	
	<i style="font-size:48px" class="fa">&#xf1cd;</i><h2><font color ="#00cc7a" size="8" >Register As A Driver</font></h2><br/>
	
								<label>First Name</label>
                                <p><input type="text" class="form-control"  name="fname" id="fname" placeholder="First Name"   ></p>
                            
                            
                                <label> Last Name</label>
                               <p> <input type="text" class="form-control" name="lname" id="lname" placeholder="Last Name"  ></p>
                            
                                                                                   
                               <label>NIC</label>
                               <p> <input type="text" class="form-control"  name="nic" id="nic" placeholder="123456789V"   ></p>
                               
                           
                               <label>Email</label>
                               <p><input type="text" class="form-control"  name="email" id="email" placeholder="tour@gmail.com"   ></p>
                           
                                                      
                               <label>Contact Number</label>
                               <p> <input type="text" class="form-control"  name="phone" id="phone" placeholder="011999999"   ></p>
                               
                               
                               <label>Upload Image</label>
                               <p><input type="file" name="avatar" id="avatar"></p><br/>
                               
                               <hr><br/>
                               
                               <label>License Number</label>
                               <p> <input type="text" class="form-control"  name="license" id="license" placeholder="A0000000"   ></p>
                               
                               
                               <label>Date Issued</label>
                               <p> <input type="date" class="form-control"  name="dI" id="dI"  ></p>
                               
                               
                               <label>Date Expired</label>
                               <p> <input type="date" class="form-control"  name="dE" id="dE"  ></p>
                               
                                                                                                                           
                               <label>Service Availability Status</label>
                               <p><input type="radio"  name="part" id="part" value="Available" />Available</input></p>
							   <p><input type="radio" name="part" id="part" value="Not available" />Not available</input></p><br/>
							   
							   <hr><br/>
							 
                               <label>Do you agree with our <a href="terms.jsp"><u>Terms & Conditions</u></a>???</label>
                               <p><input type="radio"  name="terms" id="terms" value="Yes" />Yes</input></p>
							   <p><input type="radio" name="terms" id="terms" value="No" />No</input></p><br/>
							    
                                
                               <label>User Name</label>
                               <p> <input type="text" class="form-control"  name="username" id="username" placeholder="UserName"  ></p>                              
                               <tr>
								<td></td>
								<td style="font-size: 20px; color: red;">${modelExist}</td>
							   </tr> 
                                
                                                             
                               <label>Password</label>
                               <p> <input type="password" class="form-control"  name="password" id="password" placeholder="Password"  ></p>
                                                                                        
                               <label>Confirm Password</label>
                               <p><input type="password" class="form-control"  name="cPassword" id="cPassword" placeholder="Re-Password"  ></p>
                             
							   
							   
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