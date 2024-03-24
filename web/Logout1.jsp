
<%@page import="DATA.DB"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                SimpleDateFormat yt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                SimpleDateFormat yt1 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date dt = new java.util.Date();
                String ste = yt.format(dt);
                String sdte1 = yt1.format(dt);
                DB gy = new DB();
                String intime = "", uname = "";
                intime = (String) session.getAttribute("PINTIME");
                uname = (String) session.getAttribute("PNAME");
                int gg = gy.Update("update logdet set L_UOUTTime='" + ste + "',L_TOUTDate='" + sdte1 + "',Acc_ExpryDate=ADDDATE('" + sdte1 + "', INTERVAL 1 MONTH) where L_UINTime='" + intime + "'");
                if (gg > 0) {
                    int g1g = gy.Update("update users set Exp_Date=ADDDATE('" + sdte1 + "', INTERVAL 1 MONTH) where Mail_ID='" + uname + "'");
                    session.invalidate();
                    response.sendRedirect("index.jsp");
                } else {
        %>
        <script>window.location.back();</script>
        <%                }
            } catch (Exception e) {
                out.println(e);
                System.out.println("LOGOUT ERROR IS" + e);
            }
        %>
    </body>
</html>
