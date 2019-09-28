<%@page import="Adventure.Adventure"%>
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

<title>Adventure profile</title>

</head>

<body style="background-color:white">

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
	
	
	
	<br><br><br>
	
	<div class="form-style-5">
		<div class="form">
	
				<table border="1" cellpadding="12">
					<%
					Adventure adventure=(Adventure)request.getAttribute("adventure");
					%>
				
					
					<h2 align="center" style="color:green"><b>Details of <%=adventure.getName()%> </b></h2>
				
				
				
					
					<label style="font-size:20px"><b>Company Type:</b> <%=adventure.getPart()%></label>
					
					<hr/>
					
					<label style="font-size:20px"><b>Contact No. :</b> <%=adventure.getContact_no()%> </label>
					
					<hr/>
					
					<label style="font-size:20px"><b>Image :</b> <img src="Adventure/<%=adventure.getAvatar() %>"  width="500" height="400">
												
												
												<form method="post" action="AdventureImage">
												<br/>
													<input type="hidden" name="username" value="<%=session.getAttribute("username")%>" /> 
													<input type="submit" value="Edit Image" class="select-button" />
												</form>
					</label>
					
					<hr/>
					
					<label style="font-size:20px"><b>Details : </b><%=adventure.getDetails()%> </label>
					
					<hr/>
					
					<label style="font-size:20px"><b>Best Season : </b><%=adventure.getSeason()%> </label>
					
					<hr/>
					
					<label style="font-size:20px"><b>What can be seen? : </b><%=adventure.getSee()%> </label>
					
					<hr/>
					
					<label style="font-size:20px"><b>Trip Time Duration : </b><%=adventure.getTime()%> </label>
					
					<hr/>
					
					<label style="font-size:20px"><b>Availability : </b><%=adventure.getAvb()%> 
					
												<form method="post" action="AdventureProfile">
												<br/>
													<input type="hidden" name="username" value="<%=session.getAttribute("username")%>" /> 
													<input type="submit" value="Update Avability" class="select-button" />
												</form>
					
					</label>
					
					<hr/>
					
					<label style="font-size:20px"><b>User Name : </b><%=adventure.getUsername()%> </label>
					
					<hr/>
					
					<label style="font-size:20px"><b>Password : </b><%=adventure.getPassword()%> </label>				
					
												
												<form method="POST" action="AdventureProfile2">
													<input type="hidden" name="username" value="<%=session.getAttribute("username")%>" /> 
													<input type="submit" value="Update Other Details" class="select-button" />
												</form>
												
												<div class="form-style-5">
					<div class="form">
					<input type="submit" id="dButton" onclick="myFunction()" value="Delete Your Profile">
					<script>
					function myFunction() {
		    		if (confirm("THINK TWICE ! If you pressed \"ok\" your account will be deleted permanently..")) {
    					window.location.href = "DeleteAdventure";
    				} else {
    					window.location.href = "Home.jsp";
    					window.location.href = "Header.jsp";
    				}
					}
		</script>
		</div>
		</div>
												
												
										  
					
				</table>
		</div>		
	</div>
	
	
	
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
	</div>
		
</body>
</html>