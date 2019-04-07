<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Income Menu</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <div class="w3-panel">
                <div class="w3-row w3-margin-top" style="margin-left: 150px; margin-top: 10% !important">
                    <a href="<%= request.getContextPath()%>/view_income_statement.jsp">
                        <div class="w3-quarter">
                            <div class="w3-container w3-blue-gray w3-border w3-border-blue-gray w3-hover-white w3-hover-text-blue-gray w3-padding-48">
                                <div class="w3-left"></div>
                                <div class="w3-center w3-padding-16">
                                    <h3><i class="fas fa-file-invoice-dollar fa-5x w3-padding-32"></i></h3>
                                </div>
                                <div class="w3-clear"></div>
                                <h4 class="w3-center w3-padding-small">Income Statement</h4>
                            </div>
                        </div>
                    </a>
                    <div class="w3-rest">
                        <div class="w3-row w3-margin-left">
                            <a href="<%= request.getContextPath()%>/view_hotel_income.jsp">
                                <div class="w3-col s3 w3-margin-right">
                                    <div class="w3-container w3-indigo w3-border w3-border-indigo w3-hover-white w3-hover-text-indigo w3-padding-24">
                                        <div class="w3-left w3-padding"><i class="fa fa-concierge-bell w3-xxxlarge"></i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Hotel</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/view_restaurant_income.jsp">
                                <div class="w3-col s3 w3-margin-right">
                                    <div class="w3-container w3-blue w3-border w3-border-blue w3-hover-white w3-hover-text-blue w3-padding-24">
                                        <div class="w3-left w3-padding"><i class="fa fa-utensils w3-xxxlarge"></i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Restaurant</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/view_guide_income.jsp">
                                <div class="w3-col s3">
                                    <div class="w3-container w3-cyan w3-border w3-border-cyan w3-hover-white w3-hover-text-cyan w3-text-white w3-padding-24">
                                        <div class="w3-left w3-padding"><i class="fa fa-hiking w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding" style="padding-right: 10px !important">
                                            <h3>Guide</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/view_adventure_places_income.jsp">
                                <div class="w3-col s3 w3-margin-right w3-margin-top">
                                    <div class="w3-container w3-teal w3-border w3-border-teal w3-hover-white w3-hover-text-teal w3-padding-24">
                                        <div class="w3-left w3-padding"><i class="fa fa-running w3-xxxlarge"></i></div>
                                        <div class="w3-right  w3-padding">
                                            <h3>Adventure</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/view_traveling_places_income.jsp">
                                <div class="w3-col s3 w3-margin-right w3-margin-top">
                                    <div class="w3-container w3-green w3-border w3-border-green w3-hover-white w3-hover-text-green w3-padding-24">
                                        <div class="w3-left w3-padding"><i class="fa fa-globe-americas w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Travel</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/view_spa_income.jsp">
                                <div class="w3-col s3 w3-margin-top">
                                    <div class="w3-container w3-light-green w3-border w3-border-light-green w3-hover-white w3-hover-text-light-green w3-text-white w3-padding-24">
                                        <div class="w3-left w3-padding"><i class="fa fa-spa w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Spa</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/view_vehicle_income.jsp">
                                <div class="w3-col s3 w3-margin-right w3-margin-top">
                                    <div class="w3-container w3-orange w3-border w3-border-orange w3-hover-white w3-hover-text-orange w3-text-white w3-padding-24">
                                        <div class="w3-left w3-padding"><i class="fa fa-car w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Vehicle</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/view_driver_income.jsp">
                                <div class="w3-col s3 w3-margin-right w3-margin-top">
                                    <div class="w3-container w3-amber w3-border w3-border-amber w3-hover-white w3-hover-text-amber w3-text-white w3-padding-24">
                                        <div class="w3-left w3-padding"><i class="fa fa-id-card-alt w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Driver</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="<%= request.getContextPath()%>/view_packages_income.jsp">
                                <div class="w3-col s3 w3-margin-right w3-margin-top">
                                    <div class="w3-container w3-khaki w3-border w3-border-khaki w3-hover-white w3-hover-text-khaki w3-text-white w3-padding-24">
                                        <div class="w3-left w3-padding"><i class="fa fa-clipboard-list w3-xxxlarge"></i></div>
                                        <div class="w3-right w3-padding">
                                            <h3>Packages</h3>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
        </div>
    </body>

</html>
