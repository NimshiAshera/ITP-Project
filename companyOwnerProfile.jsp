<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Dashboard</title>
        <%@ include file="styles.jsp" %>
    </head>

    <body class="w3-#c2f0f0" style="background-color: #c2f0f0">

        <%@ include file="navigationOwner.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px; background-color: light-grey">

            <!-- Header -->
            <header class="w3-container" style="padding-top:22px">
                <a href="CompanyOwner">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#33cccc">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf183;</i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>View Owner Details</h3>
                                        </div>
                                    </div>
                                </div>
                 </a>
                 <a href="StaffProfile">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:white">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf183;</i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>View Staff Details</h3>
                                        </div>
                                    </div>
                                </div>
                 </a>
                 <a href="companyOwnerReports.jsp">
                                <div class="w3-col ">
                                    <div class="w3-container w3- w3-padding-24  w3-hover-dark-gray" style="background-color:#33cccc">
                                        <div class="w3-left w3-padding"><i style='font-size:48px' class='fas'>&#xf183;</i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>View Business Report</h3>
                                        </div>
                                    </div>
                                </div>
                 </a>
            </header>

            <div class="w3-panel">
                <div class="w3-row">
                    <div class="w3-col w3-center">

                    </div>
                </div>
            </div>

            <%@ include file="scripts.jsp" %>
        </div>
    </body>

</html>