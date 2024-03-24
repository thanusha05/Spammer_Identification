
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DATA.DB"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%
    String id = request.getParameter("IID");
    DB hb = new DB();
    ResultSet rs = hb.Select("select E_Pict from event where ID='" + id + "'");    
    InputStream sImage;
    while (rs.next()) {
        byte[] bytearray = new byte[1048576];
        int size = 0;
        sImage = rs.getBinaryStream(1);
        response.reset();
        response.setContentType("image/jpeg");
        while ((size = sImage.read(bytearray)) != -1) {
            response.getOutputStream().write(bytearray, 0, size);
        }
    }
%>