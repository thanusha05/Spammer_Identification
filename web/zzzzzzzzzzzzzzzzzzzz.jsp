
<%@page import="GRPAHGENERATION.RMDPDTS"%>
<%@page import="DATA.GetInfo.cmdlikedet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DATA.DB"%>
<%@page import="DATA.GetInfo.MnubarDet"%>
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
        <!-- Image Slider -->
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
        <!--  Video Player -->
        <link href="assets/VPlayer/video-js.css" rel="stylesheet" type="text/css">
        <script src="assets/VPlayer/video.js"></script>
        <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
        <script>
            videojs.options.flash.swf = "video-js.swf";
        </script>
        <script type="text/javascript" src="assets/js/Validation.js"></script>
        <!-- Chat BOX-->        

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
    <%
        String uname = (String) session.getAttribute("UNAME");
        String upass = (String) session.getAttribute("UPASS");
        String location = (String) session.getAttribute("ULOCATION");
        int vb = 0, vb1 = 0;
        if ((uname != null) && (upass != null)) {
            RMDPDTS rmdt = new RMDPDTS();
            MnubarDet mbar = new MnubarDet();
            cmdlikedet clk = new cmdlikedet();
            String oname = mbar.username(uname);
            int noti = mbar.cntnotific(uname);
            String lati = mbar.latilangude(uname);
            int nt = noti + 1;
            int rrty = 0, rty = 0, i = 0, j = 0;
            String fname = "", ctg = "", name = "", cry = "";
            DB dn = new DB();
            DB dn1 = new DB();
            DB dn2 = new DB();
            String rth = "", rrt = "";
            String[] nitific = new String[nt];
            ResultSet asw = dn.Select("select * from notification where T_UMID='" + uname + "' and D_UView='No'");
            System.out.println("select * from notification where T_UMID='" + uname + "' and D_UView='No'");
            while (asw.next()) {
                nitific[rrty] = asw.getString("INFORMATION");
                rrty++;
            }
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
    %>
    <body>
        <script>
            var unme = '<%=uname%>';
            var upwd = '<%=upass%>';
        </script>
        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <script>
                //For Notification Clear
                var request;
                function sendInfo()
                {
                    var v = '<%=uname%>';
                    var cat = "Notification";
                    var url = "UpdateNoMsg.jsp?val=" + v + "&forcat=" + cat;

                    if (window.XMLHttpRequest) {
                        request = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try {
                        request.onreadystatechange = getInfo;
                        request.open("GET", url, true);
                        request.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }

                function getInfo() {
                    if (request.readyState == 4) {
                        var val = request.responseText;
                        // var rnoti = val.toString();
                        // alert(rnoti);
                        //location.reload();
                    }
                }

                //For Message Clear
                var request1;
                function sendInfo1()
                {
                    var v = '<%=uname%>';
                    var cat = "Message";
                    var url = "UpdateNoMsg.jsp?val=" + v + "&forcat=" + cat;

                    if (window.XMLHttpRequest) {
                        request1 = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request1 = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    try {
                        request1.onreadystatechange = getInfo1;
                        request1.open("GET", url, true);
                        request1.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }

                function getInfo1() {
                    if (request1.readyState == 4) {
                        var val = request1.responseText;
                        //  var rmsgs = val.toString();
                        //  alert(rmsgs);
                        //location.reload();
                    }
                }
            </script>                
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
                                    <a href="UNotifications.jsp">See All Tasks</a>
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
                        <li><a class="logout" href="Logout.jsp">Logout</a></li>
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
            <script>
                //Like Ajax Function
                var request09;
                function likefun(pstid)
                {
                    alert(pstid);
                    var tyhd = "Like";
                    var url = "UsrLkUlkpage.jsp?val=" + unme + "&PSTID=" + pstid + "&CTYPE=" + tyhd;
                    if (window.XMLHttpRequest) {
                        request09 = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request09 = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try {
                        request09.onreadystatechange = likefuninfo;
                        request09.open("GET", url, true);
                        request09.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }

                function likefuninfo() {
                    if (request09.readyState == 4) {
                        var val = request09.responseText;
                        var lsts = val.toString();
                        alert(lsts);
                        location.reload();
                    }
                }


                //UnLike Ajax Function
                var request08;
                function unlikefun(pstid1)
                {
                    alert(pstid1);
                    var tyhd = "UnLike";
                    var url = "UsrLkUlkpage.jsp?val=" + unme + "&PSTID=" + pstid1 + "&CTYPE=" + tyhd;

                    if (window.XMLHttpRequest) {
                        request08 = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request08 = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try {
                        request08.onreadystatechange = unlikefuninfo;
                        request08.open("GET", url, true);
                        request08.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }

                function unlikefuninfo() {
                    if (request08.readyState == 4) {
                        var val = request08.responseText;
                        var lsts = val.toString();
                        alert(lsts);
                        location.reload();
                    }
                }

            </script>  
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->           
            <section id="main-content">
                <section class="wrapper">

                    <div class="row">
                        <div class="col-lg-9 main-chart">                           
                            <div class="row">           
                                <script>
                                    function pstVld()
                                    {
                                        var pst = document.getElementById("usrposts").value
                                        if (PostPictVld(pst))
                                        {
                                            document.getElementById("usrposts").style.border = "";
                                            return true;
                                        }
                                        else
                                        {
                                            document.getElementById("usrposts").style.border = "2px solid red";
                                            document.getElementById("usrposts").focus();
                                            return false;
                                        }
                                    }
                                </script>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;">
                                    <!-- INSTAGRAM PANEL -->
                                    <center>
                                        <div class="showback">                                           
                                            <h4><i class="fa"></i>Your Posts</h4>                                           
                                            <form name="uploadpost" onsubmit="return pstVld();" id="uploadpost" enctype="multipart/form-data" method="post">
                                                <input type="hidden" class="form-control" name="Umail" id="Umail" value="<%=uname%>" readonly=""><br>   
                                                <input type="hidden" class="form-control" name="UName" id="UName"  value="<%=oname%>" readonly=""><br>                                                     
                                                <input type="hidden" class="form-control" name="CITY" id="CITY"  value="<%=location%>" readonly=""><br> 
                                                <input type="file" class="form-control" name="usrposts" id="usrposts" required=""><br>
                                                <input type="submit" class="btn btn-theme02" value="Post" formaction="PostVisuals">
                                            </form>
                                        </div><!-- /showback -->
                                    </center>  <br>                                      <br><br>
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
                                            if (pdtlen1 > 0) {
                                    %>
                                    Event Recommendation
                                    <div id="sliderFrame">
                                        <div id="slider">  
                                            <%
                                                if (((ename[0] != null) && (efname[0] != null)) && (pdtlen1 >= 1)) {
                                            %>
                                            <a href="UCirEvents.jsp?EID=<%=etid[0]%>"><img src="EVENT/<%=efname[0]%>" alt="<%=ename[0]%><%=eplace[0]%><%=edtttime[0]%><%=epstby[0]%>" /></a>                                                                                                       
                                                <%
                                                    }
                                                    if (((ename[1] != null) && (efname[1] != null)) && (pdtlen1 >= 2)) {
                                                %>
                                            <a href="UCirEvents.jsp?EID=<%=etid[0]%>"><img src="EVENT/<%=efname[1]%>" alt="<%=ename[1]%><%=eplace[1]%><%=edtttime[1]%><%=epstby[1]%>" /></a>                                                                                                                                    
                                                <%
                                                    }
                                                    if (((ename[2] != null) && (efname[2] != null)) && (pdtlen1 >= 3)) {
                                                %>
                                            <a href="UCirEvents.jsp?EID=<%=etid[0]%>"><img src="EVENT/<%=efname[2]%>" alt="<%=ename[2]%><%=eplace[2]%><%=edtttime[2]%><%=epstby[2]%>" /></a>                                                                                                                                      
                                                <%
                                                    }
                                                    if (((ename[3] != null) && (efname[3] != null)) && (pdtlen1 >= 4)) {
                                                %>
                                            <a href="UCirEvents.jsp?EID=<%=etid[0]%>"><img src="EVENT/<%=efname[3]%>" alt="<%=ename[3]%><%=eplace[3]%><%=edtttime[3]%><%=epstby[3]%>" /></a>                                                                                                                                      
                                                <%
                                                    }
                                                    if (((ename[4] != null) && (efname[4] != null)) && (pdtlen1 >= 5)) {
                                                %>
                                            <a href="UCirEvents.jsp?EID=<%=etid[0]%>"><img src="EVENT/<%=efname[4]%>" alt="<%=ename[4]%><%=eplace[4]%><%=edtttime[4]%><%=epstby[4]%>" /></a>                                                                                                                                      
                                                <%
                                                        }
                                                    }
                                                %>
                                        </div>
                                        <div id="htmlcaption" style="display: none;">
                                            <em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.
                                        </div>
                                    </div><br><br><br>
                                    Product Recommendation
                                    <% }
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
                                                System.out.println("Recommanded Products ID ---------------------------- \t" + rpdts[vb]);
                                                System.out.println("select * from products where ID='" + rpdts[vb] + "'");
                                                ResultSet rs911 = dn.Select("select * from products where ID='" + rpdts[vb] + "'");
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
                                    %>
                                    <div id="sliderFrame">
                                        <div id="slider">  
                                            <%
                                                if (((ppnm[0] != null) && (ppce[0] != null) && (ppashp[0] != null)) && (prm >= 1)) {
                                            %>
                                            <a href="UReCmdtion.jsp?EID=<%=ppID[0]%>"><img src="POSTS/<%=ppfname2[0]%>" alt="<%=ppnm[0]%><%=ppce[0]%><%=ppashp[0]%>"/></a>                                                                                                       
                                                <%
                                                    }
                                                    if (((ppnm[1] != null) && (ppce[1] != null) && (ppashp[1] != null)) && (prm >= 2)) {
                                                %>
                                            <a href="UReCmdtion.jsp?EID=<%=ppID[1]%>"><img src="POSTS/<%=ppfname2[1]%>" alt="<%=ppnm[1]%><%=ppce[1]%><%=ppashp[1]%>"/></a>                                                                                                       
                                                <%
                                                    }
                                                    if (((ppnm[2] != null) && (ppce[2] != null) && (ppashp[2] != null)) && (prm >= 3)) {
                                                %>
                                            <a href="UReCmdtion.jsp?EID=<%=ppID[2]%>"><img src="POSTS/<%=ppfname2[2]%>" alt="<%=ppnm[2]%><%=ppce[2]%><%=ppashp[2]%>"/></a>                                                                                                       
                                                <%
                                                    }
                                                    if (((ppnm[3] != null) && (ppce[3] != null) && (ppashp[3] != null)) && (prm >= 4)) {
                                                %>
                                            <a href="UReCmdtion.jsp?EID=<%=ppID[3]%>"><img src="POSTS/<%=ppfname2[3]%>" alt="<%=ppnm[3]%><%=ppce[3]%><%=ppashp[3]%>"/></a>                                                                                                       
                                                <%
                                                    }
                                                %>
                                        </div>
                                        <div id="htmlcaption" style="display: none;">
                                            <em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.
                                        </div>
                                    </div><br><br><br>
                                    <%
                                        }
                                    %>
                                </div><!-- /col-md-4 -->  

                                <%
                                    int pdtlen = mbar.productlen();
                                    if (pdtlen > 0) {
                                        int imlen = mbar.frndslen(uname);
                                        int pd = pdtlen + imlen;
                                        int psts = pd + 1;
                                        int psts1 = psts + 1;
                                        int hhh = 0, cvb = 0;
                                        String[] ptid = new String[psts];
                                        String[] ptname = new String[psts];
                                        String[] pstunam = new String[psts];
                                        String[] psttime = new String[psts];
                                        String[] psttype = new String[psts];
                                        ResultSet rs9 = dn.Select("select * from ptdvisuals order by ID desc");
                                        while (rs9.next()) {
                                            if (((rs9.getString("Vis_Types")).equals("Image")) || ((rs9.getString("Vis_Types")).equals("Video"))) {
                                                ResultSet gf1 = dn1.Select("select * from friends where RE_FUMail='" + uname + "' and RE_TUMail='" + rs9.getString("P_UMail") + "' and Status='Accept'");
                                                if (gf1.next()) {
                                                    ptid[hhh] = rs9.getString("ID");
                                                    ptname[hhh] = rs9.getString("F_Name");
                                                    pstunam[hhh] = rs9.getString("P_UName");
                                                    psttime[hhh] = rs9.getString("P_Time");
                                                    psttype[hhh] = rs9.getString("Vis_Types");
                                                    hhh++;
                                                }
                                                ResultSet gf12 = dn2.Select("select * from friends where RE_TUMail='" + uname + "' and RE_FUMail='" + rs9.getString("P_UMail") + "' and Status='Accept'");
                                                if (gf12.next()) {
                                                    ptid[hhh] = rs9.getString("ID");
                                                    ptname[hhh] = rs9.getString("F_Name");
                                                    pstunam[hhh] = rs9.getString("P_UName");
                                                    psttime[hhh] = rs9.getString("P_Time");
                                                    psttype[hhh] = rs9.getString("Vis_Types");
                                                    hhh++;
                                                }
                                            } else if ((rs9.getString("Vis_Types")).equals("Product")) {
                                                ptid[hhh] = rs9.getString("ID");
                                                ptname[hhh] = rs9.getString("F_Name");
                                                pstunam[hhh] = rs9.getString("P_UName");
                                                psttime[hhh] = rs9.getString("P_Time");
                                                psttype[hhh] = rs9.getString("Vis_Types");
                                                hhh++;
                                            }
                                        }
                                        for (cvb = 0; cvb < psts; cvb++) {
                                            if (psttype[cvb].equals("Image")) {
                                %>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;height: 75%">                                 
                                    <div class="col-lg-12 col-md-4 mb">
                                        <div class="content-panel pn">
                                            <div id="blog-bg" style="background-image:url(POSTS/<%=ptname[cvb]%>);background-size: 100% 100%;"></div>
                                            <div class="blog-text">
                                                <div class="row">    
                                                    <%
                                                        int lcnt = clk.sinlikes(ptid[cvb]);
                                                        int lcnts = clk.sincmmnts(ptid[cvb]);
                                                        ResultSet rs10 = dn.Select("select * from likes where Post_ID='" + ptid[cvb] + "' and L_UMail='" + uname + "'");
                                                        if (rs10.next()) {
                                                            if ((rs10.getString("ULORUL")).equals("Like")) {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="unlikefun(<%=ptid[cvb]%>);">UnLike  | <%=lcnt%> Likes</button>                                                                                                        
                                                    <%
                                                    } else {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="likefun(<%=ptid[cvb]%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                    <%                                                 }
                                                    } else {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="likefun(<%=ptid[cvb]%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                    <%                                                      }
                                                    %>        <br>                  <br>
                                                    <form class="form-inline" role="form" style="margin-top:-45px;margin-left: 145px;">
                                                        <div class="form-group">
                                                            <input class="form-control" size="35" type="hidden" name="PSTID" id="PSTID" value="<%=ptid[cvb]%>"/>
                                                            <input class="form-control" size="35" type="hidden" name="val" id="val" value="<%=uname%>"/>                                                            
                                                            <input class="form-control" size="35" type="text" name="CMNTS" id="CMNTS" placeholder="Your comments" required=""/>
                                                        </div>
                                                        <div class="form-group">                                                            
                                                            <button class="btn btn-primary" name="cbut" id="cbut" formaction="UaddCmnt.jsp">Add Comment</button> 
                                                            <a class="btn btn-primary" href="UViewComment.jsp?PSTID=<%=ptid[cvb]%>"><%=lcnts%> Comments </a> 
                                                        </div>
                                                    </form>                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /col-md-4-->                                                                                                                                                                       -->
                                </div><!-- /col-md-4 -->   
                                <% } else if (psttype[cvb].equals("Video")) {%>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;"> 
                                    <div class="col-lg-12 col-md-4 mb">
                                        <div class="content-panel pn">
                                            <center>
                                                <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" height="220" data-setup="{}">
                                                    <source src="POSTS/<%=ptname[cvb]%>" type='video/*' />                                           
                                                </video>
                                                <div class="blog-text">
                                                    <div class="row">    
                                                        <%
                                                            int lcnt = clk.sinlikes(ptid[cvb]);
                                                            int lcnts = clk.sincmmnts(ptid[cvb]);
                                                            ResultSet rs10 = dn.Select("select * from likes where Post_ID='" + ptid[cvb] + "' and L_UMail='" + uname + "'");
                                                            if (rs10.next()) {
                                                                if ((rs10.getString("ULORUL")).equals("Like")) {
                                                        %>
                                                        <button type="button" class="btn btn-theme" style="margin-left: -522px;" onclick="unlikefun(<%=ptid[cvb]%>);">UnLike  | <%=lcnt%> Likes</button>                                                                                                        
                                                        <%
                                                        } else {
                                                        %>
                                                        <button type="button" class="btn btn-theme" style="margin-left: -522px;" onclick="likefun(<%=ptid[cvb]%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                        <%                                                 }
                                                        } else {
                                                        %>
                                                        <button type="button" class="btn btn-theme" style="margin-left: -522px;" onclick="likefun(<%=ptid[cvb]%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                        <%                                                      }
                                                        %>                                                                                                                                                        
                                                        <form class="form-inline" role="form" style="margin-top:-45px;margin-left: 145px;">
                                                            <div class="form-group">
                                                                <input class="form-control" size="35" type="hidden" name="PSTID" id="PSTID" value="<%=ptid[cvb]%>"/>
                                                                <input class="form-control" size="35" type="hidden" name="val" id="val" value="<%=uname%>"/>                                                            
                                                                <input class="form-control" size="35" type="text" name="CMNTS" id="CMNTS" placeholder="Your comments" required=""/>
                                                            </div>
                                                            <div class="form-group">                                                            
                                                                <button class="btn btn-primary" name="cbut" id="cbut" formaction="UaddCmnt.jsp">Add Comment</button> 
                                                                <a class="btn btn-primary" href="UViewComment.jsp?PSTID=<%=ptid[cvb]%>"><%=lcnts%> Comments </a> 
                                                            </div>
                                                        </form>                                                
                                                    </div>
                                                </div>
                                            </center>   
                                        </div>
                                    </div>
                                </div><!-- /col-md-4 -->   
                                <%} else {%>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;height: 75%">                                 
                                    <div class="col-lg-12 col-md-4 mb">
                                        <div class="content-panel pn">
                                            <div id="blog-bg" style="background-image:url(POSTS/<%=ptname[cvb]%>);background-size: 100% 100%;"></div>
                                            <div class="blog-text">
                                                <div class="row">    
                                                    <%
                                                        int lcnt = clk.sinlikes(ptid[cvb]);
                                                        int lcnts = clk.sincmmnts(ptid[cvb]);
                                                        ResultSet rs10 = dn.Select("select * from likes where Post_ID='" + ptid[cvb] + "' and L_UMail='" + uname + "'");
                                                        if (rs10.next()) {
                                                            if ((rs10.getString("ULORUL")).equals("Like")) {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="unlikefun(<%=ptid[cvb]%>);">UnLike  | <%=lcnt%> Likes</button>                                                                                                        
                                                    <%
                                                    } else {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="likefun(<%=ptid[cvb]%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                    <%                                                 }
                                                    } else {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="likefun(<%=ptid[cvb]%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                    <%                                                      }
                                                    %>                                                                                                                                                        
                                                    <form class="form-inline" role="form" style="margin-top:-35px;margin-left: 145px;">
                                                        <div class="form-group">
                                                            <input class="form-control" size="35" type="hidden" name="PSTID" id="PSTID" value="<%=ptid[cvb]%>"/>
                                                            <input class="form-control" size="35" type="hidden" name="val" id="val" value="<%=uname%>"/>                                                            
                                                            <input class="form-control" size="35" type="text" name="CMNTS" id="CMNTS" placeholder="Your comments" required=""/>
                                                        </div>
                                                        <div class="form-group">                                                            
                                                            <button class="btn btn-primary" name="cbut" id="cbut" formaction="UaddCmnt.jsp">Add Comment</button> 
                                                            <a class="btn btn-primary" href="UViewComment.jsp?PSTID=<%=ptid[cvb]%>"><%=lcnts%> Comments </a> 
                                                            <a class="btn btn-primary" href="URatePdt.jsp?PSTID=<%=ptid[cvb]%>"> Rating </a> 
                                                        </div>
                                                    </form>                                                                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /col-md-4-->                                                                                                                                                                       -->
                                </div><!-- /col-md-4 -->  
                                <%                                        }
                                        }
                                    }
                                %>                                

                            </div><!-- /row -->
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->


                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                                                        
                        <div id="sidebar1" class="col-lg-3 ds" style="background:white;border: 2px solid black;overflow: auto;" >                                                                                                       
                            <h3>FRIENDS List</h3>    
                            <%
                                int fril = mbar.fredlenth(uname);
                                if (fril > 0) {
                            %>                        
                            <%
                                int frli1 = fril + 1;
                                int dri = 0, dd = 0, rdi = 0, df = 0;
                                String[] frmail = new String[frli1];
                                String[] frname = new String[frli1];
                                String[] toname = new String[frli1];
                                String[] tomail = new String[frli1];
                                ResultSet rs5 = dn.Select("select * from friends where RE_FUMail='" + uname + "' and Status='Accept'");

                                System.out.println(
                                        "select * from friends where RE_FUMail='" + uname + "' and Status='Accept'");
                                while (rs5.next()) {
                                    toname[dri] = rs5.getString("RE_TUName");
                                    tomail[dri] = rs5.getString("RE_TUMail");
                                    dri++;
                                }
                                ResultSet rs6 = dn.Select("select * from friends where RE_TUMail='" + uname + "' and Status='Accept'");

                                System.out.println(
                                        "select * from friends where RE_TUMail='" + uname + "' and Status='Accept'");
                                while (rs6.next()) {
                                    frmail[rdi] = rs6.getString("RE_FUMail");
                                    frname[rdi] = rs6.getString("RE_FUName");
                                    rdi++;
                                }
                                for (dd = 0;
                                        dd < fril;
                                        dd++) {
                                    if (tomail[dd] != null) {
                            %>                                                               
                            <div class="desc">                                   
                                <div class="thumb">
                                    <img class="img-circle" src="frinedpics.jsp?UMAIL=<%=tomail[dd]%>" width="35px" height="35px" align="">
                                </div>
                                <div class="details">
                                    <p><a href="#"><%=toname[dd]%></a><br/>                                        
                                    </p>
                                </div>                                        
                            </div>      
                            <%    }
                                }
                                for (df = 0;
                                        df < fril;
                                        df++) {
                                    if (frmail[df] != null) {
                            %>                                                               
                            <div class="desc">                                   
                                <div class="thumb">
                                    <img class="img-circle" src="frinedpics.jsp?UMAIL=<%=frmail[df]%>" width="45px" height="45px" align="">
                                </div>
                                <div class="details">
                                    <p><a href="#"><%=frname[df]%></a><br/>                                        
                                    </p>
                                </div>                                    
                            </div>      
                            <%    }
                                    }
                                }
                            %>                                                                               
                        </div><!-- /col-lg-3 -->                         
                    </div><!--/row -->
                </section>
            </section>           
            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">                    
                    Recommendation On OSN
                    <a href="UsrHome.jsp#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
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

        <%            String fbmsg = (String) session.getAttribute("fbmsg");
            if (fbmsg
                    != null) {
        %>
        <script type="text/javascript">
                                    var mmsg = '<%=fbmsg%>';
                                    var unique_id = $.gritter.add({
                                        // (string | mandatory) the heading of the notification
                                        title: 'Hello  ' + unme + '',
                                        // (string | mandatory) the text inside the notification
                                        text: mmsg,
                                        // (bool | optional) if you want it to fade out on its own or just sit there
                                        sticky: true,
                                        // (int | optional) the time you want it to be alive for before fading out
                                        time: '',
                                        // (string | optional) the class name you want to apply to that specific message
                                        class_name: 'my-sticky-class',
                                        left: '200px'

                                    });
        </script>
        <%
            }

            session.removeAttribute(
                    "fbmsg");
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
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
</html>


<%-- 
    Document   : UsrHome
    Created on : Jul 6, 2015, 11:46:54 AM
    Author     : alaguraj
--%>
<%@page import="GRPAHGENERATION.RMDPDTS"%>
<%@page import="DATA.GetInfo.cmdlikedet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DATA.DB"%>
<%@page import="DATA.GetInfo.MnubarDet"%>
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
        <!-- Image Slider -->
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
        <!--  Video Player -->
        <link href="assets/VPlayer/video-js.css" rel="stylesheet" type="text/css">
        <script src="assets/VPlayer/video.js"></script>
        <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
        <script>
            videojs.options.flash.swf = "video-js.swf";
        </script>
        <script type="text/javascript" src="assets/js/Validation.js"></script>
        <!-- Chat BOX-->        

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
    <%
        String uname = (String) session.getAttribute("UNAME");
        String upass = (String) session.getAttribute("UPASS");
        String location = (String) session.getAttribute("ULOCATION");
        int vb = 0, vb1 = 0;
        if ((uname != null) && (upass != null)) {
            RMDPDTS rmdt = new RMDPDTS();
            MnubarDet mbar = new MnubarDet();
            cmdlikedet clk = new cmdlikedet();
            String oname = mbar.username(uname);
            int noti = mbar.cntnotific(uname);
            String lati = mbar.latilangude(uname);
            int nt = noti + 1;
            int rrty = 0, rty = 0, i = 0, j = 0;
            String fname = "", ctg = "", name = "", cry = "";
            DB dn = new DB();
            DB dn1 = new DB();
            DB dn2 = new DB();
            String rth = "", rrt = "";
            String[] nitific = new String[nt];
            ResultSet asw = dn.Select("select * from notification where T_UMID='" + uname + "' and D_UView='No'");
            System.out.println("select * from notification where T_UMID='" + uname + "' and D_UView='No'");
            while (asw.next()) {
                nitific[rrty] = asw.getString("INFORMATION");
                rrty++;
            }
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
    %>
    <body>
        <script>
            var unme = '<%=uname%>';
            var upwd = '<%=upass%>';
        </script>
        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <script>
                //For Notification Clear
                var request;
                function sendInfo()
                {
                    var v = '<%=uname%>';
                    var cat = "Notification";
                    var url = "UpdateNoMsg.jsp?val=" + v + "&forcat=" + cat;

                    if (window.XMLHttpRequest) {
                        request = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try {
                        request.onreadystatechange = getInfo;
                        request.open("GET", url, true);
                        request.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }

                function getInfo() {
                    if (request.readyState == 4) {
                        var val = request.responseText;
                        // var rnoti = val.toString();
                        // alert(rnoti);
                        //location.reload();
                    }
                }

                //For Message Clear
                var request1;
                function sendInfo1()
                {
                    var v = '<%=uname%>';
                    var cat = "Message";
                    var url = "UpdateNoMsg.jsp?val=" + v + "&forcat=" + cat;

                    if (window.XMLHttpRequest) {
                        request1 = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request1 = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    try {
                        request1.onreadystatechange = getInfo1;
                        request1.open("GET", url, true);
                        request1.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }

                function getInfo1() {
                    if (request1.readyState == 4) {
                        var val = request1.responseText;
                        //  var rmsgs = val.toString();
                        //  alert(rmsgs);
                        //location.reload();
                    }
                }
            </script>                
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
                                    <a href="UNotifications.jsp">See All Tasks</a>
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
                        <li><a class="logout" href="Logout.jsp">Logout</a></li>
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
            <script>
                //Like Ajax Function
                var request09;
                function likefun(pstid)
                {
                    alert(pstid);
                    var tyhd = "Like";
                    var url = "UsrLkUlkpage.jsp?val=" + unme + "&PSTID=" + pstid + "&CTYPE=" + tyhd;
                    if (window.XMLHttpRequest) {
                        request09 = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request09 = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try {
                        request09.onreadystatechange = likefuninfo;
                        request09.open("GET", url, true);
                        request09.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }

                function likefuninfo() {
                    if (request09.readyState == 4) {
                        var val = request09.responseText;
                        var lsts = val.toString();
                        alert(lsts);
                        location.reload();
                    }
                }


                //UnLike Ajax Function
                var request08;
                function unlikefun(pstid1)
                {
                    alert(pstid1);
                    var tyhd = "UnLike";
                    var url = "UsrLkUlkpage.jsp?val=" + unme + "&PSTID=" + pstid1 + "&CTYPE=" + tyhd;

                    if (window.XMLHttpRequest) {
                        request08 = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request08 = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try {
                        request08.onreadystatechange = unlikefuninfo;
                        request08.open("GET", url, true);
                        request08.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }

                function unlikefuninfo() {
                    if (request08.readyState == 4) {
                        var val = request08.responseText;
                        var lsts = val.toString();
                        alert(lsts);
                        location.reload();
                    }
                }

            </script>  
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->           
            <section id="main-content">
                <section class="wrapper">

                    <div class="row">
                        <div class="col-lg-9 main-chart">                           
                            <div class="row">           
                                <script>
                                    function pstVld()
                                    {
                                        var pst = document.getElementById("usrposts").value
                                        if (PostPictVld(pst))
                                        {
                                            document.getElementById("usrposts").style.border = "";
                                            return true;
                                        }
                                        else
                                        {
                                            document.getElementById("usrposts").style.border = "2px solid red";
                                            document.getElementById("usrposts").focus();
                                            return false;
                                        }
                                    }
                                </script>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;">
                                    <!-- INSTAGRAM PANEL -->
                                    <center>
                                        <div class="showback">                                           
                                            <h4><i class="fa"></i>Your Posts</h4>                                           
                                            <form name="uploadpost" onsubmit="return pstVld();" id="uploadpost" enctype="multipart/form-data" method="post">
                                                <input type="hidden" class="form-control" name="Umail" id="Umail" value="<%=uname%>" readonly=""><br>   
                                                <input type="hidden" class="form-control" name="UName" id="UName"  value="<%=oname%>" readonly=""><br>                                                     
                                                <input type="hidden" class="form-control" name="CITY" id="CITY"  value="<%=location%>" readonly=""><br> 
                                                <input type="file" class="form-control" name="usrposts" id="usrposts" required=""><br>
                                                <input type="submit" class="btn btn-theme02" value="Post" formaction="PostVisuals">
                                            </form>
                                        </div><!-- /showback -->
                                    </center>  <br>                                      <br><br>
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
                                            if (pdtlen1 > 0) {
                                    %>
                                    Event Recommendation
                                    <div id="sliderFrame">
                                        <div id="slider">  
                                            <%
                                                if (((ename[0] != null) && (efname[0] != null)) && (pdtlen1 >= 1)) {
                                            %>
                                            <a href="UCirEvents.jsp?EID=<%=etid[0]%>"><img src="EVENT/<%=efname[0]%>" alt="<%=ename[0]%><%=eplace[0]%><%=edtttime[0]%><%=epstby[0]%>" /></a>                                                                                                       
                                                <%
                                                    }
                                                    if (((ename[1] != null) && (efname[1] != null)) && (pdtlen1 >= 2)) {
                                                %>
                                            <a href="UCirEvents.jsp?EID=<%=etid[0]%>"><img src="EVENT/<%=efname[1]%>" alt="<%=ename[1]%><%=eplace[1]%><%=edtttime[1]%><%=epstby[1]%>" /></a>                                                                                                                                    
                                                <%
                                                    }
                                                    if (((ename[2] != null) && (efname[2] != null)) && (pdtlen1 >= 3)) {
                                                %>
                                            <a href="UCirEvents.jsp?EID=<%=etid[0]%>"><img src="EVENT/<%=efname[2]%>" alt="<%=ename[2]%><%=eplace[2]%><%=edtttime[2]%><%=epstby[2]%>" /></a>                                                                                                                                      
                                                <%
                                                    }
                                                    if (((ename[3] != null) && (efname[3] != null)) && (pdtlen1 >= 4)) {
                                                %>
                                            <a href="UCirEvents.jsp?EID=<%=etid[0]%>"><img src="EVENT/<%=efname[3]%>" alt="<%=ename[3]%><%=eplace[3]%><%=edtttime[3]%><%=epstby[3]%>" /></a>                                                                                                                                      
                                                <%
                                                    }
                                                    if (((ename[4] != null) && (efname[4] != null)) && (pdtlen1 >= 5)) {
                                                %>
                                            <a href="UCirEvents.jsp?EID=<%=etid[0]%>"><img src="EVENT/<%=efname[4]%>" alt="<%=ename[4]%><%=eplace[4]%><%=edtttime[4]%><%=epstby[4]%>" /></a>                                                                                                                                      
                                                <%
                                                        }
                                                    }
                                                %>
                                        </div>
                                        <div id="htmlcaption" style="display: none;">
                                            <em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.
                                        </div>
                                    </div><br><br><br>
                                    Product Recommendation
                                    <% }
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
                                                System.out.println("Recommanded Products ID ---------------------------- \t" + rpdts[vb]);
                                                System.out.println("select * from products where ID='" + rpdts[vb] + "'");
                                                ResultSet rs911 = dn.Select("select * from products where ID='" + rpdts[vb] + "'");
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
                                    %>
                                    <div id="sliderFrame">
                                        <div id="slider">  
                                            <%
                                                if (((ppnm[0] != null) && (ppce[0] != null) && (ppashp[0] != null)) && (prm >= 1)) {
                                            %>
                                            <a href="UReCmdtion.jsp?EID=<%=ppID[0]%>"><img src="POSTS/<%=ppfname2[0]%>" alt="<%=ppnm[0]%><%=ppce[0]%><%=ppashp[0]%>"/></a>                                                                                                       
                                                <%
                                                    }
                                                    if (((ppnm[1] != null) && (ppce[1] != null) && (ppashp[1] != null)) && (prm >= 2)) {
                                                %>
                                            <a href="UReCmdtion.jsp?EID=<%=ppID[1]%>"><img src="POSTS/<%=ppfname2[1]%>" alt="<%=ppnm[1]%><%=ppce[1]%><%=ppashp[1]%>"/></a>                                                                                                       
                                                <%
                                                    }
                                                    if (((ppnm[2] != null) && (ppce[2] != null) && (ppashp[2] != null)) && (prm >= 3)) {
                                                %>
                                            <a href="UReCmdtion.jsp?EID=<%=ppID[2]%>"><img src="POSTS/<%=ppfname2[2]%>" alt="<%=ppnm[2]%><%=ppce[2]%><%=ppashp[2]%>"/></a>                                                                                                       
                                                <%
                                                    }
                                                    if (((ppnm[3] != null) && (ppce[3] != null) && (ppashp[3] != null)) && (prm >= 4)) {
                                                %>
                                            <a href="UReCmdtion.jsp?EID=<%=ppID[3]%>"><img src="POSTS/<%=ppfname2[3]%>" alt="<%=ppnm[3]%><%=ppce[3]%><%=ppashp[3]%>"/></a>                                                                                                       
                                                <%
                                                    }
                                                %>
                                        </div>
                                        <div id="htmlcaption" style="display: none;">
                                            <em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.
                                        </div>
                                    </div><br><br><br>
                                    <%
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
                                    ResultSet rs9 = dn.Select("select * from ptdvisuals order by ID desc");
                                    while (rs9.next()) {
                                        tid = rs9.getString("ID");
                                      //  ptid = rs9.getString("Pdt_ID");
                                        tname = rs9.getString("F_Name");
                                        tunam = rs9.getString("P_UName");
                                        ttime = rs9.getString("P_Time");
                                        ttype = rs9.getString("Vis_Types");
                                        pmail = rs9.getString("P_UMail");
                                        if ((ttype.equals("Image"))) {
                                            ResultSet gf1 = dn1.Select("select * from friends where RE_FUMail='" + uname + "' and RE_TUMail='" + pmail + "' and Status='Accept'");
                                            if (gf1.next()) {
                                %>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;height: 75%">                                 
                                    <div class="col-lg-12 col-md-4 mb">
                                        <div class="content-panel pn">
                                            <div id="blog-bg" style="background-image:url(POSTS/<%=tname%>);background-size: 100% 100%;"></div>
                                            <div class="blog-text">
                                                <div class="row">    
                                                    <%
                                                        int lcnt = clk.sinlikes(tid);
                                                        int lcnts = clk.sincmmnts(tid);
                                                        ResultSet rs10 = dn.Select("select * from likes where Post_ID='" + tid + "' and L_UMail='" + uname + "'");
                                                        if (rs10.next()) {
                                                            if ((rs10.getString("ULORUL")).equals("Like")) {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="unlikefun(<%=tid%>);">UnLike  | <%=lcnt%> Likes</button>                                                                                                        
                                                    <%
                                                    } else {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="likefun(<%=tid%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                    <%                                                 }
                                                    } else {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="likefun(<%=tid%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                    <%                                                      }
                                                    %>        <br>                  <br>
                                                    <form class="form-inline" role="form" style="margin-top:-45px;margin-left: 145px;">
                                                        <div class="form-group">
                                                            <input class="form-control" size="35" type="hidden" name="PSTID" id="PSTID" value="<%=tid%>"/>
                                                            <input class="form-control" size="35" type="hidden" name="val" id="val" value="<%=uname%>"/>                                                            
                                                            <input class="form-control" size="35" type="text" name="CMNTS" id="CMNTS" placeholder="Your comments" required=""/>
                                                        </div>
                                                        <div class="form-group">                                                            
                                                            <button class="btn btn-primary" name="cbut" id="cbut" formaction="UaddCmnt.jsp">Add Comment</button> 
                                                            <a class="btn btn-primary" href="UViewComment.jsp?PSTID=<%=tid%>"><%=lcnts%> Comments </a> 
                                                        </div>
                                                    </form>                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /col-md-4-->                                                                                                                                                                       -->
                                </div><!-- /col-md-4 --> 
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
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;height: 75%">                                 
                                    <div class="col-lg-12 col-md-4 mb">
                                        <div class="content-panel pn">
                                            <div id="blog-bg" style="background-image:url(POSTS/<%=tname%>);background-size: 100% 100%;"></div>
                                            <div class="blog-text">
                                                <div class="row">    
                                                    <%
                                                        int lcnt = clk.sinlikes(tid);
                                                        int lcnts = clk.sincmmnts(tid);
                                                        ResultSet rs10 = dn.Select("select * from likes where Post_ID='" + tid + "' and L_UMail='" + uname + "'");
                                                        if (rs10.next()) {
                                                            if ((rs10.getString("ULORUL")).equals("Like")) {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="unlikefun(<%=tid%>);">UnLike  | <%=lcnt%> Likes</button>                                                                                                        
                                                    <%
                                                    } else {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="likefun(<%=tid%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                    <%                                                 }
                                                    } else {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="likefun(<%=tid%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                    <%                                                      }
                                                    %>        <br>                  <br>
                                                    <form class="form-inline" role="form" style="margin-top:-45px;margin-left: 145px;">
                                                        <div class="form-group">
                                                            <input class="form-control" size="35" type="hidden" name="PSTID" id="PSTID" value="<%=tid%>"/>
                                                            <input class="form-control" size="35" type="hidden" name="val" id="val" value="<%=uname%>"/>                                                            
                                                            <input class="form-control" size="35" type="text" name="CMNTS" id="CMNTS" placeholder="Your comments" required=""/>
                                                        </div>
                                                        <div class="form-group">                                                            
                                                            <button class="btn btn-primary" name="cbut" id="cbut" formaction="UaddCmnt.jsp">Add Comment</button> 
                                                            <a class="btn btn-primary" href="UViewComment.jsp?PSTID=<%=tid%>"><%=lcnts%> Comments </a> 
                                                        </div>
                                                    </form>                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /col-md-4-->                                                                                                                                                                       -->
                                </div><!-- /col-md-4 --> 
                                <%
                                    }
                                } else if (ttype.equals("Video")) {
                                    ResultSet gf1 = dn1.Select("select * from friends where RE_FUMail='" + uname + "' and RE_TUMail='" + pmail + "' and Status='Accept'");
                                    if (gf1.next()) {
                                        /*   ptid[hhh] = rs9.getString("ID");
                                         ptname[hhh] = rs9.getString("F_Name");
                                         pstunam[hhh] = rs9.getString("P_UName");
                                         psttime[hhh] = rs9.getString("P_Time");
                                         psttype[hhh] = rs9.getString("Vis_Types");
                                         hhh++;*/
                                %>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;"> 
                                    <div class="col-lg-12 col-md-4 mb">
                                        <div class="content-panel pn">
                                            <center>
                                                <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" height="220" data-setup="{}">
                                                    <source src="POSTS/<%=tname%>" type='video/*' />                                           
                                                </video>
                                                <div class="blog-text">
                                                    <div class="row">    
                                                        <%
                                                            int lcnt = clk.sinlikes(tid);
                                                            int lcnts = clk.sincmmnts(tid);
                                                            ResultSet rs10 = dn.Select("select * from likes where Post_ID='" + tid + "' and L_UMail='" + uname + "'");
                                                            if (rs10.next()) {
                                                                if ((rs10.getString("ULORUL")).equals("Like")) {
                                                        %>
                                                        <button type="button" class="btn btn-theme" style="margin-left: -522px;" onclick="unlikefun(<%=tid%>);">UnLike  | <%=lcnt%> Likes</button>                                                                                                        
                                                        <%
                                                        } else {
                                                        %>
                                                        <button type="button" class="btn btn-theme" style="margin-left: -522px;" onclick="likefun(<%=tid%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                        <%                                                 }
                                                        } else {
                                                        %>
                                                        <button type="button" class="btn btn-theme" style="margin-left: -522px;" onclick="likefun(<%=tid%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                        <%                                                      }
                                                        %>                                                                                                                                                        
                                                        <form class="form-inline" role="form" style="margin-top:-45px;margin-left: 145px;">
                                                            <div class="form-group">
                                                                <input class="form-control" size="35" type="hidden" name="PSTID" id="PSTID" value="<%=tid%>"/>
                                                                <input class="form-control" size="35" type="hidden" name="val" id="val" value="<%=uname%>"/>                                                            
                                                                <input class="form-control" size="35" type="text" name="CMNTS" id="CMNTS" placeholder="Your comments" required=""/>
                                                            </div>
                                                            <div class="form-group">                                                            
                                                                <button class="btn btn-primary" name="cbut" id="cbut" formaction="UaddCmnt.jsp">Add Comment</button> 
                                                                <a class="btn btn-primary" href="UViewComment.jsp?PSTID=<%=tid%>"><%=lcnts%> Comments </a> 
                                                            </div>
                                                        </form>                                                
                                                    </div>
                                                </div>
                                            </center>   
                                        </div>
                                    </div>
                                </div><!-- /col-md-4 -->
                                <%
                                    }
                                    ResultSet gf12 = dn2.Select("select * from friends where RE_TUMail='" + uname + "' and RE_FUMail='" + pmail + "' and Status='Accept'");
                                    if (gf12.next()) {
                                        /* ptid[hhh] = rs9.getString("ID");
                                         ptname[hhh] = rs9.getString("F_Name");
                                         pstunam[hhh] = rs9.getString("P_UName");
                                         psttime[hhh] = rs9.getString("P_Time");
                                         psttype[hhh] = rs9.getString("Vis_Types");
                                         hhh++;*/
                                %>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;"> 
                                    <div class="col-lg-12 col-md-4 mb">
                                        <div class="content-panel pn">
                                            <center>
                                                <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" height="220" data-setup="{}">
                                                    <source src="POSTS/<%=tname%>" type='video/*' />                                           
                                                </video>
                                                <div class="blog-text">
                                                    <div class="row">    
                                                        <%
                                                            int lcnt = clk.sinlikes(tid);
                                                            int lcnts = clk.sincmmnts(tid);
                                                            ResultSet rs10 = dn.Select("select * from likes where Post_ID='" + tid + "' and L_UMail='" + uname + "'");
                                                            if (rs10.next()) {
                                                                if ((rs10.getString("ULORUL")).equals("Like")) {
                                                        %>
                                                        <button type="button" class="btn btn-theme" style="margin-left: -522px;" onclick="unlikefun(<%=tid%>);">UnLike  | <%=lcnt%> Likes</button>                                                                                                        
                                                        <%
                                                        } else {
                                                        %>
                                                        <button type="button" class="btn btn-theme" style="margin-left: -522px;" onclick="likefun(<%=tid%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                        <%                                                 }
                                                        } else {
                                                        %>
                                                        <button type="button" class="btn btn-theme" style="margin-left: -522px;" onclick="likefun(<%=tid%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                        <%                                                      }
                                                        %>                                                                                                                                                        
                                                        <form class="form-inline" role="form" style="margin-top:-45px;margin-left: 145px;">
                                                            <div class="form-group">
                                                                <input class="form-control" size="35" type="hidden" name="PSTID" id="PSTID" value="<%=tid%>"/>
                                                                <input class="form-control" size="35" type="hidden" name="val" id="val" value="<%=uname%>"/>                                                            
                                                                <input class="form-control" size="35" type="text" name="CMNTS" id="CMNTS" placeholder="Your comments" required=""/>
                                                            </div>
                                                            <div class="form-group">                                                            
                                                                <button class="btn btn-primary" name="cbut" id="cbut" formaction="UaddCmnt.jsp">Add Comment</button> 
                                                                <a class="btn btn-primary" href="UViewComment.jsp?PSTID=<%=tid%>"><%=lcnts%> Comments </a> 
                                                            </div>
                                                        </form>                                                
                                                    </div>
                                                </div>
                                            </center>   
                                        </div>
                                    </div>
                                </div><!-- /col-md-4 -->
                                <%
                                    }
                                } else if (ttype.equals("Product")) {
                                    /*  ptid[hhh] = rs9.getString("ID");
                                     ptname[hhh] = rs9.getString("F_Name");
                                     pstunam[hhh] = rs9.getString("P_UName");
                                     psttime[hhh] = rs9.getString("P_Time");
                                     psttype[hhh] = rs9.getString("Vis_Types");
                                     hhh++;*/
                                %>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;height: 75%">                                 
                                    <div class="col-lg-12 col-md-4 mb">
                                        <div class="content-panel pn">
                                            <div id="blog-bg" style="background-image:url(POSTS/<%=tname%>);background-size: 100% 100%;"></div>
                                            <div class="blog-text">
                                                <div class="row">    
                                                    <%
                                                        int lcnt = clk.sinlikes(tid);
                                                        int lcnts = clk.sincmmnts(tid);
                                                        ResultSet rs10 = dn.Select("select * from likes where Post_ID='" + tid + "' and L_UMail='" + uname + "'");
                                                        if (rs10.next()) {
                                                            if ((rs10.getString("ULORUL")).equals("Like")) {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="unlikefun(<%=tid%>);">UnLike  | <%=lcnt%> Likes</button>                                                                                                        
                                                    <%
                                                    } else {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="likefun(<%=tid%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                    <%                                                 }
                                                    } else {
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;" onclick="likefun(<%=tid%>);"><i class="fa fa-check"></i>Like| <%=lcnt%> Likes</button>
                                                    <%                                                      }
                                                    %>                                                                                                                                                        
                                                    <form class="form-inline" role="form" style="margin-top:-35px;margin-left: 145px;">
                                                        <div class="form-group">
                                                            <input class="form-control" size="35" type="hidden" name="PSTID" id="PSTID" value="<%=tid%>"/>
                                                            <input class="form-control" size="35" type="hidden" name="val" id="val" value="<%=uname%>"/>                                                            
                                                            <input class="form-control" size="35" type="text" name="CMNTS" id="CMNTS" placeholder="Your comments" required=""/>
                                                        </div>
                                                        <div class="form-group">                                                            
                                                            <button class="btn btn-primary" name="cbut" id="cbut" formaction="UaddCmnt.jsp">Add Comment</button> 
                                                            <a class="btn btn-primary" href="UViewComment.jsp?PSTID=<%=tid%>"><%=lcnts%> Comments </a> 
                                                            <a class="btn btn-primary" href="URatePdt.jsp?PSTID=<%=tid%>"> Rating </a> 
                                                        </div>
                                                    </form>                                                                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /col-md-4-->                                                                                                                                                                       -->
                                </div><!-- /col-md-4 -->  
                                <%
                                        }
                                    }
                                %>                                

                            </div><!-- /row -->
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->


                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                                                        
                        <div id="sidebar1" class="col-lg-3 ds" style="background:white;border: 2px solid black;overflow: auto;" >                                                                                                       
                            <h3>FRIENDS List</h3>    
                            <%                                int fril = mbar.fredlenth(uname);
                                if (fril
                                        > 0) {
                            %>                        
                            <%
                                int frli1 = fril + 1;
                                int dri = 0, dd = 0, rdi = 0, df = 0;
                                String[] frmail = new String[frli1];
                                String[] frname = new String[frli1];
                                String[] toname = new String[frli1];
                                String[] tomail = new String[frli1];
                                ResultSet rs5 = dn.Select("select * from friends where RE_FUMail='" + uname + "' and Status='Accept'");

                                System.out.println(
                                        "select * from friends where RE_FUMail='" + uname + "' and Status='Accept'");
                                while (rs5.next()) {
                                    toname[dri] = rs5.getString("RE_TUName");
                                    tomail[dri] = rs5.getString("RE_TUMail");
                                    dri++;
                                }
                                ResultSet rs6 = dn.Select("select * from friends where RE_TUMail='" + uname + "' and Status='Accept'");

                                System.out.println(
                                        "select * from friends where RE_TUMail='" + uname + "' and Status='Accept'");
                                while (rs6.next()) {
                                    frmail[rdi] = rs6.getString("RE_FUMail");
                                    frname[rdi] = rs6.getString("RE_FUName");
                                    rdi++;
                                }
                                for (dd = 0;
                                        dd < fril;
                                        dd++) {
                                    if (tomail[dd] != null) {
                            %>                                                               
                            <div class="desc">                                   
                                <div class="thumb">
                                    <img class="img-circle" src="frinedpics.jsp?UMAIL=<%=tomail[dd]%>" width="35px" height="35px" align="">
                                </div>
                                <div class="details">
                                    <p><a href="#"><%=toname[dd]%></a><br/>                                        
                                    </p>
                                </div>                                        
                            </div>      
                            <%    }
                                }
                                for (df = 0;
                                        df < fril;
                                        df++) {
                                    if (frmail[df] != null) {
                            %>                                                               
                            <div class="desc">                                   
                                <div class="thumb">
                                    <img class="img-circle" src="frinedpics.jsp?UMAIL=<%=frmail[df]%>" width="45px" height="45px" align="">
                                </div>
                                <div class="details">
                                    <p><a href="#"><%=frname[df]%></a><br/>                                        
                                    </p>
                                </div>                                    
                            </div>      
                            <%    }
                                    }
                                }
                            %>                                                                               
                        </div><!-- /col-lg-3 -->                         
                    </div><!--/row -->
                </section>
            </section>           
            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">                    
                    Recommendation On OSN
                    <a href="UsrHome.jsp#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
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

        <%            String fbmsg = (String) session.getAttribute("fbmsg");
            if (fbmsg
                    != null) {
        %>
        <script type="text/javascript">
                                    var mmsg = '<%=fbmsg%>';
                                    var unique_id = $.gritter.add({
                                        // (string | mandatory) the heading of the notification
                                        title: 'Hello  ' + unme + '',
                                        // (string | mandatory) the text inside the notification
                                        text: mmsg,
                                        // (bool | optional) if you want it to fade out on its own or just sit there
                                        sticky: true,
                                        // (int | optional) the time you want it to be alive for before fading out
                                        time: '',
                                        // (string | optional) the class name you want to apply to that specific message
                                        class_name: 'my-sticky-class',
                                        left: '200px'

                                    });
        </script>
        <%
            }

            session.removeAttribute(
                    "fbmsg");
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
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
</html>


