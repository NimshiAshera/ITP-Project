
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>






<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Dashboard</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <!-- Header -->
            <header class="w3-container" style="padding-top:22px">
                <h5><b><i class="fa fa-dashboard"></i> </b></h5>
            </header>

            <div class="w3-panel">
                <div class="w3-row">
                 
                    <div class="w3-col w3-center">
     


<%
  
 try {       
      Class.forName("com.mysql.jdbc.Driver").newInstance();
            
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root","root");
   
          
           
            PreparedStatement ps = con.prepareStatement("select * from hotel10");
            
               ResultSet rs = ps.executeQuery();
               
while(rs.next()){
	   
	   %>
        <center><font size="6"> <h5><b><i class="fa fa-dashboard"></i><%=rs.getString(1)%>   <%=rs.getString(2)%> </font></center><br><br>
        <a href="AdminhotelDelete.jsp" class="btn btn-danger ml-2 btn-sm"><i class="fas fa-trash-alt"></i><font size="3"> Remove Details</font></a></center>
	
	   <div class="container">


  <table class="table">
   <br><br>
    <tbody>
       <tr class="Customer First Name">
       <td>Part</td>
       <td><%=rs.getString(1)%></td>
       </tr>
       <tr>
       <td>Name</td>
           <td><%=rs.getString(2)%></td>
           </tr>
           <tr>
           <td>ID</td>
           <td><%=rs.getString(3)%></td>
           </tr>
           <tr>
           <td>Image</td>
          <td><img src="<%=rs.getString("imagelocation")%>"></td>
          </tr>
           <tr>
            <td>Facilities</td>
           <td><%=rs.getString(5)%></td>
           </tr>
           <tr>
           <td>Activities</td>
           <td><%=rs.getString(6)%></td>
           </tr>
           <tr>
           <td>Food</td>
           <td><%=rs.getString(7)%></td>
           </tr>
           <tr>
           <td>Reception Services</td>
           <td><%=rs.getString(8)%></td>
           </tr>
            <tr>
            <td>cleaning Services</td>
           <td><%=rs.getString(9)%></td>
            </tr>
             <tr>
             <td>Pool</td>
           <td><%=rs.getString(10)%></td>
           </tr>
            <tr>
            <td>Room</td>
            <td><%=rs.getString(11)%></td>
            </tr>
            <tr>
            <td>Address</td>
             <td><%=rs.getString(12)%></td>
            
          </tr> 
          
             </tbody>
			
		</table> 
           

	        <% }
      rs.close();
        ps.close();
        con.close();
      }catch(Exception e){System.out.println(e);}

        %>
       

                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
            
            
        </div>
    </body>

</html>
