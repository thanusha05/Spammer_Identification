
<%@page import="DATA.GetInfo.POnrAddPdts"%>
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

        <title>Product Owner Home</title>

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
        String location = (String) session.getAttribute("PLOCATION");
        if ((uname != null) && (upass != null)) {
            try {
                MnubarDet mbar = new MnubarDet();
                cmdlikedet clk = new cmdlikedet();
                POnrAddPdts pon = new POnrAddPdts();
                String oname = mbar.username(uname);
                DB dn = new DB();
                /* int noti = mbar.cntnotific(uname);
                 int nt = noti + 1;
                 int rrty = 0, rty = 0, i = 0, j = 0;
                 String fname = "", ctg = "", name = "", cry = "";           
                 String rth = "", rrt = "";
                 String[] nitific = new String[nt];
                 ResultSet asw = dn.Select("select * from notification where T_UMID='" + uname + "' and T_UView='No'");
                 System.out.println("select * from notification where T_UMID='" + uname + "' and T_UView='No'");
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
                 }*/
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
                            <a href="POnrHome.jsp">
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
                            <a href="POViewCirEvents.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Events On Circle</span>
                            </a>                            
                        </li>    
                        <li class="sub-menu">
                            <a  class="active" href="PONRPLkUsrs.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Product Like Users</span>
                            </a>                            
                        </li>    

                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->           
            <section id="main-content">
                <section class="wrapper">

                    <div class="row">
                        <div class="col-lg-9 main-chart" style="overflow: auto;">                           
                            <div class="row">           

                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;">                                   
                                </div><!-- /col-md-4 -->   
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
                                    String[] pdid = new String[psts1];
                                    ResultSet rs9 = dn.Select("select * from products where U_MailID='" + uname + "' order by ID desc ");
                                    while (rs9.next()) {
                                        ptid[hhh] = rs9.getString("ID");
                                        ptname[hhh] = rs9.getString("P_Name");
                                        pflnme[hhh] = rs9.getString("P_FlName");
                                        ptime[hhh] = rs9.getString("PA_Time");
                                        pprice[hhh] = rs9.getString("P_Price");
                                        pdescs[hhh] = rs9.getString("P_Description");
                                        pdid[hhh] = rs9.getString("Pst_ID");
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
                                                        int lcnt = clk.sinlikes(pdid[cvb]);
                                                        int lcnts = clk.sincmmnts(pdid[cvb]);
                                                    %>
                                                    <a href="POVwPdtLkUsrs.jsp?PSt_ID=<%=pdid[cvb]%>&PID=<%=ptid[cvb]%>" class="btn btn-theme" style="margin-left: 2%;">Likes  | <%=lcnt%> Likes</a> 
                                                    <a href="POVwPdtCmntUsrs.jsp?PSt_ID=<%=pdid[cvb]%>&PID=<%=ptid[cvb]%>"  class="btn btn-theme" style="margin-left: 2%;">Comments  | <%=lcnts%> Comments</a>
                                                    <a href="POVwPdtRtUsrs.jsp?PSt_ID=<%=pdid[cvb]%>&PID=<%=ptid[cvb]%>"  class="btn btn-theme" style="margin-left: 2%;">Rating  | <%=lcnts%> Rating</a>
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

                        <div id="sidebar1" class="col-lg-3 ds" style="background:white;border: 2px solid black;overflow: auto;" >                                          
                            <!--start-->
                            <%
                                int hhh1 = 0;
                                int evlnh = mbar.eventlen(location);
                                //int imlen1 = mbar.frndslen(uname);
                                //int pd1 = pdtlen1 + imlen1;
                                //int psts12 = pd1 + 1;
                                int psts111 = evlnh + 1;
                                String[] etid5 = new String[psts111];
                                String[] ename5 = new String[psts111];
                                String[] eplace5 = new String[psts111];
                                String[] edtttime5 = new String[psts111];
                                String[] efname5 = new String[psts111];
                                String[] epstby5 = new String[psts111];
                                System.out.println("select * from event where City='" + location + "' and DATE(Evnt_Time)>= DATE(NOW()) order by ID desc");
                                ResultSet rs915 = dn.Select("select * from event where City='" + location + "' and DATE(Evnt_Time)>= DATE(NOW()) order by ID desc");
                                while (rs915.next()) {
                                    etid5[hhh1] = rs915.getString("ID");
                                    ename5[hhh1] = rs915.getString("Evnt_Name");
                                    eplace5[hhh1] = rs915.getString("Venue");
                                    edtttime5[hhh1] = rs915.getString("Evnt_Time");
                                    efname5[hhh1] = rs915.getString("E_FleName");
                                    epstby5[hhh1] = rs915.getString("E_AUser");
                                    hhh1++;
                                }
                                if (psts111 >= 1) {
                            %>
                            <div id='ninja-slider'>
                                <ul>
                                    <%
                                        if (psts111 >= 1) {
                                            if ((ename5[0] != null) && (efname5[0] != null)) {
                                    %>
                                    <li><div data-image="EVENT/<%=efname5[0]%>"/></div></li>                                                                                                     
                                        <%}
                                            }
                                            if (psts111 >= 2) {
                                                if ((ename5[1] != null) && (efname5[1] != null)) {
                                        %>
                                    <li><div data-image="EVENT/<%=efname5[1]%>"/></div></li>                                                                                                     
                                        <%}
                                            }
                                            if (psts111 >= 3) {
                                                if ((ename5[2] != null) && (efname5[2] != null)) {
                                        %>
                                    <li><div data-image="EVENT/<%=efname5[2]%>"/></div></li>                                                                                                     
                                        <%}
                                            }
                                        %>                                   
                                </ul>
                            </div><br>
                            <%                                } else {
                                }
                            %>
                            %>                                                                             
                        </div><!-- /col-lg-3 -->
                    </div><!--/row -->
                </section>
            </section>           
            <!--main content end-->
            <!--footer start-->
            <!--<footer class="site-footer">
                <div class="text-center">
                    Recommendation On OSN
                    <a href="POnrHome.jsp#" class="go-top">
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
                } catch (Exception e) {
                    System.out.println("P VIEW LIKE USERSS ERROR " + e);
                }
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
</html>

