<%-- 
    Document   : RegisterForm
    Created on : Dec 21, 2015, 11:33:11 AM
    Author     : Creazione-3
--%>

<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <body style="background-image: url('images/bg1.jpg');">
       
        <div class="container">
        <div class="table-responsive">
         <center>
        <form action="" name="RegisterForm" method="post">
       
          <table class="table" >
         <h3 style="color: #990000">Sign Up</h3>
         <tr><td>Name</td><td><input type="text" name="uname" id="uname"></td></tr>                
         <tr><td>Email Id</td><td><input type="email" name="email" id="email"></td></tr>
         <tr><td>Password</td><td><input type="password" name="pwd" id="pwd"></td></tr>
         <tr><td>Confirm Password</td><td><input type="password" name="pwd" id="pwd"></td></tr>
         <tr><td>Gender</td><td><input type="radio" name="gender" value="male">Male
         <input type="radio" name="gender" value="female">Female</td></tr>
         <tr><td>Phone No</td><td><input type="tel" name="number" id="number"></td></tr>
         <tr><td></td><td><input type="submit" name="submit" id="sub" value="Sign Up"></td></tr>
         </table>
         
        </form>
        </center>
        </div>
        </div>
        
       
  <%
try{
     String btn=request.getParameter("submit");
     String name=request.getParameter("uname");
     String email=request.getParameter("email");
     String password=request.getParameter("pwd");
     String gender=request.getParameter("gender");
      String phone=request.getParameter("number");
      
       
 if(btn!=null){ 
Mongo mg = new Mongo("localhost", 27017);
DB db = mg.getDB("lars");
DBCollection collection = db.getCollection("Registration");
DBCollection collection1=db.getCollection("UserReviewCount");
BasicDBObject me = new BasicDBObject();
BasicDBObject me1= new BasicDBObject();
%>
<h1><%=me.get("pwd")%></h1>
<% 
 
me.put("uname",name);
me.put("email",email);
me.put("pwd",password);
me.put("gender",gender);
me.put("phone",phone);

me1.put("UserName",name);
me1.put("tasteCount",0);
me1.put("serviceCount",0);
me1.put("ambinceCount",0);
me1.put("cost",0);


collection.insert(me);
collection1.insert(me1);
if(collection!=null){
   %>
   <script type="text/javascript">
       alert("Note your UID: <%= name %>  & Pass : <%= password %>");
       location.href='LoginHome.jsp';
   </script>
   <% 
}

 }
 }catch(Exception er)
{
    out.println("Error"+er);

}
%>     
       
       
       
       
       
       
       
       



    </body>
</html>







