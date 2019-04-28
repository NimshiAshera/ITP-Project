<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="Layout/styles.jsp"%>
<title>Clientele</title>
</head>
<body>

	<%@include file="Layout/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%@include file="Layout/navigation.jsp"%>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
			<div class=" pb-2 mb-3 border-bottom">
				<div class="row">
					<div class="col-8"><h1 class="h2">Hotels
					 & Resorts Details.</h1></div>
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
								<tr>
									<th scope="col">Part</th>
									<th scope="col">Name</th>
									<th scope="col">Hotel ID</th>
									
									<th scope="col">Facilities</th>
									<th scope="col">Activities</th>
									<th scope="col">Food</th>
									<th scope="col">Reception Services</th>
									<th scope="col">Cleaning Services</th>
									<th scope="col">Pool</th>
									<th scope="col">Room</th>
									<th scope="col">Address</th>
									
								</tr>
							</thead>
							<tbody>
							<%
  
 try {       
      Class.forName("com.mysql.jdbc.Driver").newInstance();
            
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost/itp?useSSL=false","root","root");
   
          
           
            PreparedStatement ps = con.prepareStatement("select * from hotel10");
            
               ResultSet rs = ps.executeQuery();
               
while(rs.next()){
	   
	   %>
        
								<tr>
									<td class="align-middle"><%=rs.getString(1)%></td>
									<td class="align-middle"><%=rs.getString(2)%></td>
									<td class="align-middle"><%=rs.getString(3)%></td>
									
									<td class="align-middle"><%=rs.getString(5)%></td>
									<td class="align-middle"><%=rs.getString(6)%></td>
									<td class="align-middle"><%=rs.getString(7)%></td>
									<td class="align-middle"><%=rs.getString(8)%></td>
									<td class="align-middle"><%=rs.getString(9)%></td>
									<td class="align-middle"><%=rs.getString(10)%></td>
									<td class="align-middle"><%=rs.getString(11)%></td>
									
									
									<td class="align-middle text-center">
										<a href=""class=btn btn-info btn-sm"><i class="fas fa-spinner"></i> View</a>
										<a href="" class="btn btn-danger ml-2 btn-sm"><i class="fas fa-trash-alt"></i> Remove</a>
									</td>
								</tr>
							
	        <% }
      rs.close();
        ps.close();
        con.close();
      }catch(Exception e){System.out.println(e);}

        %>
							</tbody>
						</table>
					</div>
				</div>

				<!--End of main content-->
			</main>
		</div>
	</div>
	<%@include file="Layout/footer.jsp"%>
	<%@include file="Layout/scripts.jsp"%>
</body>
</html>