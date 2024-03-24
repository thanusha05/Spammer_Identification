/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSSINESS;

import DATA.DB;
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
public class Register extends HttpServlet {

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
            String usrcat = "", fname = "", lname = "", mail = "", gdnr = "", dob = "", passwd = "", saveFile = "", fileName = "", cntry = "", state = "", city = "", addrss = "", latilang = "";
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
                    if (name.equalsIgnoreCase("UType")) {
                        usrcat = value;
                        System.out.println("usrcat is  : " + usrcat);
                    } else if (name.equalsIgnoreCase("fname")) {
                        fname = value;
                        System.out.println("fname is : " + fname);
                    } else if (name.equalsIgnoreCase("lname")) {
                        lname = value;
                        System.out.println("lname is : " + lname);
                    } else if (name.equalsIgnoreCase("Gndr")) {
                        gdnr = value;
                        System.out.println("gdnr is : " + gdnr);
                    } else if (name.equalsIgnoreCase("emailid")) {
                        mail = value;
                        System.out.println("mail is : " + mail);
                    } else if (name.equalsIgnoreCase("dteobth")) {
                        dob = value;
                        System.out.println("dob is  : " + dob);
                    } else if (name.equalsIgnoreCase("password")) {
                        passwd = value;
                        System.out.println("passwd is : " + passwd);
                    } else if (name.equalsIgnoreCase("ppic")) {
                        data = itemm.get();
                        fileName = itemm.getName();
                    } else if (name.equalsIgnoreCase("country")) {
                        cntry = value;
                        System.out.println("cntry is  : " + cntry);
                    } else if (name.equalsIgnoreCase("state")) {
                        state = value;
                        System.out.println("state is  : " + state);
                    } else if (name.equalsIgnoreCase("city")) {
                        city = value;
                        System.out.println("city is : " + city);
                    } else if (name.equalsIgnoreCase("adds")) {
                        addrss = value;
                        System.out.println("addrss is : " + addrss);
                    } else if (name.equalsIgnoreCase("latillang")) {
                        latilang = value;
                        System.out.println("latilang is : " + latilang);
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
            ResultSet rs = fb.Select("select * from users where Mail_ID='" + mail + "'");
            if (rs.next()) {
                session.setAttribute("fbmsg", "Mail ID Alreday Presented Please Try Again With Another Mail ID");
                response.sendRedirect("Register.jsp");
            } else {
                System.out.println(saveFile);
                saveFile = fileName;
                String path = request.getSession().getServletContext().getRealPath("/");
                String patt = path.replace("\\build", "");
                String np = patt + "\\AllUsers\\";
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
                PreparedStatement pstmnt = con.prepareStatement("insert into users(TYPE, F_Name, L_Name, Mail_ID, DOB, P_PIcture, PF_Name, Country, State, City, Address, Lat_Longtude, R_Time,Password,Gender) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                pstmnt.setString(1, usrcat);
                pstmnt.setString(2, fname);
                pstmnt.setString(3, lname);
                pstmnt.setString(4, mail);
                pstmnt.setString(5, dob);
                pstmnt.setBinaryStream(6, (InputStream) fis, (int) (image.length()));
                pstmnt.setString(7, fileName);
                pstmnt.setString(8, cntry);
                pstmnt.setString(9, state);
                pstmnt.setString(10, city);
                pstmnt.setString(11, addrss);
                pstmnt.setString(12, latilang);
                pstmnt.setString(13, sdte);
                pstmnt.setString(14, passwd);
                pstmnt.setString(15, gdnr);
                int tr = pstmnt.executeUpdate();
                if (tr > 0) {
                    session.setAttribute("fbmsg", "Registered SuccessFully");
                    response.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("message", "ERROR TRY AGAIN");
                    response.sendRedirect("Register.jsp");
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
