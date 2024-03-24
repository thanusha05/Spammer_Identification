
<%@page import="DATA.GetInfo.cmdlikedet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DATA.GetInfo.MnubarDet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DATA.DB"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%
        String TYpe = request.getParameter("Type");
        System.out.println("Ctype \\\\\\\\\t\t" + TYpe);
        String modific = request.getParameter("MFDATA");
          System.out.println("Modification----------------------" + modific);
        String uname = request.getParameter("UMAIL");
          System.out.println("Mail ID " + uname);
        DB hb = new DB();
        if (TYpe.equals("FName")) {
            int ity = hb.Update("update users set F_Name='" + modific + "' where Mail_ID='" + uname + "'");
            if (ity > 0) {
                out.println("First Name  Changed Successfully");
            } else {
                 out.println("ERROR : First Name CANNOT Changed");
            }
        } else if (TYpe.equals("LName")) {
            int ity = hb.Update("update users set L_Name='" + modific + "' where Mail_ID='" + uname + "'");
            if (ity > 0) {
                out.println("Last  Name  Changed Successfully");
            } else {
                 out.println("ERROR : Last Name CANNOT Changed");
            }
        } 
        else if (TYpe.equals("DOB")) {
            int ity = hb.Update("update users set DOB='" + modific + "' where Mail_ID='" + uname + "'");
            if (ity > 0) {
                out.println("Date Of Birth Changed Successfully");
            } else {
                 out.println("ERROR : Date Of Birth CANNOT Changed");
            }
        } 
        else if (TYpe.equals("ADDRESS")) {
            int ity = hb.Update("update users set Address='" + modific + "' where Mail_ID='" + uname + "'");
            if (ity > 0) {
                out.println("Address Changed Successfully");
            } else {
                 out.println("ERROR : Address CANNOT Changed");
            }
        }
        else if (TYpe.equals("Shop_Name")) {
            int ity = hb.Update("update storedetls set SH_Name='" + modific + "' where SH_RUMail='" + uname + "'");
            if (ity > 0) {
                out.println("Shop Name Changed Successfully");
            } else {
                 out.println("ERROR : Shop Name CANNOT Changed");
            }
        }
        else if (TYpe.equals("Shop_Place")) {
            int ity = hb.Update("update storedetls set SH_CPlace='" + modific + "' where SH_RUMail='" + uname + "'");
            if (ity > 0) {
                out.println("Shop Current Place Changed Successfully");
            } else {
                 out.println("ERROR : Shop Current Place CANNOT Changed");
            }
        }
%>
