

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

    // java.util.Date tDate = new java.util.Date();
       ////// SimpleDateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
       // SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
       // String date1 = df.format(tDate).toUpperCase();
        // date2 = df1.format(tDate).toUpperCase();
        //Random randomGenerator = new Random();
        //int a=randomGenerator.nextInt(100);

        
    //    DB Db=new DB();
    
//Id, L_UName, L_UINDate, L_UINTime, L_UOUTTime, L_TOUTDate, Acc_ExpryDate, diff
      
        String query="select L_UINTime, diff from logdet where L_UName='"+uname+"' and diff is not null ";
        System.out.println("cost.jsp Query : "+query);

        JDBCCategoryDataset dataset=new JDBCCategoryDataset(con,query);

        dataset.executeQuery(query);

   JFreeChart chart = ChartFactory.createLineChart("User Login Based Analysis","L_UINTime","diff",dataset,PlotOrientation.VERTICAL,true,true,true);
   
       // JFreeChart chart =ChartFactory.createLineChart("Count Analysis","Filename","FileCount",dataset,PlotOrientation.VERTICAL,true,true,true);
     File existingFile = new File(rpath+"chart1.png");

if (existingFile.exists() || existingFile.isFile()) {
    existingFile.delete();
  }
       File file1 = new File(rpath+"chart1.png");
        
        if (file1.exists()) 
        {
             file1.delete(); //you might want to check if delete was successfull
        } 
file1.createNewFile();
        
        System.out.println(file1);
        String path=file1.getAbsolutePath();

        ChartUtilities.saveChartAsPNG(file1, chart, 1000, 500);
        %>
        <img src="chart1.png" />
        <%
        
   
con.close();
        }
        catch (Exception e)
        {
        e.printStackTrace();
        }

    
        %>
     
        
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


