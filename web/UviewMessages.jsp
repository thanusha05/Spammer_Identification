

<%@page import="DATA.DB1"%>
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

        <title>User View Messages</title>
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

            form, p, span {
                margin:0;
                padding:0; }

            input { font:12px arial;color: deeppink; }

            a {
                color:#0000FF;
                text-decoration:none; }

            a:hover { text-decoration:underline; }

            #wrapper, #loginform {
                margin:0 auto;
                padding-bottom:25px;
                background:#EBF4FB;
                width:504px;
                border:1px solid #ACD8F0; }

            #loginform { padding-top:18px; }

            #loginform p { margin: 5px; }

            #chatbox {
                text-align:left;
                margin:0 auto;
                margin-bottom:25px;
                padding:10px;
                background:#fff;
                height:270px;
                width:430px;
                border:1px solid #ACD8F0;
                overflow:auto; }

            #usermsg {
                width:395px;
                border:1px solid #ACD8F0; }

            #submit { width: 60px; }

            .error { color: #ff0000; }

            #menu { padding:12.5px 25px 12.5px 25px; }

            .welcome { float:left; }

            .logout { float:right; }

            .msgln { margin:0 0 2px 0; }    
        </style>
    </head>
    <%
        String uname = (String) session.getAttribute("UNAME");
        String upass = (String) session.getAttribute("UPASS");
        String location = (String) session.getAttribute("ULOCATION");
        int vb = 0, vb1 = 0;
        System.out.println("111111111111111111111111111111111111111111111 \t" + location);
        if ((uname != null) && (upass != null)) {
            try {
                RMDPDTS rmdt = new RMDPDTS();
                String[] rpdts = rmdt.RecomPrdts(location, uname);
                int prm = rpdts.length;
                System.out.println("#$#%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$\t" + prm);
                String[] ppnm = new String[prm];
                String[] ppID = new String[prm];
                String[] ppce = new String[prm];
                String[] ppashp = new String[prm];
                String[] ppofr = new String[prm];
                String[] ppfname2 = new String[prm];
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
                ResultSet asw = dn.Select("select * from notification where D_UMail='" + uname + "' and D_UView='No'");
                System.out.println("select * from notification where D_UMail='" + uname + "' and D_UView='No'");
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
                        var rnoti = val.toString();
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
                        var rmsgs = val.toString();
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
                                    <p class="green">You have 5 new messages</p>
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
                            <a  href="UsrHome.jsp">
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
                            <a class="active" href="UviewMessages.jsp" >
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
                function chatboxopen12345(umail)
                {
                    //alert(umail);
                    if (umail == "Select")
                    {
                        alert("please Select friend For Chat");
                        return false;
                    }
                    else
                    {
                        document.location.href = "UviewMessages.jsp?TOUSR=" + umail;
                    }
                }
                //Chat With Anothwer User Function
                /* var request09;
                 
                 function chatboxopen(umail)
                 {
                 alert(umail);
                 var url = "UsrStdChat.jsp?val=" + unme + "&UMAIL=" + umail;
                 if (window.XMLHttpRequest) {
                 request09 = new XMLHttpRequest();
                 }
                 else if (window.ActiveXObject) {
                 request09 = new ActiveXObject("Microsoft.XMLHTTP");
                 }
                 
                 try {
                 request09.onreadystatechange = chatboxopen1;
                 request09.open("GET", url, true);
                 request09.send();
                 } catch (e) {
                 alert("Unable to connect to server");
                 }
                 }
                 
                 function chatboxopen1() {
                 if (request09.readyState == 4) {
                 document.getElementById("usrchst").innerHTML = request09.responseText;
                 }
                 }*/

                var request0712;
                function chattoanthr()
                {
                    var v = document.message.usermsg.value;
                    var tousr = document.message.ummil.value;
                    // alert(v);
                    // alert(unme);
                    // alert(tousr);
                    var url = "UaddCHat.jsp?val=" + v + "&FUser=" + unme + "&TUser=" + tousr;

                    if (window.XMLHttpRequest) {
                        request0712 = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request0712 = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try {
                        request0712.onreadystatechange = chatinfo;
                        request0712.open("GET", url, true);
                        request0712.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }
                function chatinfo() {
                    if (request0712.readyState == 4) {
                        var val = request0712.responseText;
                        var umail123 = val.toString();
                        //alert(lsts);
                        //document.location.href = "UviewMessages.jsp?TOUSR=" + umail123;
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

                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;">
                                    <!-- INSTAGRAM PANEL -->
                                    <center>
                                        <div class="showback">                                                                                                                                                                  
                                            <select class="form-control" name="usrposts" id="usrposts" required="" onchange="chatboxopen12345(this.value);">
                                                <option value="Select">Select User</option>
                                                <%
                                                    DB1 db = new DB1();
                                                    ResultSet rb = dn.Select("select * from friends where RE_FUMail='" + uname + "' and Status='Accept'");
                                                    while (rb.next()) {
                                                %>
                                                <option value="<%=rb.getString("RE_TUMail")%>"><%=rb.getString("RE_TUName")%></option>
                                                <%
                                                    }
                                                    ResultSet rb1 = dn.Select("select * from friends where RE_TUMail='" + uname + "' and Status='Accept'");
                                                    while (rb1.next()) {
                                                %>
                                                <option value="<%=rb1.getString("RE_FUMail")%>"><%=rb1.getString("RE_FUName")%></option>
                                                <%
                                                    }
                                                
                                                 ResultSet rb2 = db.Select("select * from live_friends where F_Mail_ID='" + uname + "' and Yes_OR_No='ACCEPTED'");
                                                    while (rb2.next()) {
                                                %>
                                                <option value="<%=rb2.getString("T_Mail_ID")%>"><%=rb2.getString("T_Mail_ID")%></option>
                                                <%
                                                    }
                                                    
                                                     ResultSet rb3 = db.Select("select * from live_friends where T_Mail_ID='" + uname + "' and Yes_OR_No='ACCEPTED'");
                                                    while (rb3.next()) {
                                                %>
                                                <option value="<%=rb3.getString("F_Mail_ID")%>"><%=rb3.getString("F_Mail_ID")%></option>
                                                <%
                                                    }
                                                %>
                                            </select><br><br><br>
                                            
                                        </div>
                                        
                                        <div class="showback">                                                                                                                                                                  
                               
                                            <%
                                                try{    
                                                String umail = request.getParameter("TOUSR");
                                                System.out.println(umail);
                                                String funame = mbar.username(umail);
                                                if (umail != null) {
                                            %>
                                            <div id="wrapper">
                                                <div id="menu">
                                                    <p class="welcome" style="color: #ff00cc;">Welcome,<%=funame%> <b></b></p>                                                   
                                                    <div style="clear:both"></div>
                                                </div>
                                                <div id="chatbox">
                                                    <%


                                                        ResultSet rs = dn1.Select("select * from chat where F_UMail='" + uname + "' and T_UMail='" + umail + "'");
                                                        while (rs.next()) {
                                                    %>
                                                    <h3 style="color: #ff9999;margin-left: 2%;"><%=rs.getString("MESSAGE")%></h3><br>
                                                    <%
                                                        }
                                                       ResultSet rs2 = db.Select("select * from chat where F_Mail='" + uname + "' and T_Mail='" + umail + "'");
                                                        while (rs2.next()) {
                                                    %>
                                                    <h3 style="color: #ff9999;margin-left: 2%;"><%=rs2.getString("MS_G")%></h3><br>
                                                    <%
                                                        }
                                                        ResultSet rs1 = dn1.Select("select * from chat where T_UMail='" + uname + "' and F_UMail='" + umail + "'");
                                                        while (rs1.next()) {
                                                    %>
                                                    <h3 style="color: lightseagreen;float: right;"><%=rs1.getString("MESSAGE")%></h3><br>
                                                    <%
                                                        }
                                                        rs2.close();
                                                        
                                                        ResultSet rs3 = db.Select("select * from chat where T_Mail='" + uname + "' and F_Mail='" + umail + "'");
                                                        while (rs3.next()) {
                                                    %>
                                                    <h3 style="color: #ff9999;margin-left: 2%;"><%=rs3.getString("MS_G")%></h3><br>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                                <form name="message" action="UaddCHat.jsp" onsubmit="return CHKMSG();">
                                                    <input name="FUser" type="hidden" id="FUser" size="70" value="<%=uname%>" />
                                                    <input name="TUser" type="hidden" id="TUser" size="70" value="<%=umail%>" />
                                                    <input name="usermsg" type="text" id="usermsg" size="70"/>
                                                    <input type="submit" value="Send"/>
                                                </form>
                                            </div> 
                                            <%
                                                } } catch(Exception ee) { System.out.println("chat ex"+ee); }
                                            %>
                                        </div><!-- /showback -->
                                        <div id="usrchst">&nbsp;</div>
                                    </center>  <br>                                      <br><br>
                                    <script>
                function CHKMSG()
                {
                    var ddd = document.getElementById("usermsg").value;
                    var cxc = /^[\w\ - \s\.\, \?]+$/.test(ddd);
                    if (ddd == "")
                    {
                        alert("Please Enter Some Values");
                        document.getElementById("usermsg").style.border = "2px solid red;";
                        document.getElementById("usermsg").focus();
                        return false;
                    }
                    else if (!cxc)
                    {
                        alert("Alphabats and numbers and also space , dot ,comma under_score and ifund only allowed");
                        document.getElementById("usermsg").style.border = "2px solid red;";
                        document.getElementById("usermsg").focus();
                        return false;
                    }
                    document.getElementById("usermsg").style.border = "";
                    return true;
                }
                                    </script>
                                </div><!-- /col-md-4 -->  

                                <%
                                    int pdtlen = mbar.productlen();
                                    int imlen = mbar.frndslen(uname);
                                    int pd = pdtlen + imlen;
                                    int psts = pd + 1;
                                    int psts1 = psts + 1;
                                    int hhh = 0, cvb = 0;
                                    int pdtlen1 = mbar.eventlen(location);
                                    //int imlen1 = mbar.frndslen(uname);
                                    //int pd1 = pdtlen1 + imlen1;
                                    //int psts12 = pd1 + 1;
                                    int psts111 = pdtlen1 + 1;
                                    int hhh1 = 0, cvb1 = 0;
                                    String[] etid = new String[psts111];
                                    String[] ename = new String[psts111];
                                    String[] eplace = new String[psts111];
                                    String[] edtttime = new String[psts111];
                                    String[] efname = new String[psts111];
                                    String[] epstby = new String[psts111];
                                    System.out.println("select * from event where City='" + location + "' and DATE(Evnt_Time)>= DATE(NOW()) order by ID desc");
                                    ResultSet rs91 = dn.Select("select * from event where City='" + location + "' and DATE(Evnt_Time)>= DATE(NOW()) order by ID desc");
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
                            </div><!-- /row -->
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->


                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                  

                        <div id="sidebar1" class="col-lg-3 ds" style="background:white;border: 2px solid black;overflow: auto;" >                                                                                                                                                    
                            <%
                                if (psts111 > 0) {
                            %>
                            <div id='ninja-slider'>
                                <ul>
                                    <%
                                        if (psts111 >= 1) {
                                            if ((ename[0] != null) && (efname[0] != null)) {
                                    %>
                                    <li><div data-image="EVENT/<%=efname[0]%>"/></div></li>                                                                                                     
                                        <%
                                                }
                                            }
                                            if (psts111 >= 2) {
                                                if ((ename[1] != null) && (efname[1] != null)) {
                                        %>
                                    <li><div data-image="EVENT/<%=efname[1]%>"/></div></li>                                                                                                     
                                        <%
                                                }
                                            }
                                            if (psts111 >= 3) {
                                                if ((ename[2] != null) && (efname[2] != null)) {
                                        %>
                                    <li><div data-image="EVENT/<%=efname[2]%>"/></div></li>                                                                                                     
                                        <%
                                                }
                                            }
                                        %>
                                    <!-- <li><div data-image="assets/SLIDER/2/md/1.jpg"></div></li>
                                     <li><div data-image="assets/SLIDER/2/md/2.jpg"></div></li>
                                     <li>
                                         <div data-image="assets/SLIDER/2/md/3.jpg">
                                             <a class="video" href="https://www.youtube.com/watch?v=j6PbonHsqW0"></a>
                                         </div>
                                     </li>
                                     <li><div data-image="assets/SLIDER/2/md/4.jpg"></div></li>
                                     <li><a data-image="assets/SLIDER/2/md/5.jpg" href="http://www.menucool.com"></a></li>-->
                                </ul>
                            </div><br>
                            <%                                }
                            %>
                            <!--end-->
                            <h3>FRIENDS List</h3>    
                            <%  int fril = mbar.fredlenth(uname);
                                if (fril > 0) {
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
                        </div>                                                  
                    </div><!-- /col-lg-3 -->
                    </div><!--/row -->
                </section>
            </section>           
            <!--main content end-->
            <!--footer start-->
            <!--<footer class="site-footer">
                <div class="text-center">                    
                    Recommendation On OSN
                    <a href="UviewMessages.jsp#" class="go-top">
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
                } catch (Exception e) {
                    System.out.println("CHAT PAGE ERROR" + e);
                }
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
</html>


