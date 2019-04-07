<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4;">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> &nbsp;Menu</button>
    <span class="w3-bar-item w3-right"><div style="color: silver;">Eco Travels</div></span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-black w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row" >
        <div class="w3-col s4">
            <i class="fas fa-users-cog fa-4x"></i>
        </div>
        <div class="w3-col s8 w3-bar">
            <span>Welcome, <strong>Accountant</strong></span><br>
            <a href="#" class="w3-bar-item w3-btn"><i class="fa fa-user"></i></a>
            <a href="#" class="w3-bar-item w3-btn"><i class="fa fa-cog"></i></a>
            <a href="#" class="w3-bar-item w3-btn"><i class="fa fa-sign-out-alt"></i></a>
        </div>
    </div>
    <hr style="border: 1px solid transparent">

    <div class="w3-bar-block w3-padding-24">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
        <a href="<%= request.getContextPath()%>/dashboard.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-tachometer-alt fa-fw"></i>&nbsp; Dashboard</a>
        <a href="<%= request.getContextPath()%>/view_bad_debts.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-business-time fa-fw"></i>&nbsp; Bad Debts</a>
        <a href="<%= request.getContextPath()%>/view_income_menu.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-hand-holding-usd fa-fw"></i>&nbsp; Income</a>
      
        <div class="w3-dropdown-hover w3-hover-blue">
            <button class="w3-button w3-hover-blue" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Transactions <i class="fa fa-caret-down"></i></button>
            <div class="w3-dropdown-content w3-bar-block">
                <a href="<%= request.getContextPath()%>/view_business_transactions.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-building fa-fw"></i>&nbsp; Business</a>
                <a href="<%= request.getContextPath()%>/view_booking_transactions.jsp" class="w3-bar-item w3-button w3-padding w3-hover-blue"><i class="fa fa-cart-arrow-down fa-fw"></i>&nbsp; Booking</a>
            </div>
        </div>

    </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
