<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Gold</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
    <style type="text/css">
    .mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}


/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>
    
    
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>

   <!-- Navbar -->


	<%
		if (session.getAttribute("username") == null) {
	%>
		<jsp:include page="Header-Before.jsp"></jsp:include>
	<%
		} else {
	%>
		<jsp:include page="Header.jsp"></jsp:include>
	<%
		}
	%>


	<!-- END nav -->
		
		<br><br>

    <div class="hero-wrap" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <h1 class="mb-4 bread">Gold</h1>
            </div>
          </div>
        </div>
      </div>
    </div>

<section class="ftco-section bg-light">
    	<div class="container">
    	
    	<div class="col-md-12 room-single mt-4 mb-5 ftco-animate">
    						<p style="font-size:25px">What is the Speciality in Gold ???</p>
    						<div class="d-md-flex mt-5 mb-5">
    							<ul class="list">
	    							<li style="font-size:20px"><span>*</span> A <b>luxury tour package</b> for 5 days with unforgettable memories.. </li><br>
	    							<li style="font-size:20px"><span>*</span> Specially for families , honeymoon couples , & office staff vacations.</li><br>
	    							<li style="font-size:20px"><span>*</span> Package Includes ;</li><br>
	    							<li style="font-size:20px; color:platinum"><span>**</span> Candle Light Dinners</li>
	    							<li style="font-size:20px; color:platinum"><span>**</span> Wild Safari</li>
	    							<li style="font-size:20px; color:platinum"><span>**</span> Luxury Treats For Your Mind, Body & Soul </li>
	    							<li style="font-size:20px; color:platinum"><span>**</span> With Finest Dishes</li>
	    						</ul>
	    						
    						</div>
    			</div>
    	
    		<div class="row">

		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="Gold_View" class="img d-flex justify-content-center align-items-center" style="background-image: url(package/g1.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="Gold_View">Family Package</a></h3>
		    						<p><span class="price mr-2">$100.00</span> <span class="per">per person</span></p>
		    						<p><span class="per">Price Includes Children above 8 years</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 6 Persons</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed Rooms:</span> 3</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="Gold_View" class="btn-custom">View More <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="GoldV" class="img d-flex justify-content-center align-items-center" style="background-image: url(package/g6.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="GoldV">Deluxe Package</a></h3>
		    						<p><span class="price mr-2">$100.00</span> <span class="per">per person</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 10 Persons</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed Rooms:</span> 5</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="GoldV" class="btn-custom">View More<span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="GoldView" class="img d-flex justify-content-center align-items-center" style="background-image: url(package/p1.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="GoldView">Couple Package</a></h3>
		    						<p><span class="price mr-2">$100.00</span> <span class="per">per person</span></p>
		    						<p><span class="per">Special for Honeymoon Couples</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 2 Persons</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed Rooms:</span> 1</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="GoldView" class="btn-custom">View More <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    		</div>
		    		
		    		<div class="slideshow-container">

							<div class="mySlides fade">
  							<div class="numbertext">1 / 7</div>
  							<img src="package/g1.jpg" style="width:80%"></div>
  							
  							<div class="mySlides fade">
  							<div class="numbertext">2 / 7</div>
  							<img src="package/g2.jpg" style="width:80%"></div>
  							
  							<div class="mySlides fade">
  							<div class="numbertext">3 / 7</div>
  							<img src="package/g3.jpg" style="width:80%"></div>
  							
  							<div class="mySlides fade">
  							<div class="numbertext">4 / 7</div>
  							<img src="package/g4.jpg" style="width:80%"></div>
  							
  							<div class="mySlides fade">
  							<div class="numbertext">5 / 7</div>
  							<img src="package/g5.jpg" style="width:80%"></div>
  							
  							<div class="mySlides fade">
  							<div class="numbertext">6 / 7</div>
  							<img src="package/g6.jpg" style="width:80%"></div>
  							
  							<div class="mySlides fade">
  							<div class="numbertext">7 / 7</div>
  							<img src="package/g7.jpg" style="width:80%"></div>
  							
  				



				</div>
				<br>

				<div style="text-align:center">
  					<span class="dot"></span> 
  					<span class="dot"></span> 
  					<span class="dot"></span>
  					<span class="dot"></span> 
  					<span class="dot"></span> 
  					<span class="dot"></span> 
  					<span class="dot"></span> 
  				 
				</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
		    		

    	</div>
    </section>
    


    

    <footer>

		<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>

	</footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>