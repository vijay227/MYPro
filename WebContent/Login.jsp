<%-- 
    Document   : Login
    Created on : Mar 3, 2016, 4:29:13 PM
    Author     : Nitesh-PC
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="DefaultMaster.jsp" %>
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
    <body>
   
   <div class="table-responsive" style=" margin-top:15%; margin-left:10%;height:40%; width:30%; background-image: url('images/login-back.png');"></div>
       
        <div class="container" style="margin-left:48%; margin-top:-15%; width:35%;">     
      <div class="table-responsive">
               <div>
               		<form action="" name="LoginForm" onsubmit="return validateLogin()" method="post">                  
                    <table class="table">
                    <th>Sign in here...!</th>
                        <tr><td>User Name : </td><td><input type="text" name="uname" autofocus="" required="" autocomplete="off" id="login_username" ></td></tr>
                        <tr><td>Password :  </td><td><input type="password" name="passwd" required="" id="login_password" /></td></tr>                         
                        <tr><td> <input type="submit" name="sbutton" value="Login" id="login_btn"/></td>
                        <td><a href="RegisterForm.jsp">Register Here</a></td> </tr>
                    </table>
                	</form>
               </div> 
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
                         			location.href = 'AdminM.jsp';
                         			</script>
   						 		<% 
                    	
            				}
                        }
                    
                        if (s != null) {
                        	conn.Connect  cnt=conn.Connect.getInstance();
                        	String uname = request.getParameter("uname");
                        	String password=request.getParameter("passwd");
                        	boolean b=cnt.isValidateLogin(uname, password);
                        	if(b){
                             session.setAttribute("userName", user);
                			 %>
                				 <script type="text/javascript">

                  				   alert("Welcome <%=user%>");
                     				location.href = 'UserM.jsp';
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




