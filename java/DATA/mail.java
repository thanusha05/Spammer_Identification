/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
/**
 * A utility class for sending e-mail messages
 * @author www.codejava.net
 *
 */
public class mail
{
    public Boolean email(String to, String msg) throws AddressException,MessagingException
    {
                    boolean k;
                    final String username = "diwa.2801@gmail.com";
                    final String password = "furgqbokcooqfjkf";
                    Properties props = new Properties();
                    props.put("mail.smtp.user",username);  //props.put("mail.smtp.port", "25"); //props.put("mail.debug", "true"); 
                    props.put("mail.smtp.password", password);
                    props.put("mail.smtp.host","smtp.gmail.com"); 
                    props.put("mail.smtp.auth", "true"); 
                    props.put("mail.smtp.starttls.enable","true");  
                    props.put("mail.smtp.EnableSSL.enable","true");
                    props.put("mail.smtp.debug", "true");
                    props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
                    props.setProperty("mail.smtp.socketFactory.fallback", "false");   
                    props.setProperty("mail.smtp.port", "465");   
                    props.setProperty("mail.smtp.socketFactory.port", "465");      

                    Session mailSession = Session.getInstance(props,new javax.mail.Authenticator() {    
                        
                           protected PasswordAuthentication getPasswordAuthentication()
                           {    
                           return new PasswordAuthentication(username,password);  
                           }    
                          });//Get the Session object.
                        mailSession.getDebug();
                        MimeMessage message1 = new MimeMessage(mailSession);// Create a default MimeMessage object
                        message1.setFrom(new InternetAddress(username));// Set From: header field of the header.
                        message1.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
                        message1.setText(msg);
                        message1.saveChanges();// Now set the actual message  //message.setSubject("");// Set Subject: header field
                      
                        Transport transport = mailSession.getTransport("smtp");
                        transport.connect("smtp.gmail.com", username, password);
                        transport.sendMessage(message1, message1.getAllRecipients());
                        transport.close();;// Send message
    return true;
    
    }
    public Boolean sendEmail(final String userName, final String password, String toAddress,
            String message) throws AddressException,MessagingException
    {
        try
        {
        // sets SMTP server properties
        String host="smtp.gmail.com"; 
        String port="465";
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
         properties.setProperty("mail.smtp.socketFactory.port", port);
        properties.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
 
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() 
        {
         public PasswordAuthentication getPasswordAuthentication()
         {
            return new PasswordAuthentication(userName, password);
          }
        };
 
        Session session = Session.getInstance(properties, auth);
 
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        //msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(message);
 
        // sends the e-mail
        Transport.send(msg);
        
 
    }
        catch(Exception e)
        {
         System.out.println(e);
        }return true;
    }
    public static void main(String args[]) throws AddressException
    {
        try {
            mail m=new mail();
           // m.sendEmail("prabhukumar7708@gmail.com","Prabhu@123","yuvarajaprince8@gmail.com","nothing its just for checking");
        if(m.email("diwa.2801@gmail.com", "hiiii"))
        {
            System.out.println("success");
        }
        } catch (MessagingException ex) {
            Logger.getLogger(mail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}