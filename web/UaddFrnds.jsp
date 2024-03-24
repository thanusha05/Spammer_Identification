
<%@page import="DATA.GetInfo.cmdlikedet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DATA.GetInfo.MnubarDet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DATA.DB"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%
    String frmail = request.getParameter("FRMAIL");
    String uname = request.getParameter("val");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd h:mm:ss");
    java.util.Date de = new java.util.Date();
    String sdte = sdf.format(de);
    DB hb = new DB();
    MnubarDet bgr = new MnubarDet();
    String uuname = bgr.username(uname);
    String frname = bgr.username(frmail);
    int ity = hb.Insert("insert into friends(RE_FUMail, RE_FUName, RE_TUMail, RE_TUName, Status, RE_Time) values('" + uname + "','" + uuname + "','" + frmail + "','" + frname + "','Pending','"+sdte+"')");
    if (ity > 0) {
        out.println("Request Sent");
        response.sendRedirect("UsrFindFri.jsp");
    } else {
        out.println("ERROR");
        response.sendRedirect("UsrFindFri.jsp");
    }
%>
