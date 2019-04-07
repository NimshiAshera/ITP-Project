<%@page import="Accounts.Business_Transaction"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dashboard</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-light-grey">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <!-- Header -->
            <header class="w3-container" style="padding-top:22px">
                <!--<h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5>-->
            </header>

            <div class="w3-panel">
                <div class="w3-row">
                    <div class="w3-col w3-center">
                        <!--Type Here-->
                        <div class="w3-card-4">
                            <div class="w3-container w3-blue-grey">
                                <h2>Add Business Transaction</h2>
                            </div>

                           
                            <form class="w3-container w3-padding-64" action="<%= request.getContextPath()%>/Add_Business_Transaction" method="POST">

                                <div class="w3-row">

                                    <div class="w3-col s2"><p></p></div>

                                    <div class="w3-col s8">

                                        
                                        <div class="w3-row w3-padding">
                                            <div class="w3-col s2"><p style="margin-top: 5px">Type</p></div>
                                            <div class="w3-rest w3-dark-grey w3-center"><input class="w3-input w3-border" type="text" name="Type" required></div>
                                            
                                         
                                        </div>

                                        <div class="w3-row w3-padding">
                                            <div class="w3-col s2"><p style="margin-top: 5px">Date</p></div>
                                            <div class="w3-rest w3-dark-grey w3-center"><input class="w3-input w3-border" type="Date" name="Date"  required></div>
                                        </div>

                                        <div class="w3-row w3-padding">
                                            <div class="w3-col s2"><p style="margin-top: 5px">Amount</p></div>
                                            <div class="w3-rest w3-dark-grey w3-center"><input class="w3-input w3-border" type="number" name="Amount" required></div>
                                        </div>

                                        <div class="w3-row w3-padding w3-padding-48">
                                            <div class="w3-col s10"><p></p></div>
                                            <div class="w3-col s2 w3-center"><button class="w3-btn w3-blue w3-block w3-padding-16" type="submit">Submit</button></div>
                                        </div>

                                    </div>

                                </div>

                            

                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
        </div>
    </body>

</html>
