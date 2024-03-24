/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSSINESS.MAILSEND;

import DATA.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alaguraj
 */
public class mail extends HttpServlet {

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
    public String userName;

    public synchronized boolean sendMail(String userName, String passWord, String host, String port, String starttls, String auth, boolean debug, String socketFactoryClass, String fallback, String[] cc, String subject, String text) {
        this.userName = userName;


        Properties props = new Properties();

        //Properties props=System.getProperties();

        props.put("mail.smtp.user", userName);

        props.put("mail.smtp.host", host);

        if (!"".equals(port)) {
            props.put("mail.smtp.port", port);
        }

        if (!"".equals(starttls)) {
            props.put("mail.smtp.starttls.enable", starttls);
        }

        props.put("mail.smtp.auth", auth);

        if (debug) {

            props.put("mail.smtp.debug", "true");

        } else {
            props.put("mail.smtp.debug", "false");

        }

        if (!"".equals(port)) {
            props.put("mail.smtp.socketFactory.port", port);
        }

        if (!"".equals(socketFactoryClass)) {
            props.put("mail.smtp.socketFactory.class", socketFactoryClass);
        }

        if (!"".equals(fallback)) {
            props.put("mail.smtp.socketFactory.fallback", fallback);
        }



        try {

            Session session = Session.getDefaultInstance(props, null);

            session.setDebug(debug);

            MimeMessage msg = new MimeMessage(session);

            msg.setText(text);

            msg.setSubject(subject);

            msg.setFrom(new InternetAddress(userName));

            for (int i = 0; i < cc.length; i++) {

                msg.addRecipient(Message.RecipientType.CC, new InternetAddress(cc[i]));
                System.out.println("MAIL CONTENT FOR " + cc[i] + " is \t" + text);

            }
            msg.saveChanges();

            Transport transport = session.getTransport("smtp");

            transport.connect(host, userName, passWord);

            transport.sendMessage(msg, msg.getAllRecipients());

            transport.close();

            return true;

        } catch (Exception mex) {


            mex.printStackTrace();

            return false;

        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String TOMID = request.getParameter("MID");
        String FNAME = request.getParameter("FNAME");
        String EXDATE = request.getParameter("EXPDATE");
        String usrid = "diwa.2801@gmail.com";
        String passwd = "furgqbokcooqfjkf";
        try {
            String[] cc = new String[2];
            String typs = "Dear " + FNAME + "\n Your Account Will Be Expire On " + EXDATE + ".To MainTain Correctly Then Renew By Login Your Account ";
            int cnt = 0;
            DB Db = new DB();
            cc[0] = TOMID;
            sendMail(usrid, passwd, "smtp.gmail.com", "465", "true", "true", true, "javax.net.ssl.SSLSocketFactory", "false", cc, "mail", typs);
            int sd = new DB().Update("update users set M_SND='Yes' where Mail_ID='" + TOMID + "'");
            session.setAttribute("fbmsg", "Expiry Notification To  " + FNAME + " Has Been Sent Successfully");
            response.sendRedirect("ADFindEndUsr.jsp");
        } catch (Exception e) {
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
