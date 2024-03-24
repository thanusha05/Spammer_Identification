
<%@page import="java.text.SimpleDateFormat"%>
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

        <title>Admin Home</title>

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
        String uname = (String) session.getAttribute("ADUNAME");
        String upass = (String) session.getAttribute("ADUPASS");
        String location = "Chennai";
        int vb = 0, vb1 = 0;
        if ((uname != null) && (upass != null)) {
            try {
                DB gb = new DB();
                RMDPDTS rmdt = new RMDPDTS();
                MnubarDet mbar = new MnubarDet();
                cmdlikedet clk = new cmdlikedet();
                String oname = "Admin";
                String fbmsg = (String) session.getAttribute("fbmsg");
                if (fbmsg != null) {
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
        session.removeAttribute("fbmsg");
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
                <a href="ADMNHome.jsp" class="logo"><center><b style="color: #003366;">Generating Location-Sensitive Recommendations in
                            <br>Social Network Environments</b></center></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  notification start -->
                    <ul class="nav top-menu">

                        <!-- inbox dropdown end -->
                    </ul>
                    <!--  notification end -->
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="Logout.jsp?TYPE=ADMIN">Logout</a></li>
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

                        <p class="centered"><a href="#" class="img-thumbnail" width="60"></a></p>
                        <h5 class="centered"><%=oname%></h5>

                        <li class="mt">
                            <a class="active" href="ADMNHome.jsp">
                                <i class="fa fa-home"></i>
                                <span>Home</span>
                            </a>
                        </li>
                        
                        <li class="sub-menu">
                            <a href="AdmnViewEvents.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>View Events</span>
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
                    //alert(pstid1);
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
                        //var lsts = val.toString();
                        //  alert(lsts);
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
                                        var psttpy = document.getElementById("PstYpe").value;
                                        if (psttpy == "LOCAL")
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
                                        else if (psttpy == "URL")
                                        {

                                            var pst = document.getElementById("posturl").value
                                            var aa = pst.split("/");
                                            var ty = aa.length;
                                            var destinationFile = aa[ty - 1];
                                            var ext = destinationFile.substring(destinationFile.lastIndexOf('.') + 1);
                                            if (pst == "")
                                            {
                                                document.getElementById("posturl").style.border = "";
                                                return true;
                                            }
                                            else if (!(ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "png" || ext == "PNG"))
                                            {
                                                alert("Supported File Formats gif , GIF , jpg , JPG , jpeg , JPEG , png , PNG ");
                                                return false;
                                            }
                                        }
                                    }
                                    //second Validation
                                    function pstVld1()
                                    {
                                        var pst = document.getElementById("posturl").value
                                        var aa = pst.split("/");
                                        var ty = aa.length;
                                        var destinationFile = aa[ty - 1];
                                        var ext = destinationFile.substring(destinationFile.lastIndexOf('.') + 1);
                                        if (pst == "")
                                        {
                                            document.getElementById("posturl").style.border = "";
                                            return true;
                                        }
                                        else if (!(ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "png" || ext == "PNG"))
                                        {
                                            alert("Supported File Formats gif , GIF , jpg , JPG , jpeg , JPEG , png , PNG ");
                                            return false;
                                        }
                                        return true;
                                    }
                                    function enablesbutts(xenon)
                                    {
                                        alert(xenon);
                                        if (xenon == "LOCAL")
                                        {
                                            document.getElementById("uploadposturl").style.display = "none";
                                            document.getElementById("uploadpost").style.display = "block";
                                        }
                                        else if (xenon == "URL")
                                        {
                                            document.getElementById("uploadpost").style.display = "none";
                                            document.getElementById("uploadposturl").style.display = "block";
                                        }
                                    }
                                </script>
                               

                            </div><!-- /row -->
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->
                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                                                        
                        <div id="sidebar1" class="col-lg-3 ds" style="background:white;border: 2px solid black;overflow: auto;" >                                                                                                       
                           
                        </div><!-- /col-lg-3 -->                         
                    </div><!--/row -->
                    <%
DB db=new DB();
ResultSet rs=db.Select("select * from report_1");
%>

<br><br><br>
  <%
//DB db=new DB();
ResultSet rs2=db.Select("select L_uname,sum(diff) as diff from logdet join report_1 on L_UName=use_name group by L_UName");
%>
<table border="2" style="color: red;font-size: 10px">
    <tr><td>USer NAme</td><td>Max time</td><td>Hours</td></tr>
    <%
      while(rs2.next())
      {
          %>
          <tr><td><%=rs2.getString("L_uname")%></td>
          <td><%=rs2.getString("diff")%> minutes</td>
          
          <td>
          <%
          String sts="";
          int hh=Integer.parseInt(rs2.getString("diff"))%60;
          if(hh>16)
          {
              sts="Addicted";
              out.println("Addicted");
          }
           if(hh<3)
           {
                sts="Non Addict";
              out.println("Non Addict");
           }
          if(hh>=3&&hh<=16)
          {
               sts="Prime to Addict";
              out.println("Prime to Addict");
          }
         %>
          </td>
          <td><a href="charts_page1.jsp?uname=<%=rs2.getString("L_uname")%>">Graph</a></td>
          <td><a href="sendStatus.jsp?uname=<%=rs2.getString("L_uname")%>&sts=<%=sts%>">Send Status</a></td></tr>
         <%
                  
      }
        
%>    
    
    
</table><br>
<br>


 <%
      //Id, L_UName, L_UINDate, L_UINTime, L_UOUTTime, L_TOUTDate, Acc_ExpryDate, diff
       //SimpleDateFormat yt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
       SimpleDateFormat yt1 = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dt = new java.util.Date();
        //String ste = yt.format(dt);
        String sdt = yt1.format(dt);
DB db2=new DB();
ResultSet rs3=db2.Select("select L_uname,diff as diff from logdet where L_UINDate='"+sdt+"' and not L_UName='fbadmin@gmail.com' group by l_uname ");
%>
<table border="2" style="color: red;font-size: 10px">
    <tr><td>USer NAme</td><td>Max time</td><td>Hours</td></tr>
    <%
      while(rs3.next())
      {
          %>
          <tr><td><%=rs3.getString("L_uname")%></td>
          <td><%=rs3.getString("diff")%> minutes</td>
          
          <td>
          <%
          String sts="";
          int hh=Integer.parseInt(rs3.getString("diff"))%60;
          if(hh>16)
          {
              sts="Addicted";
              out.println("Addicted");
          }
           if(hh<3)
           {
                sts="Non Addict";
              out.println("Non Addict");
           }
          if(hh>=3&&hh<=16)
          {
               sts="Prime to Addict";
              out.println("Prime to Addict");
          }
         %>
          </td>
          <td><a href="charts_page.jsp?uname=<%=rs3.getString("L_uname")%>">Graph</a></td>
          <td><a href="sendStatus.jsp?uname=<%=rs3.getString("L_uname")%>&sts=<%=sts%>">Send Status</a></td></tr>
         <%
                  
      }
        
%>    
    
    
</table><br><br><br>

<h2 style="color:black; ">Blocked users</h2>
              
 <%
      
DB db3=new DB();
ResultSet rs4=db3.Select("select *,COUNT(*) from spam group by subject ");
%>
<table border="2" style=" color: black;font-size: 14px">
    <tr><td>USER NAME</td><td>MESSAGE</td><td>COUNT</td><td>STATUS</td></tr>
    <%
      while(rs4.next())
      {
          %>
          <tr>
            <td><%=rs4.getString(3)%></td>
            <td><%=rs4.getString(2)%></td>
            <td><%=rs4.getString(3)%></td>
            <% if(rs4.getInt("count(*)")>=10) { %>
            <td>Blocked</td>
            <% } else {  %>
            <td><%=rs4.getInt("count(*)") %></td>
            <%
            }%>
          </tr>
         <%
                  
      }
        
%>    
    
    
</table>                    

                </section>
            </section>           
            <!--main content end-->
            <!--footer start-->
            <!-- <footer class="site-footer">
                <div class="text-center">                    
                    Recommendation On OSN
                    <a href="UsrHome.jsp#" class="go-top">
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
                    System.out.println("UserHome Error" + e);
                }
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
</html>


