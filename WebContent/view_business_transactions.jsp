<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Accounts.Income_Statement"%>
<%@page import="Accounts.Business_Transaction"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uId = null;
    String uType = null;
    String uDate = null;
    String uAmount = null;
    String updateDate = null;

    String date = null;
    String month = null;
    String year = null;

    if (request.getParameter("uId") != null) {
        uId = request.getParameter("uId");
        uType = request.getParameter("uType");
        uDate = request.getParameter("uDate");
        year = uDate.substring(0, 4);

        month = uDate.substring(6, 7);
        int temp_month = Integer.parseInt(month);
        if (temp_month < 10) {
            month = '0' + month;
        } else {
            month = month;
        }

        date = uDate.substring(9, 10);
        int temp_date = Integer.parseInt(date);
        if (temp_date < 10) {
            date = '0' + date;
        } else {
            date = date;
        }

        uDate = year + '-' + month + "-" + date;
        uAmount = request.getParameter("uAmount");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Business Transactions</title>
        <%@ include file="template/styles.jsp" %>
    </head>

    <body class="w3-white">

        <%@ include file="template/navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <!-- Header -->
            <div class="w3-panel w3-steel-gray" style="margin-bottom:40px !important">
                <header class="w3-container" >
                    <h6>Dashboard / Business Transactions </h6>
                </header>
            </div>

            <div class="w3-row">
                <div class="w3-col s9"><p></p></div>
                <div class="w3-col s3 w3-padding" style="padding-top: 0 !important;">
                    <table class="w3-right">
                        <tr>
                            <td>
                                <button class="w3-button w3-right w3-blue w3-border w3-border-blue w3-hover-border-blue w3-hover-white w3-hover-text-blue" onclick="document.getElementById('addPaymentModal').style.display = 'block'">Add Payment</button>
                            </td>
                            <td>
                                <form action="<%=request.getContextPath()%>/Expense_Report_Serverlet" method="POST">
                                    <button class="w3-button w3-right w3-blue w3-border w3-border-blue w3-hover-white w3-hover-text-blue" name="printReport"><i class="fas fa-print" style="padding-left: 5px"></i></button>
                                </form>
                            </td>
                        <tr>
                    </table>
                </div>
            </div>

            <div class="w3-panel">
                <div class="w3-row">
                    <div class="w3-col w3-center">

                        <table id="datatable" class="display table table-data-width w3-table w3-bordered w3-white">
                            <thead>
                                <tr class="w3-black">

                                    <th>Transaction ID</th>
                                    <th>Type</th>
                                    <th>Date</th>
                                    <th>Amount</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ResultSet res;
                                    res = Business_Transaction.viewBusinessTransaction();
                                    while (res.next()) {
                                %>


                                <tr class="w3-white">
                            <form action="view_business_transactions.jsp" method="POST">
                                <td><%=res.getString("Transaction_Id")%><input type="text" value="<%=res.getString("Transaction_Id")%>" name="uId" hidden></td>
                                <td><%=res.getString("Type")%><input type="text" value="<%=res.getString("Type")%>" name="uType" hidden></td>
                                <td><%=res.getDate("Date")%><input type="date" value="<%=res.getDate("Date")%>" name="uDate" hidden></td>
                                <td><%=Income_Statement.getNumberWithSeparator(res.getString("Amount"))%><input type="text" value="<%=res.getString("Amount")%>" name="uAmount" hidden></td> 
                                <td style="width: 15px"> <button class="w3-button w3-amber w3-border w3-border-amber w3-hover-border-amber w3-hover-white w3-hover-text-amber" type="submit">Update</button></td>
                            </form>
                            <form action="<%= request.getContextPath()%>/Delete_Business_Transaction"  method="POST">
                                <td style="width: 15px"> <button class="w3-button w3-red w3-border w3-border-red w3-hover-border-red w3-hover-white w3-hover-text-red" value="<%=res.getString("Transaction_Id")%>" type="submit" name="tid">Remove</button></td>
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

        <!--Modal area-->
        <!--Add payment modal-->
        <div id="addPaymentModal" class="w3-modal">
            <div class="w3-modal-content w3-animate-top w3-card-4">
                <header class="w3-container w3-blue"> 
                    <span onclick="document.getElementById('addPaymentModal').style.display = 'none'" 
                          class="w3-button w3-display-topright w3-hover-blue">&times;</span>
                    <h4 class="w3-center">Add New Business Transaction</h4>
                </header>
                <div class="w3-container w3-padding-32">
                    <form action="<%= request.getContextPath()%>/Add_Business_Transaction" method="POST">

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

                                <div class="w3-row w3-padding w3-padding-24">
                                    <div class="w3-col s10"><p></p></div>
                                    <div class="w3-col s2 w3-center"><button class="w3-button w3-block w3-right w3-blue w3-border w3-border-blue w3-hover-border-blue w3-hover-white w3-hover-text-blue w3-padding-16" type="submit">Submit</button></div>
                                </div>

                            </div>

                        </div>

                    </form>
                </div>
            </div>
        </div>
        <!--End Add payment modal-->


        <!--Update payment modal-->
        <div id="updatePaymentModal" class="w3-modal">
            <div class="w3-modal-content w3-animate-top w3-card-4">
                <header class="w3-container w3-amber"> 
                    <span onclick="document.getElementById('updatePaymentModal').style.display = 'none'" 
                          class="w3-button w3-display-topright w3-hover-amber">&times;</span>
                    <h4 class="w3-center">Update Business Transaction</h4>
                </header>
                <div class="w3-container w3-padding-32">
                    <form action="<%= request.getContextPath()%>/Update_Business_Transaction" method="POST">
                        <div class="w3-row">

                            <div class="w3-col s2"><p></p></div>

                            <div class="w3-col s8">

                                <div class="w3-row w3-padding">
                                    <div class="w3-col s2"><p style="margin-top: 5px">ID</p></div>
                                    <div class="w3-rest w3-dark-grey w3-center"><input class="w3-input w3-border" type="text" name="Transaction_Id" value="<%=uId%>" readonly></div>
                                </div>

                                <div class="w3-row w3-padding">
                                    <div class="w3-col s2"><p style="margin-top: 5px">Type</p></div>
                                    <div class="w3-rest w3-dark-grey w3-center"><input class="w3-input w3-border" type="text" name="Type" required value="<%=uType%>"></div>
                                </div>

                                <div class="w3-row w3-padding">
                                    <div class="w3-col s2"><p style="margin-top: 5px">Date</p></div>
                                    <div class="w3-rest w3-dark-grey w3-center"><input class="w3-input w3-border" type="date" name="Date" required value="<%=uDate%>"></div>
                                </div>

                                <div class="w3-row w3-padding">
                                    <div class="w3-col s2"><p style="margin-top: 5px">Amount</p></div>
                                    <div class="w3-rest w3-dark-grey w3-center"><input class="w3-input w3-border" type="text" name="Amount" required value="<%=uAmount%>"></div>
                                </div>

                                <div class="w3-row w3-padding w3-padding-24">
                                    <div class="w3-col s10"><p></p></div>
                                    <div class="w3-col s2 w3-center"><button class="w3-button w3-amber w3-border w3-border-amber w3-hover-border-amber w3-hover-white w3-hover-text-amber w3-padding-16" type="submit">Update</button></div>
                                </div>

                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End Update payment modal-->
        <!--End modal area-->
        <%
            if (uId != null) {
        %>
        <script>
            // Get the modal
            var modal = document.getElementById('updatePaymentModal');
            modal.style.display = "block";
        </script>
        <%
            }
        %>
    </body>
</html>
