<%-- 
    Document   : count
    Created on : Mar 5, 2016, 4:31:01 PM
    Author     : Nitesh-PC
--%>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <input type="submit" name="con" value="Count">
        </form>
        <%
         if (request.getParameter("con") != null) {
                try {
                    String word[];
                    String f1_line, f2_line,f,p;
                    int count = 0;
                    BufferedReader br = new BufferedReader(new FileReader("D:\\Lars\\pos.txt"));
                    BufferedReader br1 = new BufferedReader(new FileReader("D:\\Lars\\foodpos.txt"));
                  while((f1_line = br.readLine()) != null)
                  {
                      word=f1_line.split(" ");
                      for(int i=0 ;i<word.length-1;i++)
                      {
                          p=word[i].toLowerCase();
                          System.out.println(p);
                          while((f2_line = br1.readLine())!=null)
                          {
                              f=f2_line.toLowerCase();
                              
                              if(p.equalsIgnoreCase(f))
                              {
                                  count++;
                              }
                          }
                      }
                  }
                   out.println(count);
                    
                    
                   
                } catch (Exception er) {
                    out.println(er);
                }
            }
        %>
    </body>
</html>
