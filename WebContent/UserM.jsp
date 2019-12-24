<%-- 
    Document   : UserMaster
    Created on : Feb 17, 2016, 3:53:04 PM
    Author     : Nitesh-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Love For Food</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="fontawesome/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="js/lightbox/css/lightbox.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
        <script src="JavaScript/newjavascript.js" type="text/javascript"></script>

    </head>
  
    <body style="background-image: url(images/bg1.jpg); opacity: 5; position: absolute; height: 100%; width: 100%; ">
    <%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    if (session.getAttribute("userName") == null) {
        response.sendRedirect(request.getContextPath() + "/Login.jsp");
    }
    %>
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#topFixedNavbar1" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a class="navbar-brand text-uppercase" href="#">Love For Food</a></div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="topFixedNavbar1">
                    
                      <ul class="nav navbar-nav navbar-right text-uppercase">
                            	<li><a href="index.jsp">home</a></li>
                                <li><a href="SearchHotels.jsp" >Search Restaurant</a></li>
                                <li><a href="Recommendation.jsp"> Recommendation</a></li>
                                <li><a href="UserProfile.jsp" >User Profile</a></li>
                                <li><a href="">Book Table</a></li>	
  								<li><a href="#">Contact Us</a></li>
  								<li><a href="Logout.jsp">Logout</a></li>
					</ul>
                </div> 
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </body>
</html>