/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSSINESS;

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
public class SHProPicUpdate extends HttpServlet {

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
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd h:mm:ss");
            java.util.Date de = new java.util.Date();
            String sdte = sdf.format(de);
            int price = 0;
            String usrmail = "", saveFile = "", fileName = "";
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
                    if (name.equalsIgnoreCase("unames")) {
                        usrmail = value;
                        System.out.println("usrmail is  : " + usrmail);
                    } else if (name.equalsIgnoreCase("nshppic")) {
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
            System.out.println(saveFile);
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
            System.out.println("update storedetls set P_PIcture=?,PF_Name=? where Mail_ID='" + usrmail + "'");
            PreparedStatement pstmnt = con.prepareStatement("update storedetls set SH_Picture=?,SH_LFlName=? where SH_RUMail='" + usrmail + "'");
            pstmnt.setBinaryStream(1, (InputStream) fis, (int) (image.length()));
            pstmnt.setString(2, fileName);
            int tr = pstmnt.executeUpdate();
            //DB fr = new DB();
            //int tr = fr.Update("update users set P_PIcture='" + fis + "',PF_Name=? where Mail_ID='" + usrmail + "'");
            if (tr > 0) {
                session.setAttribute("fbmsg", "Profile Picture Changed successfully");
                System.out.println("Profile Picture Changed successfully");
                response.sendRedirect("POWProfile.jsp");
            } 
        } catch (Exception e) {
            out.println(e); 
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
