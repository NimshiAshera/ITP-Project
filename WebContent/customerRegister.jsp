<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src=""></script>
<link rel="stylesheet" type="text/css" href="formcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>



</head>
<%@include file="header.jsp"%>

<body>

<div id="wrapper">
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					
					<div class="post">
					
					
					<br><br><br><div class="form-style-5">


<form action="" method="post" enctype="multipart/form-data">
<fieldset>
<legend><span class="number">1</span> Customer Registration</legend>


 
<input type="text" name="fusername" placeholder=" First Name *" required oninput="this.className = ''">
<input type="text" name="lusername" placeholder=" Last Name *" required oninput="this.className = ''">
<input type="text" name="address" placeholder=" address *" required oninput="this.className = ''">
<input type="text" name="nic" placeholder=" (NIC)123456789V *" required oninput="this.className = ''">
<p><input type="radio" name="gender"  value="Male" />Male</input></p>
<p><input type="radio" name="gender" id="gender" value="Female" />Female</input></p>
<input type="text" name="dateofbirth" placeholder=" (DOB)yyyy-mm-dd" required oninput="this.className = ''">
 <input type="text" name="email" placeholder="(Email)tour@gmail.com" required oninput="this.className = ''">
 <input type="text" name="phone" placeholder="(Phone-No)011999999" required oninput="this.className = ''">
  <input type="text" name="username" placeholder="UserName" required oninput="this.className = ''"> 
  <input type="text" name="password" placeholder="Password" required oninput="this.className = ''">
  <input type="text" name="repassword" placeholder="Re-Password" required oninput="this.className = ''">
  
</fieldset>

<input type="submit" value="Submit" />
</form>
	<a href="driverRegister.jsp"><font size="5">Register As A Driver</font></p></a>
	<a href="vehicleRegister1.jsp"><font size="5">Register As A Vehicle Owner</font></p></a>
	<a href="tourGuideRegister.jsp"><font size="5">Register As A Tour Guide</font></p></a>
		<font size="5">Register As A Owner</font></p>
			<div class="dropdown-content">
			
			<li><a href="">Spa..</a></li><br/>
			<li><a href="">Restaurant</a></li><br/>
			<li><a href="test1.jsp">Hotel</a></li><br/>
			<li><a href="">Adventure Company</a></li><br/>
			
			</div>
	<a href="#"><font size="5">Register Tour Packages</font></p></a>
	<a href="#"><font size="5">Register Traveling Places</font></p></a>

	
</div>
					
					
					</div>
					</div>
					</div>
					</div>
					</div>
					</div>
<%@include file="footer.jsp"%>
</body>
</html>