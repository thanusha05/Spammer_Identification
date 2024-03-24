
<%@page import="DATA.GetInfo.MnubarDet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DATA.DB"%>
<%
    String uname = request.getParameter("val");
    System.out.println("name is ..........\t" + uname);
    String cat = request.getParameter("forcat");
    System.out.println("category is ..........\t" + cat);
    MnubarDet mbr = new MnubarDet();
    String sts = "Yes";
    int yt = 0, yyt = 0;
    DB nh = new DB();
    if (cat.equals("Notification")) {
        int gt = nh.Update("update notification set D_UView='" + sts + "' where T_UMID='" + uname + "'");
        if (gt > 0) {
            out.println("Notification Cleared ");
        } else {
            out.println("ERROR");
        }
    } else {
        System.out.println("Mesage Query ..........\t update chat set T_VSts='" + sts + "' where T_UMail='" + uname + "'");
        int gt = nh.Update("update chat set T_VSts='" + sts + "' where T_UMail='" + uname + "'");
        if (gt > 0) {
            out.println("Messag Cleared");
        } else {
            out.println("ERROR");
        }
    }
%>