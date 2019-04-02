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
  <span class="w3-left w3-padding" ><h2><b>OUR GALLERY</b></h2></span> 
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content" style="max-width:2100px; margin-top:83px">
  
  <!-- Photo grid -->
  <div class="w3-row w3-grayscale-min">
    <div class="w3-quarter">
      <img src="gallery/001.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Mirissa Sri Lanka">
      <img src="gallery/02.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Peacock Capture @ Kumana National Park">
      <img src="gallery/03.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Resort @ Yala National Park">
   </div>
    
   <div class="w3-quarter">
      <img src="gallery/031.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Galle Dutch Fort Light House">
      <img src="gallery/005.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Ganga Bees Yala Resort">
      <img src="gallery/007.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Katharagama Annual Perahara">
    </div>
    
    <div class="w3-quarter">
      <img src="gallery/009.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Deniyaye Scenery">
      <img src="gallery/011.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Bandagiri Hotel in Down South">
      <img src="gallery/013.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Fatna Deniyaye">
    </div>

    <div class="w3-quarter">
      <img src="gallery/014.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="The Villa Bentotha">
      <img src="gallery/015.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Sinharaja Rain Forest">
      <img src="gallery/08.jpg" style="width:100% ; height: 280px" onclick="onClick(this)" alt="Flock of Elephanrt @ Yala ">
    </div>
    
    
  </div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      
      <a href="Gallery_01.jsp" class="w3-bar-item w3-black w3-button w3-black-button">1</a>
      <a href="Gallery_02.jsp" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="Gallery_03.jsp" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="Gallery_02.jsp" class="w3-bar-item w3-button w3-hover-black">�</a>
     
      
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