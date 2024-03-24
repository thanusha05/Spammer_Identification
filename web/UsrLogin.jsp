

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>User Login</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">
        <script type="text/javascript" src="assets/js/Validation.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>


        <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
        <script>
            function lginvld()
            {
                var uname = document.getElementById("username").value;
                var pass = document.getElementById("password").value;
                if (MailVld(uname))
                {
                    document.getElementById("username").style.border = "";
                    if (PassVld(pass))
                    {
                        document.getElementById("password").style.border = "";
                        return true;
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
                    document.getElementById("username").style.border = "2px solid red";
                    document.getElementById("username").focus();
                    return false;
                }
            }
        </script>
        <div id="login-page">
            <a style="margin-left: 30%;" href="index.jsp" class="logo"><center><b style="color: white;">Generating Location-Sensitive Recommendations in
                        <br>Social Network Environments</b></center></a>
            <div class="container">

                <form class="form-login" method="post" onsubmit="return lginvld();" action="UsrLogCheck">
                    <h2 class="form-login-heading">sign in now</h2>
                    <div class="login-wrap">
                        <%
                            String fbmsg = (String) session.getAttribute("fbmsg");
                            if (fbmsg != null) {
                        %>
                        <script type="text/javascript">
            var mmsg = '<%=fbmsg%>';
            document.writeln("<div class='alert alert-danger'><b>" + mmsg + "</div>");
                        </script>
                        <%
                            }
                            session.removeAttribute("fbmsg");
                        %>   
                        <input type="email" name="username" id="username" class="form-control" placeholder="User ID" value="" required="" autofocus>
                        <br>
                        <input type="password" name="password" id="password"  value="" required=""  class="form-control" placeholder="Password">
                        <!--<label class="checkbox">
                            <span class="pull-right">
                                <a data-toggle="modal" href="UsrLogin.jsp#myModal"> Forgot Password?</a>		
                            </span>
                        </label>-->
                        <br>
                        <button class="btn btn-theme btn-block" type="submit" formaction="UsrLogCheck"><i class="fa fa-lock"></i> SIGN IN</button><br><br>
                        <button class="btn btn-theme btn-block" type="submit" onclick="window.history.back();"><i class="fa fa-windows"></i>BACK</button>
                        <hr>		            		          
                        <div class="registration">
                            Don't have an account yet?<br/>
                            <a class="" href="Register.jsp">
                                Create an account
                            </a>
                        </div>

                    </div>				          		
                </form>	  	

            </div>
        </div>       
        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Forgot Password ?</h4>
                    </div>
                    <form name="remberpass" id="remberpass" method="post">
                        <div class="modal-body">                                          
                            <p>Enter your e-mail address below to reset your password.</p>
                            <input type="text" name="email" id="email" value="" required="" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">		                            
                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <button class="btn btn-theme" type="button" formaction="GetPassword">Submit</button>
                        </div>
                    </form>     
                </div>
            </div>
        </div>
        <!-- modal -->
        <!-- Modal  -   1 -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModalQ1" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Forgot Password ?</h4>
                    </div>
                    <form name="remberpass" method="post">
                        <div class="modal-body">                                          
                            <p>Enter your e-mail address below to reset your password.</p>
                            <input type="text" name="email" id="email" value="" required="" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">		
                            <input type="hidden" name="pages" id="pages" value="UsrLogin.jsp" required="" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">		
                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <button class="btn btn-theme" type="button" formaction="GetPassword">Submit</button>
                        </div>
                    </form>     
                </div>
            </div>
        </div>
        <!-- modal -->
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!--BACKSTRETCH-->
        <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
        <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
        <script>
            $.backstretch("assets/img/login-bg.jpg", {speed: 500});
        </script>


    </body>
</html>
