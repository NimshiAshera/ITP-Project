<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-gray" onclick="w3_open();"><i class="fa fa-bars"></i> &nbsp;Menu</button>
    <span class="w3-bar-item w3-right" style="font-size:30px">Eco Travels</span>
  
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s4">
            <i class="fas fa-users-cog fa-4x"></i>
        </div>
        <div class="w3-col s8 w3-bar">
        </br></br></br>
            <span>Welcome<strong></strong></span><br>
            
            
            
        </div>
    </div>
    <hr>
    <div class="w3-container" style="text-align: center">
       
    </div>
    <div class="w3-bar-block">
       
        <a href="StartUp.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-business-time fa-fw"></i>&nbsp; Our Official Site</a>     
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
        <a href="dashBOwner.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-tachometer-alt fa-fw"></i>&nbsp; Dashboard</a>
        <a href="companyOwnerProfile.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-business-time fa-fw"></i>&nbsp; Company Owner</a>
        <a href="staffRegistration.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-business-time fa-fw"></i>&nbsp; Staff Registration </a>    
        
            <div class="w3-dropdown-hover">
            <button class="w3-button" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Staff <i class="fa fa-caret-down"></i></button>
            <div class="w3-dropdown-content w3-bar-block">
              <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-building fa-fw"></i>&nbsp;Customer Manager</a>
              <a href="ServiceManager.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-building fa-fw"></i>&nbsp;Service Manager</a>
              <a href="view_income_menu.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cart-arrow-down fa-fw"></i>&nbsp; Accountant</a>
              <a href="BookingManager.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cart-arrow-down fa-fw"></i>&nbsp; Booking Manager</a>
              <a href="</.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cart-arrow-down fa-fw"></i>&nbsp; Event Manager</a>
              <a href="</.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cart-arrow-down fa-fw"></i>&nbsp; Package Manager</a>
              <a href="TravelManager.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cart-arrow-down fa-fw"></i>&nbsp; Travel Manager</a>
            </div>
            </div>
            
       
    </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
