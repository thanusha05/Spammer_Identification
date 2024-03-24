/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSSINESS;

import DATA.DB;
import DATA.GetInfo.MnubarDet;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.security.cert.X509Certificate;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.ServletException;
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
public class PostVisuals extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
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
            String UName = "", UMail = "", city = "", FName = "", pstURL = "", pstype = "", fileName = "", saveFile;
            String Query = "";
            String contentType = request.getContentType();
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(4012);
            ServletFileUpload upload = new ServletFileUpload(factory);
            List item = null;
            try {
                item = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            byte[] data = null;
            Iterator iter = item.iterator();
            while (iter.hasNext()) {
                FileItem itemm = (FileItem) iter.next();
                if (itemm.isFormField()) {
                    String name = itemm.getFieldName();
                    String value = itemm.getString();
                    if (name.equalsIgnoreCase("Umail")) {
                        UMail = value;
                        System.out.println("UMail is  : " + UMail);
                    } else if (name.equalsIgnoreCase("UName")) {
                        UName = value;
                        System.out.println("UName is : " + UName);
                    } else if (name.equalsIgnoreCase("CITY")) {
                        city = value;
                        System.out.println("city is : " + city);
                    } else if (name.equalsIgnoreCase("usrposts")) {
                        try {
                            data = itemm.get();
                            fileName = itemm.getName();
                            System.out.println("File anem is ...............................\t" + fileName);
                        } catch (Exception e) {
                            System.err.println("ERROR " + e);
                        }
                    } else {
                        System.out.println(name);
                    }
                } else {
                    data = itemm.get();
                    fileName = itemm.getName();
                    System.out.println("File anem is ...............................\t" + fileName);
                }
            }
            saveFile = fileName;
            System.out.println(saveFile);
            String path = request.getSession().getServletContext().getRealPath("/");
            String patt = path.replace("\\build", "");
            String np = patt + "\\POSTS\\";
            String strPath = np + saveFile;
            File ff = new File(strPath);
            System.out.println("Fikle PATH\t" + strPath);
            FileOutputStream fileOut = new FileOutputStream(ff);
            fileOut.write(data, 0, data.length);
            fileOut.flush();
            fileOut.close();
            System.out.println(saveFile);
            File image = new File(strPath);
            FileInputStream fis = new FileInputStream(image);
            if ((fileName.endsWith(".jpg")) || (fileName.endsWith(".JPG")) || (fileName.endsWith(".jpeg")) || (fileName.endsWith(".JPEG")) || (fileName.endsWith(".png")) || (fileName.endsWith(".PNG"))) {
                String ownid = mbr.postid();
                int yh = Integer.parseInt(ownid);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social", "root", "admin");
                PreparedStatement pstmnt = con.prepareStatement("insert into ptdvisuals(P_UMail,P_UName,F_Name,PostVis,P_Time,Vis_Types,City) values(?,?,?,?,?,?,?)");
                pstmnt.setString(1, UMail);
                pstmnt.setString(2, UName);
                pstmnt.setString(3, fileName);
                pstmnt.setBinaryStream(4, (InputStream) fis, (int) (image.length()));
                pstmnt.setString(5, sdte);
                pstmnt.setString(6, "Image");
                pstmnt.setString(7, city);
                int tr = pstmnt.executeUpdate();
                if (tr > 0) {
                    //PreparedStatement pstmnt1 = con.prepareStatement("insert into likes(Post_ID, L_UName, L_UMail, L_Count, L_Time) values('" + ownid + "','" + UName + "','" + UMail + "','0','" + sdte + "')");
                    //int hgf = pstmnt1.executeUpdate();
                    session.setAttribute("fbmsg", "Your Image SuccessFully Posted");
                    response.sendRedirect("UsrHome.jsp");
                } else {
                    session.setAttribute("fbmsg", "ERROR TRY AGAIN");
                    response.sendRedirect("UsrHome.jsp");
                }
            } else {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social", "root", "admin");
                PreparedStatement pstmnt = con.prepareStatement("insert into ptdvisuals(P_UMail,P_UName,F_Name,PostVis,P_Time,Vis_Types,City) values(?,?,?,?,?,?,?)");
                pstmnt.setString(1, UMail);
                pstmnt.setString(2, UName);
                pstmnt.setString(3, fileName);
                pstmnt.setBinaryStream(4, (InputStream) fis, (int) (image.length()));
                pstmnt.setString(5, sdte);
                pstmnt.setString(6, "Video");
                pstmnt.setString(7, city);
                int tr = pstmnt.executeUpdate();
                if (tr > 0) {
                    String ownid = mbr.postid();
                    //PreparedStatement pstmnt1 = con.prepareStatement("insert into likes(Post_ID, L_UName, L_UMail, L_Count, L_Time) values('" + ownid + "','" + UName + "','" + UMail + "','0','" + sdte + "')");
                    //int hgf = pstmnt1.executeUpdate();
                    session.setAttribute("fbmsg", "Your Video SuccessFully Posted");
                    response.sendRedirect("UsrHome.jsp");
                } else {
                    session.setAttribute("fbmsg", "ERROR TRY AGAIN");
                    response.sendRedirect("UsrHome.jsp");
                }
            }
        } catch (Exception e) {
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PostVisuals.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PostVisuals.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PostVisuals.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PostVisuals.class.getName()).log(Level.SEVERE, null, ex);
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
