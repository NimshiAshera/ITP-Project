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

<title>Adventure Company</title>

<script type="text/javascript" >
		function validation(){

			var part = document.form1.part.value;
			
			if(part==""){
				alert("Please select an option.");
				return false;
			}
		
			
			var name=document.form1.name.value;
						
				if(name==""){
					alert("Please insert the company name");
					return false;
				}else if(!isNaN(fname)){
					alert("Please insert a valid  name");
					return false;
				}
			

			var contact_no = document.form1.contact_no.value;
			var Phone =  /^[0-9]{10}$/;
				
				if(contact_no==""){
					alert("Please insert the contact number");
					return false;
				}else if(!contact_no.match(Phone)){
					alert("Please insert a correct contact number");
					return false;
				}
			
				
				
			var avatar = document.form1.avatar.value;
				
				if(avatar==""){				
					alert("Insert a image");
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
			
			var cpassword = document.form1.cpassword.value;
				
				if(cpassword==""){
					alert("Please insert your password again");
					return false;
				}else if(!password.match(cpassword)){
					alert("Password not matching. Check again");
					return false;
				}	
								
				
		}


</script>


</head>
	
<body style="background:url(images/91.jpg) repeat;">
  <div id="wrapper">
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					
					<div class="post">
					
					
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


						<div class="container">
					
					<br><br><br><div class="form-style-5">

	
	<div class="form">
	
	<form action="AdventureRegister" name="form1" method="post" enctype="multipart/form-data" onSubmit="return validation()">
	
	<i style='font-size:48px' class='fas'>&#xf6ec;</i><h2><font color ="#00cc7a" size="8">Adventure Company Registration </font></h2>
	<br>
	
	                          	<label>Whale Watching  / Wild Safari </label>	                          	
                              	<p><input type="radio" name="part" id="part1" value="Whale Watching" />Whale Watching</input></p>
							  	<p><input type="radio" name="part" id="part2" value="Wild Safari" />Wild Safari</input></p>
							
							  
							    <hr><br/>
                            
	
		                        <label>Company Name</label>
                                <p><input type="text" class="form-control"  name="name" placeholder=" Name"  ></p>
                                
  
                                <label>Contact Person No.  </label>
                                <p><input type="text" class="form-control"  name="contact_no" placeholder="Contact No"></p>
                                                                                                                                    
                                
                                <hr><br/>
                                
                                
                                <label>Image</label>
                                <p><input type="file" class="form-control"  name="avatar" size="4000000" ></p><br>
                               
                                <label>Adventure Details</label>
                                <p><textarea  type="text" placeholder="Details" name="details" ></textarea></p>
                                
                                <label>Best Season</label>
                                <p><textarea  type="text" placeholder="When is best?" name="season" ></textarea></p>
                                
                                <label>What can be seen?</label>
                                <p><textarea  type="text" placeholder="" name="see" ></textarea></p>
                                
                                <label>How long is the trip?</label>
                                <p><textarea type="text" placeholder="" name="time" ></textarea></p>
                                
  
                                <label>Service Availability Status</label>
                               	<p><input type="radio"  name="avb" id="avb" value="Available" />Available</input></p>
							   	<p><input type="radio" name="avb" id="avb" value="Not available" />Not available</input></p><br/>
                           
                           
                            	<hr><br/>
                   
                            
                                <label>User Name</label>
                                <p><input type="text" class="form-control"  name="username" placeholder="User Name"></p>
                                
                                                                              
                                <label>Password</label>
                                <p><input type="password" class="form-control"  name="password" placeholder="Password"></p>
                               
                               	
                               	<label>Confirm Password</label>
                                <p><input type="password" class="form-control"  name="cpassword" placeholder="cPassword"></p>
                                                               
		
	
	<input type="submit" value="Submit" name="submitButton"
					id="sButton">	
	</form>
	</div>
	</div>
	
	</div>
					</div>
					</div>
					</div>
					</div>
					
					<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
					
					</div>

</body>
	

</html>