/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSSINESS;

import DATA.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.java2d.pipe.SpanShapeRenderer;

/**
 *
 * @author alaguraj
 */
public class UsrLogCheck extends HttpServlet {

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
        SimpleDateFormat yt1 = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dt = new java.util.Date();
        String ste = yt.format(dt);
        String sdte1 = yt1.format(dt);
        String msg = "";
        DB gf = new DB();
        DB gf1 = new DB();
        try {
            String uname = request.getParameter("username");
            String upass = request.getParameter("password");
            
            ResultSet rs3=gf.Select("select count(*) from spam where subject= '"+uname+"' ");
                        if(rs3.next())
                        {
                            int count=rs3.getInt(1);
                            if(count>=10)
                            {
                                session.setAttribute("fbmsg", "You are blocked");
                                response.sendRedirect("UsrLogin.jsp");
                            }
                            else
                            {
                        
                        
            if ((uname.equalsIgnoreCase("fbadmin@gmail.com"))||(uname.contains("admin"))) {
                ResultSet rs1 = gf1.Select("select * from admindet where Mail_ID='" + uname + "' and Password='" + upass + "'");
                if (rs1.next()) {
                    if ((uname.equals(rs1.getString("Mail_ID"))) && (upass.equals(rs1.getString("Password")))) {
                        int lgin = gf.Insert("insert into logdet(L_UName,L_UINDate,L_UINTime) value('" + uname + "','" + sdte1 + "','" + ste + "')");
                        System.out.println("Normal User");
                        session.setAttribute("ADINTIME", ste);
                        session.setAttribute("ADUNAME", uname);
                        session.setAttribute("ADUPASS", upass);
                        session.setAttribute("fbmsg", "You are Loggedin Successfully...");
                        response.sendRedirect("ADMNHome.jsp");
                    } else {
                        session.setAttribute("fbmsg", "Wrong Format Of Username And Password!!!...");
                        response.sendRedirect("UsrLogin.jsp");
                    }
                } else {
                    session.setAttribute("fbmsg", "Invalid Username and Password!!!...");
                    response.sendRedirect("UsrLogin.jsp");
                }

            } else {
                ResultSet rs = gf.Select("select * from users where Mail_ID='" + uname + "' and Password='" + upass + "'");
                System.out.println("select * from users where Mail_ID='" + uname + "' and Password='" + upass + "'");
                if (rs.next()) {
                    if ((uname.equals(rs.getString("Mail_ID"))) && (upass.equals(rs.getString("Password")))) {
                        
                        
                        if ((rs.getString("TYPE")).equals("Normal_User")) {                            
                            int lgin = gf.Insert("insert into logdet(L_UName,L_UINDate,L_UINTime) value('" + uname + "','" + sdte1 + "','" + ste + "')");
                            System.out.println("Normal User");
                            session.setAttribute("UINTIME", ste);
                            session.setAttribute("ULOCATION", rs.getString("City"));
                            session.setAttribute("UNAME", uname);
                            
                            session.setAttribute("UPASS", upass);
//                            Calendar cal=Calendar.getInstance();
//                            Date date=cal.getTime();
//                            DateFormat dateformat=new SimpleDateFormat("HH:mm:ss");
//                            String formateddate=dateformat.format(date);
//                            System.out.println("insert into log_details (userid,login) values('"+uname+"','"+formateddate+"')");
//                            gf.Insert("insert into log_details (userid,login) values('"+uname+"','"+formateddate+"')");
                            
                            session.setAttribute("fbmsg", "You are Loggedin Successfully...");
                            response.sendRedirect("UsrHome.jsp");
                        } else if ((rs.getString("TYPE")).equals("Product_Distributor")) {
                            System.out.println("Product User");
                            int lgin = gf.Insert("insert into logdet(L_UName,L_UINDate,L_UINTime) value('" + uname + "','" + sdte1 + "','" + ste + "')");
                            session.setAttribute("PINTIME", ste);
                            session.setAttribute("PLOCATION", rs.getString("City"));
                            session.setAttribute("PNAME", uname);
                            session.setAttribute("PPASS", upass);
                            session.setAttribute("fbmsg", "You are Loggedin Successfully...");
                            response.sendRedirect("POnrHome.jsp");
                        }
                    } else {
                        session.setAttribute("fbmsg", "Invalid Username and Password!!!...");
                        response.sendRedirect("UsrLogin.jsp");
                    }
                } else {
                    session.setAttribute("fbmsg", "Invalid Username and Password!!!...");
                    response.sendRedirect("UsrLogin.jsp");
                }
            }
        } 
        
        }else
                        {
                        
                                       
            if ((uname.equalsIgnoreCase("fbadmin@gmail.com"))||(uname.contains("admin"))) {
                ResultSet rs1 = gf1.Select("select * from admindet where Mail_ID='" + uname + "' and Password='" + upass + "'");
                if (rs1.next()) {
                    if ((uname.equals(rs1.getString("Mail_ID"))) && (upass.equals(rs1.getString("Password")))) {
                        int lgin = gf.Insert("insert into logdet(L_UName,L_UINDate,L_UINTime) value('" + uname + "','" + sdte1 + "','" + ste + "')");
                        System.out.println("Normal User");
                        session.setAttribute("ADINTIME", ste);
                        session.setAttribute("ADUNAME", uname);
                        session.setAttribute("ADUPASS", upass);
                        session.setAttribute("fbmsg", "You are Loggedin Successfully...");
                        response.sendRedirect("ADMNHome.jsp");
                    } else {
                        session.setAttribute("fbmsg", "Wrong Format Of Username And Password!!!...");
                        response.sendRedirect("UsrLogin.jsp");
                    }
                } else {
                    session.setAttribute("fbmsg", "Invalid Username and Password!!!...");
                    response.sendRedirect("UsrLogin.jsp");
                }

            } else {
                ResultSet rs = gf.Select("select * from users where Mail_ID='" + uname + "' and Password='" + upass + "'");
                System.out.println("select * from users where Mail_ID='" + uname + "' and Password='" + upass + "'");
                if (rs.next()) {
                    if ((uname.equals(rs.getString("Mail_ID"))) && (upass.equals(rs.getString("Password")))) {
                        
                        
                        if ((rs.getString("TYPE")).equals("Normal_User")) {                            
                            int lgin = gf.Insert("insert into logdet(L_UName,L_UINDate,L_UINTime) value('" + uname + "','" + sdte1 + "','" + ste + "')");
                            System.out.println("Normal User");
                            session.setAttribute("UINTIME", ste);
                            session.setAttribute("ULOCATION", rs.getString("City"));
                            session.setAttribute("UNAME", uname);
                            
                            session.setAttribute("UPASS", upass);
//                            Calendar cal=Calendar.getInstance();
//                            Date date=cal.getTime();
//                            DateFormat dateformat=new SimpleDateFormat("HH:mm:ss");
//                            String formateddate=dateformat.format(date);
//                            System.out.println("insert into log_details (userid,login) values('"+uname+"','"+formateddate+"')");
//                            gf.Insert("insert into log_details (userid,login) values('"+uname+"','"+formateddate+"')");
                            
                            session.setAttribute("fbmsg", "You are Loggedin Successfully...");
                            response.sendRedirect("UsrHome.jsp");
                        } else if ((rs.getString("TYPE")).equals("Product_Distributor")) {
                            System.out.println("Product User");
                            int lgin = gf.Insert("insert into logdet(L_UName,L_UINDate,L_UINTime) value('" + uname + "','" + sdte1 + "','" + ste + "')");
                            session.setAttribute("PINTIME", ste);
                            session.setAttribute("PLOCATION", rs.getString("City"));
                            session.setAttribute("PNAME", uname);
                            session.setAttribute("PPASS", upass);
                            session.setAttribute("fbmsg", "You are Loggedin Successfully...");
                            response.sendRedirect("POnrHome.jsp");
                        }
                    } else {
                        session.setAttribute("fbmsg", "Invalid Username and Password!!!...");
                        response.sendRedirect("UsrLogin.jsp");
                    }
                } else {
                    session.setAttribute("fbmsg", "Invalid Username and Password!!!...");
                    response.sendRedirect("UsrLogin.jsp");
                }
            }
                        
                        }
        
        
        
        }
        finally {
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
            Logger.getLogger(UsrLogCheck.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UsrLogCheck.class.getName()).log(Level.SEVERE, null, ex);
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
