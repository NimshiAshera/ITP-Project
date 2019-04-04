<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<title>Hotel</title>
</head>
		
<body>
  <div id="wrapper">
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					
					<div class="post">
					
					
						<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">ABOUT SRILANKA</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">MAP</a>
    <a href="Gallery_01.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">GALLERY</a>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">THINGS TO DO <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">HOTEL & RESORT</a>
        <a href="#" class="w3-bar-item w3-button">SPA</a>
        <a href="#" class="w3-bar-item w3-button">ADVENTURS</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">HIRE FOR YOU <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">VEHICLE</a>
        <a href="#" class="w3-bar-item w3-button">TOUR GUIDE</a>
        <a href="#" class="w3-bar-item w3-button">DRIVERS</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">BOOK & REQUEST <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">TOUR PACKAGES</a>
        <a href="#" class="w3-bar-item w3-button">EVENT</a>
      </div>
    </div>
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG OUT</a>
    <a href="driverSignin.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">LOG IN</a>   
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">SIGN IN</a>
    
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  </div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">ABOUT SRILANKA</a>
  <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MAP</a>
  <a href="Contacts.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">CONTACT</a>
  <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MERCH</a>
</div>
	
					
					
					<br><br><br><div class="form-style-5">

	
	<div class="form">
	
	<form action="HotelReg" method="post" enctype="multipart/form-data">
	
	<i style='font-size:48px' class='fas'>&#xf594;</i><h4><font color ="#00cc7a"><font size="8">Hotel,Restaurant & Resort  Registration</font></font></h4>
	
	                           <label>Hotel,Restaurant,Resort Or Spa</label>
                              <p> <input type="radio" name="part" id="part" value="Hotel" />Hotel</input></p>
					<p><input type="radio" name="part" id="part" value="Restaurant" />Restaurant</input></p>
					<p><input type="radio" name="part" id="part" value="Resort" />Resort</input></p>
					
                            
	
		                      <label>Name</label>
                                <p><input type="text" class="form-control"  name="name" placeholder=" Name"  ></p>
                            
                            
                                 <label>Hotel,Restaurant,Resort ID</label>
                               <p> <input type="text" class="form-control"  name="hotel_id" placeholder="ID"></p>
                               
                                <label>Image</label>
                               <p> <input type="file" class="form-control"  name="avatar" size="4000000" accept="image/x-png,image/jpg,image/jpeg"></p><br>
                               
                                <label><u>Facilities </u></label>
                               
                                *Swimming Pools<br>
                                *Free Wifi<br>
                                *Beachfont<br>
                                *Family Rooms<br>
                                *Air Port<br>
                                *Bar<br>
                                 <p><textarea name="facilities" rows="10" cols="30" ></textarea></p>
                           
                            
                             <label><u>Activities  </u></label>
                               
                            *Beach<br>    *Library<br>
                            *Windsurfing<br>
                            *Table tennis<br>
                            *Billiords<br>
                            *Fishing<br>
                            *Evening Entertaintment<br>
                            *Water sports Facilities<br>
                            *Snorkelling<br>
                            *Diving<br>
                            
                            <p><textarea name="activities" rows="10" cols="30" ></textarea></p>
                            
                             <label><u>Food and Drinks </u></label>
                           
                          *Chocolate or Cookies-Rs up to 200<br>
                          *Fruits-With several prices<br>
                          *Bottle of water-Rs 50-100<br>
                          *Wine shampane-Rs up to 1000<br>
                          *Kid meals - Rs 500-1000<br>
                          *Snack bar<br>
                          *Breakfast in room<br>
                          *Special diet meals<br>
                           <p><textarea name="food" rows="10" cols="30" ></textarea></p>
                            
                           <label><u>Reception Services </u></label>
                               
                           *Lockers<br>
                           *Couerage Services<br>
                           *Luggage Services<br>
                           *Currency Exchanges<br>
                           *24 Hour Front Desk<br>
                           <p><textarea name="re_services" rows="10" cols="30" ></textarea></p>
                          
                          <label>Cleaning Services </label>
                            
                          *Daily maid services<br>
                          *Trouser Press<br>
                          *Dry Cleaning<br>
                          *Laundry<br>
                            
                            <p><textarea name="cleaning_services" rows="10" cols="30" ></textarea></p>
                            
                          <label>Pools and Wellness </label>
                             
                           *Swimming Pool<br>
                           *Kids Pool<br>
                           *Personal Trainer<br>
                           
                            *Pool Beach Towels<br>
                          
                            *Fitness Center<br>
                            <p><textarea name="pool" rows="10" cols="30" ></textarea></p>
                            
                            <label>Rooms </label>
                               
                          *Deluxe Room = Rs 3000-5000<br>
                          *Superior Room=Rs 2000-3000<br>
                         * Standard Double Room=RS 1500-2000<br>
                            
                   <p><textarea name="rooms" rows="10" cols="30" ></textarea></p>
                            
                            
                                <label>Address</label>
                                <p><input type="text" class="form-control"  name="address" placeholder="Address"></p>
                           
                            
                                <label>User Name</label>
                             <p>   <input type="text" class="form-control"  name="username" placeholder="User Name"></p>
                           
                            
                           
                                <label>Password</label>
                               <p> <input type="text" class="form-control"  name="password" placeholder="Password"></p>
                               
                                
		
	
	<input type="submit" value="Submit" name="submitButton"
					id="sButton">	
	</form>
	</div>
	</div>
	
	</div>
					</div>
					</div>
					</div>
					</div>
					
					<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->
					
					</div>

</body>
	

</html>