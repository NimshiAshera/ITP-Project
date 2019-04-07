<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    	<link rel="stylesheet" type="text/css" href="form.css">
    	<link rel="stylesheet" type="text/css" href="profile.css">
        <title>Dashboard</title>
        <%@ include file="styles.jsp" %>
    </head>

    <body  >

        <%@ include file="navigationOwner.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px; ">

            <!-- Header -->
            <header class="w3-container" style="padding-top:22px">
                <h2><b><i class="fa fa-dashboard"></i>Service Manager Dashboard</b></h2>
            </header>

            <div class="w3-panel" ;">
                <div class="w3-row"  ;">
                    <div class="w3-col w3-center" >

						<a href="#">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#b3e6cc">
                                        <div class="w3-left w3-padding"><i class="fa fa-home w3-xxxlarge"></i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Hotel & Resort</h3>
                                        </div>
                                    </div>
                                </div>
                         </a>
                         <a href="#">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#66cc99">
                                        <div class="w3-left w3-padding"><i class="fa fa-spa w3-xxxlarge"></i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Spa</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
							<a href="VehicleList">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#b3e6cc">
                                        <div class="w3-left w3-padding"><i class="fa fa-car w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Vehicle</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="ViewDriverBook">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24   w3-hover-dark-gray" style="background-color:#66cc99">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf1cd;</i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Driver</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="TourGuideList">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#b3e6cc">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf3c5;</i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Tour Guide</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="#">
                                <div class="w3-col ">
                                    <div class="w3-container w3 w3-padding-24  w3-hover-dark-gray" style="background-color:#66cc99">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf6ec;</i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Adventure</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                    </div>
                </div>
            </div>

            <%@ include file="scripts.jsp" %>
        </div>
    </body>

</html>