<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src=""></script>
<link rel="stylesheet" type="text/css" href="">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%;
    align: center;
}

th{
    border: 2px solid #dddddd;
    text-align: center;
    padding: 8px;
    
}

td {
    border: 2px solid #D0D3D4;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}

</style>
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
					<div class="form-style-5">
					
					
	<%
  if(session.getAttribute("username") != null){
	  String username = (String) session.getAttribute("username");
	  
  
 try { 
	 
      Class.forName("com.mysql.jdbc.Driver").newInstance();
            
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost/itp?useSSL=false","root","root");
   
            PreparedStatement ps = con.prepareStatement("select * from owner where username='"+username+"'");
            
               ResultSet rs = ps.executeQuery();
               rs.next();
               
               
        %>

		<form method="post" action="UpdateOwner">
	

		<table width="800" border="0" align="center">
		    <br><center><font size="4">Update Owner Details</font></center>
			<br><br><center><font size="5">Detail Information of <%=rs.getString(1)%> <%=rs.getString(2)%></font></center>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td>Customer First Name:</td>
				<td><input type="text" name="Fname" id="Fname"
					value="<%=rs.getString(1)%>" disabled /></td>
			</tr>
			<tr>
				<td>Customer Last Name:</td>
				<td><input type="text" name="Lname" id="Lname"
					value="<%=rs.getString(2)%>" disabled /></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><input type="text" name="Address" id="Address"
					value="<%=rs.getString(3)%>" /></td>
			</tr>
			<tr>
				<td>National Identity card No:</td>
				<td><input type="text" name="NIC" id="NIC"
					value="<%=rs.getString(4)%>" disabled/></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><input type="text" name="Gender" id="Gender"
					value="<%=rs.getString(5)%>" disabled/></td>
			</tr>
			<tr>
				<td>Date Of Birth:</td>
				<td><input type="text" name="DOB" id="DOB"
					value="<%=rs.getString(6)%>" />yyyy-mm-dd</td>
			</tr>
			<tr>
				<td>Email Address:</td>
				<td><input type="text" name="Email" id="Email"
					value="<%=rs.getString(7)%>" /></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><input type="text" name="PhoneNo" id="PhoneNo"
					value="<%=rs.getString(8)%>" /></td>
			</tr>
			
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="username" id="username"
					value="<%=rs.getString(9)%>" disabled/></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="text" name="password" id="password"
					value="<%=rs.getString(10)%>" /></td>

			</tr>
			<tr><td><input type="submit" value="Update"></td>
			<td><a href="test3.jsp"><font size="4"> NEXT ---> Update My Hotel Details</font></a></td></tr>
		</table>
	</form>
	<br><center><a href="deleteOwner.jsp"><font size="5">Delete My Details</font></a></center>
	
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
					</div>
					</div>
					</div>
					</div>
					</div>
<%@include file="footer.jsp"%>
</body>
</html>