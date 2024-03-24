

<%@page import="DATA.GetInfo.cmdlikedet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DATA.GetInfo.MnubarDet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DATA.DB"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%
        String cmnt = request.getParameter("CMNTS");
        String pstid = request.getParameter("PSTID");
        String uname = request.getParameter("val");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd h:mm:ss");
        java.util.Date de = new java.util.Date();
        String sdte = sdf.format(de);
        DB hb = new DB();
        MnubarDet bgr = new MnubarDet();
        String uuname = bgr.username(uname);
        int ity = hb.Insert("insert into Report_1(Post_ID,Cmnt_UserMail,Cmnt_UName, Cmnt_Time, Comments,use_name) values('" + pstid + "','" + uname + "','" +uuname + "','" + sdte + "','" + cmnt + "','"+(String)session.getAttribute("UNAME")+"')");
        if (ity > 0) {
            System.out.println("Success Comment");
            response.sendRedirect("UsrHome.jsp");
        } else {
            System.out.println("ERROR Comment");
            response.sendRedirect("UsrHome.jsp");
        }
%>
