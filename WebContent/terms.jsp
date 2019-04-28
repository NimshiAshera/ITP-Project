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


<script type="text/javascript" src=""></script>

<title>Terms & Conditions</title>


<style type="text/css">

/*---terms & conditions---*/

.terms h2{
	font-size: 2.5em ;
	color: #00cc7a ;
	font-family: 'Oswald', sans-serif ;
	text-align: center;
}

.terms p{
	font-size: 1.5em;
	font-family: Georgia, "Times New Roman", Times, serif;
	margin-left: 10px;
}

</style>
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
	
	
		<br/><br/><br/><br/><br/><br/>
	
		<div class="terms">
	
		<h2>Our Terms & Conditions</h2>
			<br/>
			
			<p>When You Are Registering As A Business Partner Of Our Company....</p>
	
				<p><span>&#10033;</span>All information received by us upon your registration will be used 
				in accordance with our Privacy Policy. Kindly read the below mentioned details.</p>

				<p><span>&#10033;</span>On registration, we expect you to provide an accurate and complete information 
				of the compulsory fields. We also expect you to keep the information secure, 
				specifically user name & access password. Kindly update the information 
				periodically to keep your account relevant. Business Standard will rely on 
				any information you provide to us.</p> 

				<p><span>&#10033;</span>Each registration is for a single user only. You are not allowed to give access to 
				your account to anyone else.</p> 

				<p><span>&#10033;</span>On knowledge, we may cancel or suspend your access to our site if it comes across you 
				sharing your personal access without further obligation to you. </p>
				
				<p><span>&#10033;</span>When you received a payment from a traveler, you must provide us with 
				complete and accurate payment information. <u>Along with that we must received 
				<b>15% of initial payment</b> to our bank account within two days of initial payment 
				received date.</u> If not we may cancel or suspend your access to our site.</p>
				
				<p><span>&#10033;</span>When registering your business you must provide accurate prices of you services, 
				as we are calculating the total prices upon your details & send total pricing details 
				to the travelers.</p>
				
				<p><span>&#10033;</span>You must provide value & respect all of your customers & provide an unforgettable service
				to them on their tour.</p>
		</div>
		<br><br><br>
		<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
				
	</div>
	
</body>
</html>