<%-- 
    Document   : child
    Created on : Feb 24, 2016, 11:52:45 AM
    Author     : Nitesh-PC
--%>

<%@page import="conn.Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Untitled Page</title>

        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="fontawesome/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="js/lightbox/css/lightbox.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
        <script src="JavaScript/newjavascript.js" type="text/javascript"></script>
    </head>
    <body>
   <div style="margin-left:25%; height:30%; width:40%;">
     <form  method="post">
            <table class="table">
                <tr><td><label for="Breakfast">Breakfast </label></td>
                <td><input type="checkbox" name="1" value="Breakfast" style="margin-left: 70%"/></td></tr>
                <tr><td><label for="Meal">Meal</label></td>
                <td><input type="checkbox" name="2" value="Meal" style="margin-left: 70%"/></td></tr>
                <tr><td><label for="pizza">Pizza/Burger</label></td>
                <td><input type="checkbox" name="3" value="Pizza/Burger" style="margin-left: 70%"/></td></tr>
                 <tr><td><label for="StreetFood">Street Food</label></td>
                <td><input type="checkbox" name="4" value="Street Food" style="margin-left: 70%"/></td></tr>
                <tr><td><label for="Chinese">Chinese</label></td>
                <td><input type="checkbox" name="5" value="Chinese" style="margin-left: 70%"/></td></tr>
                <tr><td><label for="Dessert">Dessert</label></td>
                <td><input type="checkbox" name="6" value="Dessert" style="margin-left: 70%"/></td></tr>
                <tr><td><label for="CafeDrink">Cafe & Drink</label></td>
                <td><input type="checkbox" name="7" value="Cafe & Drink" style="margin-left: 70%"/></td></tr>
                <tr><td><label for="seafood">Sea Food</label></td>
                <td><input type="checkbox" name="8" value="Sea Food" style="margin-left: 70%"/></td></tr>
                
                <tr><td><label for="addcategory"></label></td>
                <td colspan="2"><input type="submit" name="addcategory" value="Add Categories"/></td></tr>
                
            </table> 
        </form>
 </div>
    <%
        try {
            String btn = request.getParameter("addcategory");
            conn.Connect con =conn.Connect.getInstance();
            String hotelName="Gautami";
            boolean b=false;
          
            if (btn != null) {
            	
            	out.println("Check poimnt");
                for(int i=1;i<=8;i++){
                	
                	if(request.getParameter(""+i)!=null){
                		String url="update addcategory set Breakfast="+""+true+""+" where hname="+""+hotelName+""+"";
                      
                       b=con.isAddCategory(url);
                	}
                	
                }
                
                 //session.getAttribute("HotelName").toString();
              
              
               if(b)
               {
            	   %>
            	    <script>alert("Category added Successfully...");</script>
            	    <% 
               }
               
               
       
                 }
            
        } catch (Exception er) {
            out.println("Error" + er);

        }
    %>               


</body>
</html>
