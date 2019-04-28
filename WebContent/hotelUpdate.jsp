<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<script type="text/javascript" src=""></script>
<link rel="stylesheet" type="text/css" href="">


 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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
        <a href="viewOwnerhotel.jsp" class="w3-bar-item w3-button">HOTEL & RESORT</a>
        <a href="viewOwnerspa.jsp" class="w3-bar-item w3-button">SPA</a>
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
    <a href="OwnerLogout" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG OUT</a>
    <a href="ownerSignin.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG IN</a>   
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

		<form method="post" action="UpdateHotel">
	

		
		    <br><center><font size="4">Update Hotel & Resort Details</font></center>
			<br><center><font size="5">Detail Information of <%=rs.getString(1)%> <%=rs.getString(2)%></font></center><br>
			 <div class="container">
			 <table class="table">
			 
   
    <tbody>
			<tr class="Customer First Name">
			
				<td>Hotel & Resort:</td>
				<td><input type="text" name="part" id="part" class="form-control"
					value="<%=rs.getString(1)%>" disabled /></td>
			</tr>
			<tr>
				<td>Hotel Or Restaurant Name:</td>
				<td><input type="text" name="name" id="name" class="form-control"
					value="<%=rs.getString(2)%>" disabled /></td>
			</tr>
			<tr>
				<td>Hotel ID:</td>
				<td><input type="text" name="hotel_id" id="hotel_id" class="form-control"
					value="<%=rs.getString(3)%>" disabled/></td>
			</tr>
			
			<tr>
				<td>Image:</td>
				<td><input type="file" name="avatar" id="avatar" class="form-control"
					value="<%=rs.getString(4)%>"disabled /></td>
			</tr>
			<tr>
				<td>Facilities:</td>
				<td><input type="text" name="facilities" id="facilities" class="form-control"
					value="<%=rs.getString(5)%>" /></td>
			</tr>
			<tr>
				<td>Activities:</td>
				<td><input type="text" name="activities" id="activities" class="form-control"
					value="<%=rs.getString(6)%>" /></td>
			</tr>
			<tr>
				<td>Food:</td>
				<td><input type="text" name="food" id="food" class="form-control"
					value="<%=rs.getString(7)%>" /></td>
			</tr>
			<tr>
				<td>Reception Services:</td>
				<td><input type="text" name="re_services" id="re_services" class="form-control"
					value="<%=rs.getString(8)%>" /></td>
			</tr>
			<tr>
				<td>Cleaning Services:</td>
				<td><input type="text" name="cleaning_services" id="cleaning_services" class="form-control"
					value="<%=rs.getString(9)%>" /></td>
			</tr>
			<tr>
				<td>Pool:</td>
				<td><input type="text" name="pool" id="pool" class="form-control"
					value="<%=rs.getString(10)%>" /></td>
			</tr>
			<tr>
				<td>Rooms:</td>
				<td><input type="text" name="rooms" id="rooms" class="form-control"
					value="<%=rs.getString(11)%>" /></td>
			</tr>
			
			
			<tr>
				<td>Address:</td>
				<td><input type="text" name="address" id="address" class="form-control"
					value="<%=rs.getString(12)%>" disabled /></td>
			</tr>
			
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="username" id="username" class="form-control"
					value="<%=rs.getString(13)%>" disabled/></td>
			</tr>
			
			<tr><td><input type="submit" value="Update" class="btn btn-warning"></td>
			</tr>
			</tbody>
		</table>
	</form>
	<center><a href="deleteHotel.jsp" class="btn btn-danger ml-2 btn-sm"><i class="fas fa-trash-alt"></i><font size="5"> Remove My Hotel Details</font></a></center><br><br>
	
	
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