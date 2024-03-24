
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

        <title>Product Owner Add Products</title>

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
    </head>
    <%
        String uname = (String) session.getAttribute("PNAME");
        String upass = (String) session.getAttribute("PPASS");
        String location = (String) session.getAttribute("PLOCATION");
        if ((uname != null) && (upass != null)) {
            try {
                POnrAddPdts pd = new POnrAddPdts();
                String shname = pd.shopname(uname);
                String shid = pd.shopID(uname);
                int ppid = pd.PrdtsID();
                if ((shname != null) && (shid != null)) {
                    MnubarDet mbar = new MnubarDet();
                    cmdlikedet clk = new cmdlikedet();
                    String oname = mbar.username(uname);
                    DB dn = new DB();
    %>
    <body>
        <script>
            var unme = '<%=uname%>';
            var upwd = '<%=upass%>';</script>
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
                        <li><a class="logout" href="Logout.jsp">Logout</a></li>
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
                            <a  href="POnrHome.jsp">
                                <i class="fa fa-home"></i>
                                <span>Home</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a  class="active" href="POAddProducts.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Add Products</span>
                            </a>                            
                        </li> 

                        <!--<li class="sub-menu">
                            <a href="POUdtProdts.jsp" >
                                <i class="fa fa-book"></i>
                                <span>Update Products</span>
                            </a>                            
                        </li>-->
                        <li class="sub-menu">
                            <a href="POViewCirEvents.jsp" >
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
                        var lsts = val.toString();
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
                        var lsts = val.toString();
                        //alert(lsts);
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
                    <script>
                        function ADDPDTS()
                        {
                            var fname = document.getElementById("PName").value;
                            var price = document.getElementById("PRice").value;
                            var desc = document.getElementById("descrip").value;
                            var SHPic = document.getElementById("adpdts").value;
                            if (PDTSnameVld(fname))
                            {
                                document.getElementById("PName").style.border = "";
                                if (PDTPCEVld(price))
                                {
                                    document.getElementById("PRice").style.border = "";
                                    if (DESCsVld(desc))
                                    {
                                        document.getElementById("descrip").style.border = "";
                                        if (PDTPictVld(SHPic))
                                        {
                                            document.getElementById("adpdts").style.border = "";
                                            return true;
                                        }
                                        else
                                        {
                                            document.getElementById("adpdts").style.border = "2px solid red";
                                            document.getElementById("adpdts").focus();
                                            return false;
                                        }
                                    }
                                    else
                                    {
                                        document.getElementById("descrip").style.border = "2px solid red";
                                        document.getElementById("descrip").focus();
                                        return false;
                                    }
                                }
                                else
                                {
                                    document.getElementById("PRice").style.border = "2px solid red";
                                    document.getElementById("PRice").focus();
                                    return false;
                                }
                            }
                            else
                            {
                                document.getElementById("PName").style.border = "2px solid red";
                                document.getElementById("PName").focus();
                                return false;
                            }
                        }
//Product Name Validation
                        function PDTSnameVld(spnm)
                        {
                            var fun = /^[a-zA-Z\s\-\_]+$/.test(spnm);
                            if (spnm == "")
                            {
                                alert("Please Enter PRODUCT Name");
                                return false;
                            }
                            else if (!fun)
                            {
                                alert("PRODUCT Name Should Contain Only ALPHABETS");
                                return false;
                            }
                            return true;
                        }
                        //Product Name Validation
                        function PDTPCEVld(spnm1)
                        {
                            var fun = /^[0-9]+$/.test(spnm1);
                            if (spnm1 == "")
                            {
                                alert("Please Enter PRODUCT PRICE");
                                return false;
                            }
                            else if (!fun)
                            {
                                alert("PRODUCT PRICE Should Contain Only NUMBER");
                                return false;
                            }
                            return true;
                        }

                        //Product DESCRIPTION Validation
                        function DESCsVld(desc)
                        {
                            var fun = /^[\w\s\-\.\,]+$/.test(desc);
                            if (desc == "")
                            {
                                alert("Please Enter PRODUCT DESCRIBTION");
                                return false;
                            }
                            else if (!fun)
                            {
                                alert("PRODUCT DESCRIBTION Should not Contain any Special Symbols");
                                return false;
                            }
                            return true;
                        }
                        //Product Picture Validation
                        function PDTPictVld(picsd)
                        {
                            var ext = picsd.substring(picsd.lastIndexOf('.') + 1);
                            if (picsd == "")
                            {
                                alert("Please Select Product Picture");
                                return false;
                            }
                            else if (!(ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "png" || ext == "PNG"))
                            {
                                alert("Supported File Formats gif , GIF , jpg , JPG , jpeg , JPEG , png , PNG ");
                                return false;
                            }
                            return true;
                        }
                    </script>
                    <div class="row">
                        <div class="col-lg-9 main-chart" style="overflow: auto;">                           
                            <div class="row">           

                                <div class="col-md-10 mb" style="background: white;margin-left: 70px;">
                                    <!-- INSTAGRAM PANEL -->
                                    <center>
                                        <div class="showback">
                                            <h4><i class="fa"></i>Add New Products</h4>                                           
                                            <form name="uploadpost" id="uploadpost" onsubmit="return ADDPDTS();" enctype="multipart/form-data" method="post">
                                                <input type="hidden" class="form-control" name="Umail" id="Umail" value="<%=uname%>" readonly=""><br>   
                                                <input type="hidden" class="form-control" name="UName" id="UName"  value="<%=oname%>" readonly=""><br>     
                                                <input type="hidden" class="form-control" name="shpname" id="shpname" value="<%=shname%>" readonly=""><br>   
                                                <input type="hidden" class="form-control" name="shid" id="shid"  value="<%=shid%>" readonly=""><br>     
                                                <input type="hidden" class="form-control" name="city" id="city"  value="<%=location%>" readonly=""><br>
                                                <input type="hidden" class="form-control" name="pppid" id="pppid"  value="<%=ppid%>" readonly=""><br>
                                                <input type="text" class="form-control" placeholder="Product Name" name="PName" id="PName" maxlength="50" required="" autofocus=""><br>
                                                <input type="text" class="form-control" placeholder="Product Price" name="PRice" id="PRice" maxlength="4" required="" autofocus=""><br>
                                                <textarea class="form-control" placeholder="Product Description" name="descrip" id="descrip"  maxlength="500" required="" autofocus=""></textarea><br>                                                
                                                <input type="file" class="form-control" name="adpdts" id="adpdts" required="" autofocus=""><br>
                                                <input type="submit" class="btn btn-theme" value="Add Products" formaction="POnrAddPrdts">
                                            </form>
                                        </div><!-- /showback -->
                                    </center>                                        
                                </div><!-- /col-md-4 -->                                   
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
                    <a href="POAddProducts.jsp#" class="go-top">
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
                    } else {
                        session.setAttribute("fbmsg", "Please Add Your Basic Information");
                        response.sendRedirect("POBasicInfo.jsp");
                    }
                } catch (Exception e) {
                    System.out.println("Add products Error" + e);
                }
            } else {
                session.setAttribute("fbmsg", "Please Login");
                response.sendRedirect("UsrLogin.jsp");
            }
        %>
    </body>
</html>

