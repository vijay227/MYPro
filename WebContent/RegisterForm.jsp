<%-- 
    Document   : RegisterForm
    Created on : Dec 21, 2015, 11:33:11 AM
    Author     : Creazione-3
--%>

<%@page import="conn.Connect"%>
<%@include file="UserMaster.jsp" %>
<%@page import="com.mysql.*" %>
<%@page import="com.mysql.jdbc.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Registration</title>
    </head>
    <body>
         
       <div class="container" style="margin-top:10%; width:50%;">
        <form action="" name="RegisterForm" method="post">
            
            
            <div class="table-responsive" style="background-color: rgba(150,160,100,.2);">
          
     <table class="table" >
         <h1 align="center" style="color: #990000">Sign Up</h1>
         <tr><td>Name</td><td><input type="text" name="uname" id="uname"></td></tr>
                 
         <tr><td>Email Id</td><td><input type="email" name="email" id="email"></td></tr>
         <tr><td>Password</td><td><input type="password" name="pwd" id="pwd"></td></tr>
         <tr><td>Confirm Password</td><td><input type="password" name="pwd" id="pwd"></td></tr>
         <tr><td>Gender</td><td><input type="radio" name="gender" value="male">Male
         <input type="radio" name="gender" value="female">Female</td></tr>
         <tr><td>Phone No</td><td><input type="tel" name="number" id="number"></td></tr>
         
         <tr><td></td><td><input type="submit" name="submit" id="sub" value="Sign Up"></td></tr>
         </table>
                </div>
        </form>
     </div>
       
  <%
     String btn=request.getParameter("submit");
     String name=request.getParameter("uname");
     String email=request.getParameter("email");
     String password=request.getParameter("pwd");
     String gender=request.getParameter("gender");
     String phone=request.getParameter("number");
      
       
 if(btn!=null){ 
	
	 try{

	
	 conn.Connect  cnt=conn.Connect.getInstance();
	boolean b=cnt.isRegister(name, email, password, gender, phone);
	if(b)
	{
	%>
		<script type="text/javascript">
	       alert("Note your UID: <%= name %>  & Pass : <%= password %>");
	       location.href='Login.jsp';
	   </script>
	   <% 
	}

 }catch(Exception er)
{
    //out.println("Error"+er);

}
 }
%>     
      

    </body>
</html>







