<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    
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
				}else if(!fname.match(Fname)){
					alert("Please insert letters only for first name");
					return false;
				}
			
			
			var lname=document.form1.lname.value;
			var Lname= /^[a-zA-Z]+$/;
			
				if(lname==""){
					alert("Please insert the last name");
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
				
			
			var phoneno = document.form1.phoneno.value;
			var Contact  =  /^[0-9]{10}$/;
				
				if(phoneno==""){
					alert("Please insert the contact number");
					return false;
				}else if(!phoneno.match(Contact)){
					alert("Please insert a correct contact number");
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

		<title>Staff Register</title>

		<%@ include file="styles.jsp" %>

</head>
                 

    <body class="w3-#e6ffee" style="background-color: #e6ffee">

        <%@ include file="navigationOwner.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px; background-color: light-grey">

            <!-- Header -->
            <header class="w3-container" style="padding-top:22px">
                
            <div class="form-style-5">
			<div class="form">
	
			<form action="StaffRegister" name="form1" method="post" enctype="multipart/form-data" onSubmit="return validation()">
	
			<i style='font-size:48px' class='fas'>&#xf183;</i><font color ="#00cc7a" size="8"> Staff Registration</font>
			
			
		<label>Designation</label>	
		<p><input type="radio" name="role" id="role" value="Customer Manager" />Customer Manager</input></p>
 		<p><input type="radio" name="role" id="role" value="Manager" />Service Manager</input></p>
		<p><input type="radio" name="role" id="role" value="Accountant" />Accountant</input></p>
		<p><input type="radio" name="role" id="role" value="Booking Manager" />Booking Manager</input></p>
		<p><input type="radio" name="role" id="role" value="Event Manager" />Event Manager</input></p>
		<p><input type="radio" name="role" id="role" value="Package Manager" />Package Manager</input></p>
		<p><input type="radio" name="role" id="role" value="Travel Manager" />Travel Manager</input></p><br><br>
 
 
		<label>First Name</label>
		<p><input type="text" class="form-control"  name="fname" id="fname" placeholder="Jone"   ></p>
                            
		<label> Last Name</label>
		<p> <input type="text" class="form-control" name="lname" id="lname" placeholder="Silva"  ></p>
                            
		<label>NIC</label>
		<p> <input type="text" class="form-control"  name="nic" id="nic" placeholder="123456789V"   ></p>
                               
                               
		<label>Contact Number</label>
		<p> <input type="text" class="form-control"  name="phoneno" id="phone" placeholder="011999999" ></p>
         
		<label>Email</label>
		<p><input type="text" class="form-control"  name="email" id="email" placeholder="tour@gmail.com"   ></p>
                           
 		<label>User Name</label>
 		<p> <input type="text" class="form-control"  name="username" id="username" placeholder="UserName"  ></p>                              
                                                             
		<label>Password</label>
		<p> <input type="text" class="form-control"  name="password" id="password" placeholder="Password"  ></p>
                                                                                        
		<label>Confirm Password</label>
		<p><input type="text" class="form-control"  name="cPassword" id="cPassword" placeholder="Re-Password"  ></p>
                             
  
		<input type="submit" value="Register" name="submitButton"
					id="sButton">		
	</form>
			
	</div>
	</div>
                
                
           </header>

            <div class="w3-panel">
                <div class="w3-row">
                    <div class="w3-col w3-center">

                    </div>
                </div>
            </div>

            <%@ include file="scripts.jsp" %>
        </div>
        
        
        <div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
	<!-- End page content -->
	
        
    </body>