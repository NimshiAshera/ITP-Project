<%@page import="Gold.Gold" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    	<link rel="stylesheet" type="text/css" href="form.css">
    	<link rel="stylesheet" type="text/css" href="profile.css">
        <title>Dashboard</title>
        <%@ include file="styles.jsp" %>
    </head>

    <body  >

        <%@ include file="navigationOwner.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px; ">

            

            <div class="w3-panel" ;">
                <div class="w3-row"  ;">
                    <div class="w3-col w3-center" >

						<%
							Gold gold = (Gold) request.getAttribute("pid");
						%>
					
					
					<label style="font-size:20px;"><b>Name :</b><%=gold.getPname()%></label>
					<label style="font-size:20px"><b>PID:</b> <%=gold.getPid()%></label>
					<label style="font-size:20px"><b>No of.Person :</b> <%=gold.getPerson()%> </label>
					<label style="font-size:20px;"><b>View :</b><%=gold.getView()%></label>
					<label style="font-size:20px"><b>No. of Beds:</b> <%=gold.getBed()%></label>
					<label style="font-size:20px"><b>Image :</b> <img src="package/<%=gold.getAvatar() %>"  width="200" height="150">
												
												
												<form method="post" action="GoldImage">
												<br/>
													<input type="hidden" name="pid" value="<%=session.getAttribute("pid")%>" /> 
													<input type="submit" value="Edit Image" class="select-button" />
												</form>
										 </label>
					
					<label style="font-size:20px"><b>Day 01:</b> <%=gold.getD1()%>  </label>
					<label style="font-size:20px"><b>Day 02 :</b> <%=gold.getD2()%>  </label> 
					<label style="font-size:20px"><b>Day 03 : </b><%=gold.getD3()%> </label> 
					<label style="font-size:20px"><b>Day 04 : </b><%=gold.getD4()%> </label>
					<label style="font-size:20px"><b>Day 05 : </b><%=gold.getD5()%> </label>				
					
												
												<form method="POST" action="GoldProfile">
													<input type="hidden" name="pid" value="<%=session.getAttribute("pid")%>" /> 
													<input type="submit" value="Edit Your Details" class="select-button" />
												</form>
					
					
					
                    </div>
                </div>
            </div>

            <%@ include file="scripts.jsp" %>
        </div>
    </body>

</html>