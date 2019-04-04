<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <%@ include file="styles.jsp" %>
    </head>

    <body style="background-color: light-grey;">

        <%@ include file="navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <!-- Header -->
            <header class="w3-container" style="padding-top:22px;">
                <div style="color: black;"><h1><b><i class="fa fa-dashboard"></i> Accounts</b></h1></div>
            </header>

            <div class="w3-panel" >
                <div class="w3-row">
                    <div class="w3-col w3-center" >

                    </div>
                </div>
            </div>

            <%@ include file="scripts.jsp" %>
        </div>
    </body>

</html>
