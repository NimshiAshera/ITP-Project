<%@page import="Accounts.Income_Statement"%>
<%@page import="Accounts.Bad_Debt"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bad Debts</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <!-- Header -->
            <div class="w3-panel w3-steel-gray" style="margin-bottom:40px !important">
                <header class="w3-container" >
                    <h6>Dashboard / Bad Debts </h6>
                </header>
            </div>

            <div class="w3-panel">

                <div class="w3-row">
                    <div class="w3-col w3-center">

                        <table class="w3-table w3-bordered w3-white">
                            <thead class="w3-black">
                            <th>Business Name</th>
                            <th>Department</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th></th>
                            </thead>
                            <tbody>
                                <%
                                    ResultSet res;
                                    res = Bad_Debt.getBadDebts();
                                    while (res.next()) {
                                %>

                                <tr class="w3-white ">
                            <form action="<%= request.getContextPath()%>/Delete_Bad_debt" method="POST">
                                <td><%=res.getString("Business_name")%></td>
                                <td><%=res.getString("Department")%></td>
                                <td><%= Income_Statement.getNumberWithSeparator(res.getString("Amount"))%></td>
                                <td><%=res.getString("Date")%></td> 
                                <td style="width: 15px"> <button class="w3-button w3-red w3-border w3-border-red w3-hover-border-red w3-hover-white w3-hover-text-red" value="<%=res.getString("Transaction_Id")%>" type="submit" name="tid">Discard debt</button></td>
                            </form>
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
