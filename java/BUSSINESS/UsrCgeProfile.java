/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSSINESS;

import DATA.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alaguraj
 */
public class UsrCgeProfile extends HttpServlet {

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
        SimpleDateFormat yt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        java.util.Date dt = new java.util.Date();
        String ste = yt.format(dt);
        String msg = "";
        DB gf = new DB();
        try {
            String umail = request.getParameter("umail23");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String DOB = request.getParameter("udob");
            String Adds = request.getParameter("uadds");
            String city = request.getParameter("uacity");
            System.out.println("update users set F_Name='" + fname + "',L_Name='" + lname + "',DOB='" + DOB + "',City='" + city + "',Address='" + Adds + "' where Mail_ID='" + umail + "'");
            int up = gf.Update("update users set F_Name='" + fname + "',L_Name='" + lname + "',DOB='" + DOB + "',City='" + city + "',Address='" + Adds + "' where Mail_ID='" + umail + "'");
            if (up > 0) {
                session.setAttribute("fbmsg", "Profile Datas Modified SuccessFully");
                session.removeAttribute("ULOCATION");
                session.setAttribute("ULOCATION", city);
                response.sendRedirect("UProfile.jsp");
            } else {
                session.setAttribute("fbmsg", "ERROR TRY AGAIN");
                response.sendRedirect("UsrBasicInfo.jsp");
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
