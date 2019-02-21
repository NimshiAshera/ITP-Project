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

		<form action="DelOwner">
	

		<table width="800px" border="0" align="center">
			<br> <br><center><font size="4">Delete Owner Details</font></center>
			<br><br><center><font size="5">Detail Information of <%=rs.getString(1)%> <%=rs.getString(2)%></font></center><br><br>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td>Customer First Name:</td>
				<td><%=rs.getString(1)%></td>
			</tr>
			<tr>
				<td>Customer Last Name:</td>
				<td><%=rs.getString(2)%></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<tr>
				<td>National Identity card No:</td>
				<td><%=rs.getString(4)%></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><%=rs.getString(5)%></td>
			</tr>
			<tr>
				<td>Date Of Birth:</td>
				<td><%=rs.getString(6)%></td>
			</tr>
			<tr>
				<td>Email Address:</td>
				<td><%=rs.getString(7)%></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><%=rs.getString(8)%></td>
			</tr>
			
			<tr>
				<td>User Name:</td>
				<td><%=rs.getString(9)%></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><%=rs.getString(10)%></td>

			</tr>
			<tr><td></td>
				<td><br><br><input type="submit" value="DELETE"></td>
			</tr>
		
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
					</div>
					</div>
					</div>
					</div>
					</div>
<%@include file="footer.jsp"%>
</body>
</html>