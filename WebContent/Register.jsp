<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<title>Register</title>
</head>
<body style="background:url(background/back.jpg) repeat;">


<!----Register form------------>

	<div class="container" >
	
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


<br><br><br><div class="form-style-5">
	<div class="form">

		
			<div class="w3-rest">
                       
                        
                        <tr>
                        <th>
                            <a href="customerRegister.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#33cccc">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf183;</i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Local Customer</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                         </th> 
                         <th>  
            				<a href="customerRegister2.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#47d1d1">
                                        <div class="w3-left w3-padding"><i style='font-size:50px' class='fas'>&#xf183;</i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Foreign Customer</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
            			</th>
            			</tr>
            			<tr>
            			<th>
             				<a href="test1.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#33cccc">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf594;</i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Hotel</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            </th>
                            <th>
                            
								<a href="test1.jsp">
                              <div class="w3-col ">
                                    <div class="w3-container  w3-padding-24  w3-hover-dark-gray" style="background-color:#47d1d1 ">
                                        <div class="w3-left w3-padding"><i class="fa fa-home w3-xxxlarge"></i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Resort</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                           </th>
                           <th>
            					<a href="test1.jsp">
                                <div class="w3-col">
                                    <div class="w3-container w3- w3-padding-24   w3-hover-dark-gray" style="background-color:#85e0e0">
                                        <div class="w3-left w3-padding"><i class="fa fa-envira w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Spa</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            </th>
                            </tr>
            					<a href="vehicleRegister2.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#99e6e6">
                                        <div class="w3-left w3-padding"><i class="fa fa-car w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Vehicle</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            
             					<a href="driverRegister.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24   w3-hover-dark-gray" style="background-color:#adebeb">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf1cd;</i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Driver</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            
            					<a href="adventureCompaniesRegister.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3 w3-padding-24  w3-hover-dark-gray" style="background-color:#70dbdb">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf6ec;</i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Adventure</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            
           						<a href="tourGuideRegister.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#5cd6d6">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf3c5;</i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Tour Guide</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>                                                
			
			
			</div>
		
			
			
			</div>
	</div>
	
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
 
<!-- End page content -->
	</div>

</body>
</html>