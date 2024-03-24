

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

        <title>User Rate Product</title>

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

        <!-- Video Player -->
        <link href="assets/VPlayer/video-js.css" rel="stylesheet" type="text/css">
        <script src="assets/VPlayer/video.js"></script>
        <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
        <script>
            videojs.options.flash.swf = "video-js.swf";
        </script>
    </head>
    <%
        String uname = (String) session.getAttribute("UNAME");
        String upass = (String) session.getAttribute("UPASS");
        String location = (String) session.getAttribute("ULOCATION");
        if ((uname != null) && (upass != null)) {
            try {
                String pstids = request.getParameter("PSTID");
                MnubarDet mbar = new MnubarDet();
                cmdlikedet clk = new cmdlikedet();
                String oname = mbar.username(uname);
                int noti = mbar.cntnotific(uname);
                int nt = noti + 1;
                int rrty = 0, rty = 0, i = 0, j = 0;
                String fname = "", ctg = "", name = "", cry = "";
                DB dn = new DB();
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
                        alert(rnoti);
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
                        alert(rmsgs);
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

                        <p class="centered"><a href="UProfile.jsp"><img src="propicget.jsp?UMAIL=<%=uname%>" class="img-thumbnail" width="60"></a></p>
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
                            <a href="ULikePages.jsp" >
                                <i class="fa fa-book"></i>
                                <span>Like Pages</span>
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
                //Comment Ajax Function
                var request07;
                function commentstre(csdm)
                {
                    var tye = "form" + csdm;
                    alert(tye);
                    var v = document.form.comment.value;
                    alert(v);
                    var url = "UaddCmnt.jsp?val=" + unme + "&PSTID=" + csdm + "&CMNTS=" + v;

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
                }

            </script>  
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <%
                String flename = clk.filenames(pstids);
                String ttype = clk.fileType(pstids);
                int lcnt = clk.ratingpdt(pstids);
                //int lcnts = clk.sincmmnts(pstids);
            %>
            <div style="overflow: auto;">
                <div class="col-lg-6 col-md-4 mb" style="margin-left:35%;margin-top: 10%;">
                    <a style="float: right;" href="javascript:window.history.back();"><img class="img-responsive" src="assets/img/Close_Icon.png" width="30em" height="30em" alt=""></a>
                    <div class="content-panel pn">
                        <div id="blog-bg" style="background-image:url(POSTS/<%=flename%>);background-size: 100% 100%;"></div>
                        <div class="blog-text">
                            <div class="row">   
                                <button type="button" class="btn btn-theme" style="margin-left: 2%;">RATING <%=lcnt%></button>                                                                                                        
                                <%
                                    ResultSet rs10 = dn.Select("select * from rating where Post_ID='" + pstids + "' and R_UserMail='" + uname + "'");
                                    if (rs10.next()) {
                                %>

                                <%                                } else {
                                %>
                                <form class="form-inline" role="form" style="margin-top:-35px;margin-left: 145px;">
                                    <div class="form-group">
                                        <input class="form-control" size="35" type="hidden" name="PSTID" id="PSTID" value="<%=pstids%>"/>
                                        <input class="form-control" size="35" type="hidden" name="val" id="val" value="<%=uname%>"/>   
                                        <input class="form-control" size="35" type="hidden" name="City" id="City" value="<%=location%>"/> 
                                        <input type="radio" name="rating" value="1" class="star">1
                                        <input type="radio" name="rating" value="2" class="star">2
                                        <input type="radio" name="rating" value="3" class="star">3
                                        <input type="radio" name="rating" value="4" class="star">4
                                        <input type="radio" name="rating" value="5" class="star">5
                                    </div>
                                    <div class="form-group">                                                            
                                        <button class="btn btn-primary" name="cbut" id="cbut" formaction="UaddRating.jsp">Rate Product</button>                                     
                                    </div>
                                </form>                                     
                                <%                                                 }
                                %>                                                                                                                                                       

                            </div>
                        </div>
                    </div>
                </div><!-- /col-md-4--> 
                <div class="col-lg-6 col-md-4 mb" style="margin-left:35%;margin-top: 0%;">
                    <%
                        ResultSet sdt = dn.Select("select * from comments where Post_ID='" + pstids + "'");
                        while (sdt.next()) {
                    %>
                    <div class="showback">                   
                        <span class="badge bg-info"><%=sdt.getString("Cmnt_UName")%></span>
                        <div class="alert alert-warning"><b style=" font-size: 15px;"><%=sdt.getString("Comments")%></b></div>                    
                    </div><!-- /showback -->
                    <%               }
                    %>                                                                     
                </div>
            </div>
            <%

            %>
            <!-- js placed at the end of the document so the pages load faster -->
            <script src="assets/js/jquery.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>

            <!--BACKSTRETCH-->
            <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
            <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
            <script>
                $.backstretch("assets/img/login-bg.jpg", {speed: 500});
            </script>

            <%
                    } catch (Exception e) {
                        System.out.println("Rate Product ERRO "+ e);
                    }
                } else {
                    session.setAttribute("fbmsg", "Please Login");
                    response.sendRedirect("UsrLogin.jsp");
                }
            %>
    </body>
</html>
