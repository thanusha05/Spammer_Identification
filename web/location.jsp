
<%@page import="GRPAHGENERATION.RMDPDTS"%>
<%@page import="DATA.GetInfo.cmdlikedet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DATA.DB"%>
<%@page import="DATA.GetInfo.MnubarDet"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>User Home</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <script src="assets/js/chart-master/Chart.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange = function() {
                window.location.hash = "no-back-button";
            }
        </script> 
        <link href="assets/SLIDER/2/ninja-slider.css" rel="stylesheet" type="text/css" />
        <!--ninjaVideoPlugin.js is required only when the slider contains videos, and its link should be placed before the ninja-slider.js link.-->
        <script src="assets/SLIDER/2/ninjaVideoPlugin.js" type="text/javascript"></script>
        <script src="assets/SLIDER/2/ninja-slider.js" type="text/javascript"></script>
        <style>
            body {font: normal 0.9em Arial;margin:60px 0;background-color:#222;color:#ddd;}
            a {color:#1155CC;}
            ul li {padding: 10px 0;}
        </style>
        <link href="assets/Slider1/themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
        <script src="assets/Slider1/themes/1/js-image-slider.js" type="text/javascript"></script>
        <link href="assets/Slider1/generic.css" rel="stylesheet" type="text/css" />
        <!-- Chat BOX-->   
        
        
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
            var geocoder = geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': latlng }, function (results, status) {
           alert(results[1].formatted_address);
            document.getElementById("loc1").value=results[1].formatted_address;
            
            });
            initMap();
        }
      function initMap() {
        var mapOptions = {
          center: latLong,
          zoom: 1,
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
        
        
        
        
        <script>
            videojs.options.flash.swf = "video-js.swf";
        </script>
             
        <style>
            @media only screen and (max-width : 540px)
            {
                .chat-sidebar
                {
                    display: none !important;
                }

                .chat-popup
                {
                    display: none !important;
                }
            }

            body
            {
                background-color: #e9eaed;
            }

            .chat-sidebar
            {
                width: 200px;
                position: fixed;
                height: 100%;
                right: 0px;
                top: 0px;
                padding-top: 10px;
                padding-bottom: 10px;
                border: 1px solid rgba(29, 49, 91, .3);
            }

            .sidebar-name
            {
                padding-left: 10px;
                padding-right: 10px;
                margin-bottom: 4px;
                font-size: 12px;
            }
            .sidebar-name span
            {
                padding-left: 5px;
            }
            .sidebar-name a
            {
                display: block;
                height: 100%;
                text-decoration: none;
                color: inherit;
            }
            .sidebar-name:hover
            {
                background-color:#e1e2e5;
            }
            .sidebar-name img
            {
                width: 32px;
                height: 32px;
                vertical-align:middle;
            }
            .popup-box
            {
                display: none;
                position: fixed;
                bottom: 25px;
                right: 220px;
                height: 285px;
                background-color: rgb(237, 239, 244);
                width: 300px;
                border: 1px solid rgba(29, 49, 91, .3);
            }

            .popup-box .popup-head
            {
                background-color: #6d84b4;
                padding: 5px;
                color: white;
                font-weight: bold;
                font-size: 14px;
                clear: both;
            }

            .popup-box .popup-head .popup-head-left
            {
                float: left;
            }

            .popup-box .popup-head .popup-head-right
            {
                float: right;
                opacity: 0.5;
            }

            .popup-box .popup-head .popup-head-right a
            {
                text-decoration: none;
                color: inherit;
            }

            .popup-box .popup-messages
            {
                height: 100%;
                overflow-y: scroll;
            }



        </style>
      
    </head>
    <body>
    <%
        String uname = (String) session.getAttribute("UNAME");
        String upass = (String) session.getAttribute("UPASS");
        String location = (String) session.getAttribute("ULOCATION");
        int vb = 0, vb1 = 0;
        if ((uname != null) && (upass != null)) {
            try {
                DB gb = new DB();
                RMDPDTS rmdt = new RMDPDTS();
                MnubarDet mbar = new MnubarDet();
                cmdlikedet clk = new cmdlikedet();
                String oname = mbar.username(uname);
          %>    
    
        <script>
            var unme = '<%=uname%>';
            var upwd = '<%=upass%>';
        </script>
        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
                            
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->               
                <a href="UsrHome.jsp" class="logo"><center><b style="color: #003366;">Generating Location-Sensitive Recommendations in
                            <br>Social Network Environments</b></center></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  notification start -->
                    <ul class="nav top-menu">
                        <!-- settings start -->
                        <li class="dropdown">
                            <%
                                int noti = mbar.cntnotific(uname);
                                String lati = mbar.latilangude(uname);
                                int nt = noti + 1;
                                int rrty = 0, rty = 0, i = 0, j = 0;
                                String fname = "", ctg = "", name = "", cry = "";
                                DB dn = new DB();
                                DB dn1 = new DB();
                                DB dn2 = new DB();
                                DB dn3 = new DB();
                                String rth = "", rrt = "";
                                String[] nitific = new String[nt];
                                ResultSet asw = dn.Select("select * from notification where D_UMail='" + uname + "' and D_UView='No'");
                                System.out.println("select * from notification where D_UMail='" + uname + "' and D_UView='No'");
                                while (asw.next()) {
                                    nitific[rrty] = asw.getString("INFORMATION");
                                    rrty++;
                                }
                                if (noti != 0) {
                            %>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="UsrHome.jsp#" onclick="sendInfo();">
                                <i class="fa fa-tasks"></i>
                                <span class="badge bg-theme"><%=noti%></span>
                            </a>
                            <ul class="dropdown-menu extended tasks-bar">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">You have <%=noti%> Notification</p>
                                </li>
                                <%
                                    for (i = 0; i < noti; i++) {
                                %>                                
                                <li>
                                    <a href="UsrHome.jsp#">
                                        <div class="task-info">
                                            <div class="desc"><%=nitific[i]%></div>                                            
                                        </div>                                       
                                    </a>
                                </li> 
                                <%
                                    }
                                %>                                
                                <li class="external">
                                    <a href="UNotifications.jsp">See All Notifications</a>
                                </li>
                            </ul>
                            <%
                            } else {
                            %>                                
                            <a data-toggle="dropdown" class="dropdown-toggle" href="UsrHome.jsp#">
                                <i class="fa fa-tasks"></i>                               
                            </a>
                            <%                                }
                            %>                           
                        </li>
                        <!-- settings end -->
                        <!-- inbox dropdown start-->
                        <li id="header_inbox_bar" class="dropdown">
                            <%
                                int msgs = mbar.cntmessage(uname);
                                int ms = msgs + 1;
                                String[] msgfrm = new String[ms];
                                String[] mfrmid = new String[ms];
                                String[] mgses = new String[ms];
                                ResultSet asw1 = dn.Select("select * from chat where T_UMail='" + uname + "' and T_VSts='No'");
                                System.out.println("select * from chat where T_UMail='" + uname + "' and T_VSts='No'");
                                while (asw1.next()) {
                                    msgfrm[rrty] = asw1.getString("F_UName");
                                    mfrmid[rrty] = asw1.getString("F_UMail");
                                    mgses[rrty] = asw1.getString("MESSAGE");
                                    rty++;
                                }
                                if (msgs != 0) {
                            %>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="UsrHome.jsp#" onclick="sendInfo1();">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-theme"><%=msgs%></span>
                            </a>
                            <ul class="dropdown-menu extended inbox">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">You have <%=msgs%> new messages</p>
                                </li>
                                <%
                                    for (j = 0; j < msgs; j++) {
                                %>                                
                                <li>
                                    <a href="UsrHome.jsp#">
                                        <span class="photo"><img alt="avatar" src="propicget.jsp?UMAIL=<%=mfrmid[j]%>"></span>
                                        <span class="subject">
                                            <span class="from"><%=msgfrm[j]%></span>
                                            <!--<span class="time">Just now</span>-->
                                        </span>
                                        <span class="message">
                                            <%=mgses[j]%>
                                        </span>
                                    </a>
                                </li>  
                                <%
                                    }
                                %>                                
                                <li>
                                    <a href="UMessages.jsp#">See all messages</a>
                                </li>
                            </ul>
                            <%
                            } else {
                            %>                                
                            <a data-toggle="dropdown" class="dropdown-toggle" href="UsrHome.jsp#">
                                <i class="fa fa-envelope-o"></i>                                
                            </a>
                            <%                                }
                            %>                           

                        </li>
                        <!-- inbox dropdown end -->
                    </ul>
                    <!--  notification end -->
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="Logout.jsp?TYPE=USER">Logout</a></li>
                    </ul>
                </div>
            </header>
            <!--header end-->

            <!-- **********************************************************************************************************************************************************
            MAIN SIDEBAR MENU
            *********************************************************************************************************************************************************** -->
            <!--sidebar start-->
            <aside>
                <div id="sidebar"  class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">

                        <p class="centered"><a href="UProfile.jsp?UMAIL=<%=uname%>"><img src="propicget.jsp?UMAIL=<%=uname%>" class="img-thumbnail" width="60"></a></p>
                        <h5 class="centered"><%=oname%></h5>

                        <li class="mt">
                            <a class="active" href="UsrHome.jsp">
                                <i class="fa fa-home"></i>
                                <span>Home</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="UsrFindFri.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Find Friends</span>
                            </a>                            
                        </li> 
                            <li class="sub-menu">
                            <a href="location.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>LOCATION</span>
                            </a>                            
                                       </li>  
                        <li class="sub-menu">
                            <a href="UviewMessages.jsp" >
                                <i class="fa fa-book"></i>
                                <span>Chat</span>
                            </a>                            
                        </li>
                        <li class="sub-menu">
                            <a href="UCirEvents.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Events On Circle</span>
                            </a>                            
                        </li>    
                        <li class="sub-menu">
                            <a href="UReCmdtion.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Recommendation To You</span>
                            </a>                            
                        </li>    

                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->
              
            
            <div class="blog">
			<div class="container">
                           
                            <center><form action="location1.jsp" method="post"><br>
                                    <br>
            <h3> Location Identification</h3>
           
            <div style="color: black">Current  latitude : <input type="text" value="" id="lat" name="lat" style="width: 360px; color: black" readonly><br></div>
            <div style="color: black">Current  longitude : <input type="text" value="" id="lan" name="lan" style="width: 360px; color: black" readonly><br></div>
        </form>
                                    </center>
                           
          <div class="top-menu">
                    <a class="nav pull-right ">
                        <div id="map-canvas" style=" width: 1040px; height: 600px">
    </div>
                    </a>
                </div>
     
			</div>
		</div>
            <div class="footer">
                         <div class="container">
                                    <div class="footer-text">
                                        <center>	<script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOU-GKNx-YL5o-b8cvlqgyn0rso6iQtUk&callback=showlocation"
  type="text/javascript"></script></center>
									</div>
                         </div>
					<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
     </div>
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->           
            <section id="main-content">
                <section class="wrapper">

                    <div class="row">
                        <div class="col-lg-9 main-chart">                           
                            <div class="row">           
                                
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;">
                                    <!-- INSTAGRAM PANEL -->
                                    <br>                                      <br><br>
                                    
                                <%
                                        int pdtlen1 = mbar.eventlen(lati);
                                        if (pdtlen1 > 0) {
                                            int imlen1 = mbar.frndslen(uname);
                                            int pd1 = pdtlen1 + imlen1;
                                            int psts12 = pd1 + 1;
                                            //int psts11 = psts12 + 1;
                                            int hhh1 = 0, cvb1 = 0;
                                            String[] etid = new String[psts12];
                                            String[] ename = new String[psts12];
                                            String[] eplace = new String[psts12];
                                            String[] edtttime = new String[psts12];
                                            String[] efname = new String[psts12];
                                            String[] epstby = new String[psts12];
                                            ResultSet rs91 = dn.Select("select * from event where City='" + location + "' order by ID desc");
                                            while (rs91.next()) {
                                                etid[hhh1] = rs91.getString("ID");
                                                ename[hhh1] = rs91.getString("Evnt_Name");
                                                eplace[hhh1] = rs91.getString("Venue");
                                                edtttime[hhh1] = rs91.getString("Evnt_Time");
                                                efname[hhh1] = rs91.getString("E_FleName");
                                                epstby[hhh1] = rs91.getString("E_AUser");
                                                hhh1++;
                                            }
                                    %>
                                    <h3>Event Recommendation</h3>
                                    <div id="sliderFrame">
                                       
                                        <div id="htmlcaption" style="display: none;">
                                            <em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.
                                        </div>
                                    </div><br><br><br>
                                    <h3>Product Recommendation</h3>
                                    <% }
                                        try {
                                            String[] rpdts = rmdt.RecomPrdts(location, uname);
                                            int prm = rpdts.length;
                                            String[] ppnm = new String[prm];
                                            String[] ppID = new String[prm];
                                            String[] ppce = new String[prm];
                                            String[] ppashp = new String[prm];
                                            String[] ppofr = new String[prm];
                                            String[] ppfname2 = new String[prm];
                                            if (prm > 0) {
                                                for (vb = 0; vb < prm; vb++) {
                                                    ResultSet rs9119 = dn.Select("select * from ptdvisuals where ID='" + rpdts[vb] + "'");
                                                    if (rs9119.next()) {
                                                        ResultSet rs911 = dn.Select("select * from products where ID='" + rs9119.getString("Pdt_ID") + "'");
                                                        if (rs911.next()) {
                                                            ppID[vb1] = rs911.getString("ID");
                                                            System.out.println("----------------------------PId is \t" + ppID[vb1]);
                                                            ppnm[vb1] = rs911.getString("P_Name");
                                                            System.out.println("----------------------------name is \t" + ppnm[vb1]);
                                                            ppce[vb1] = rs911.getString("P_Price");
                                                            System.out.println("-----------------------------price is \t" + ppID[vb1]);
                                                            ppashp[vb1] = rs911.getString("P_AvbleShop");
                                                            System.out.println("------------------------------shop is \t" + ppID[vb1]);
                                                            ppfname2[vb1] = rs911.getString("P_FlName");
                                                            System.out.println("-----------------------------------filename is \t" + ppID[vb1]);
                                                            //ppofr[vb1] = rs911.getString("Pdt_Offer");
                                                            vb1++;
                                                        }
                                                    }
                                                }
                                    %>
                                    <div id="sliderFrame">
                                        
                                        <div id="htmlcaption" style="display: none;">
                                            <em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.
                                        </div>
                                    </div><br><br><br>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            System.out.println("EROOR IN HOMEPAGE PRODUCT GETTING" + e);
                                        }
                                    %>
                                </div><!-- /col-md-4 -->  

                                <%
                                    int pdtlen = mbar.productlen();
                                    //if (pdtlen > 0) {
                                    int imlen = mbar.frndslen(uname);
                                    int pd = pdtlen + imlen;
                                    int psts = pd + 1;
                                    /*  int psts1 = psts + 1;
                                     int hhh = 0, cvb = 0;
                                     String[] ptid = new String[psts];
                                     String[] ptname = new String[psts];
                                     String[] pstunam = new String[psts];
                                     String[] psttime = new String[psts];
                                     String[] psttype = new String[psts];*/

                                    String tid = new String();
                                    String ptid = new String();
                                    String tname = new String();
                                    String tunam = new String();
                                    String ttime = new String();
                                    String ttype = new String();
                                    String pmail = new String();
                                    String lcity = new String();
                                    ResultSet rs9 = gb.Select("select * from ptdvisuals order by ID desc");
                                    while (rs9.next()) {
                                        tid = rs9.getString("ID");
                                        ptid = rs9.getString("Pdt_ID");
                                        tname = rs9.getString("F_Name");
                                        tunam = rs9.getString("P_UName");
                                        ttime = rs9.getString("P_Time");
                                        ttype = rs9.getString("Vis_Types");
                                        pmail = rs9.getString("P_UMail");
                                        lcity = rs9.getString("City");
                                        if ((ttype.equals("Image"))) {
                                            if (pmail.equalsIgnoreCase(uname)) {
                                %>
                                
                                <!-- /col-md-4 --> 
                                <%
                                } else {
                                    ResultSet gf1 = dn1.Select("select * from friends where RE_FUMail='" + uname + "' or RE_TUMail='" + pmail + "' and Status='Accept'");
                                    if (gf1.next()) {
                                %>
                            
                                <!-- /col-md-4 --> 
                                <%
                                    }
                                    ResultSet gf12 = dn2.Select("select * from friends where RE_TUMail='" + uname + "' and RE_FUMail='" + pmail + "' and Status='Accept'");
                                    if (gf12.next()) {
                                        /*   ptid[hhh] = rs9.getString("ID");
                                         ptname[hhh] = rs9.getString("F_Name");
                                         pstunam[hhh] = rs9.getString("P_UName");
                                         psttime[hhh] = rs9.getString("P_Time");
                                         psttype[hhh] = rs9.getString("Vis_Types");
                                         hhh++;*/
                                %>
                                
                                    
                                                    <%
                                                        int lcnt = clk.sinlikes(tid);
                                                        int lcnts = clk.sincmmnts(tid);
                                                        ResultSet rs10 = dn.Select("select * from likes where Post_ID='" + tid + "' and L_UMail='" + uname + "'");
                                                        if (rs10.next()) {
                                                            if ((rs10.getString("ULORUL")).equals("Like")) {
                                                    %>
                                                                                                       
                                                    
                                                    
                                                            <br>                  <br>
                                                    
                                                   
                                <%
                                        }
                                    }
                                } else if (ttype.equals("status")) {  String stat=new String(rs9.getBytes("PostVis"));
                                    %>
                                    
                                    
                                    
                                                        <%
                                                            int lcnt1 = clk.sinlikes(tid);
                                                            int lcnts1 = clk.sincmmnts(tid);
                                                            ResultSet rs101 = dn.Select("select * from likes where Post_ID='" + tid + "' and L_UMail='" + uname + "'");
                                                            if (rs101.next()) {
                                                                if ((rs101.getString("ULORUL")).equals("Like")) {
                                                        %>
                                   
                                                        
                                                        <%
                                                        } else {
                                                        %>
                                                       
                                                        
                                                        <%                                                 }
                                                        } else {
                                                        %>
                                                        
                                                        
                                                        <%                                                      }
                                                        %>                                                                                                                                                        
                                                                      
                                    
                                   
                                <!-- /col-md-4 -->
                             
                                
                                
                                <!-- /col-md-4 -->
                                
                               
                                
                                <!-- /col-md-4 -->
                               
                                
                                
                                <!-- /col-md-4 -->
                                <%
                                    }
                                } 
                                
                                    /*  ptid[hhh] = rs9.getString("ID");
                                     ptname[hhh] = rs9.getString("F_Name");
                                     pstunam[hhh] = rs9.getString("P_UName");
                                     psttime[hhh] = rs9.getString("P_Time");
                                     psttype[hhh] = rs9.getString("Vis_Types");
                                     hhh++;*/
                                %>
                               
                                
                                
                                <%
                                        }
                                    }
                                %>                                

                            </div><!-- /row -->
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->
                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                                                        
                                                
                    </div><!--/row -->
                </section>
            </section>           
            <!--main content end-->
            <!--footer start-->
            <!-- <footer class="site-footer">
                <div class="text-center">                    
                    Recommendation On OSN
                    <a href="UsrHome.jsp#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>-->
            <!--footer end-->
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/jquery-1.8.3.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="assets/js/jquery.sparkline.js"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>

        <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

        <!--script for this page-->
        <script src="assets/js/sparkline-chart.js"></script>    
        <script src="assets/js/zabuto_calendar.js"></script>	
<%
            String fbmsg = (String) session.getAttribute("fbmsg");
            if (fbmsg != null) {
        %>
        <script type="text/javascript">
   // var mmsg = '';
    alert("<%=fbmsg%>");
        </script>
        <%
            }
            session.removeAttribute("fbmsg");
        %>
        <script type="application/javascript">
            $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
            $(this).hide();
            });

            $("#my-calendar").zabuto_calendar({
            action: function () {
            return myDateFunction(this.id, false);
            },
            action_nav: function () {
            return myNavFunction(this.id);
            },
            ajax: {
            url: "show_data.php?action=1",
            modal: true
            },
            legend: [
            {type: "text", label: "Special event", badge: "00"},
            {type: "block", label: "Regular event", }
            ]
            });
            });


            function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
            }
        </script>

        <%
                } catch (Exception e) {
                    System.out.println("UserHome Error" + e);
                }
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
</html>


