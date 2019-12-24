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
<%@page import="java.sql.*" %>
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
    <center> <form  method="post">
            <table id="addrest" style="margin-top:-60px;">
                <br>
                <tr><td><label for="RestaurantName">Restaurant Name : </label></td></tr>
                <tr><td><input type="text" name="rname" id="rname" style="width:400px;"></td></tr>
                <tr><td> <label for="Address">Address :</label></td></tr>
                <tr><td><input type="textarea" name="address" id="address" style="width:400px;"></td></tr>
                <tr><td> <label for="City">City :</label></td></tr>
                <tr><td> <input type="text" name="city" id="city" style="width:400px;"></td></tr>
                <tr><td> <label for="Area">Area :</label></td></tr>
                <tr><td> <input type="text" name="area" id="area" style="width:400px;"></td></tr>
                <tr><td><label for="Corner">Corner :</label></td></tr>
                <tr><td> <input type="text" name="corner" id="corner" style="width:400px;"></td></tr>
                <tr><td>  <label for="Email">Email :</label></td></tr>
                <tr><td> <input type="email" name="email" id="email" style="width:400px;"></td></tr>
                <tr><td> <label for="Phone">Phone No. :</label></td></tr>
                <tr><td><input type="text" name="number" id="number" style="width:400px;"></td></tr><br><br>
                <tr><td><tr><td> <label for=""></label></td></tr></td></tr>
                <tr><td> <input type="submit" name="Add" id="add" value="Add Restaurant"></td></tr>
                
            </table>
        </form>
    </center>
    <%
        try {
            String btn = request.getParameter("Add");
            String rname = request.getParameter("rname");
            String address = request.getParameter("address");
            String area = request.getParameter("area");
            String city = request.getParameter("city");
            String corner = request.getParameter("corner");
            String email = request.getParameter("email");
            String phone = request.getParameter("number");
            if (btn != null) {
                 session.setAttribute("HotelName", rname);
                 conn.Connect  cnt=conn.Connect.getInstance();
                 boolean b=cnt.isAddRestaurnat(rname, address, area, city, corner, email, phone); 
                 boolean b1=cnt.isDefaultHotelReviewCount(rname);
                if (b) {
                    File f = new File("E:\\Lars\\" + rname + ".txt");
                    if (!f.exists()) {
                        f.createNewFile();
                    }
                    //response.sendRedirect("UploadPhotos.jsp");
    %>
    <script type="text/javascript">
        alert("Hotel Regitered Successfully...");
       // location.href = 'Restaurant.jsp';
    </script>
    <%  }
            }
        } catch (Exception er) {
            out.println("Error" + er);

        }
    %>               


</body>
</html>
