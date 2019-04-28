<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src=""></script>
<link rel="stylesheet" type="text/css" href="">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>


<title>Insert title here</title>



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
	
	
					<%
  if(session.getAttribute("username") != null){
	  String username = (String) session.getAttribute("username");
	  
  
 try { 
	 
      Class.forName("com.mysql.jdbc.Driver").newInstance();
            
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root","root");
   
            PreparedStatement ps = con.prepareStatement("select * from hotel10 where username='"+username+"'");
            
               ResultSet rs = ps.executeQuery();
               rs.next();
               
               
        %>

		<form action="DelHotel">
	

		
			 <br><br><center><font size="4">Delete Hotel Details</font></center>
			<br><br><center><font size="5">Detail Information of <%=rs.getString(1)%> <%=rs.getString(2)%></font></center><br><br>
			 <div class="container">
			 <table class="table">
			 
   
    <tbody>
			<tr class="Customer First Name">
				<td>Hotel ,Restaurant Or Resort:</td>
				<td><%=rs.getString(1)%></td>
			</tr>
			<tr>
				<td>Name:</td>
				<td><%=rs.getString(2)%></td>
			</tr>
			<tr>
				<td>Hotel_ID:</td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<tr>
				<td>Image:</td>
				<td><img src="<%=rs.getString("imagelocation")%>"></td>
			<tr>
				<td>Facilities:</td>
				<td><%=rs.getString(5)%></td>
			</tr>
			<tr>
				<td>Activities:</td>
				<td><%=rs.getString(6)%></td>
			</tr>
			
			
			<tr>
				<td>Food:</td>
				<td><%=rs.getString(7)%></td>
			</tr>
			<tr>
				<td>Reception Services:</td>
				<td><%=rs.getString(8)%></td>

			</tr>
			<tr>
				<td>Cleaning Services:</td>
				<td><%=rs.getString(9)%></td>

			</tr>
			<tr>
				<td>Pool:</td>
				<td><%=rs.getString(10)%></td>

			</tr>
			<tr>
				<td>Rooms:</td>
				<td><%=rs.getString(11)%></td>

			</tr>
			<tr>
				<td>Address:</td>
				<td><%=rs.getString(12)%></td>

			</tr>
			<tr>
				<td>User Name:</td>
				<td><%=rs.getString(13)%></td>

			</tr>
			
			
			
			<tr><td></td>
				<td><br><br><input type="submit" value="Delete" class="btn btn-danger"></td>
			</tr>
		</tbody>
		</table>
	</form>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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