<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    

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

                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
            
            
        </div>
    </body>

</html>
