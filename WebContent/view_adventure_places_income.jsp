<%@page import="Accounts.Income_Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Adventure Places</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <!-- Header -->
            <div class="w3-panel w3-steel-gray" style="margin-bottom:40px !important">
                <header class="w3-container" >
                    <h6>Dashboard / Income / Adventure Places</h6>
                </header>
            </div>

            <div class="w3-panel">

                <div class="w3-row">
                    <div class="w3-col s10"><p></p></div>
                    <div class="w3-rest w3-right">
                        <form action="<%=request.getContextPath()%>/Adventure_Places_Income_Report_Serverlet" method="POST">
                            <button class="w3">
                        </form>
                    </div>
                </div>


                <div class="w3-row">
                    <div class="w3-col w3-center">

                        <table id="datatable" class="display table table-data-width w3-table w3-bordered w3-white">
                            <thead>
                                <tr class="w3-black">
                                    <th>Date</th>
                                    <th>Business_name</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ResultSet res06;
                                    res06 = Income_Statement.getDepartmentTransactions("Adventure");
                                    while (res06.next()) {
                                %>


                                <tr class="w3-white">
                                    <td><%= res06.getDate("Date")%></td>
                                    <td><%= res06.getString("Business_name")%></td>
                                    <td><%= Income_Statement.getNumberWithSeparator(res06.getString("Amount"))%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
        </div>
    </body>

</html>
