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
                <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5>
            </header>

            <div class="w3-panel">
                <div class="w3-row">
                    <div class="w3-col w3-center">
<h1>Hotel & Resorts Delete</h1><br>
								<h4>Warning ! If You Enter User Name Delete All Details of Related Hotel or Resorts.</h4><br>
							</thead>
							
							
							
						
        
					 <form action="AdminDeleteHotel" method="post" >			
								
									
			<table align="center">
				
				
     			<tr><td style="width:175px">User name:</td>
         		<td><input type="text" class="form-control" placeholder="User name" name="username" required ></td></tr>
         				<tr><br></tr><tr></tr><tr></tr>		 
     			 <tr><td></td><td><br><br><input type="submit" value="Delete" class="btn btn-danger"></td></tr>
			
        
                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
            
            
        </div>
    </body>

</html>
