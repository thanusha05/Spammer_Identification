

<%@page import="DATA.GetInfo.cmdlikedet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DATA.GetInfo.MnubarDet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DATA.DB"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%
    String TYpe = request.getParameter("CTYPE");
    System.out.println("Ctype \\\\\\\\\t\t"+TYpe);
    String pstid = request.getParameter("PSTID");
    String uname = request.getParameter("val");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd h:mm:ss");
    java.util.Date de = new java.util.Date();
    String sdte = sdf.format(de);
    DB hb = new DB();
    MnubarDet bgr = new MnubarDet();
    String uuname = bgr.username(uname);
    cmdlikedet cdr = new cmdlikedet();
    int cnt = cdr.ttllikes(pstid);
    System.out.println("Already Likes IS\t" + cnt);
    int tcnt = cnt + 1;
    System.out.println("Like Likes IS\t" + tcnt);
    int ulcnt = cnt - 1;
    System.out.println("UnLike Likes IS\t" + ulcnt);
    ResultSet ygt = hb.Select("select * from likes where Post_ID='" + pstid + "' and L_UMail='" + uname + "'");
    if (ygt.next()) {
        if (TYpe.equals("Like")) {
            int ity = hb.Update("update likes set AL_Count='" + tcnt + "',ULORUL='Like' where L_UMail='" + uname + "'");
            if (ity > 0) {
                out.println("Liked");
            } else {
                out.println("Unliked");
            }
        } else if (TYpe.equals("UnLike")) {
            int ity = hb.Update("update likes set AL_Count='" + ulcnt + "',ULORUL='UnLike' where L_UMail='" + uname + "'");
            if (ity > 0) {
                out.println("UnLiked");
            } else {
                out.println("liked");
            }
        }
    } else{
        int ity = hb.Insert("insert into likes(Post_ID, L_UName, L_UMail, L_Time, AL_Count,ULORUL) values('" + pstid + "','" + uuname + "','" + uname + "','" + sdte + "','" + tcnt + "','Like')");
        if (ity > 0) {
            out.println("Liked");
        } else {
            out.println("Unliked");
        }
    }
%>
