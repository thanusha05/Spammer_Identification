

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Initial Page</title>        
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
    </head>

    <body>

        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <header class="header black-bg">              
                <!--logo start-->
                <a href="index.jsp" class="logo"><center><b style="color: #003366;">Generating Location-Sensitive Recommendations in
                            <br>Social Network Environments</b></center></a>
                <!--logo end-->
                <!-- <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <!--   <ul class="nav top-menu">
                <!-- settings start -->
                <!--     <li class="dropdown">
                         <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                             <i class="fa fa-tasks"></i>
                             <span class="badge bg-theme">4</span>
                         </a>
                         <ul class="dropdown-menu extended tasks-bar">
                             <div class="notify-arrow notify-arrow-green"></div>
                             <li>
                                 <p class="green">You have 4 pending tasks</p>
                             </li>
                             <li>
                                 <a href="index.html#">
                                     <div class="task-info">
                                         <div class="desc">DashGum Admin Panel</div>
                                         <div class="percent">40%</div>
                                     </div>
                                     <div class="progress progress-striped">
                                         <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                             <span class="sr-only">40% Complete (success)</span>
                                         </div>
                                     </div>
                                 </a>
                             </li>
                             <li>
                                 <a href="index.html#">
                                     <div class="task-info">
                                         <div class="desc">Database Update</div>
                                         <div class="percent">60%</div>
                                     </div>
                                     <div class="progress progress-striped">
                                         <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                             <span class="sr-only">60% Complete (warning)</span>
                                         </div>
                                     </div>
                                 </a>
                             </li>
                             <li>
                                 <a href="index.html#">
                                     <div class="task-info">
                                         <div class="desc">Product Development</div>
                                         <div class="percent">80%</div>
                                     </div>
                                     <div class="progress progress-striped">
                                         <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                             <span class="sr-only">80% Complete</span>
                                         </div>
                                     </div>
                                 </a>
                             </li>
                             <li>
                                 <a href="index.html#">
                                     <div class="task-info">
                                         <div class="desc">Payments Sent</div>
                                         <div class="percent">70%</div>
                                     </div>
                                     <div class="progress progress-striped">
                                         <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                             <span class="sr-only">70% Complete (Important)</span>
                                         </div>
                                     </div>
                                 </a>
                             </li>
                             <li class="external">
                                 <a href="#">See All Tasks</a>
                             </li>
                         </ul>
                     </li>
                <!-- settings end -->
                <!-- inbox dropdown start-->
                <!--   <li id="header_inbox_bar" class="dropdown">
                       <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                           <i class="fa fa-envelope-o"></i>
                           <span class="badge bg-theme">5</span>
                       </a>
                       <ul class="dropdown-menu extended inbox">
                           <div class="notify-arrow notify-arrow-green"></div>
                           <li>
                               <p class="green">You have 5 new messages</p>
                           </li>
                           <li>
                               <a href="index.html#">
                                   <span class="photo"><img alt="avatar" src="assets/img/ui-zac.jpg"></span>
                                   <span class="subject">
                                       <span class="from">Zac Snider</span>
                                       <span class="time">Just now</span>
                                   </span>
                                   <span class="message">
                                       Hi mate, how is everything?
                                   </span>
                               </a>
                           </li>
                           <li>
                               <a href="index.html#">
                                   <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span>
                                   <span class="subject">
                                       <span class="from">Divya Manian</span>
                                       <span class="time">40 mins.</span>
                                   </span>
                                   <span class="message">
                                       Hi, I need your help with this.
                                   </span>
                               </a>
                           </li>
                           <li>
                               <a href="index.html#">
                                   <span class="photo"><img alt="avatar" src="assets/img/ui-danro.jpg"></span>
                                   <span class="subject">
                                       <span class="from">Dan Rogers</span>
                                       <span class="time">2 hrs.</span>
                                   </span>
                                   <span class="message">
                                       Love your new Dashboard.
                                   </span>
                               </a>
                           </li>
                           <li>
                               <a href="index.html#">
                                   <span class="photo"><img alt="avatar" src="assets/img/ui-sherman.jpg"></span>
                                   <span class="subject">
                                       <span class="from">Dj Sherman</span>
                                       <span class="time">4 hrs.</span>
                                   </span>
                                   <span class="message">
                                       Please, answer asap.
                                   </span>
                               </a>
                           </li>
                           <li>
                               <a href="index.html#">See all messages</a>
                           </li>
                       </ul>
                   </li>
                <!-- inbox dropdown end -->
                <!--    </ul>
                <!--  notification end -->
                <!-- </div>-->
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="Register.jsp">New User Register</a></li>
                        <li><a class="logout" href="UsrLogin.jsp">User Login</a></li>                                                                  
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

                </div>
            </aside>
            <!--sidebar end-->

            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">

                    <div class="row">
                        <div class="col-lg-9 main-chart">
                            <div class="row">                                   
                                <div id="sliderFrame" style="margin-top: 5px;">
                                    <!-- <div id="slider">  
                                         <center>
                                             <img src="" alt="12" /></a>                                                                                                       
                                             <img src="" alt="34" /></a> 
                                             <img src="SliderImages/enterprise-social-media.jpg" alt="90" /></a>  
                                             <img src="SliderImages/social-network.jpg" alt="56" /></a>                                                                                                                                      
                                             <img src="SliderImages/social-network-software-72.jpg" alt="78" /></a>                                                                                                                                      
                                         </center>
                                     </div>-->
                                    <div id='ninja-slider'>
                                        <ul>
                                            <li><div data-image="SliderImages/social_networking.jpg"></div></li>
                                            <li><div data-image="SliderImages/social-network-links.jpg"></div></li>                                                                                                    
                                            <li><div data-image="SliderImages/enterprise-social-media.jpg"></div></li>
                                            <li><div data-image="SliderImages/media-communication.jpg"></div></li>
                                            <li><div data-image="SliderImages/social-networking2.png"></div></li>
                                            <li><div data-image="SliderImages/snetwork.png"></div></li>
                                        </ul>
                                    </div><br>
                                    <div id="htmlcaption" style="display: none;">
                                        <em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.
                                    </div>
                                </div>                             
                            </div><!-- /row -->
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->


                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                  

                        <div class="col-lg-3 ds">

                            <h3>Calender</h3>                          
                            <div id="calendar" class="mb">
                                <div class="panel green-panel no-margin">
                                    <div class="panel-body">
                                        <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                            <div class="arrow"></div>
                                            <h3 class="popover-title" style="disadding: none;"></h3>
                                            <div id="date-popover-content" class="popover-content"></div>
                                        </div>
                                        <div id="my-calendar"></div>
                                    </div>
                                </div>
                            </div><!-- / calendar -->

                        </div><!-- /col-lg-3 -->
                    </div><!--/row --><br><br><br><br>
                </section>
            </section>

            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">                    
                    Recommendation On OSN
                    <a href="index.jsp#" class="go-top">
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
        <%
            String fbmsg = (String) session.getAttribute("fbmsg");
            if (fbmsg != null) {
        %>
        <script type="text/javascript">
    var mmsg = '<%=fbmsg%>';
    var unique_id = $.gritter.add({
        // (string | mandatory) the heading of the notification
        title: 'Action Message',
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

    </body>
</html>
