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

 
<title>Travelling Places</title>
</head>
	
		
<body style="background:url(images/img01.gif) repeat;">

  <%@ include file="navigationOwner.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px; background-color: light-grey">

            <!-- Header -->
            <header class="w3-container" style="padding-top:22px">
                
            <div class="form-style-5">
			<div class="form">
	
			<form action="TravelRegister" name="form1" method="post" enctype="multipart/form-data" >
	
			<br><br><br>
	
	<i style='font-size:24px' class='fas'>&#xf5a0;</i><h2><font color ="#00cc7a" size="8" >Traveling Place </font></h2>
	<br>
	
	                        
		                      	<label>Traveling Place</label>
                                <p><input type="text" class="form-control" id="name" name="name" placeholder=" Name"  ></p>
                            
                            
                               	<label> Place Details</label>
                               	<p> <input type="text" class="form-control" id="details" name="details" placeholder="Details"  ></p>
                            
                            
                            	<label>Upload Image</label>
                                <p><input  type="file" id="avatar" name="avatar" ></p><br/>
                                
                                
                           
                            
		
	
	<input type="submit" value="Submit" name="submitButton"
					id="sButton">	
	</form>
	</div>
	</div>

        </div>
    </body>

</html>