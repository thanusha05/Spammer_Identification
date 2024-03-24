
<%@page import="Connection.mail"%>
<%@page import="DATA.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String uname=request.getParameter("uname");
            String sts=request.getParameter("sts");
            DB db=new DB();
            try{
                    mail m=new mail();
                   boolean k=m.email(uname, sts);
                   if(k){System.out.println("mail sent"); }else{ System.out.println("mail not sent"); }
            }
            catch(Exception e){ System.out.println(e); }
            
            db.Insert("update friends set status1='"+sts+"' where RE_FUMail='"+uname+"'");
            db.Insert("update friends set status2='"+sts+"' where RE_TUMail='"+uname+"'");
           response.sendRedirect("ADMNHome.jsp");
            
            
            %>
    </body>
</html>
