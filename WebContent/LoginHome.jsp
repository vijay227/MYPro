<%-- 
    Document   : Login
    Created on : Mar 3, 2016, 4:29:13 PM
    Author     : Nitesh-PC
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="HotelCSS.css" rel="stylesheet" type="text/stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
 		<link rel="stylesheet" type="text/css" href="fontawesome/css/font-awesome.min.css" />
  		<link rel="stylesheet" type="text/css" href="js/lightbox/css/lightbox.min.css">
  		<link href="css/style.css" rel="stylesheet" type="text/css">
        <title>Login</title>
    </head>
    <body style="background-image: url('images/bg1.jpg');">
       
        <div class="container">
        <div class="table-responsive" style="margin-top:25%;">
        <center>
        <h3>Login here...!</h3>
                <form action="" name="LoginForm" onsubmit="return validateLogin()" method="post">                  
                    <table class="table" style="height:25%; width:100%;">
                        <tr><td>User Name : </td><td><input type="text" name="uname" autofocus="" required="" autocomplete="off" id="login_username" ></td></tr>
                        <tr><td>Password :  </td><td><input type="password" name="passwd" required="" id="login_password" /></td></tr>                         
                        <tr><td> <input type="submit" name="sbutton" value="Login" id="login_btn"/></td>
                        <td><a href="RegMobile.jsp">Register Here</a></td> </tr>
                    </table>
                </form>
                  </center>      
                </div>
              
        </div>
    </body> 
</html>
                <%
                    try {
                    	
                    	String user = request.getParameter("uname");
                    	
                        String s = request.getParameter("sbutton");
                        if(s!=null){
            			if((request.getParameter("uname").equals("admin")) && (request.getParameter("passwd").equals("admin")))
            				{
								 session.setAttribute("AdminLogin", user);
  						  		%>
    								<script type="text/javascript">			
       					 			alert("Welcome <%=user%>");
                         			//location.href = 'AdminM.jsp';
                         			</script>
   						 		<% 
                    	
            				}
                        }
                    
                        if (s != null) {
                        	Classes.Retrive rt = new Classes.Retrive();
                        	String u = request.getParameter("uname");
                        	String password=rt.isUserLoginValidate(u);
                        	if(request.getParameter("passwd").equals(password)){
                             session.setAttribute("userName", user);
                			 %>
                				 <script type="text/javascript">

                  				   alert("Welcome <%=user%>");
                     				//location.href = 'UserM.jsp';
               					  </script>
                			 <%
                       			 }
                        	else{
                        		 %>
                				 <script type="text/javascript">

                  				   alert("Wrong user name or password...");
                     				location.href = 'Login.jsp';
               					  </script>
                			 <%
                        		
                        	}
                        }
                        
                    } catch (Exception e) {

                    }
                %>




