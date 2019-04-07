<%@page import="Accounts.Income_Statement"%>
<%@page import="Accounts.Booking_Transaction"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Booking Transaction</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <div class="w3-panel w3-steel-gray" style="margin-bottom:40px !important">
                <header class="w3-container" >
                    <h6>Dashboard / Booking Transaction</h6>
                </header>
            </div>

            <div class="w3-panel">
                <div class="w3-row">
                    <div class="w3-col w3-center">

                        <table id="datatable" class="display table table-data-width w3-table w3-bordered w3-white">
                            <thead>
                                <tr class="w3-black">

                                    <th>Transaction_Id</th>
                                    <th>Business_name</th>
                                    <th>Department</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ResultSet res;
                                    res = Booking_Transaction.viewBookingTransaction();
                                    while (res.next()) {
                                %>


                                <tr class="w3-white">
                            <form action="<%= request.getContextPath()%>/Add_Blacklist_Transaction" method="post">
                                <td><%= res.getString("Transaction_Id")%></td>
                                <td><%= res.getString("Business_name")%><input type="text" value="<%= res.getString("Business_name")%>" name="Business_name" hidden></td>
                                <td><%= res.getString("Department")%><input type="text" value="<%= res.getString("Department")%>" name="Department" hidden></td>
                                <td><%= Income_Statement.getNumberWithSeparator(res.getString("Amount"))%><input type="text" value="<%= res.getString("Amount")%>" name="Amount"hidden></td>
                                <td><%= res.getString("Date")%><input type="text" value="<%= res.getString("Date")%>" name="Date" hidden></td>
                                <td style="width: 15px"> <button class="w3-button w3-amber w3-border w3-border-amber w3-hover-border-amber w3-hover-white w3-hover-text-amber" value="<%=res.getString("Transaction_Id")%>" type="submit" name="tid">Add to bad debts</button></td>
                            </form>
                            <form action="<%= request.getContextPath()%>/Update_Booking_Transaction" method="post">
                                <td style="width: 15px"> <button class="w3-button w3-green w3-border w3-border-green w3-hover-border-green w3-hover-white w3-hover-text-green" value="<%=res.getString("Transaction_Id")%>" type="submit" name="tid">Confirm</button></td>
                            </form>
                            </tr>
                            <% }%>

                            </tbody>   
                        </table>

                    </div>
                </div>
            </div>

            <%@ include file="template/scripts.jsp" %>
        </div>
    </body>

</html>
