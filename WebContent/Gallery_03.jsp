<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="gallery_1.css">
<link rel="stylesheet" href="gallery2.css">

<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif; font-size:30px}
.w3-quarter img{margin-bottom: -6px; cursor: pointer}
.w3-quarter img:hover{opacity: 0.6; transition: 0.3s}
</style>

<title>Gallery</title>
</head>

<body class="w3-white">

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-white w3-xlarge w3-padding-16">
  <span class="w3-left w3-padding"><h2><b>OUR GALLERY</b></h2></span>
  
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content" style="max-width:2100px; margin-top:83px">
  
  <!-- Photo grid -->
  <div class="w3-row w3-grayscale-min">
    <div class="w3-quarter">
      <img src="gallery/45.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Hummanaya">
      <img src="gallery/32.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Flock of Deer-Yala National Park">
      <img src="gallery/0033.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Unawatua Beach">
   </div>
    
   <div class="w3-quarter">
      <img src="gallery/034.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Chaarya REsort & Spa">
      <img src="gallery/035.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Kosgoda Turtle Hatchery">
      <img src="gallery/36.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Hikkaduwa Beach Hotel">
    </div>
    
    <div class="w3-quarter">
      <img src="gallery/44.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Traditional Fishing Sceneary">
      <img src="gallery/038.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="The Fortress Resort & Spa">
      <img src="gallery/0039.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Tissamaharama Temple ">
    </div>

    <div class="w3-quarter">
      <img src="gallery/40.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Blue whale watching at Benthota">
      <img src="gallery/041.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Heritance Hotel, Ahungalla">
      <img src="gallery/043.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Beruwala Light House">
    </div>
    
    
  </div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="Gallery_02.jsp" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="Gallery_01.jsp" class="w3-bar-item w3-black w3-button">1</a>
      <a href="Gallery_02.jsp" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="Gallery_03.jsp" class="w3-bar-item w3-button w3-hover-black">3</a>
      
      
    </div>
  </div>
  
  <!-- Modal for full size images on click-->
  <div id="modal01" class="w3-modal w3-black" style="padding-top:0" onclick="this.style.display='none'">
    <span class="w3-button w3-black w3-xlarge w3-display-topright">&times;</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
      <img id="img01" class="w3-image">
      <p id="caption"></p>
    </div>
  </div>

  

  
  <div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>

<!-- End page content -->
</div>

<script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

</script>


</body>
</html>