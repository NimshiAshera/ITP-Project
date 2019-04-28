<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



 <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<%
String uname=(String)session.getAttribute("username");
%>
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
	
	
	
					
					
	<%
  if(session.getAttribute("username") != null){
	  String username = (String) session.getAttribute("username");
	  
  
 try { 
	 
      Class.forName("com.mysql.jdbc.Driver").newInstance();
            
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root","root");
   
            PreparedStatement ps = con.prepareStatement("select * from owner where username='"+username+"'");
            
               ResultSet rs = ps.executeQuery();
               rs.next();
               
               
        %>

		<form method="post" action="UpdateOwner">
	
	
	
	
	
	

		
		    <br><center><font size="4">Update Owner Details</font></center><br><br>
			<br><center><font size="5">Detail Information of <%=rs.getString(1)%> <%=rs.getString(2)%></font></center><br><br>
			
			<div class="container">


  <table class="table">
   
    <tbody>
   
			<tr class="Customer First Name">
				<td>Customer First Name:</td>
				<td><input type="text" name="Fname" id="Fname" class="form-control"
					value="<%=rs.getString(1)%>" disabled /></td>
					
			</tr>
			<tr>
				<td>Customer Last Name:</td>
				<td><input type="text" name="Lname" id="Lname" class="form-control"
					value="<%=rs.getString(2)%>" disabled /></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><input type="text" name="Address" id="Address" class="form-control"
					value="<%=rs.getString(3)%>" /></td>
			</tr>
			<tr>
				<td>National Identity card No:</td>
				<td><input type="text" name="NIC" id="NIC" class="form-control"
					value="<%=rs.getString(4)%>" disabled/></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><input type="text" name="Gender" id="Gender" class="form-control"
					value="<%=rs.getString(5)%>" disabled/></td>
			</tr>
			<tr>
				<td>Date Of Birth:</td>
				<td><input type="text" name="DOB" id="DOB" class="form-control"
					value="<%=rs.getString(6)%>" disabled/></td>
			</tr>
			<tr>
				<td>Email Address:</td>
				<td><input type="text" name="Email" id="Email" class="form-control"
					value="<%=rs.getString(7)%>" /></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><input type="text" name="PhoneNo" id="PhoneNo" class="form-control"
					value="<%=rs.getString(8)%>" /></td>
			</tr>
			
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="username" id="username" class="form-control"
					value="<%=rs.getString(9)%>" disabled/></td>
			</tr>
			
			<tr><td><input type="submit" value="Update" class="btn btn-warning"></td></tr>
			<tr>
			<td><a href="hotelUpdate.jsp" class="btn btn-info btn-sm"><i class="fas fa-spinner"></i> <span class="glyphicon glyphicon-circle-arrow-right"></span><font size="4"> Update Hotel Details</font></a></td>
			<td><a href="spaUpdate.jsp"class="btn btn-info btn-sm"><i class="fas fa-spinner"></i><font size="4"> Update Spa Details</font></a></td>
			</tr>
			</tbody>
			</div>
		</table>
	</form>
	<br><center><a href="deleteOwner.jsp" class="btn btn-danger ml-2 btn-sm"><i class="fas fa-trash-alt"></i><font size="5"> Remove My Details</font></a></center><br><br><br>
	
	        <%
              
      rs.close();
        ps.close();
        con.close();
      }catch(Exception e){System.out.println(e);}
      
      }else
{
   response.sendRedirect("Login.jsp?id=Your session may be expired. You have to login first");

  
}

        %>

</div>

 <br/> <br/> <br/>

<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
					
					</div>
					
					</div>
					</div>
					</div>
					</div>
					</div>
					</div>

</body>
</html>