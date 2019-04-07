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
	
<body style="background:url(images/img01.gif) repeat;">
  <div id="wrapper">
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="page-content">
					
					<div class="post">
					
					
					<br><br><br><div class="form-style-5">

	
	<div class="form">
	
	<form action="SpaRegis" method="post" enctype="multipart/form-data">
	
	<i style='font-size:48px' class='fas'>&#xf236;</i><h4><font color ="#00cc7a"><font size="8">Spa Registration</font></font></h4>
	
	                          
                            
	
		                      <label>Name</label>
                                <p><input type="text" class="form-control"  name="name" placeholder=" Name"  ></p>
                            
                            
                                 <label>Spa ID</label>
                               <p> <input type="text" class="form-control"  name="id" placeholder="ID"></p>
                               
                                <label>Image</label>
                               <p> <input type="file" class="form-control"  name="avatar" size="4000000" accept="image/x-png,image/jpg,image/jpeg"></p><br>
                               
                               If you have multiple choices copy & paste below<br>
                               
                                <label><u>Facials </u> </label>
                               
                                *Express Facial     --->    $45 <br>
                                *Signature Facial   --->    $65   <br>
                                *Radiance Facial    --->    $90<br>
                                *Gentlemen's Facial  --->   $65<br>
                                *Stone Facial       --->    $75<br>
                                *Age Management Facial  ---> $80<br>
                                *Ultimate Back Treatment --->$65<br>
                                *Luxury Facial         --->  $80<br>
                                *Deep sea Facial       --->  $80<br>
                                *Revitalizing Facial   --->  $30 <br>
                                *Eye Contour           --->  $85<br>
                                
                                 <p><textarea name="facials" rows="10" cols="30" ></textarea></p>
                           
                            
                             <label><u>Waxing  </u></label>
                               
                            *Lip Wax--->$60<br>    
                            *Chin Wax---$70<br>
                            *Sideburn --->$65Wax<br>
                            *Full Face Wax--->$80<br>
                            *Hand Wax--->$70<br>
                            *Chest Wax--->$70<br>
                            *Forearm Wax--->$65<br>
                            *Brazilian--->$85<br>
                           
                            
                            <p><textarea name="waxing" rows="10" cols="30" ></textarea></p>
                            
                             <label><u>Body Treatments </u></label>
                           
                          *Body Polish<br>
                          *Aroma,salt Treatment/Vichy Rain<br>
                          *Seaweed or Mud Body Wrap<br>
                          *Airbrush Tan/Body Polish<br>
                          
                           <p><textarea name="body" rows="10" cols="30" ></textarea></p>
                            
                           <label><u>Massage Therapy </u></label>
                               
                           *Tension Relief Massage<br>
                           *Swedish Massage<br>
                           *Deep Tissue Massage<br>
                           *Aromatic Wellness Massage<br>
                           *Deluxe Swedish Massage<br>
                           <p><textarea name="massage" rows="10" cols="30" ></textarea></p>
                          
                          <label>Tinting </label>
                            
                          *Lash Tint<br>
                          *Brow Tint<br>
                          
                            
                            <p><textarea name="tinting" rows="10" cols="30" ></textarea></p>
                            
                         
                            
                            
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