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

						<a href="PackagePlatinum.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#e5e4e2 ">
                                        <div class="w3-left w3-padding"><i class="fas fa-box-open w3-xxxlarge"></i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>PLATINUM PACKAGE</h3>
                                        </div>
                                    </div>
                                </div>
                         </a>
                         <a href="PackageGold.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#b39800">
                                        <div class="w3-left w3-padding"><i class="fas fa-box-open w3-xxxlarge"></i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>GOLD PACKAGE</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
							<a href="PackageSilver.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color: #cccccc">
                                        <div class="w3-left w3-padding"><i class="fas fa-box-open w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>SILVER PACKAGE</h3>
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