<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Home Page</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

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

	

<!-- Page content -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- Automatic Slideshow Images -->
  <div class="mySlides w3-display-container w3-center">
    <img src="images/01.jpg" style="width:100%; height:980px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      <h3>Galle</h3>
    </div>
  </div>  
  <div class="mySlides w3-display-container w3-center">
    <img src="images/02.jpg" style="width:100%; height:980px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      <h3>Unawatuna</h3> 
    </div>
  </div>  
  <div class="mySlides w3-display-container w3-center">
    <img src="images/03.jpg" style="width:100%; height:980px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      <h3>Arugam-Bay</h3>
    </div>
  </div>  
  <div class="mySlides w3-display-container w3-center">
    <img src="images/05.jpg" style="width:100%; height:980px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      <h3>Tangalla</h3>    
    </div>
  </div>  
  <div class="mySlides w3-display-container w3-center">
    <img src="images/08.jpg" style="width:100%; height:980px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      <h3>Hikkaduwa</h3>    
    </div>
  </div>  
  <div class="mySlides w3-display-container w3-center">
    <img src="images/07.jpg" style="width:100%; height:980px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      <h3>Mirissa</h3> 
    </div>
  </div>
  <div class="mySlides w3-display-container w3-center">
    <img src="images/15.jpg" style="width:100%; height:980px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      <h3>Koggala</h3> 
    </div>
  </div>
    
  <!-- About SriLanka -->
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:900px" id="band">
    <h2 class="w3-wide">ABOUT PARADISE</h2>
    <p class="w3-opacity"><i>Ayubowan</i></p>
    <p class="w3-justify">Sri Lanka, formerly called "Ceylon", is an island nation in the 
						Indian Ocean, southeast of the Indian subcontinent, in a strategic 
						location near major Indian Ocean sea lanes.Proximity to the Indian 
						subcontinent has facilitated close cultural interaction between 
						Sri Lanka and India from ancient times. At a crossroads of maritime 
						routes traversing the Indian Ocean, Sri Lanka has also been exposed 
						to cultural influences from other Asian civilizations. The climate 
						is tropical and warm, due to the moderating effects of ocean winds. 
						Mean temperatures range from 17 °C (62.6 °F) in the central highlands, 
						where frost may occur for several days in the winter. Rainfall pattern 
						is influenced by monsoon winds from the Indian Ocean and Bay of Bengal.    
						
  	<div class="w3-row w3-padding-32">
      <div class="w3-third">
        
        <img src="images/map.jpg" class="w3-round w3-margin-bottom "  style="width:500px; height:700px; position:relative; ">
      
      </div>
    </div>
  </div>

  <!-- Map Section -->
  <div class="w3-black" id="tour">
    <div class="w3-container w3-content w3-padding-64" style="max-width:900px">
      
         <p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2030672.362610328!2d79.73098304395932!3d6.243035501705419!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae173bad9013377%3A0x44238fe850f6f47e!2sSouthern+Province!5e0!3m2!1sen!2slk!4v1552664915460" width="800" height="800" frameborder="0" style="border:0" allowfullscreen></iframe></p>
  
   </div>
  </div>
  
  
  <!-- The Contact Section -->
  
  <%@include file="Contacts.jsp"%>
  
<!-- End Page Content -->
</div>

<!-- Image of location-->
<img src="background/end.jpg" class="w3-image w3-greyscale-min" style="width:100%">

<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->



<script>
// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 4000);    
}

// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}

</script>

</body>
</html>