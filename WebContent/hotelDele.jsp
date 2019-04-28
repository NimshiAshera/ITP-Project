<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>

<title>Clientele</title>
</head>
<body>


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

	
	<div class="container-fluid">
		<div class="row">
			
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
			<div class=" pb-2 mb-3 border-bottom">
				<div class="row">
					<div class="col-8"><h1 class="h2">Hotels
					 & Resorts.</h1></div>
					<div class="col float-right">
						<div class="alert ${message_color} alert-dismissible fade show" role="alert">
						  ${message}
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						    <span aria-hidden="true">&times;</span>
						  </button>
						</div>
					</div>
				</div>
			</div>

			<!--Main content-->
			<div class="col pb-2 mb-3">

				<div class="row mt-4">
					<div class="col-12">
						<table class="table">
							<thead class="thead-dark">
								<h1>Hotel & Resorts Delete</h1><br>
								<h4>Warning ! If You Enter User Name Delete All Details of Related Hotel or Resorts.</h4><br>
							</thead>
							
							
							
						
        
					 <form action="AdminDelHotel" method="post" >			
								
									
			<table align="center">
				
				
     			<tr><td style="width:175px">User name:</td>
         		<td><input type="text" placeholder="User name" name="username" required></td></tr>
         				<tr><br></tr><tr></tr><tr></tr>		 
     			 <tr><td></td><td><button  type="submit" name="submit">DELETE</button></td></tr>
			
        
									
									
							
			
							
							 
						</table>
						</form>
					</div>
				</div>

				<!--End of main content-->
			</main>
		</div>
	</div>
	
</body>
</html>