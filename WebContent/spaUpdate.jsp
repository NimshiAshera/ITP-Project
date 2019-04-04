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
   
            PreparedStatement ps = con.prepareStatement("select * from spa where username='"+username+"'");
            
               ResultSet rs = ps.executeQuery();
               rs.next();
               
               
        %>

		<form method="post" action="UpdateSpa">
	

		<table width="800" border="0" align="center">
		    <br><center><font size="4">Update Spa Details</font></center>
			<br><br><center><font size="5">Detail Information of <%=rs.getString(1)%> <%=rs.getString(2)%></font></center>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				
			<tr>
				<td>Spa Name:</td>
				<td><input type="text" name="name" id="name"
					value="<%=rs.getString(1)%>" disabled /></td>
			</tr>
			<tr>
				<td>Hotel ID:</td>
				<td><input type="text" name="id" id="id"
					value="<%=rs.getString(2)%>" disabled/></td>
			</tr>
			
			<tr>
				<td>Image:</td>
				<td><input type="file" name="avatar" id="avatar"
					value="<%=rs.getString(3)%>"disabled /></td>
			</tr>
			<tr>
				<td>Facials:</td>
				<td><input type="text" name="facials" id="facials" 
					value="<%=rs.getString(4)%>" /></td>
			</tr>
			<tr>
				<td>Waxing:</td>
				<td><input type="text" name="waxing" id="waxing"
					value="<%=rs.getString(5)%>" /></td>
			</tr>
			<tr>
				<td>Body:</td>
				<td><input type="text" name="body" id="body"
					value="<%=rs.getString(6)%>" /></td>
			</tr>
			<tr>
				<td>Massage:</td>
				<td><input type="text" name="massage" id="massage"
					value="<%=rs.getString(7)%>" /></td>
			</tr>
			<tr>
				<td>Tinting:</td>
				<td><input type="text" name="tinting" id="tinting"
					value="<%=rs.getString(8)%>" /></td>
			</tr>
			
			
			
			<tr>
				<td>Address:</td>
				<td><input type="text" name="address" id="address"
					value="<%=rs.getString(9)%>" disabled /></td>
			</tr>
			
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="username" id="username"
					value="<%=rs.getString(10)%>" disabled/></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="text" name="password" id="password"
					value="<%=rs.getString(11)%>" disabled/></td>

			</tr>
			<tr><td><input type="submit" value="Update"></td>
			
		</table>
	</form>
	<br><center><a href="deleteSpa.jsp"><font size="5">Delete My Hotel Details</font></a></center>
	
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

</body>
</html>