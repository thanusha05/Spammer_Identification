
<%@page import="DATA.GetInfo.FindFriends"%>
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
    String sts = request.getParameter("STS");   
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd h:mm:ss");
    java.util.Date de = new java.util.Date();
    String sdte = sdf.format(de);
    FindFriends ff = new FindFriends();
    DB hb = new DB();
    MnubarDet mbar = new MnubarDet();;
    String oname = mbar.username(uname);
    String uuname = ff.requmail(frmail);
    String frname = ff.requname(frmail);
     String mmsg = oname + "  IS  " + sts + "   Your Request";
    if (sts.equals("Accept")) {
        int fv = hb.Update("update friends set Status='Accept' where ID='" + frmail + "'");
        if (fv > 0) {
            int ity = hb.Insert("insert into notification(T_UMID,INFORMATION,S_Time,T_UName,D_UName,D_UMail) values('" + uname + "','" + mmsg + "','" + sdte + "','" + oname + "','" + frname + "','" + uuname + "')");
            out.println("Request Sent");
            response.sendRedirect("UsrFindFri.jsp");
        } else {
            out.println("ERROR");
            response.sendRedirect("UsrFindFri.jsp");
        }
    } else {
        int fv = hb.Update("update friends set Status='Reject' where ID='" + frmail + "'");
        if (fv > 0) {
            int ity = hb.Insert("insert into notification(T_UMID,INFORMATION,S_Time,T_UName,D_UName,D_UMail) values('" + uname + "','" + mmsg + "','" + sdte + "','" + oname + "','" + frname + "','" + uuname + "')");
            out.println("Request Sent");
            response.sendRedirect("UsrFindFri.jsp");
        } else {
            out.println("ERROR");
            response.sendRedirect("UsrFindFri.jsp");
        }
    }

%>