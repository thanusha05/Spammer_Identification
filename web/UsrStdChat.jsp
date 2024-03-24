
<%@page import="java.sql.ResultSet"%>
<%@page import="DATA.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Chat </title>
        <link type="text/css" rel="stylesheet" href="style.css" />
        <style>
            /* CSS Document */
            body {
                font:12px arial;
                color: #222;
                text-align:center;
                padding:35px; }

            form, p, span {
                margin:0;
                padding:0; }

            input { font:12px arial; }

            a {
                color:#0000FF;
                text-decoration:none; }

            a:hover { text-decoration:underline; }

            #wrapper, #loginform {
                margin:0 auto;
                padding-bottom:25px;
                background:#EBF4FB;
                width:504px;
                border:1px solid #ACD8F0; }

            #loginform { padding-top:18px; }

            #loginform p { margin: 5px; }

            #chatbox {
                text-align:left;
                margin:0 auto;
                margin-bottom:25px;
                padding:10px;
                background:#fff;
                height:270px;
                width:430px;
                border:1px solid #ACD8F0;
                overflow:auto; }

            #usermsg {
                width:395px;
                border:1px solid #ACD8F0; }

            #submit { width: 60px; }

            .error { color: #ff0000; }

            #menu { padding:12.5px 25px 12.5px 25px; }

            .welcome { float:left; }

            .logout { float:right; }

            .msgln { margin:0 0 2px 0; }    
        </style>
    </head>
    <%
        DB gf = new DB();
        String csrid = request.getParameter("val");
        String umail = request.getParameter("UMAIL");
    %>
    <script>
        var crusr = '<%=csrid%>';
        var tousr = '<%=umail%>';
    </script>
    <script>
        //Chat Ajax Function
        var request07;
        function chattoanthr()
        {
            var v = document.message.usermsg.value;
            alert(v);
            var url = "UaddCHat.jsp?val=" + v + "&FUser=" + crusr + "&TUser=" + tousr;

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
    <div id="wrapper">
        <div id="menu">
            <p class="welcome">Welcome, <b></b></p>
            <p class="logout"><a id="exit" href="#">Exit Chat</a></p>
            <div style="clear:both"></div>
        </div>

        <div id="chatbox">
            <%
                ResultSet rs = gf.Select("select * from chat where F_UMail='" + csrid + "' and T_UMail='" + umail + "'");
                while (rs.next()) {
            %>
            <h3 style="float: left;"><%=rs.getString("MESSAGE")%></h3>
            <%
                }
                ResultSet rs1 = gf.Select("select * from chat where T_UMail='" + csrid + "' and F_UMail='" + umail + "'");
                while (rs1.next()) {
            %>
            <h3 style="float: right;"><%=rs1.getString("MESSAGE")%></h3>
            <%
                }
            %>
        </div>

        <form name="message" action="">
            <input name="usermsg" type="text" id="usermsg" size="63" />
            <input name="submitmsg" type="submit"  id="submitmsg" value="Send" onsubmit=""/>
        </form>
    </div>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        // jQuery Document
        $(document).ready(function() {

        });
    </script>
</body>
</html>
