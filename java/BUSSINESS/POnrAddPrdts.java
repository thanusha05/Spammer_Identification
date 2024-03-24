/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSSINESS;

import DATA.DB;
import DATA.GetInfo.MnubarDet;
import DATA.GetInfo.POnrAddPdts;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
public class POnrAddPrdts extends HttpServlet {

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
            POnrAddPdts pad = new POnrAddPdts();
            DB fb = new DB();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd h:mm:ss");
            java.util.Date de = new java.util.Date();
            String sdte = sdf.format(de);
            int price = 0;
            String UName = "", UMail = "", FName = "", fileName = "", saveFile;
            String Query = "", shname = "", shid = "", pname = "", pprice = "", pdesc = "", city = "", pdid = "";
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
                    } else if (name.equalsIgnoreCase("shpname")) {
                        shname = value;
                        System.out.println("shname is : " + shname);
                    } else if (name.equalsIgnoreCase("shid")) {
                        shid = value;
                        System.out.println("shid is : " + shid);
                    } else if (name.equalsIgnoreCase("city")) {
                        city = value;
                        System.out.println("city is : " + city);
                    } else if (name.equalsIgnoreCase("pppid")) {
                        pdid = value;
                        System.out.println("pdid is : " + pdid);
                    } else if (name.equalsIgnoreCase("PName")) {
                        pname = value;
                        System.out.println("pname is : " + pname);
                    } else if (name.equalsIgnoreCase("PRice")) {
                        pprice = value;
                        System.out.println("pprice is : " + pprice);
                    } else if (name.equalsIgnoreCase("descrip")) {
                        pdesc = value;
                        System.out.println("pdesc is : " + pdesc);
                    } else if (name.equalsIgnoreCase("adpdts")) {
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
            if ((fileName.endsWith(".jpg")) || (fileName.endsWith(".JPG")) || (fileName.endsWith(".jpeg")) || (fileName.endsWith(".JPEG")) || (fileName.endsWith(".png")) || (fileName.endsWith(".PNG")) || (fileName.endsWith(".gif"))) {
                String path = request.getSession().getServletContext().getRealPath("/");
                String patt = path.replace("\\build", "");
                String np = patt + "\\POSTS\\";
                String strPath = np + saveFile;
                File ff = new File(strPath);
                System.out.println("File PATH\t" + strPath);
                FileOutputStream fileOut = new FileOutputStream(ff);
                fileOut.write(data, 0, data.length);
                fileOut.flush();
                fileOut.close();
                System.out.println(saveFile);
                File image = new File(strPath);
                FileInputStream fis = new FileInputStream(image);
                String ownid = pad.produtpstid();
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social", "root", "admin");
                PreparedStatement pstmnt = con.prepareStatement("insert into products(P_Name,P_Price,P_Description,PA_Time,U_MailID,U_Name,P_FlName,P_PIcture,P_AvbleShop,P_AShopID,Pst_ID) values(?,?,?,?,?,?,?,?,?,?,?)");
                pstmnt.setString(1, pname);
                pstmnt.setString(2, pprice);
                pstmnt.setString(3, pdesc);
                pstmnt.setString(4, sdte);
                pstmnt.setString(5, UMail);
                pstmnt.setString(6, UName);
                pstmnt.setString(7, fileName);
                pstmnt.setBinaryStream(8, (InputStream) fis, (int) (image.length()));
                pstmnt.setString(9, shname);
                pstmnt.setString(10, shid);
                pstmnt.setString(11, ownid);
                int tr = pstmnt.executeUpdate();
                if (tr > 0) {
                    PreparedStatement pstmnt1 = con.prepareStatement("insert into ptdvisuals(P_UMail,P_UName,F_Name,PostVis,P_Time,Vis_Types,City,Pdt_ID) values(?,?,?,?,?,?,?,?)");
                    pstmnt1.setString(1, UMail);
                    pstmnt1.setString(2, UName);
                    pstmnt1.setString(3, fileName);
                    pstmnt1.setBinaryStream(4, (InputStream) fis, (int) (image.length()));
                    pstmnt1.setString(5, sdte);
                    pstmnt1.setString(6, "Product");
                    pstmnt1.setString(7, city);
                    pstmnt1.setString(8, pdid);
                    int tr1 = pstmnt1.executeUpdate();
                    if (tr1 > 0) {
                        session.setAttribute("fbmsg", "Your Product SuccessFully Added");
                        response.sendRedirect("POnrHome.jsp");
                    } else {
                        session.setAttribute("fbmsg", "Error!!!...");
                        response.sendRedirect("POnrHome.jsp");
                    }
                } else {
                    session.setAttribute("fbmsg", "ERROR TRY AGAIN");
                    response.sendRedirect("POnrHome.jsp");
                }
            }
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
            Logger.getLogger(POnrAddPrdts.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(POnrAddPrdts.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(POnrAddPrdts.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(POnrAddPrdts.class.getName()).log(Level.SEVERE, null, ex);
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
