

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

        <title>User Own Profile</title>

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
        String[] rpdts;
        int prm = 0;
        if ((uname != null) && (upass != null)) {
            try {
                RMDPDTS rmdt = new RMDPDTS();
                rpdts = rmdt.RecomPrdts(location, uname);
                prm = rpdts.length;
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
            var udteb = new String();
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
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <script>
                function UPDATEALD()
                {
                    var fname = document.getElementById("fname").value;
                    var lname = document.getElementById("lname").value;
                    var adss = document.getElementById("uadds").value;
                    var cty = document.getElementById("uacity").value;
                    if (FnameVld(fname))
                    {
                        document.getElementById("fname").style.border = "";
                        if (LnameVld(lname))
                        {
                            document.getElementById("lname").style.border = "";
                            if (CityVld(cty))
                            {
                                document.getElementById("uacity").style.border = "";
                                if (AddssVld(adss))
                                {
                                    document.getElementById("uadds").style.border = "";
                                    return true;
                                }
                                else
                                {
                                    document.getElementById("uadds").style.border = "2px solid red";
                                    document.getElementById("uadds").focus();
                                    return false;
                                }
                            }
                            else
                            {
                                document.getElementById("uacity").style.border = "2px solid red";
                                document.getElementById("uacity").focus();
                                return false;
                            }
                        }
                        else
                        {
                            document.getElementById("lname").style.border = "2px solid red";
                            document.getElementById("lname").focus();
                            return false;
                        }
                    }
                    else
                    {
                        document.getElementById("fname").style.border = "2px solid red";
                        document.getElementById("fname").focus();
                        return false;
                    }
                }
                function UPDATPICS()
                {
                    var picsd = document.getElementById("nppic").value;
                    var ext = picsd.substring(picsd.lastIndexOf('.') + 1);
                    if (picsd == "")
                    {
                        alert("Please Select Profiule Picture");
                        document.getElementById("nppic").style.border = "2px solid red";
                        document.getElementById("nppic").focus();
                        return false;
                    }
                    else if (!(ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "png" || ext == "PNG"))
                    {
                        alert("Supported File Formats gif , GIF , jpg , JPG , jpeg , JPEG , png , PNG ");
                        document.getElementById("nppic").style.border = "2px solid red";
                        document.getElementById("nppic").focus();
                        return false;
                    }
                    document.getElementById("nppic").style.border = "";
                    return true;
                }
            </script>
            <section id="main-content">
                <section class="wrapper">
                    <div class="row" style="margin-top: 5%;">                   
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <form name="changepro" method="post" onsubmit="return UPDATEALD();" action="UsrCgeProfile">
                                <div class="showback">
                                    <input type="hidden" class="form-control" name="umail23" id="umail23" value="<%=uname%>" >
                                    <h4><i class="fa fa-angle-right"></i>Your Basic Informations Are</h4>
                                    <%
                                        ResultSet pow = dn.Select("select * from users where Mail_ID='" + uname + "'");
                                        if (pow.next()) {
                                    %> 
                                    <script>udteb = '<%=pow.getString("DOB")%>'</script>
                                    <span class="label label-success">First Name : </span>
                                    <div class="alert alert-success" ><b><input type="text" class="form-control" name="fname" id="fname" value="<%=pow.getString("F_Name")%>" maxlength="25"></b></div>                                                                    
                                    <span class="label label-success">Last Name : </span>
                                    <div class="alert alert-success"><b><input type="text" class="form-control" name="lname" id="lname" value="<%=pow.getString("L_Name")%>" maxlength="25"></b></div>                                                                  
                                    <span class="label label-success" >Date Of Birth: </span>
                                    <div class="alert alert-success" ><b><input type="text" class="form-control" name="udob" id="datepicker" value="<%=pow.getString("DOB")%>" readonly=""></b></div>                                                                    
                                    <span class="label label-success">Address : </span>
                                    <div class="alert alert-success"><b><input type="text" class="form-control" name="uadds" id="uadds" value="<%=pow.getString("Address")%>" maxlength="50"></b></div>                                                                                                          
                                    <span class="label label-success">City : </span>
                                    <div class="alert alert-success"><b><input type="text" class="form-control" name="uacity" id="uacity" value="<%=pow.getString("City")%>" maxlength="45"></b></div>                                                                                                          
                                    <span class="label label-success">State : </span>
                                    <div class="alert alert-success"><b><input type="text" class="form-control" name="stse" id="stse" value="<%=pow.getString("State")%>" readonly=""></b></div>
                                    <span class="label label-success">Country : </span>
                                    <div class="alert alert-success"><b><input type="text" class="form-control" name="cntry" id="cntry" value="<%=pow.getString("Country")%>" readonly=""></b></div>                                           
                                            <%                                        }
                                            %>                                                                          
                                    <input type="submit" value="Add Information"class="btn btn-theme" style="margin-left: 400px;">
                                </div><!-- /showback -->

                            </form>
                        </div>
                        <br><br><br><br>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <! -- Your Profile Picture -->
                            <div class="showback">
                                <h4><i class="fa fa-angle-right"></i> Yours Profile Picture</h4>
                                <center>
                                    <img src="propicget.jsp?UMAIL=<%=uname%>" class="img-thumbnail" width="50%" height="45%">
                                </center>                                
                            </div><!-- /showback -->
                            <div class="showback">
                                <h4><i class="fa fa-angle-right"></i>Profile Picture Change</h4>
                                <center>
                                    <form name="ppicchange" method="post" onsubmit="return UPDATPICS();"  enctype="multipart/form-data">
                                        <input type="hidden" class="form-control" name="unames" id="unames" value="<%=uname%>"><br>                                             
                                        <input type="file" class="form-control" name="nppic" id="nppic" required="" accept="image/*" autofocus><br>                                             
                                        <button class="btn btn-theme btn-block" type="submit" style="background: #990099;" formaction="UsrPicUpdate"><i class="fa fa-lock"></i>Change Profile Picture</button>
                                    </form>
                                </center>                                
                            </div><!-- /showback -->
                        </div>                      
                    </div>
                    </div>
                </section>
            </section>           
            <!-- <footer class="site-footer">
                 <div class="text-center">                    
                     Recommendation On OSN
                     <a href="UProfile.jsp#" class="go-top">
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
        <!-- OFFLINE LINKS -->
        <!-- <link rel="stylesheet" href="assets/DATEPIC/jquery-ui.css">
         <script src="assets/DATEPIC/jquery-1.10.2.js"></script>
         <script src="assets/DATEPIC/jquery-ui.js"></script>-->

        <!-- ONLINE LINKS -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script>
                $(function() {
                    $("#datepicker").datepicker();
                });
                $("#datepicker").datepicker({
                    yearRange: '1980:' + new Date().getFullYear().toString(),
                    dateFormat: 'yy-mm-dd'
                });

        </script>  
        <%
                } catch (Exception e) {
                    System.err.println(e);
                }
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
</html>

