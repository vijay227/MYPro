<%-- 
    Document   : uploadphotos1
    Created on : Feb 24, 2016, 12:14:45 PM
    Author     : Nitesh-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Photos</title>
         <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Upload Photos</title>
        
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="fontawesome/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="js/lightbox/css/lightbox.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
        <script src="JavaScript/newjavascript.js" type="text/javascript"></script>
        
        <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
        <script src="JavaScript/newjavascript.js" type="text/javascript"></script>
    </head>
    <body>
       
                <center> <form name="upload" method="post" action="uploadfile.jsp" enctype="multipart/form-data">
                        <table id="addrest" height="200px;">
                            <tr><td colspan="2"><h2>Upload Restaurant Photos</h2></tr><br>
                            <tr><td><label for="Photos">Restaurant Photos : </label></td>
                                <td><input type="file" name="photo" id="photo"></td></tr> 
                               <tr> <td><input type="submit" name="upload1" id="upload1" value="Upload Photo"></td> </tr>
       
                        </table>
                    </form>
                    
                </center>
            
    </body>
</html>
