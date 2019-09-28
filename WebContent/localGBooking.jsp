<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="TourguideBook.TourguideBook"%>
<%@page import="LCustomer.LCustomer"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="styles/1.css" type="text/css" >

<title>Insert title here</title>
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
	
	<br/><br/><br/>	
	
	<h1>View Booked Tour Guides</h1>
	
	<br/><br/>
	
		<div class="new">
		 		<form action="LGuideSearch"  method="get">
		 		<input type="text" class="form-control" name="gname" placeholder="Enter guides name to search your bookings..."/>
				<i class="fa fa-search"></i>
				</form>
		
		</div>

		<br/><br/>
     
     	<div class="table100">
     		
     	
       			 <TABLE border="0">
        			<Thead>
            			<TR>
               				<TH class="cell100 column1">First Name</TH>
                			<TH class="cell100 column2">Phone No.</TH>
                			<TH class="cell100 column3">Email</TH>
                			<TH class="cell100 column4">Tour Guide Name</TH>
                			<TH class="cell100 column5">Service Required Date</TH>
                			<TH class="cell100 column6">No. of Dates</TH>
                			<TH class="cell100 column7">Total Amount(USD)</TH>
            			</TR>
            		</Thead>
            	
   
            
            
            <tbody>
            
            <% 
			Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/project?useSSL=false", "root", "root");

            Statement statement = conn.createStatement();
            
            String query = request.getParameter("q");
            String data;

            if(query!=null){
            	data = "select l.fname,l.phone, l.email , g.gname, g.date, g.numd, g.amount  from tourguidebook g INNER JOIN lcustomer l  on l.username = g.username where g.gname like '% "+ query +" %' or   l.fname like '% "+query+" %' ";
            }else{
            	data = "select l.fname,l.phone, l.email ,g.gname, g.date, g.numd, g.amount  from tourguidebook g INNER JOIN lcustomer l  on l.username = g.username ";
            }
            
            
            ResultSet resultset = 
                statement.executeQuery(data) ;  
        	%>
            
            <% 
            while(resultset.next()){ 
            %>
            <TR class="row100 body">
                <TD class="cell100 column1"> <%= resultset.getString(1) %></TD>
                <TD class="cell100 column2"> <%= resultset.getString(2) %></TD>
                <TD class="cell100 column3"> <%= resultset.getString(3) %></TD>
                <TD class="cell100 column4"> <%= resultset.getString(4) %></TD>
                <TD class="cell100 column5"> <%= resultset.getString(5) %></TD>
                <TD class="cell100 column6"> <%= resultset.getString(6) %></TD>
                <TD class="cell100 column7"> <%= resultset.getString(7) %></TD>
            </TR>
            
            <% 
            }           
            %>
            
            </tbody>
           
        </TABLE>
        
	
	</div>
	
	<br/><br/><br/><br/><br/>
<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->

</body>
</html>