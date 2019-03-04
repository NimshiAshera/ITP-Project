<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="style.css">

<%
String uname=(String)session.getAttribute("username");
%>

<title>header</title>
</head>

<div id="wrapper">
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					<div id="header-wrapper">
						<div id="header">
							<div id="logo">
								<h1><a href="#">Sri Lankan Tour</a></h1> &nbsp; &nbsp; &nbsp;<a  href="profilepage1.jsp" ><font size="3"> Welcome Back Profile! <% out.println(session.getAttribute("username")); %></font></a>
								                                                                                                                   
								                                                                                                                       
								<div id="menu">
								<ul>
								<li class="current_page_item"><a href="homepage.jsp">Home</a></li>
								<li><a href="Map.jsp">Site Map</a></li>
								<li><a href="aboutUs.jsp">About Us</a></li>
								<li><a href="contactUs.jsp">Contact Us</a></li>
								<li><a href="customerLogin.jsp">Sign In</a></li>
								<li><a href="OwnerLogout">Sign Out</a></li>
								<li><a href="customerRegister.jsp">Join</a></li>
								</ul>
							</div>
						</div>
					</div>
					
						</div>		
				
					
					<!-- end #header -->
					<div id="menu-wrapper">
						<div id="menu">
							<ul>
								
								<div class="subnav">
								<button class="subnavbtn"><u><li>Hire To Your Step <i class="fa fa-caret-down"></i></u></li></button>
                                <div class="subnav-content">
                                <a href="#"></a>
                                <a href="#"></a>
                                <a href="#"></a>
                                <a href="#"></a>
                                <a href="#">Hire Vehicle</a>
                                <a href="#">Hire Driver</a>
                                <a href="#">Hire Tour Guide</a>
</div>
                        
</div>
                   
                                <div class="subnav">
								<button class="subnavbtn"><u><li>Where To Go??</li><i class="fa fa-caret-down"></i></u></button>
								<div class="subnav-content">							
					 			<a href="#"></a>
					 			<a href="#"></a>
                                <a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="hotel&Resorts.jsp">Hotel & Resort</a>
					 			<a href="Restaurants.jsp">Restaurants</a>
					 			<a href="#">Traveling Places</a>
</div>
</div> 		
								
								
								
								<div class="subnav">
								<button class="subnavbtn"><u><li>Things To Do??</li><i class="fa fa-caret-down"></i></u></button>
								<div class="subnav-content">
								<a href="#"></a>
                                <a href="#"></a>
                                <a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#">Whale Watching</a>
					 			<a href="#">Hiking</a>
					 			<a href="#">Wild Safari</a>
					 			<a href="#">Beach Holidays</a>
					 			<a href="#">Spa</a>
					 
</div>
</div> 			
								
								<div class="subnav">
								<button class="subnavbtn"><u><li>Gallary</li><i class="fa fa-caret-down"></i></u></button>
								<div class="subnav-content">
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="gallery.jsp">Travelers Gallary</a>
								
								
</div>
</div> 									
								
								
								<div class="subnav">
								<button class="subnavbtn"><u><li> Our Packages</li><i class="fa fa-caret-down"></i></u></button>
								<div class="subnav-content">
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>				 			
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>
					 			<a href="#"></a>			
					 			<a href="#">Platinum</a>
					 			<a href="#">Gold</a>
					 			<a href="#">Silver</a>
					 			<a href="#">Bronze</a>
					 
</div>
</div> 								
								<div class="subnav">
								
								<button class="subnavbtn"><u><li>Book / Request On Your Own</li><i class="fa fa-caret-down"></i></u></button>
								
								<div class="subnav-content">					 	
					 			<a href="#">Event Request</a>
					 			<a href="">Vehicle Booking</a>
					 			<a href="#">Driver Booking</a>
					 			<a href="#">Tour Guide Booking</a>
					 			<a href="#">Hotel & Resort Booking</a>
					 			<a href="#">Restaurant Booking</a>
					 			<a href="#">Spa Booking</a>
					 			<a href="">Adventure Booking</a>					 			
					 			<a href="#">Tour Package Booking</a>
					 
							</ul>
						</div>
					</div>
					
					

</body>
</html>