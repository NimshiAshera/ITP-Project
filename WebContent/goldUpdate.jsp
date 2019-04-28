
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    
    	<link rel="stylesheet" type="text/css" href="form.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    	
    


		<title>Gold Image Update</title>

		<%@ include file="styles.jsp" %>

	</head>
         <body style="background:url(images/img01.gif) repeat;">
                 

    <body class="w3-#e6ffee" style="background-color: #e6ffee">

        <%@ include file="navigationOwner.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px; background-color: light-grey">

            <!-- Header -->
            <header class="w3-container" style="padding-top:22px">
                
            <div class="form-style-5">
			<div class="form">
	
	
			<i style='font-size:48px' class='fas'>&#xf183;</i><font color ="#00cc7a" size="8"> Gold Image Update</font>
			
		
		<div class="form-style-5">
			<div class="form">
				<form action="UpdateGold" method="post" enctype="multipart/form-data">
										
						<lable>Package ID</lable>
						<p><input id="input" type="text"
							value="pid" name="pid" disabled="disabled"></p>
							
						<lable>Package Name</lable>
						<p><input id="input" type="text"
							value="pname" name="pname" disabled="disabled"></p>	
						
					 	<lable>Day 1</lable>
						<p><input id="input" type="text"
							value="d1" name="d1" ></p>	
							
						<lable>Day 2</lable>
						<p><input id="input" type="text"
							value="d2" name="d2" ></p>	
							
						<lable>Day 3</lable>
						<p><input id="input" type="text"
							value="d3" name="d3" ></p>	
							
						<lable>Day 4</lable>
						<p><input id="input" type="text"
							value="d4" name="d4" ></p>	
							
						<lable>Day 5</lable>
						<p><input id="input" type="text"
							value="d5" name="d5" ></p>					
 						
 					

				       <br/> <input type="submit" value="Update" name="submitButton" id="sButton">
				       <br/> <input type="submit" value="Delete" name="submitButton" id="sButton">
				</form>
			</div>
		</div>

		<h1 style="font-size: 40px; color: red;">${insertUnsuccess}</h1>

 
 
		
	</form>
			
	</div>
	</div>
                
                
           </header>

            <div class="w3-panel">
                <div class="w3-row">
                    <div class="w3-col w3-center">

                    </div>
                </div>
            </div>

            <%@ include file="scripts.jsp" %>
        </div>
        
        
        <div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
	<!-- End page content -->
	
        
    </body>