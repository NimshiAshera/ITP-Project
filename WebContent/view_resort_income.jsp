<%@page import="Accounts.Income_Statement"%>
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
                <h5><b><i class="fa fa-dashboard"></i> Resort</b></h5>
            </header>

            <div class="w3-panel">
                <div class="w3-row">
                    <div class="w3-col w3-center">

                        <table class="w3-table w3-bordered w3-white w3-hoverable">
                            <tr class="w3-black">
                                <th>Date</th>
                                <th>Business_name</th>
                                <th>Amount</th>
                            </tr>

                            <%
                                ResultSet res06;
                                res06 = Income_Statement.getMonthlyIncome("Resort");
                                while (res06.next()) {
                            %>


                            <tr>
                                <td><%= res06.getDate("Date")%></td>
                                <td><%= res06.getString("Business_name")%></td>
                                <td><%= res06.getString("Amount")%></td>
                            </tr>
                            <%
                                }
                            %>

                        </table>

                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
        </div>
    </body>

</html>
