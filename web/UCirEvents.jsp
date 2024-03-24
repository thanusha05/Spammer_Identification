
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

        <title>User Event View </title>

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
            videojs.options.flash.swf = "video-js.swf";</script>

        <!-- Chat BOX-->        
        <script type="text/javascript" src="assets/Datetimepicker/jquery/1.7.2/jquery.min.js"></script>
        <!--Load Script and Stylesheet -->
        <script type="text/javascript" src="assets/Datetimepicker/jquery.simple-dtpicker.js"></script>
        <link type="text/css" href="assets/Datetimepicker/jquery.simple-dtpicker.css" rel="stylesheet" />
        <script type="text/javascript">
            $(function() {
                $('*[name=entDateTime]').appendDtpicker();
            });</script>
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
        String City = (String) session.getAttribute("ULOCATION");
        if ((uname != null) && (upass != null)) {
            try {
                MnubarDet mbar = new MnubarDet();
                cmdlikedet clk = new cmdlikedet();
                String oname = mbar.username(uname);
                String lati = mbar.latilangude(uname);
                int noti = mbar.cntnotific(uname);
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
    <link rel="stylesheet" type="text/css" href="assets/Datetimepicker/jquery.datetimepicker.css"/>    
    <body>
        <script>
            var unme = '<%=uname%>';
            var upwd = '<%=upass%>';</script>
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

                        <p class="centered"><a href="UProfile.jsp?UMAIL=<%=uname%>"><img src="propicget.jsp?UMAIL=<%=uname%>" class="img-thumbnail" width="60"></a></p>
                        <h5 class="centered"><%=oname%></h5>

                        <li class="mt">
                            <a href="UsrHome.jsp">
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
                            <a class="active" href="UCirEvents.jsp" >
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
                    //alert(pstid);
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
                        // var lsts = val.toString();
                        // alert(lsts);
                        location.reload();
                    }
                }


                //UnLike Ajax Function
                var request08;
                function unlikefun(pstid1)
                {
                    // alert(pstid1);
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
                        //  var lsts = val.toString();
                        // alert(lsts);
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
                }

                function pstVld()
                {
                    var ENM = document.getElementById("entName").value;
                    var NENM = /^[a-zA-Z]+$/.test(ENM);
                    if (ENM == "")
                    {
                        alert("Please Enter EVENT NAME");
                        document.getElementById("entName").style.border = "2px solid red";
                        document.getElementById("entName").focus();
                        return false;
                    }
                    else if (!NENM)
                    {
                        alert("EVENT Name Should Contain Only ALPHABETS");
                        document.getElementById("entName").style.border = "2px solid red";
                        document.getElementById("entName").focus();
                        return false;
                    }
                    document.getElementById("entName").style.border = "";
                    var EDTM = document.getElementById("entDateTime").value;
                    if (EDTM == "")
                    {
                        alert("Please Enter EVENT NAME");
                        document.getElementById("entDateTime").style.border = "2px solid red";
                        document.getElementById("entDateTime").focus();
                        return false;
                    }
                    var pst = document.getElementById("evntposts").value;
                    var ext = pst.substring(pst.lastIndexOf('.') + 1);
                    if (pst == "")
                    {
                        alert("Please Select EVENT Picture");
                        document.getElementById("evntposts").style.border = "2px solid red";
                        document.getElementById("evntposts").focus();
                        return false;
                    }
                    else if (!(ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "png" || ext == "PNG"))
                    {
                        alert("Supported File Formats gif , GIF , jpg , JPG , jpeg , JPEG , png , PNG ");
                        document.getElementById("evntposts").style.border = "2px solid red";
                        document.getElementById("evntposts").focus();
                        return false;
                    }
                    document.getElementById("evntposts").style.border = "";
                    return true;
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
                                            <h4><i class="fa"></i>Post Your Ideas</h4>                                           
                                            <form name="uploadpost" id="uploadpost" onsubmit="return pstVld();" enctype="multipart/form-data" method="post">
                                                <input type="hidden" class="form-control" name="Umail" id="Umail" value="<%=uname%>" readonly=""><br>   
                                                <input type="hidden" class="form-control" name="UName" id="UName"  value="<%=oname%>" readonly=""><br>    
                                                <input type="hidden" class="form-control" name="latilan" id="latilan"  value="<%=lati%>" readonly=""><br>  
                                                <input type="hidden" class="form-control" name="city" id="city"  value="<%=City%>" readonly=""><br>  
                                                <input type="text" class="form-control" name="entName" id="entName"  value="" required="" placeholder="Event Name" autofocus="" maxlength="50"><br>                                              
                                                <input type="text" class="form-control" name="entDateTime" id="entDateTime" readonly="" required=""  value="" placeholder="Event DateTime" autofocus=""><br>                                                	
                                                <input type="file" class="form-control" name="evntposts" id="evntposts" required="" autofocus=""><br>
                                                <input type="submit" class="btn btn-theme02" value="Post" formaction="EventADD">
                                            </form>
                                        </div><!-- /showback -->
                                    </center>                                        
                                </div><!-- /col-md-4 -->   
                                <%
                                    int pdtlen = mbar.eventlen(City);
                                    int imlen = mbar.frndslen(uname);
                                    int pd = pdtlen + imlen;
                                    int psts = pd + 1;
                                    int psts1 = psts + 1;
                                    int hhh = 0, cvb = 0;
                                    String[] etid = new String[psts1];
                                    String[] ename = new String[psts1];
                                    String[] eplace = new String[psts1];
                                    String[] edtttime = new String[psts1];
                                    String[] efname = new String[psts1];
                                    String[] epstby = new String[psts1];

                                    String etid1 = new String();
                                    String ename1 = new String();
                                    String eplace1 = new String();
                                    String edtttime1 = new String();
                                    String efname1 = new String();
                                    String epstby1 = new String();
                                    ResultSet rs9 = dn.Select("select * from event where City='" + City + "' order by ID desc");
                                    while (rs9.next()) {
                                        etid[hhh] = rs9.getString("ID");
                                        ename[hhh] = rs9.getString("Evnt_Name");
                                        eplace[hhh] = rs9.getString("Venue");
                                        edtttime[hhh] = rs9.getString("Evnt_Time");
                                        efname[hhh] = rs9.getString("E_FleName");
                                        epstby[hhh] = rs9.getString("E_AUser");
                                        hhh++;
                                    }
                                    /* if (ppdt != null) {
                                     ResultSet rs99 = dn.Select("select * from event where ID='" + ppdt + "'");
                                     while (rs99.next()) {
                                     etid1 = rs99.getString("ID");
                                     ename1 = rs99.getString("Evnt_Name");
                                     eplace1 = rs99.getString("Venue");
                                     edtttime1 = rs99.getString("Evnt_Time");
                                     efname1 = rs99.getString("E_FleName");
                                     epstby1 = rs99.getString("E_AUser");
                                     }
                                     */
                                %>
                                <!--   <div class="col-md-10 mb" style="background: white;margin-left: 70px;height: 75%">                                 
                                       <div class="col-lg-12 col-md-4 mb">
                                           <div class="content-panel pn">
                                               <div id="blog-bg" style="background-image:url(EVENT/<%=efname1%>);background-size: 100% 100%;"></div>
                                               <div class="blog-text">
                                                   <div class="row"> 
                                                       <h4 style="color: #ff3399;"> <%=ename1%>  ||  <%=eplace1%>  ||   <%=edtttime1%>  |||  Posted By <span style="color: black;"><%=epstby1%></span></h4>                                                                                                      
                                                   </div>
                                               </div>
                                           </div>
                                       </div><!-- /col-md-4-->                                                                                                                                                                       -->
                                <!--    </div><!-- /col-md-4 --> 
                                <%
                                    //} 
                                    for (cvb = 0; cvb < pdtlen; cvb++) {
                                %>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;height: 75%">                                 
                                    <div class="col-lg-12 col-md-4 mb">
                                        <div class="content-panel pn">
                                            <div id="blog-bg" style="background-image:url(EVENT/<%=efname[cvb]%>);background-size: 125% 100%;"></div>
                                            <div class="blog-text">
                                                <div class="row"> 
                                                    <h4 style="color: #ff3399;"> <%=ename[cvb]%>  ||  <%=eplace[cvb]%>  ||   <%=edtttime[cvb]%>  |||  Posted By <span style="color: black;"><%=epstby[cvb]%></span></h4>                                                                                                      
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /col-md-4-->                                                                                                                                                                       -->
                                </div><!-- /col-md-4 -->   
                                <% }
                                %>                              

                            </div><!-- /row -->
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->


                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                  
                        <div id="sidebar1" class="col-lg-3 ds" style="background:white;border: 2px solid black;overflow: auto;" >                                                                                                       
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
                        </div><!-- /col-lg-3 -->  
                    </div><!--/row -->
                </section>
            </section>           
            <!--main content end-->
            <!--footer start-->
            <!-- <footer class="site-footer">
                 <div class="text-center">                    
                     Recommendation On OSN
                     <a href="UCirEvents.jsp#" class="go-top">
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

                });</script>
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
                    System.out.println("CIRCLE EVENTS ERROR" + e);
                }
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
    <script src="assets/Datetimepicker/jquery.js"></script>
    <script src="assets/Datetimepicker/jquery.datetimepicker.js"></script>
    <script>/*
     window.onerror = function(errorMsg) {
     $('#console').html($('#console').html()+'<br>'+errorMsg)
     }*/
                var dateToday = new Date();
                var tomorrow = new Date(dateToday.getTime() + 24 * 60 * 60 * 1000);
                $('#entDateTime').datetimepicker({
                    dayOfWeekStart: 1,
                    lang: 'en',
                    minDate: tomorrow,
                    //yearRange: new Date().getFullYear().toString() + ':' + new Date().getFullYear().toString(),
                    //dateFormat: 'yy-mm-dd',
                    format: 'Y-m-d H:i'
                });

    </script>
</html>


