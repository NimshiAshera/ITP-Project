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

<SCRIPT LANGUAGE="JavaScript">
	function validateform(form) {

		for (var i = 0; i < 2; i++) {
			if (form.elements[0].value == null || form.elements[0].value == "") {
				alert("Please enter the first name.");
				form.elements[0].value = "";
				form.elements[0].focus();
				return false;
			}

			if (!isNaN(form.elements[i].value)) {
				alert("First Name cannot only have numbers.");
				form.elements[i].value = "";
				form.elements[i].focus();
				return false;
			}
			if (form.elements[1].value == null || form.elements[1].value == "") {
				alert("Please enter the last name.");
				form.elements[1].value = "";
				form.elements[1].focus();
				return false;
			}

			if (!isNaN(form.elements[i].value)) {
				alert("Last Name cannot only have numbers.");
				form.elements[i].value = "";
				form.elements[i].focus();
				return false;
			}
		}

		var nic = document.C1.nic.value;
		var nicp = /^[0-9]{9}[vV]$/;

		if (nic == null || nic == "") {
			alert("Please enter the NIC number.");
			document.C1.nic.value = "";
			document.C1.nic.focus();
			return false;
		}

		if (!nic.match(nicp)) {
			alert("Invalid NIC number");
			document.C1.nic.value = "";
			document.C1.nic.focus();
			return false;
		}

		var gender = form.querySelectorAll('input[name="gender"]:checked');
		if (!gender.length) {
			alert('You must select male or female');
			return false;
		}

		var dateofbirth = document.C1.dateofbirth.value;
		var date = /^(\d{4})-(\d{1,2})-(\d{1,2})/;

		if (dateofbirth == null || dateofbirth == "") {
			alert("Please Entre the Date Of Birth");
			document.C1.dateofbirth.value = "";
			document.C1.dateofbirth.focus();
			return false;
		}

		if (!dateofbirth.match(date)) {
			alert("Invalid date format.");
			document.C1.dateofbirth.value = "";
			document.C1.dateofbirth.focus();
			return false;
		}

		var email = document.C1.email.value;
		var mail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

		if (email == null || email == "") {
			alert("Please enter the Email.");
			document.C1.email.value = "";
			document.C1.email.focus();
		}

		if (!email.match(mail)) {
			alert("Invalid Email address.");
			document.C1.email.value = "";
			document.C1.email.focus();
			return false;
		}

		if (!isNaN(document.C1.phone.value)) {
			if (document.C1.phone.value > 9999999999) {
				alert("please check the phone number.");
				document.C1.phone.value = "";
				document.C1.phone.focus();
				return false;
			}

			if (document.C1.phone.value < 99999999) {
				alert("please check the phone number.");
				document.C1.phone.value = "";
				document.C1.phone.focus();
				return false;
			}
		} else {
			alert("Phone Number must be number.");
			document.C1.phone.value = "";
			return false;
		}

		

		if (document.C1.password.value != document.C1.repassword.value) {
			alert("Check Confirm Password.");
			document.C1.repassword.value = "";
			document.C1.repassword.focus();
			return false;
		}

	}
</SCRIPT>


<script type="text/javascript">
	function click() {
		var sds = document.getElementById("num");
	}
</script>
        


<title>Hotel</title>
</head>
	
	
<body style="background:url(images/img01.gif) repeat;">
  <div id="wrapper">
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					
					<div class="post">
					
					
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
    <a href="driverSignin.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG IN</a>   
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">SIGN IN</a>
    
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
	
	<form action="OwnerS" method="post"  name="C1" onSubmit="return validateform(this)">
	
	<i style='font-size:48px' class='fas'>&#xf183;</i><h4><font color ="#00cc7a"><font size="8">Owner Registration</font></font></h4>
	
	
	
		                      <label>First Name</label>
                                <p><input type="text" class="form-control"  name="fusername" placeholder="First Name"  ></p>
                            
                            
                                <label> Last Name</label>
                               <p> <input type="text" class="form-control" name="lusername" placeholder="Last Name"  ></p>
                            
                            
                               <label>Address  </label>
                              <p>  <input type="text" class="form-control"  name="address" placeholder="Address"></p>
                            
                            
                               <label>NIC</label>
                               <p> <input type="text" class="form-control"  name="nic" placeholder="123456789V"></p>
                               
                           
                           
                               <label>Gender</label>
                              <p> <input type="radio" name="gender" id="gender" value="Male" />Male</input></p>
					<p><input type="radio" name="gender" id="gender" value="Female" />Female</input></p>
                            
                           
                            
                                <label>Date of Birth</label>
                                <p><input type="text" class="form-control"  name="dateofbirth" placeholder="yyyy-mm-dd"></p>
                           
                            
                                <label>Email</label>
                             <p>   <input type="text" class="form-control"  name="email" placeholder="tour@gmail.com"></p>
                           
                            
                           
                                <label>Phone Number</label>
                               <p> <input type="text" class="form-control"  name="phone" placeholder="011999999"></p>
                               
                                
                                
                                <label>User Name</label>
                               <p> <input type="text" class="form-control"  name="username" placeholder="UserName"></p>
                               
                                
                              
                               <label>Password</label>
                               <p> <input type="text" class="form-control"  name="password" placeholder="Password"></p>
                              
                                
                               
                                <label>Re-Password</label>
                              <p>  <input type="text" class="form-control"  name="repassword" placeholder="Re-Password"></p>
                                
		
		
		
		
	
	<input type="submit" value="Next" name="submitButton"
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