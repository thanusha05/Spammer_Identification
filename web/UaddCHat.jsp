
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DATA.GetInfo.cmdlikedet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DATA.GetInfo.MnubarDet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DATA.DB"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%
    String cntnt = request.getParameter("usermsg");
    String fuser = request.getParameter("FUser");
    String tuser = request.getParameter("TUser");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd h:mm:ss");
    java.util.Date de = new java.util.Date();
    String sdte = sdf.format(de);
    DB hb = new DB();
    MnubarDet bgr = new MnubarDet();
    String funame = bgr.username(fuser);
    String tuname = bgr.username(tuser);
   boolean mail=false;
        int count=0;
        String spam="";
          String qry="SELECT * FROM word WHERE MATCH (word)AGAINST ('"+cntnt+"'  IN BOOLEAN MODE)";
       DB Db = new DB();
               ResultSet  rs1 = Db.Select(qry);
               if(rs1.next()){
                    ++count;
                     if(count==0)
                   spam=rs1.getString("word");
                    else if(count>0) 
                        spam=spam+","+rs1.getString("word") ;
                   mail=true;
                  
               }
        if(mail)
                {
                    //System.out.println("Spam Comment");
                    
                           DB Db1 = new DB();
Connection con=Db1.con;
PreparedStatement st=null;
        st =con.prepareStatement("insert into spam values (?,?,?,?,?,?,?,?,?,?,?,?)");
java.util.Date d = new java.util.Date();
java.sql.Timestamp t = new java.sql.Timestamp( d.getTime());

st.setString(1,"Friends");
st.setString(2, cntnt);
st.setBinaryStream(6, null);
st.setString(3, fuser);
st.setString(4, funame);
st.setTimestamp(5,  t);
st.setInt(7, 0);
  String command = "ipconfig /all";
       Process p = Runtime.getRuntime().exec(command);
 
       BufferedReader inn = new BufferedReader(new InputStreamReader(p.getInputStream()));
       Pattern pattern = Pattern.compile(".*Physical Addres.*: (.*)");
 
       while (true) {
            String line = inn.readLine();
 
	    if (line == null)
          break;
 
	    Matcher mm = pattern.matcher(line);
	    if (mm.matches()) {
                st.setString(8, mm.group(1));
	        System.out.println(mm.group(1));
                break;
	    }
	}

st.setString(9, cntnt);
st.setString(10, "encrypt");
st.setString(11, "ft");
st.setString(12, "");
int i =st.executeUpdate();
                    session.setAttribute("fbmsg", "Spam Comment");
            response.sendRedirect("UviewMessages.jsp?TOUSR=" + tuser);
                }
                else
                {
    System.out.println("insert into chat(F_UName,T_UName,MESSAGE,S_Time,F_UMail,T_UMail) values('" + funame + "','" + tuname + "','" + cntnt + "','" + sdte + "','" + fuser + "','" + tuser + "')");
    int ity = hb.Insert("insert into chat(F_UName,T_UName,MESSAGE,S_Time,F_UMail,T_UMail) values('" + funame + "','" + tuname + "','" + cntnt + "','" + sdte + "','" + fuser + "','" + tuser + "')");
    if (ity > 0) {
        out.println("Success Comment");
        response.sendRedirect("UviewMessages.jsp?TOUSR=" + tuser);
    } else {
        out.println("ERROR Comment");
        response.sendRedirect("UviewMessages.jsp?TOUSR=" + tuser);
    }
                }
%>
