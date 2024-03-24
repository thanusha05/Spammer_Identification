<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="DATA.DB"%>
<html>
   
<head>
<title>The Former Flat Responsive Agriculture bootstrap Website Template | Single :: w3layouts</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">	
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords" content="Bootstrap Responsive Templates, Iphone Compatible Templates, Smartphone Compatible Templates, Ipad Compatible Templates, Flat Responsive Templates"/>
<script src="js/jquery-1.11.0.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Arimo:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
 <script src="https://api.tomtom.com/maps-sdk-for-web/cdn/5.x/5.64.0/services/services-web.min.js"></script>
</head>
<body>
    <%
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
        %>
        <script>
            alert('<%=msg%>');
            alert(d);
        </script>
        <%
                session.removeAttribute("msg");
            }
            String name = (String) session.getAttribute("User_u");
            if (name != null) {
        %>
	<!--start-header-->
    <script type="text/javascript">
    	var map = null;
        var latLong =null;
			function showlocation() {
			   // One-shot position request.
			    navigator.geolocation.getCurrentPosition(callback);
			}
    	
      function callback(position) {
      	
      	var lat = position.coords.latitude;
      	var lon = position.coords.longitude;
      	            document.getElementById("lat").value=lat;
                     document.getElementById("lan").value=lon;

           	latLong	= new google.maps.LatLng(lat, lon);
       
      	   var latlng = new google.maps.LatLng(lat, lon);
           var  geocoder = new google.maps.Geocoder();
            geocoder.geocode
            ({ 'latLng': latlng }, 
            function (results, status)
            {
                var add=document.getElementById("loc1").value=results[0].formatted_address;
                alert(add); 
            });
            var addr=document.getElementById("loc1").value;
            if(addr === '' || addr === null || addr === undefined){
              tt.services.reverseGeocode({key:"1MmbJI1SBWF7Yht63JQXbpE5Yp5BvAge",   position: latLong})

                                        .go()
                                        .then(function (results) {
                                       // alert("success");
                                        var add=document.getElementById("loc1").value=results.addresses[0].address.freeformAddress;
                                    //alert(add); 
                                        //alert(results.addresses[0].address.freeformAddress);
                                    });
            initMap();
        }  }
      function initMap() {
        var mapOptions = {
          center: latLong,
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map-canvas"), 
                                          mapOptions);
     var marker = new google.maps.Marker({
				    position: latLong
				});      
				
				marker.setMap(map);
                                     	map.setZoom(8);
      	map.setCenter(marker.getPosition());
      } 
  
      //   google.maps.event.addDomListener(window, 'load', initMap);
    </script>
			<div id="home" class="header">
					<div class="top-header">
						<div class="container">
							<div class="logo">
							</div>
							<!--start-top-nav-->
							
                                                       
							<div class="clearfix"> </div>
						</div>
				</div>
			<!---pop-up-box---->
					  <script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
					<link href="css/popup-box.css" rel="stylesheet" type="text/css" media="all"/>
					<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					<!---//pop-up-box---->
				<div id="small-dialog" class="mfp-hide">
						
					</div>
					<div id="small-dialog1" class="mfp-hide">
						<div class="signup">
							<h3>Sign Up</h3>
							<h4>Enter Your Details Here</h4>
							<input type="text" value="First Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'First Name';}" />
							<input type="text" value="Second Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Second Name';}" />
							<input type="text" class="email"value="Enter Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Email';}"  />
							<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"/>
							<input type="submit"  value="SignUp"/>
						</div>
					</div>	
				 <script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
																						
						});
				</script>					
		<!--End-header-->
		<div class="navgation">
					<div class="menu">
                         <a class="toggleMenu" href="#"><img src="images/menu-icon.png" alt="" /> </a>
							<ul class="nav" id="nav">
							<li><a href="User_Home.jsp" class="active">Home</a></li>
							<li><a href="F_R_Checking.jsp">Query Expert</a></li>
                                                        <li><a href="analysis.jsp">View And Analysis</a></li>
                                                        <li><a href="bidding.jsp">Update Product</a></li>
                                                        <li><a href="cspre.jsp">Agent</a></li>
                                                        <li><a href="Logout.jsp" >Logout</a></li>
                                                        </ul>
					</div>
					 <h2 style="margin-top: -63px;">Welcome <span class="text-info"> <%=name%></span></h2>
			
		</div>
		</div>
		<!--starts-blog-->
        <div class="blog">
            <div class="container">
                <center>
                    <form action="locationSeeds.jsp" method="post">
                        <h3> Location Based Crop </h3>
                        <div>Current  Location : <input  type="text" value="" id="loc1" name="loc1" style="width: 845px;" readonly></div>
                            Current  latitude : <input type="text" value="" id="lat" name="lat" style="width: 360px;" readonly><br>
                            Current  longitude : <input type="text" value="" id="lan" name="lan" style="width: 360px;" readonly><br>
                            <input type="Submit" class="btn btn-info"  value="Check Location Based Seeds"> 
                    </form>
                </center>
        <div id="map-canvas" style="width: 500px; height: 500px">
        </div>
            </div>
		</div>
		<!--end-blog-->
		 <div class="footer">
                         <div class="container">
                                    <div class="footer-text">
                                        <center>	<script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOU-GKNx-YL5o-b8cvlqgyn0rso6iQtUk&callback=showlocation"
  type="text/javascript"></script></center>
									</div>
                         </div>
					<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
     </div>
</body>
<%
        } else {
            session.setAttribute("msg", "Session Out");
            response.sendRedirect("index.jsp");
        }
    %>
</html>