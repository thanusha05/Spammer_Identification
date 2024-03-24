
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%
try {           
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
                    if (name.equalsIgnoreCase("usrmail")) {
                        usrmail = value;
                        System.out.println("usrmail is  : " + usrmail);
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
            PreparedStatement pstmnt = con.prepareStatement("update users set P_PIcture=?,PF_Name=? where Mail_ID='"+usrmail+"'");        
            pstmnt.setBinaryStream(1, (InputStream) fis, (int) (image.length()));  
            pstmnt.setString(2,fileName);
            int tr = pstmnt.executeUpdate();
            if (tr > 0) {
                session.setAttribute("fbmsg", "Profile Picture Changed successfully");
                response.sendRedirect("POWProfile.jsp");
            } else {
                session.setAttribute("fbmsg", "ERROR TRY AGAIN");
                response.sendRedirect("POWProfile.jsp");
            }
        }catch (Exception e)
        {
            System.out.println(e);
            e.printStackTrace();
        }

%>