
<%@page import="GRPAHGENERATION.RMDPDTS"%>
<%@page import="DATA.GetInfo.FindFriends"%>
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
        <title>User Find Friends</title>

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
                /* String[] rpdts = rmdt.RecomPrdts(location, uname);
                 int prm = rpdts.length;
                 System.out.println("#$#%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$\t" + prm);
                 String[] ppnm = new String[prm];
                 String[] ppID = new String[prm];
                 String[] ppce = new String[prm];
                 String[] ppashp = new String[prm];
                 String[] ppofr = new String[prm];
                 String[] ppfname2 = new String[prm];*/
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
                        //alert(rnoti);
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
                        //alert(rmsgs);
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
                            <a href="UsrHome.jsp">
                                <i class="fa fa-home"></i>
                                <span>Home</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a class="active" href="UsrFindFri.jsp" >
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
            <script>
                //Like Ajax Function
                /*   var request09;
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
                 //Chat Ajax Function
                 var request07;
                 function chattoanthr(csdm)
                 {
                 var v = document.form.comment.value;
                 alert(v);
                 var url = "UaddCHat.jsp?val=" + unme + "&PSTID=" + csdm + "&CMNTS=" + v;
                 
                 if (window.XMLHttpRequest) {
                 request07 = new XMLHttpRequest();
                 }
                 else if (window.ActiveXObject) {
                 request07 = new ActiveXObject("Microsoft.XMLHTTP");
                 }
                 
                 try {
                 request07.onreadystatechange = commentstreInfo;
                 request07.open("GET", url, true);
                 request07.send();
                 } catch (e) {
                 alert("Unable to connect to server");
                 }
                 }
                 
                 function commentstreInfo() {
                 if (request07.readyState == 4) {
                 var val = request07.responseText;
                 var lsts = val.toString();
                 alert(lsts);
                 location.reload();
                 }
                 }*/

                //Friend Request Ajax Function
                var request071;
                function addfrlists(frmail)
                {
                    // alert(frmail);
                    var url;
                    if (window.XMLHttpRequest) {
                        request071 = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request071 = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try {
                        request071.onreadystatechange = frlistInfo;
                        request071.open("GET", url, true);
                        request071.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }

                function frlistInfo() {
                    if (request071.readyState == 4) {
                        var val = request071.responseText;
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
                                <%
                                    FindFriends ffr = new FindFriends();
                                    int cmrelst = ffr.frrequest(uname);
                                    int psts11 = cmrelst + 1;
                                    int fcmi = 0;
                                    String[] refrpid = new String[psts11];
                                    String[] refrmname = new String[psts11];
                                    String[] refrmail = new String[psts11];
                                    ResultSet qs = dn.Select("select * from friends where RE_TUMail='" + uname + "' and Status='Pending'");
                                    while (qs.next()) {
                                        refrpid[fcmi] = qs.getString("ID");
                                        refrmname[fcmi] = qs.getString("RE_FUName");
                                        refrmail[fcmi] = qs.getString("RE_FUMail");
                                        fcmi++;
                                    }
                                    for (int bn = 0; bn < cmrelst; bn++) {
                                %>                                  
                                <div class="col-lg-10 col-md-4 col-sm-4 col-xs-12" style="background: #ffccff;margin-left: 7%;">
                                    <div class="project-wrapper">
                                        <div class="project">                                                                                       
                                            <img class="img-responsive" src="propicget.jsp?UMAIL=<%=refrmail[bn]%>" alt="">                                               
                                            <h5 class="mt" style="color: #ff0033;"><%=refrmname[bn]%></h5>                                                  
                                            <a class="btn btn-small btn-theme04" href="UaddFrnAccRjt.jsp?val=<%=uname%>&FRMAIL=<%=refrpid[bn]%>&STS=Accept">Accept</a><br><br>
                                            <a class="btn btn-small btn-theme04" href="UaddFrnAccRjt.jsp?val=<%=uname%>&FRMAIL=<%=refrpid[bn]%>&STS=Reject">Reject</a><br><br><div style="background: white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> <br><br>
                                            <div class="overlay"></div>                                           
                                        </div>
                                    </div>
                                </div><!-- col-lg-4 -->   
                                <%
                                    }
                                    int psts = ffr.overusrtot(uname);
                                    int psts1 = psts + 1;
                                    int hhh = 0, cvb = 0;
                                    String[] frpid = new String[psts1];
                                    String[] frname1 = new String[psts1];
                                    String[] frmail1 = new String[psts1];
                                    String[] frdpic = new String[psts1];
                                    String fname1 = "", lname1 = "", cmp = "";
                                    ResultSet rs9 = dn.Select("select * from users where TYPE='Normal_User' and Mail_ID!='" + uname + "' order by ID desc ");
                                    while (rs9.next()) {
                                        frpid[hhh] = rs9.getString("ID");
                                        fname1 = rs9.getString("F_Name");
                                        lname1 = rs9.getString("L_Name");
                                        cmp = fname1.concat(" " + lname1);
                                        frname1[hhh] = cmp;
                                        frmail1[hhh] = rs9.getString("Mail_ID");
                                        frdpic[hhh] = rs9.getString("PF_Name");
                                        hhh++;
                                    }
                                    String srhfr = request.getParameter("SRCH");
                                    if (srhfr != null) {
                                        String[] frpid1 = new String[psts1];
                                        String[] frname11 = new String[psts1];
                                        String[] frmail11 = new String[psts1];
                                        String[] frdpic1 = new String[psts1];
                                        String ffmail = "", fname11 = "", lname11 = "", cmp1 = "";
                                        ResultSet rs92 = dn.Select("select * from users where F_Name Like '" + srhfr + "%'");
                                        while (rs92.next()) {
                                            frpid1[hhh] = rs92.getString("ID");
                                            fname11 = rs92.getString("F_Name");
                                            lname11 = rs92.getString("L_Name");
                                            cmp1 = fname11.concat(" " + lname11);
                                            ffmail = rs92.getString("Mail_ID");
                                            /* frdpic[hhh] = rs92.getString("PF_Name");
                                             hhh++;
                                             }
                                             for (cvb = 0; cvb < psts; cvb++) {*/
                                %> 
                                <div class="col-lg-10 col-md-4 col-sm-4 col-xs-12" style="background: #9999ff;margin-left: 7%;">
                                    <div class="project-wrapper">
                                        <div class="project">
                                            <a class="fancybox" href="AllUsers/<%=rs92.getString("PF_Name")%>">
                                                <img class="img-responsive" width="45%" height="45%" src="AllUsers/<%=frdpic[cvb]%>" alt="">
                                            </a>                                               
                                            <h5 class="mt"><%=cmp1%></h5>                                       
                                            <%
                                                ResultSet rew = dn.Select("select * from friends where (RE_FUMail='" + uname + "' and RE_TUMail='" + ffmail + "') or (RE_TUMail='" + uname + "' and RE_FUMail='" + ffmail + "')");
                                                if (rew.next()) {
                                            %>
                                            <a class="bn btn-small btn-theme04" href="#">Already</a><br><br><div style="background: white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> <br><br>\
                                            <%                                                    } else {
                                            %>
                                            <a class="btn btn-small btn-theme04" href="UaddFrnds.jsp?val=<%=uname%>&FRMAIL=<%=frmail1[cvb]%>">Add Friend</a><br><br><div style="background: white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> <br><br>
                                            <%
                                                }
                                            %>
                                            <div class="overlay"></div>                                         
                                        </div>
                                    </div>
                                </div><!-- col-lg-4 -->   <br>                                                         
                                <%                                    }
                                } else {
                                    for (cvb = 0; cvb < psts; cvb++) {
                                        String ffgf = frmail1[cvb];
                                %>
                                <div class="col-lg-10 col-md-4 col-sm-4 col-xs-12" style="background: #9999ff;margin-left: 7%;">
                                    <div class="project-wrapper">
                                        <div class="project">
                                            <a class="fancybox" href="AllUsers/<%=frdpic[cvb]%>">
                                                <img class="img-responsive" width="45%" height="45%" src="AllUsers/<%=frdpic[cvb]%>" alt="">
                                            </a>                                               
                                            <h5 class="mt"><%=frname1[cvb]%></h5>
                                            <%
                                                ResultSet rew = dn.Select("select * from friends where (RE_FUMail='" + uname + "' and RE_TUMail='" + frmail1[cvb] + "') or (RE_TUMail='" + uname + "' and RE_FUMail='" + frmail1[cvb] + "')");
                                                if (rew.next()) {
                                            %>
                                            <a class="bn btn-small btn-theme04" href="#">Already</a><br><br><div style="background: white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> <br><br>\
                                            <%                                                    } else {
                                            %>
                                            <a class="btn btn-small btn-theme04" href="UaddFrnds.jsp?val=<%=uname%>&FRMAIL=<%=frmail1[cvb]%>">Add Friend</a><br><br><div style="background: white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> <br><br>
                                            <%
                                                }
                                            %>

                                            <div class="overlay"></div>                                         
                                        </div>
                                    </div>
                                </div><!-- col-lg-4 -->   <br>                                                             
                                <%                                        }
                                    }
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
                    <a href="UsrFindFri.jsp#" class="go-top">
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
                    System.out.println("FIND FRIENDS ERROR" + e);
                }
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
</html>

