/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import DATA.DB;
import DATA.GetInfo.MnubarDet;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author alaguraj
 */
@WebServlet(urlPatterns = {"/Poststs"})
public class Poststs extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        try {
            MnubarDet mbr = new MnubarDet();
            DB fb = new DB();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd h:mm:ss");
            java.util.Date de = new java.util.Date();
            String sdte = sdf.format(de);
            int price = 0;
            String UName = "", UMail = "", city = "", FName = "", pstURL = "", pstype = "", fileName = "", saveFile = null;
            String Query = "";
            String post="";
            //Umail1 UName1 CITY1 posturl1
            UMail=request.getParameter("Umail1");
            UName=request.getParameter("UName1");
            city=request.getParameter("CITY1");
           post=request.getParameter("posturl1");
            int count=-1; String spam=""; boolean mail=true;
          
            try{
       String qry="SELECT * FROM word WHERE MATCH (word)AGAINST ('"+post+"'  IN BOOLEAN MODE)";
       DB Db = new DB();
               ResultSet  rs1 = Db.Select(qry);
               if(rs1.next()){
                    ++count;
                     if(count==0)
                   spam=rs1.getString("word");
                    else if(count>0) 
                        spam=spam+","+rs1.getString("word") ;
                   mail=false;
                  
               }rs1.close();

       }
        catch (Exception e) {
           System.out.println(e);
          }
            
            if(mail==true) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social", "root", "admin");
                PreparedStatement pstmnt = con.prepareStatement("insert into ptdvisuals(P_UMail,P_UName,F_Name,PostVis,P_Time,Vis_Types,City) values(?,?,?,?,?,?,?)");
                pstmnt.setString(1, UMail);
                pstmnt.setString(2, UName);
                pstmnt.setString(3, fileName);
                pstmnt.setBytes(4, post.getBytes()); 
                pstmnt.setString(5, sdte);
                pstmnt.setString(6, "status");
                pstmnt.setString(7, city);
                int tr = pstmnt.executeUpdate();
                if (tr > 0) {
                    String ownid = mbr.postid();
                    //PreparedStatement pstmnt1 = con.prepareStatement("insert into likes(Post_ID, L_UName, L_UMail, L_Count, L_Time) values('" + ownid + "','" + UName + "','" + UMail + "','0','" + sdte + "')");
                    //int hgf = pstmnt1.executeUpdate();
                    session.setAttribute("fbmsg", "Your Status SuccessFully Posted");
                    response.sendRedirect("UsrHome.jsp");
                } else {
                    session.setAttribute("fbmsg", "ERROR TRY AGAIN");
                    response.sendRedirect("UsrHome.jsp");
                }
            }
            
        else if(mail==false){
try{
DB Db = new DB();
Connection con=Db.con;
PreparedStatement st=null;
        st =con.prepareStatement("insert into spam values (?,?,?,?,?,?,?,?,?,?,?,?)");
java.util.Date d = new java.util.Date();
java.sql.Timestamp t = new java.sql.Timestamp( d.getTime());

st.setString(1,"Friends");
st.setString(2, post);
st.setBinaryStream(6, null);
st.setString(3, UMail);
st.setString(4, UName);
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

st.setString(9, spam);
st.setString(10, "encrypt");
st.setString(11, "ft");
st.setString(12, saveFile);
int i =st.executeUpdate();
st.close();
      if(i==1)
      {
                response.sendRedirect("UsrHome.jsp");
                session.setAttribute("fbmsg", "You Can't Update Status.Because Its a Spam.Check Your Report");
                session.setAttribute("color", "red"); 
      }
      else
              {
                    response.sendRedirect("UsrHome.jsp");
                    session.setAttribute("fbmsg", "You Can't update status Because it's blocked and Your Message is Spam");
                    session.setAttribute("color", "red"); 
              }
}
catch(Exception e)
        {
   e.printStackTrace();
            }
          }
          
          
        }
         catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Poststs.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Poststs.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
