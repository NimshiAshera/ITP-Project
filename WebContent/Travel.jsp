<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="travel/style.css">

<body style="background:url(travel/cover.jpg) no-repeat; background-size:cover; background-attachment: fixed; padding:0; margin:0;">

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
	
	<br/><br/><br/><br/>
		
	<h3 style="font-size: 100px;">TRAVEL BLOG</h3>
	
	<div class="travel">
			
		<div class="col">
			<div class="table">
				<h2>GALLE LIGHT HOUSE</h2>
					<div class="visit">
						<img src="travel/sri-lanka-travel-host-galle-day-tour.jpg" width="350" height="280">
					</div>
					<ul>
Galle is beautiful city seeped in centuries of history. The remains of this history 
can still be seen everywhere from its cobblestoned streets, to the historic monuments, 
to the many still functional structures such as the Galle Lighthouse. The Galle Lighthouse, 
or Pointe de Galle Light as it was also known, was the very first light station to be built 
in Sri Lanka. The light station is within the walls of the ancient Galle Fort, a UNESCO world 
heritage site and well known tourist attraction.The lighthouse is strategically located at the 
southern end of the promontory.This original structure stood 24.5 m tall (80 feet). 
The Galle Lighthouse is currently operated and managed by the Sri Lanka Ports Authority. 
The lights work through a computerized system which allows the foremost light to switch
 on every night and switch off in the morning. Visitors are not allowed to climb the lighthouse.
					</ul>
					<a href="#">For More Details</a>
			</div>
		
		</div>
		<div class="col">
			<div class="table">
				<h2>PATNA DENIYAYE</h2>
					<div class="visit">
						<img src="travel/FB_IMG_1552709813360.jpg" width="350" height="350">
					</div>
					<ul>
Patna Sliding Rock, locally know as the Patna Burus 
Gala is one of the newer destinations discovered 
local travelers. The location is situated inside 
Patna Division in Enesalwatta estate belonging to 
Maturata Plantations in Deniyaya. At this location 
the river flows over a number of wide rocks with 
gentle slopes and at end of the each rock lies a 
shallow pool. Due to the gentle water flow over 
the smooth rock surface, number of natural water
slides are created on the rock.
					</ul>
					<a href="#">For More Details</a>
			</div>
		
		</div>
		<div class="col">
			<div class="table">
				<h2>MIRISSA BEACH</h2>
					<div class="pop">Popular</div>
					<div class="visit">
						<img src="travel/Palm.jpg" width="350" height="320">
					</div>
					<ul>
Mirissa Beach is a great place to go whale watching. 
There are many tour companies that offer whale and 
dolphin watching tours and if you are lucky you can 
get to see many different types. Blue whales, 
Bryde's whales, Sperm whales, Fin whales and Orca 
have all been spotted off Mirissa.Sometimes you can 
see turtles and various fish species, for example 
Bluefin tuna & flying fish. So you will be unlucky 
if you don't see anything! The peak season for 
seeing whales in Mirissa and the south of Sri Lanka 
is between December and March.
					</ul>
					<a href="#">For More Details</a>
			</div>
		
		</div>
		<div class="col">
			<div class="table">
				<h2>GALLE DUTCH FORT</h2>
					<div class="visit">
						<img src="travel/2379232605_68ae6f785b.jpg" width="350" height="320">
					</div>
					<ul>
The Galle Fort, or Dutch Fort as it is also known, 
is a fortification first built by the Portugese on the 
SouthWestern coast of Sri Lanka. According to a statement 
by UNESCO the site was recognized as a World Heritage Site 
for its unique exposition of an urban ensemble which 
illustrates the interaction of European architecture and 
South Asian traditions from the 16th to the 19th centuries 
which is the criteterion number four for such recognition.
					</ul>
					<a href="#">For More Details</a>
			</div>
		
		</div>
		<div class="col">
			<div class="table">
				<h2>HIKKADUWA BEACH & SURFING</h2>
					<div class="pop">Popular</div>
					<div class="visit">
						<img src="travel/insta-3.jpg" width="350" height="320">
					</div>
					<ul>
Hikkaduwa Beach and Surfing Hikkaduwa beach is one of the most popular tourist places 
in Sri lanka Known for the harmonized and calm environment. The Beach is considered to
 be one of the finest places in the country for surfing and it is also well known for 
seafood currie which gives an extraordinary touch while having the perfect day on the beach. 
You can enjoy Surfing to the fullest in the months of November to March when waves rise up. 
Many tourists have recommended surfing in these months.
					</ul>
					<a href="#">For More Details</a>
			</div>
		
		</div>
		<div class="col">
			<div class="table">
				<h2>BIRDS PARK HAMBANTHOTA</h2>
					<div class="visit">
						<img src="travel/birds.jpg" width="300" height="300">
					</div>
					<ul>
Birds Park is a home to endemic and exotic birds with over 180 varieties and around 3200 birds. 
The park which is located in the Southern part of the island expands on a landscape of 35 acres 
and is dedicated to create awareness and interest in wild life and the Importance of Conservation 
of fauna and flora.The Centre breeds endangered bird species with the assistance of foreign bird 
breeding centers and exchange of rare species with other zoological gardens in the world. It also 
facilitates university students and research fellows to conduct studies and researches.
					</ul>
					<a href="#">For More Details</a>
			</div>
		
		</div>
	
	</div>
	
	<div class="w3-black w3-center w3-padding-24"><h3><b>Powered by ECO Tours</b></h3></div>
  
<!-- End page content -->

</body>
</html>