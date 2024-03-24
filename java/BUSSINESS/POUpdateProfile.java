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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class POUpdateProfile extends HttpServlet {

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
        SimpleDateFormat yt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        java.util.Date dt = new java.util.Date();
        String ste = yt.format(dt);
        String msg = "";
        DB gf = new DB();
        try {
            String umail = "", fname = "", lname = "", DOB = "", Adds = "", city = "", sname = "", splace = "", fileName = "", saveFile = "";
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
                    if (name.equalsIgnoreCase("umail23")) {
                        umail = value;
                        System.out.println("umail is  : " + umail);
                    } else if (name.equalsIgnoreCase("fname")) {
                        fname = value;
                        System.out.println("fname is : " + fname);
                    } else if (name.equalsIgnoreCase("lname")) {
                        lname = value;
                        System.out.println("lname is : " + lname);
                    } else if (name.equalsIgnoreCase("dteobth")) {
                        DOB = value;
                        System.out.println("DOB is  : " + DOB);
                    } else if (name.equalsIgnoreCase("uadds")) {
                        Adds = value;
                        System.out.println("Adds is : " + Adds);
                    } else if (name.equalsIgnoreCase("uacity")) {
                        city = value;
                        System.out.println("city is : " + city);
                    } else if (name.equalsIgnoreCase("ushname")) {
                        sname = value;
                        System.out.println("sname is : " + sname);
                    } else if (name.equalsIgnoreCase("ushplce")) {
                        splace = value;
                        System.out.println("splace is : " + splace);
                    } else if (name.equalsIgnoreCase("shpic")) {
                        data = itemm.get();
                        fileName = itemm.getName();
                    } else {
                        System.out.println(name);
                    }
                } else {
                    data = itemm.get();
                    fileName = itemm.getName();
                    System.out.println("File name is ...............................\t" + fileName);
                }
            }
            DB fb = new DB();
            MnubarDet mb = new MnubarDet();
            String usrname = mb.username(umail);
            String uuid = mb.userID(umail);
            saveFile = fileName;
            String path = request.getSession().getServletContext().getRealPath("/");
            String patt = path.replace("\\build", "");
            String np = patt + "\\SHOP\\";
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
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social", "root", "admin");
            PreparedStatement pstmnt = con.prepareStatement("insert into storedetls(SH_Name,SH_CPlace,SH_LFlName,SH_Picture,SH_RUname,SH_RUMail,Usr_ID) values(?,?,?,?,?,?,?)");
            pstmnt.setString(1, sname);
            pstmnt.setString(2, splace);
            pstmnt.setString(3, fileName);
            pstmnt.setBinaryStream(4, (InputStream) fis, (int) (image.length()));
            pstmnt.setString(5, usrname);
            pstmnt.setString(6, umail);
            pstmnt.setString(7, uuid);
            int tr = pstmnt.executeUpdate();
            if (tr > 0) {
                session.removeAttribute("ULOCATION");
                session.setAttribute("ULOCATION", city);
                int up = gf.Update("update users set F_Name='" + fname + "',L_Name='" + lname + "',DOB='" + DOB + "',City='" + city + "',Address='" + Adds + "' where Mail_ID='" + umail + "'");
                session.setAttribute("fbmsg", "Registered SuccessFully");
                response.sendRedirect("POWProfile.jsp");
            } else {
                session.setAttribute("fbmsg", "ERROR TRY AGAIN");
                response.sendRedirect("POBasicInfo.jsp");
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
        } catch (SQLException ex) {
            Logger.getLogger(POUpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(POUpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
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
