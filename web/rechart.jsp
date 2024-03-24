

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.category.*,org.jfree.data.jdbc.*"%>
<%-- 
    Document   : H_Recrods
    Created on : Feb 4, 2015, 5:57:00 PM
    Author     : fazil
--%>

<%-- 
    Document   : User_Home
    Created on : Sep 3, 2014, 4:07:30 PM
    Author     : mvinoth
--%>


<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Magnetic - Stunning Responsive HTML5/CSS3 Photography Template</title>
	
</head>
<body>
      <%
        try {
            String mail = (String) session.getAttribute("mail");
            String name = (String) session.getAttribute("name");
            Integer id = (Integer) session.getAttribute("id");
%>

	<header>
	
                
               
        <div class="box"  style="height: 762px; width: 1304px; overflow: auto;">
            <center>
<%
     
     session.setAttribute("count", 0);
    
    String st=request.getParameter("s1");
    String s2=request.getParameter("s2");
  Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social","root","admin");


%>
        </font>
<%
     
        String path1=request.getRealPath("/");
        String rpath=path1.replace("build", "");
      String uname=request.getParameter("uname");
      
        ResultSet rs=null;
        try
        {

        }
        catch (Exception e)
        {
        e.printStackTrace();
        }

    
        %>
     
        <img src="chart1.png" />
            </center>
    </div>
                 </center>
                                </form></center>
			</div><!-- end content -->
		</section>
	</section><!-- end main -->
	     <%
                

            } catch (Exception e) {
                System.out.println(e);
            }
        %>
</body>
</html>


