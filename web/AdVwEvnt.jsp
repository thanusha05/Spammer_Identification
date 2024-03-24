<%@page import="java.sql.ResultSet"%>
<%@page import="DATA.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    

<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet">

<link href="assets/SLIDER/2/ninja-slider.css" rel="stylesheet" type="text/css" />
<!--ninjaVideoPlugin.js is required only when the slider contains videos, and its link should be placed before the ninja-slider.js link.-->
<script src="assets/SLIDER/2/ninjaVideoPlugin.js" type="text/javascript"></script>
<script src="assets/SLIDER/2/ninja-slider.js" type="text/javascript"></script>
<style>           
    ul li {padding: 10px 0;}
</style>
<%
    String placee = request.getParameter("val");
    ResultSet re = new DB().Select("select * from event where Venue='" + placee + "'");
    if (re.next()) {
%>
<table class="table table-striped table-advance table-hover">    
    <hr>
    <thead>
        <tr>                                                    
            <th><i class="fa fa-bookmark">Events On <%=placee%></i></th>                                                    
        </tr>
    </thead>
    <tbody>
        <%
            ResultSet re1 = new DB().Select("select * from event where Venue='" + placee + "'");
            while (re1.next()) {
        %>
        <tr>
            <td><img width="50em" height="50em" src="piceventget.jsp?IID=<%=re1.getString("ID")%>"></td>
            <td><%=re1.getString("Evnt_Name")%></td>
            <td><%=re1.getString("Evnt_Time")%></td>                                                                                                                                                                     
        </tr> 
        <% }
        %>
    </tbody>
</table>
<%
} else {
%>
There Is No Event On Place <%=placee%>
<%
    }
%>