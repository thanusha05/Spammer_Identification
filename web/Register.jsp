

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Registration Page</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">
        <script type= "text/javascript" src = "assets/js/countries.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <link rel="stylesheet" href="assets/datepicker/css/pickmeup.css" type="text/css" />
        <link rel="stylesheet" media="screen" type="text/css" href="assets/datepicker/css/demo.css" />
        <script type="text/javascript" src="assets/datepicker/js/jquery.js"></script>
        <script type="text/javascript" src="assets/datepicker/js/jquery.pickmeup.js"></script>
        <script type="text/javascript" src="assets/datepicker/js/demo.js"></script>       
        <script type="text/javascript" src="assets/js/Validation.js"></script>       

    </head>

    <body>
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
        <script>
            function rgvld()
            {
                var utype = document.getElementById("UType").value;
                var fname = document.getElementById("fname").value;
                var lname = document.getElementById("lname").value;
                var gndr = document.getElementById("Gndr").value;
                var mids = document.getElementById("emailid").value;
                var dob = document.getElementById("datepicker").value;
                var pass = document.getElementById("password").value;
                var pic = document.getElementById("ppic").value;
                var cntry = document.getElementById("country").value;
                var stat = document.getElementById("state").value;
                var cty = document.getElementById("city").value;
                var adss = document.getElementById("adds").value;
                if (UTypeVld(utype))
                {
                    document.getElementById("UType").style.border = "";
                    if (FnameVld(fname))
                    {
                        document.getElementById("fname").style.border = "";
                        if (LnameVld(lname))
                        {
                            document.getElementById("lname").style.border = "";
                            if (GndrVld(gndr))
                            {
                                document.getElementById("Gndr").style.border = "";
                                if (MailVld(mids))
                                {
                                    document.getElementById("emailid").style.border = "";
                                    if (DofBthVld(dob))
                                    {
                                        document.getElementById("datepicker").style.border = "";
                                        if (PassVld(pass))
                                        {
                                            document.getElementById("password").style.border = "";
                                            if (PictVld(pic))
                                            {
                                                document.getElementById("ppic").style.border = "";
                                                if (CntryVld(cntry))
                                                {
                                                    document.getElementById("country").style.border = "";
                                                    if (StatVld(stat))
                                                    {
                                                        document.getElementById("state").style.border = "";
                                                        if (CityVld(cty))
                                                        {
                                                            document.getElementById("city").style.border = "";
                                                            if (AddssVld(adss))
                                                            {
                                                                document.getElementById("adds").style.border = "";
                                                                return true;
                                                            }
                                                            else
                                                            {
                                                                document.getElementById("adds").style.border = "2px solid red";
                                                                document.getElementById("adds").focus();
                                                                return false;
                                                            }
                                                        }
                                                        else
                                                        {
                                                            document.getElementById("city").style.border = "2px solid red";
                                                            document.getElementById("city").focus();
                                                            return false;
                                                        }
                                                    }
                                                    else
                                                    {
                                                        document.getElementById("state").style.border = "2px solid red";
                                                        document.getElementById("state").focus();
                                                        return false;
                                                    }
                                                }
                                                else
                                                {
                                                    document.getElementById("country").style.border = "2px solid red";
                                                    document.getElementById("country").focus();
                                                    return false;
                                                }
                                            }
                                            else
                                            {
                                                document.getElementById("ppic").style.border = "2px solid red";
                                                document.getElementById("ppic").focus();
                                                return false;
                                            }
                                        }
                                        else
                                        {
                                            document.getElementById("password").style.border = "2px solid red";
                                            document.getElementById("password").focus();
                                            return false;
                                        }
                                    }
                                    else
                                    {
                                        document.getElementById("datepicker").style.border = "2px solid red";
                                        document.getElementById("datepicker").focus();
                                        return false;
                                    }
                                }
                                else
                                {
                                    document.getElementById("emailid").style.border = "2px solid red";
                                    document.getElementById("emailid").focus();
                                    return false;
                                }
                            }
                            else
                            {
                                document.getElementById("Gndr").style.border = "2px solid red";
                                document.getElementById("Gndr").focus();
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
                else
                {
                    document.getElementById("UType").style.border = "2px solid red";
                    document.getElementById("UType").focus();
                    return false;
                }
            }

        </script>
        <!--main content start-->
        <section id="main-content" style="background: whitesmoke;margin-right: 250px;">
            <a style="margin-left: 20%;" href="index.jsp" class="logo"><center><b style="color: #003366;">Generating Location-Sensitive Recommendations in
                        <br>Social Network Environments</b></center></a>
            <section class="wrapper" id="login-page">
                <center><h3 style="margin-top:20px;color: black;">User Sign Up </h3><br></center>
                <div class="row mt">
                    <form name="usrregister" method="post" onsubmit="return rgvld();" enctype="multipart/form-data">
                        <div class="col-md-12">
                            <div class="form-panel">                               
                                <div class="custom-check goleft mt">
                                    <center><select  name="UType" id="UType" class="form-control" style="width:50%;" required="" autofocus="">  
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            <option value="Normal_User">Normal User</option>
                                        </select></center><br>
                                </div><!-- /table-responsive -->
                            </div><!--/ White-panel -->

                            <div class="col-lg-6 col-md-6 col-sm-12">    
                                <div class="showback">
                                    <h3>Personal Info</h3><br>
                                    <input type="text" class="form-control" placeholder="First Name" name="fname" id="fname" value="" required="" autofocus><br>
                                    <input type="text" class="form-control" placeholder="Last Name" name="lname" id="lname" value="" required="" autofocus><br>
                                    <select class="form-control" name="Gndr" id="Gndr">
                                        <option value="Select">Select Your Gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Fe-Male">Fe-Male</option>
                                    </select><br>
                                    <input type="email" class="form-control" placeholder="User Mail ID" name="emailid" id="emailid" value="" required="" autofocus><br>
                                    <input type="text" class="form-control" placeholder="Date Of Birth" name="dteobth" id="datepicker" readonly="" required="" autofocus=""><br>                           
                                    <input type="password" class="form-control" placeholder="New Password" name="password" id="password" value="" required="" autofocus><br>
                                    <input type="file" class="form-control" name="ppic" id="ppic" value="" required="" accept="image/*" autofocus><br>
                                </div><!-- /showback -->
                                <button class="btn btn-theme btn-block" style="background: #990099;" type="submit" onclick="window.history.back();">Back</button>
                            </div><!--/col-lg-6 -->


                            <div class="col-lg-6 col-md-6 col-sm-12">                       
                                <div class="showback">                                    
                                    <h3>Address Info</h3><br>
                                    <select type="text" name="country" id="country" class="form-control" required="">                                               
                                    </select><br>
                                    <script language="javascript">
            populateCountries("country", "state");
                                    </script>
                                    <select type="text" name="state" id="state" class="form-control" required=""><option value="Select">Select</option></select><br>
                                    <input type="text" class="form-control" placeholder="City" name="city" id="city" value="" required="" autofocus><br>
                                    <textarea class="form-control" placeholder="Address" name="adds" id="adds" rows="3"  value="" required="" autofocus></textarea><br>                                
                                    <input type="hidden" class="form-control" placeholder="Lattitude Lantitude" name="latillang" id="latillang" value=""  autofocus><br>                                 
                                </div><!-- /showback -->                                           
                                <button class="btn btn-theme btn-block" type="submit" style="background: #990099;" formaction="Register"><i class="fa fa-lock"></i> SIGN IN</button>

                            </div><!-- /col-lg-6 -->

                        </div><!--/col-md-12 -->  <br><br>   
                    </form><br>
                </div><!--/ row -->
            </section><!--/wrapper -->
        </section><!-- /MAIN CONTENT -->

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!--BACKSTRETCH-->
        <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
        <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
        <script>

            /* $(document).ready(function() {
             $("#bgprice").keypress(function(e) {
             if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
             return false;
             }
             });
             $("#bgquantity").keypress(function(e) {
             if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
             return false;
             }
             });
             });*/
            $.backstretch("assets/img/login-bg.jpg", {speed: 500});
        </script>  
        <!-- OFFLINE LINKS -->
        <link rel="stylesheet" href="assets/DATEPIC/jquery-ui.css">
        <script src="assets/DATEPIC/jquery-1.10.2.js"></script>
        <script src="assets/DATEPIC/jquery-ui.js"></script>

        <!-- ONLINE LINKS -->
         <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>-->
        <script>
            $(function() {
                $("#datepicker").datepicker();
            });
            $("#datepicker").datepicker({
                defaultDate: '1990-01-01',
                yearRange: '1990:' + new Date().getFullYear().toString(),
                dateFormat: 'yy-mm-dd'
            });

        </script>                          

    </body>
</html>
