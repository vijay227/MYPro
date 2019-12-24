<%-- 
    Document   : uploadfile
    Created on : Dec 25, 2015, 5:02:44 PM
    Author     : Nitesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            try {
                String hotelName=session.getAttribute("HotelName").toString();
                String saveFile = "";
                String contentType = request.getContentType();
                if ((contentType != null && contentType.indexOf("multipart/form-data") >= 0)) {
                    DataInputStream in = new DataInputStream(request.getInputStream());
                    int formDataLength = request.getContentLength();
                    byte dataByte[] = new byte[formDataLength];
                    int byteRead = 0;
                    int totalbyteRead = 0;
                    while (totalbyteRead < formDataLength) {
                        byteRead = in.read(dataByte, totalbyteRead, formDataLength);
                        totalbyteRead += byteRead;

                    }
                    String file = new String(dataByte);
                    saveFile = file.substring(file.indexOf("filename=\"") + 10);
                    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                    /*
                     saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,contentType.length());
                     */
                    int lastIndex = contentType.lastIndexOf("=");
                    String boundry = contentType.substring(lastIndex + 1, contentType.length());
                    int pos;

                    pos = file.indexOf("filename=\"");
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;

                    int boundryLocation = file.indexOf(boundry, pos) - 3;
                    int startpos = ((file.substring(0, pos)).getBytes()).length;
                    int endpos = ((file.substring(0, boundryLocation)).getBytes()).length;
                    String sfname = saveFile.substring(0, (saveFile.length() - 2));
                    String home = System.getProperty("user.home");
                    File folder = new File("E:\\Workspace\\Hotel\\WebContent\\images\\");
                    if (!(folder.exists())) {
                        folder.mkdirs();
                    }
                    //out.println(f1);

                    File f1 = new File("E:\\Workspace\\Hotel\\WebContent\\images\\" +hotelName+".jpeg");

                    //if(!f1.exists())
                    //f1.mkdirs();
                    //out.println(f1);
                    saveFile = f1.toString();
                    //out.println(sfname);
                    Pojo.FilePath fp = new Pojo.FilePath();
                    //lars.pojo.Filepath fp=new lars.pojo.Filepath();
                    // peer.pojo.filepath fp = new peer.pojo.filepath();
                    // fp.setSavefile(saveFile);
                    fp.setFilePath(saveFile);
                    //response.sendRedirect("Send_File.jsp");
                    File f = new File(saveFile);
                    //out.println(saveFile);
                   // String id = request.getParameter("type");
                    //out.println(id);
                    FileOutputStream fileout = new FileOutputStream(saveFile);
                    fileout.write(dataByte, startpos, (endpos - startpos));
                    fileout.flush();
                    fileout.close();

                    String hName ="test";//session.getAttribute("HotelName").toString();
                    Classes.Retrive rt = new Classes.Retrive();
                        rt.isPhotoMenuSave(hName, sfname);
                      //  response.sendRedirect("Restaurant.jsp");
                   
        %>
        <script>alert('File Uploaded Successfully...!') </script>
            <%
                }

            } catch (Exception e) {%>
            < script type = "text/javascript" > alert("Something went wrong" + e)</script><%
                }
            %>    
    </body>

</html>
