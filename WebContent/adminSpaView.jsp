
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
   
          
           
            PreparedStatement ps = con.prepareStatement("select * from spa");
            
               ResultSet rs = ps.executeQuery();
               
while(rs.next()){
	   
	   %>
	  <center><font size="5"><h5><b><i class="fa fa-dashboard"></i>Spa <%=rs.getString(1)%> </font></center><br><br>
	   <div class="container">


  <table class="table">
   
    <tbody>
       <tr class="Customer First Name">
       
	   <td>Spa Name</td>
       <td><%=rs.getString(1)%></td>
       
       </tr>
       <tr>
       <td>Spa ID</td>
       <td><%=rs.getString(2)%></td>
           
       </tr>
       <tr>
           <td>Image </td>
           <td><%=rs.getString(3)%></td>
          </tr>
          <tr> 
          <td>Image </td>
           <td><img src="<%=rs.getString("imagelocation")%>"></td>
           </tr>
           <tr>
            <td>Facial</td>
           <td><%=rs.getString(4)%></td>
           </tr>
           <tr>
           <td>Waxing</td>
           <td><%=rs.getString(5)%></td>
           </tr>
           <tr>
           <td>Body</td>
           <td><%=rs.getString(6)%></td>
           </tr>
           <tr>
           <td>Massage</td>
           <td><%=rs.getString(7)%></td>
           </tr>
           <tr>
             <td>Tinting</td>
           <td><%=rs.getString(8)%></td>
          
        
          </tr> 
          </tbody>
			
		</table> 
            
           

	        <% }
      rs.close();
        ps.close();
        con.close();
      }catch(Exception e){System.out.println(e);}

        %>
        </table>

                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
            
            
        </div>
    </body>

</html>
