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
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
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
public class EventADD extends HttpServlet {

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
            throws ServletException, IOException {
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
            String UName = "", UMail = "", ename = "", eplace = "", lat = "", City = "", FName = "", fileName = "", saveFile = "", Etm = "";
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
                    } else if (name.equalsIgnoreCase("latilan")) {
                        lat = value;
                        System.out.println("lat is : " + lat);
                    } else if (name.equalsIgnoreCase("city")) {
                        City = value;
                        System.out.println("City is : " + City);
                    } else if (name.equalsIgnoreCase("entName")) {
                        ename = value;
                        System.out.println("ename is  : " + ename);
                    } else if (name.equalsIgnoreCase("entDateTime")) {
                        Etm = value;
                        System.out.println("Etm is  : " + Etm);
                    } else if (name.equalsIgnoreCase("evntposts")) {
                        data = itemm.get();
                        fileName = itemm.getName();
                        System.out.println("File anem is ...............................\t" + fileName);
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
            String np = patt + "\\EVENT\\";
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
            if ((fileName.endsWith(".jpg")) || (fileName.endsWith(".jpeg")) || (fileName.endsWith(".png"))) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social", "root", "admin");
                PreparedStatement pstmnt = con.prepareStatement("insert into event(Evnt_Name,Venue,Lat_Longtude,Evnt_Time,E_AUser,E_AUMail,E_FleName,E_Pict,City) values(?,?,?,?,?,?,?,?,?)");
                pstmnt.setString(1, ename);
                pstmnt.setString(2, City);
                pstmnt.setString(3, lat);
                pstmnt.setString(4, Etm);
                pstmnt.setString(5, UName);
                pstmnt.setString(6, UMail);
                pstmnt.setString(7, fileName);
                pstmnt.setBinaryStream(8, (InputStream) fis, (int) (image.length()));
                pstmnt.setString(9, City);
                int tr = pstmnt.executeUpdate();
                if (tr > 0) {
                    //String ownid = mbr.postid();
                    //PreparedStatement pstmnt1 = con.prepareStatement("insert into likes(Post_ID, L_UName, L_UMail, L_Count, L_Time) values('" + ownid + "','" + UName + "','" + UMail + "','0','" + sdte + "')");
                    //int hgf = pstmnt1.executeUpdate();
                    session.setAttribute("fbmsg", "Your Image SuccessFully Posted");
                    response.sendRedirect("UCirEvents.jsp");
                } else {
                    session.setAttribute("fbmsg", "ERROR TRY AGAIN");
                    response.sendRedirect("UCirEvents.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
