<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src=""></script>


<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="formpks.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<style>
body{
background-image:url("images/90.jpg");
background-color:;
}
</style>

</head>

<body>

<div id="wrapper">
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					
					<div class="post">
					
					
						<!-- Navbar -->

	<%
		if (session.getAttribute("uname") == null  ||  session.getAttribute("username") == null) {
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

<br/>
 <center><font size="5">What do you want to register?</font></center><br><br>
<fieldset>
<legend> <font size="5">HOTEL </font></legend>
 <center><a href="test2.jsp"><img src="images/icon2.png" width="170" height="170" style="float:center"> </a> </center>  
</fieldset><br><br>
 
 
  <fieldset>
<legend> <font size="5">SPA</font></a></legend>
<center><a href="test5.jsp"><img src="images/icon1.png"   width="170" height="170" style="float:center">  </a></center>
</fieldset><br><br>


 <fieldset>
<legend> <font size="5">ADVENTURE</font></a></legend>
<center><a href="adventureCompaniesRegister.jsp"><img src="images/icon3.png"   width="170" height="170" style="float:center">  </a></center>
</fieldset><br><br>


 

			
			</div>

</div>
					
					</div>
<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
					</div>
					</div>
					</div>
					</div>
					</div>
					</div>

</body>
</html>