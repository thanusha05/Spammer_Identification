
<%@page import="DATA.GetInfo.POnrAddPdts"%>
<%@page import="DATA.GetInfo.cmdlikedet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DATA.DB"%>
<%@page import="DATA.GetInfo.MnubarDet"%>
<%@page import="DATA.GetInfo.POnrAddPdts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Product Owner Update Products</title>

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
        String uname = (String) session.getAttribute("PNAME");
        String upass = (String) session.getAttribute("PPASS");
        if ((uname != null) && (upass != null)) {
            try {
                POnrAddPdts pd = new POnrAddPdts();
                String shname = pd.shopname(uname);
                String shid = pd.shopID(uname);
                if ((shname != null) && (shid != null)) {
                    MnubarDet mbar = new MnubarDet();
                    cmdlikedet clk = new cmdlikedet();
                    POnrAddPdts pon = new POnrAddPdts();
                    String oname = mbar.username(uname);
                    DB dn = new DB();
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
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->
                <a href="POnrHome.jsp" class="logo"><center><b style="color: #003366;">Generating Location-Sensitive Recommendations in
                            <br>Social Network Environments</b></center></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">                  
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="Logout1.jsp">Logout</a></li>
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
                        <p class="centered"><a href="POWProfile.jsp?UMAIL=<%=uname%>"><img src="propicget.jsp?UMAIL=<%=uname%>" class="img-thumbnail" width="60"></a></p>
                        <h5 class="centered"><%=oname%></h5>
                        <li class="mt">
                            <a class="active" href="POnrHome.jsp">
                                <i class="fa fa-home"></i>
                                <span>Home</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="POAddProducts.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Add Products</span>
                            </a>                            
                        </li> 

                        <li class="sub-menu">
                            <a href="POUdtProdts.jsp" >
                                <i class="fa fa-book"></i>
                                <span>Update Products</span>
                            </a>                            
                        </li>
                        <li class="sub-menu">
                            <a href="UCirEvents.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Events On Circle</span>
                            </a>                            
                        </li>    
                        <li class="sub-menu">
                            <a href="PONRPLkUsrs.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Product Like Users</span>
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
            <!--main content start-->           
            <section id="main-content">
                <section class="wrapper">

                    <div class="row">
                        <div class="col-lg-9 main-chart" style="overflow: auto;">                           
                            <div class="row">           

                                <%
                                    int psts = pon.produtlen(uname);
                                    int psts1 = psts + 1;
                                    int hhh = 0, cvb = 0;
                                    String[] ptid = new String[psts1];
                                    String[] ptname = new String[psts1];
                                    String[] pflnme = new String[psts1];
                                    String[] ptime = new String[psts1];
                                    String[] pprice = new String[psts1];
                                    String[] pdescs = new String[psts1];
                                    ResultSet rs9 = dn.Select("select * from products order by ID desc");
                                    while (rs9.next()) {
                                        ptid[hhh] = rs9.getString("ID");
                                        ptname[hhh] = rs9.getString("P_Name");
                                        pflnme[hhh] = rs9.getString("P_FlName");
                                        ptime[hhh] = rs9.getString("PA_Time");
                                        pprice[hhh] = rs9.getString("P_Price");
                                        pdescs[hhh] = rs9.getString("P_Description");
                                        hhh++;
                                    }
                                    for (cvb = 0; cvb < psts; cvb++) {
                                %>
                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;height: 75%">                                 
                                    <div class="col-lg-12 col-md-4 mb">
                                        <div class="content-panel pn">
                                            <div id="blog-bg" style="background-image:url(POSTS/<%=pflnme[cvb]%>);background-size: 100% 100%;"></div>
                                            <div class="blog-text">
                                                <div class="row">    
                                                    <%
                                                        int lcnt = clk.sinlikes(ptid[cvb]);
                                                        int lcnts = clk.sincmmnts(ptid[cvb]);
                                                    %>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;">Likes  | <%=lcnt%> Likes</button> 
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;">Comments  | <%=lcnts%> Comments</button>
                                                    <button type="button" class="btn btn-theme" style="margin-left: 2%;">Rating  | <%=lcnts%> Rating</button>
                                                    <form class="form-inline" role="form" style="margin-top:-35px;margin-left: 145px;">
                                                        <div class="form-group">
                                                            <input class="form-control" size="35" type="hidden" name="PTID" id="PTID" value="<%=ptid[cvb]%>"/>                                                                                                                   
                                                        </div>
                                                        <div class="form-group">                                                            
                                                            <button class="btn btn-primary" name="cbut" id="cbut" formaction="POCrtOffer.jsp">Add Comment</button>                                                             
                                                        </div>
                                                    </form>   
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /col-md-4-->                                                                                                                                                                  
                                </div><!-- /col-md-4 -->                                 
                                <%                                        }

                                %>                                                                                  
                            </div><!-- /row -->
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->


                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                  

                        <div class="col-lg-3 ds" >                                                  
                            <!--start-->
                            <div id='ninja-slider'>
                                <ul>
                                    <li><div data-image="assets/SLIDER/2/md/1.jpg"></div></li>
                                    <li><div data-image="assets/SLIDER/2/md/2.jpg"></div></li>                                                                                                    
                                    <li><div data-image="assets/SLIDER/2/md/4.jpg"></div></li>
                                    <li><a data-image="assets/SLIDER/2/md/5.jpg" href="http://www.menucool.com"></a></li>
                                </ul>
                            </div><br>
                            <!--end-->
                            <h3>Our Products</h3>
                            <div style="overflow: auto;height: 700px;">
                                <%                                    int fril = mbar.fredlenth(uname);
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
                                        frmail[rdi] = rs5.getString("RE_FUMail");
                                        frname[rdi] = rs5.getString("RE_FUName");
                                        rdi++;
                                    }
                                    for (dd = 0;
                                            dd < fril;
                                            dd++) {
                                        if (tomail[df] != null) {
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
                                        <img class="img-circle" src="frinedpics.jsp?UMAIL=<%=frmail[df]%>" width="35px" height="35px" align="">
                                    </div>
                                    <div class="details">
                                        <p><a href="#"><%=frname[df]%></a><br/>                                        
                                        </p>
                                    </div>
                                </div>      
                                <%    }
                                    }
                                %>                                
                            </div>                                                  
                        </div><!-- /col-lg-3 -->
                    </div><!--/row -->
                </section>
            </section>           
            <!--main content end-->
            <!--footer start
            <footer class="site-footer">
                <div class="text-center">
                    2014 - Alvarez.is
                    <a href="index.html#" class="go-top">
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
                        session.setAttribute("fbmsg", "Please Add Your Basic Information");
                        response.sendRedirect("POBasicInfo.jsp");
                    }
                } catch (Exception e) {
                    System.out.println("PROFILE UPDATE ERROR" + e);
                }
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
</html>

