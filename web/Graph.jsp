

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
<%@page import="Connection.DbConnection"%>
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

            DbConnection db = new DbConnection();
      
            if (mail.equals("admin")&&name.equals("admin")) {


    %>

	<header>
	
                
               
        <div class="box"  style="height: 762px; width: 1304px; overflow: auto;">
            <center>
<%
        String rpath=request.getRealPath("/");
      
      
        ResultSet rs=null;
        try
        {
DbConnection Db=new DbConnection();
        java.util.Date tDate = new java.util.Date();
        SimpleDateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
        SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
        String date1 = df.format(tDate).toUpperCase();
        // date2 = df1.format(tDate).toUpperCase();
        //Random randomGenerator = new Random();
        //int a=randomGenerator.nextInt(100);

        

    Connection con=Db.con;

      
        String query="select Apps_name,max(total) from comment group by Apps_name";
        System.out.println("cost.jsp Query : "+query);

        JDBCCategoryDataset dataset=new JDBCCategoryDataset(con,query);

        dataset.executeQuery(query);

   JFreeChart chart = ChartFactory.createLineChart("User Review Based Analysis","Apps_name","total",dataset,PlotOrientation.VERTICAL,true,true,true);
   
       // JFreeChart chart =ChartFactory.createLineChart("Count Analysis","Filename","FileCount",dataset,PlotOrientation.VERTICAL,true,true,true);
     
        final File file1 = new File(rpath+"chart.png");
        System.out.println(file1);
        String path=file1.getAbsolutePath();

        ChartUtilities.saveChartAsPNG(file1, chart, 1000, 500);
        
   
con.close();
        }
        catch (Exception e)
        {
        e.printStackTrace();
        }

    
        %>
        <img src="chart.png" ></img>
            </center>
    </div>

                 </table>
                 </center>
                                </form></center>
			</div><!-- end content -->
		</section>
	</section><!-- end main -->
	     <%
                } else {
                    session.setAttribute("msg", "Session out Login Please");
                    response.sendRedirect("Logout.jsp");
                }

            } catch (Exception e) {
                System.out.println(e);
            }
        %>
</body>
</html>


