<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="contact-us.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
</head>
<%@include file="header.jsp"%>

<body>
	
	<div class="container">
			<h4>More Than Just A WebSite...</h4>
			<h5>Plan Your Ideal Tour <span style="padding-left: 40px; "></span>Build Your Business</h5>
			<img src="images/b13.png" width="790px" height="300px" >
			<div class="box">
				<div class="left-box">
				
				<form>

					<fieldset>
					<legend><span class="number">*</span> Get in Touch..</legend>
					<input type="text" name="field1" placeholder="Your Name *">
					<input type="email" name="field2" placeholder="Your Email *">
					<textarea type="text" name="field3" placeholder="Your Message *"></textarea>
					</fieldset>				
					
				<input type="submit" value="SUBMIT" name="submitButton" id="sButton">	
	
				</form>
				</div>
	
				<div class="right-box">
					<fieldset>
					<legend><span class="number">*</span>Connect us..</legend>
					<p class="second">For any questions</p>
					<p class="third">Email us at </br >eco-tours@yahoo.com </br></br>
									Contact us on </br> +94 11 234 5678
					
					
					</p>
					</fieldset>
				</div>
			</div>
	</div>
	
		
</body>
</html>