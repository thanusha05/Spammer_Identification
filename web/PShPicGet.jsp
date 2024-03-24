
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DATA.DB"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%
    String iod = request.getParameter("UMAIL");
    DB hb = new DB();
    ResultSet rs = hb.Select("select SH_Picture from storedetls where SH_RUMail='" + iod + "'");
    System.out.println("select SH_Picture from storedetls where SH_RUMail='" + iod + "'");
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