
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
                        <li><a class="logout" href="POBasicInfo.jsp">Add Basic Information</a></li>
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
                            <a  href="POViewCirEvents.jsp" >
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
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <section id="main-content">
                <section class="wrapper">
                    <div class="row" style="margin-top: 5%;">                   
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <! -- ALERTS EXAMPLES -->
                            <div class="showback">
                                <h4><i class="fa fa-angle-right"></i>Your Basic Informations Are</h4>
                                <%
                                    ResultSet pow = dn.Select("select * from users where Mail_ID='" + uname + "'");
                                    if (pow.next()) {
                                %> 
                                <span class="label label-success">First Name : </span>
                                <div class="alert alert-success" ><b><%=pow.getString("F_Name")%></b></div>                                                                    
                                <span class="label label-success">Last Name : </span>
                                <div class="alert alert-success"><b><%=pow.getString("L_Name")%></b></div>                                                                  
                                <span class="label label-success" >Date Of Birth: </span>
                                <div class="alert alert-success" ><b><%=pow.getString("DOB")%></b></div>                                                                    
                                <span class="label label-success">Address : </span>
                                <div class="alert alert-success"><b><%=pow.getString("Address")%></b></div>                                                                                                          
                                <span class="label label-success">State : </span>
                                <div class="alert alert-success"><b><%=pow.getString("State")%></b></div>
                                <span class="label label-success">Country : </span>
                                <div class="alert alert-success"><b><%=pow.getString("Country")%></b></div>
                                        <%
                                            }
                                            ResultSet pow12 = dn.Select("select * from storedetls where SH_RUMail='" + uname + "'");
                                            if (pow12.next()) {
                                        %>                                      
                                <span class="label label-success"> Shop Name : </span>
                                <div class="alert alert-success"><b><%=pow12.getString("SH_Name")%></b></div>                                                                    
                                <span class="label label-success">Shop Place : </span>
                                <div class="alert alert-success"><b><%=pow12.getString("SH_CPlace")%></b></div>                                      
                                        <%
                                            }
                                        %> 
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <! -- Your Profile Picture -->
                            <div class="showback">
                                <h4><i class="fa fa-angle-right"></i> Yours Profile Picture</h4>
                                <center>
                                    <img src="propicget.jsp?UMAIL=<%=uname%>" class="img-thumbnail" width="50%" height="45%">
                                </center>                                
                            </div><!-- /showback -->
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <! -- Your Profile Picture -->
                            <div class="showback">
                                <h4><i class="fa fa-angle-right"></i> Yours Shop Picture</h4>
                                <center>
                                    <img src="PShPicGet.jsp?UMAIL=<%=uname%>" class="img-thumbnail" width="50%" height="45%">
                                </center>                                
                            </div><!-- /showback -->
                        </div>

                    </div>
                    </div>
                </section>
            </section>           
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
                        System.out.println("POPRofile Error " + e);
                    }
                } else {
                    session.setAttribute("fbmsg", "Please Login");
                    response.sendRedirect("UsrLogin.jsp");
                }
            %>
    </body>
</html>
