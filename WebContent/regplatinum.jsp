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
    	
    
    	<script type="text/javascript" >
		function validation(){


			var pname=document.form1.pname.value;
			
						
				if(pname==""){
					alert("Please insert the Package name");
					return false;
				}
			
			
			var pid=document.form1.pid.value;
			var Pid= /^[0-9]$/;
			
				if(pid==""){
					alert("Please insert the package ID name");
					return false;
				}else if(!pid.match(Pid)){
					alert("Please insert numbers only for package ID name");
					return false;
				}
			
								
				
		}


		</script>

		<title>Platinum Register</title>

		<%@ include file="styles.jsp" %>

</head>
                 

    <body class="w3-#e6ffee" style="background-color: #e6ffee">

        <%@ include file="navigationOwner.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px; background-color: light-grey">

            <!-- Header -->
            <header class="w3-container" style="padding-top:22px">
                
            <div class="form-style-5">
			<div class="form">
	
			<form action="PlatinumRegister" name="form1" method="post" enctype="multipart/form-data" onSubmit="return validation()">
	
			<i style='font-size:48px' class='fas'>&#xf183;</i><font color ="#00cc7a" size="8"> Platinum Registration</font>
			
			

 
 
		<label>Package Name</label>
		<p><input type="text" class="form-control"  name="pname" id="pname" placeholder="ccc"   ></p>
                            
		<label> package ID</label>
		<p> <input type="text" class="form-control" name="pid" id="pid" placeholder="1100"  ></p>
                            
		<label>Max Person</label>
		<p> 
		<select name="person" placeholder="Select Max person">
  		<option name="person" id="person" value="2">2</option>
  		<option name="person" id="person" value="6">6</option>
  	  	<option name="person" id="person" value="10">10</option>
  	
		</select>
		</p>
		

                                                             
		<label>Bed</label>
		<p> 
		<select name="bed" placeholder="Select Bed">
  		<option name="bed" id="bed" value="1">1</option>
  		<option name="bed" id="bed" value="3">3</option>
  		<option name="bed" id="bed" value="5">5</option>
		</select>
		</p> 
		
		<label>Upload Image</label>
        <p><input type="file" name="avatar" id="avatar"></p><br/>
        
		
		<label>Day 01 details</label>
		<p><textarea type="text" placeholder="Enter text here..." name="d1" id="d1"> 
		</textarea>
		</p>
		
		<label>Day 02 details</label>
		<p><textarea type="text" placeholder="Enter text here..." name="d2" id="d2"> 
		</textarea>
		</p>
		
		<label>Day 03 details</label>
		<p><textarea type="text" placeholder="Enter text here..." name="d3" id="d3"> 
		</textarea>
		</p>
		
		<label>Day 04 details</label>
		<p><textarea type="text" placeholder="Enter text here..." name="d4" id="d4"> 
		</textarea>
		</p>
		
		<label>Day 05 details</label>
		<p><textarea type="text" placeholder="Enter text here..." name="d5" id="d5"> 
		</textarea>
		</p>
		
		<label>Day 06 details</label>
		<p><textarea type="text" placeholder="Enter text here..." name="d6" id="d6"> 
		</textarea>
		</p>
		
		<label>Day 07 details</label>
		<p><textarea type="text" placeholder="Enter text here..." name="d7" id="d7"> 
		</textarea>
		</p>

                             
  
		<input type="submit" value="Register" name="submitButton"
					id="sButton">		
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