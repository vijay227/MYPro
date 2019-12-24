<%-- 
    Document   : index
    Created on : Feb 17, 2016, 3:06:03 PM
    Author     : Nitesh-PC
--%>
<%@page import="java.sql.*"%>
<%@page import="javax.mail.*"%>
 
<%@page import="javax.mail.internet.*"%>
<%@ page import="java.io.*"%>

<%@page import="java.util.*"%>
<%@ page import="java.math.BigInteger"%>

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
  <!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.--><script>var __adobewebfontsappname__="dreamweaver"</script><script src="http://use.edgefonts.net/open-sans:n3,n4:default.js" type="text/javascript"></script>
</head>
  <body>
  <nav class="navbar navbar-fixed-top">
  	<div class="container">
  		<!-- Brand and toggle get grouped for better mobile display -->
  		<div class="navbar-header">
  			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#topFixedNavbar1" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
  			<a class="navbar-brand text-uppercase" href="#">Love For Food</a></div>
  		<!-- Collect the nav links, forms, and other content for toggling -->
  		
  		
  		<%
  		if(session.getAttribute("AdminLogin")!=null && session.getAttribute("userName")==null  ){
  			%>
  			<div class="collapse navbar-collapse" id="topFixedNavbar1">
  			<ul class="nav navbar-nav navbar-right text-uppercase">
                            <li><a href="index.jsp" onmousemove="HideModalWindow()">home</a></li>
                                <li><a href="Restaurant.jsp" onclick="ShowNewPage()" >Add Restaurant</a></li>
                                <li><a href="SearchHotels.jsp" onmousemove="HideModalWindow()">Search Restaurant</a></li>
                                <li><a href="restaurantDetails.jsp" onmouseover="HideModalWindow()" >Restaurant Details</a></li>
  								 <li><a href="testing.jsp"> Calculate Profiles</a></li>
  								<li><a href="#"> Logout</a></li>
			</ul>
			</div>
  			<% 
  		}
  		else if(session.getAttribute("userName")!=null && session.getAttribute("AdminLogin")==null){
  			%>
  			<div class="collapse navbar-collapse" id="topFixedNavbar1">
  			<ul class="nav navbar-nav navbar-right text-uppercase">
                            	<li><a href="index.jsp">home</a></li>
                                <li><a href="SearchHotels.jsp" >Search Restaurant</a></li>
                                <li><a href="Recommendation.jsp"> Recommendation</a></li>
                                <li><a href="#" >User Profile</a></li>	
  								<li><a href="#">Contact Us</a></li>
  								<li><a href="#">Logout</a></li>
					</ul>
					</div>
  			<%
  			
  			
  		}
  		else{
  			%>
  			<div class="collapse navbar-collapse" id="topFixedNavbar1">
  			<ul class="nav navbar-nav navbar-right text-uppercase">
                            <li><a href="index.jsp" onmousemove="HideModalWindow()">home</a></li>
                                <li><a href="SearchHotels.jsp">Search Restaurant</a></li>
                                <li><a href="Login.jsp">Login</a></li>
  								 <li><a href="#">Contact Us</a></li>
  								<li><a href="#">Logout</a></li>
			</ul>
  			</div>
  			
  			<%
  			
  		}
  		
  		
  		
  		%>
			
		
  		<!-- /.navbar-collapse -->
	  </div>
  	<!-- /.container-fluid -->
  </nav>
      
      <script>

 
 </script>
        
      
  
  <div id="carousel1" class="carousel slide" data-ride="carousel">
  	<ol class="carousel-indicators">
  		<li data-target="#carousel1" data-slide-to="0" class="active"></li>
  		<li data-target="#carousel1" data-slide-to="1"></li>
  		<li data-target="#carousel1" data-slide-to="2"></li>
                <li data-target="#carousel1" data-slide-to="3"></li>
                <li data-target="#carousel1" data-slide-to="4"></li>
                <li data-target="#carousel1" data-slide-to="5"></li>
                <li data-target="#carousel1" data-slide-to="6"></li>
                
	  </ol>
  	<div class="carousel-inner" role="listbox">
  		<div class="item active">
			<img src="images/s1.jpg" alt="First slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
  		<div class="item">
			<img src="images/s2.jpg" alt="Second slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
  		<div class="item">
			<img src="images/s3.jpg" alt="Third slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
                <div class="item">
			<img src="images/s4.jpg" alt="Third slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
                <div class="item">
			<img src="images/s5.jpg" alt="Third slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
                <div class="item">
			<img src="images/s6.jpg" alt="Third slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
                <div class="item">
			<img src="images/s7.jpg" alt="Third slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
                
	  </div>
	  <!-- / carousel-inne-->
  	<a class="left carousel-control" href="#carousel1" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
	<a class="right carousel-control" href="#carousel1" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a>
	</div>
 
 
  
  
  <section class="container section" id="contact">
	<h1 class="text-center text-uppercase section-title">contact us</h1>
	<div class="row">
		<div class="col-md-6">
			
			<form id="form1" name="form1" method="post">
				
				<p>If you have any question or suggestions please feel free to contact us at any time </p>
				<label for="email">Email :</label>
				<input type="email" name="email" id="email" required="">
				<label for="pass">Password :</label>
				<input type="password" name="pass" id="pass" required="">
				<label for="Subject">Subject :</label>
				<input type="text" name="Subject" id="Subject" required="">
				<label for="Message">Message :</label>
				<textarea name="Message" id="Message" required=""></textarea>
				<input type="submit" name="send" id="send" value="Send">
				
			</form>
			
			
			
			<%
 	if(request.getParameter("send")!=null){
 		String smail=request.getParameter("email");
 		String pass=request.getParameter("pass");
 		String sub=request.getParameter("Subject");
 		String msg1=request.getParameter("Message");
 
    String host = "smtp.gmail.com";
 
    //host = smtp_server; //"smtp.gmail.com"; user = jsp_email; //"YourEmailId@gmail.com" // email id to send the emails
 
    //pass = jsp_email_pw; //Your gmail password
 
    String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
    String to_add = "dinesh12192@gmail.com", subject = sub, messageText = msg1, password = "9226591664";
 
    String from = smail;
 
    boolean sessionDebug = true;
 
    Properties props = System.getProperties();
 
    props.put("mail.host", host);
 
    props.put("mail.transport.protocol.", "smtp");
 
    props.put("mail.smtp.auth", "true");
 
    props.put("mail.smtp.", "true");
 
    props.put("mail.smtp.port", "465");
 
    props.put("mail.smtp.socketFactory.fallback", "false");
 
    props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
 
    Session mailSession = Session.getDefaultInstance(props, null);
 
    mailSession.setDebug(sessionDebug);
 
    Message msg = new MimeMessage(mailSession);
 
    msg.setFrom(new InternetAddress(from));
 
    InternetAddress[] address = { new InternetAddress(to_add) };
 
    msg.setRecipients(Message.RecipientType.TO, address);
 
    msg.setSubject(subject);
 
    msg.setContent(messageText, "text/html"); // use setText if you want to send text
 
    Transport transport = mailSession.getTransport("smtp");
    System.setProperty("javax.net.ssl.trustStore", "conf/jssecacerts");
    System.setProperty("javax.net.ssl.trustStorePassword", "admin");
    transport.connect(host, smail, pass);
 
    try {
 
        transport.sendMessage(msg, msg.getAllRecipients());
        out.println("your mail sent successfully...!");
        //WasEmailSent = true; // assume it was sent
 
    }
 
    catch (Exception err) {
 
        //WasEmailSent = false; // assume it's a fail
 
        out.println("Error" + err.getMessage());
 
    }
    transport.close();
 	}
%>
			
			
			
			
			
			
		</div>
		<div class="col-md-6 contact-info">
			<h3>Contact info</h3>
			<p><strong class="text-uppercase">email :</strong>loveforfood999@gmail.com</p><!--loveforfood -->
			<p><strong class="text-uppercase">Phone :</strong>7276112425 </p>
			<p><strong class="text-uppercase">Address :</strong>ZEAL Pune</p>
		</div>
	</div>
  </section>
  <footer class="footer container-fluid text-center">
  	<div class="logo"><span>Love For Food</span></div>
	<div class="socials">
		<a href="#"><span class="fa fa-facebook"></span></a>
		<a href="#"><span class="fa fa-twitter"></span></a>
		<a href="#"><span class="fa fa-google-plus"></span></a>
	</div>
	
  </footer>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
	<script src="js/jquery-1.11.3.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed --> 
	<script src="js/bootstrap.js"></script>
	
	<!--the velocity animation framework-->
	<script src="js/ScrollMagic.min.js"></script>
	<script src="js/velocity.js"></script>
	<script src="js/velocity.ui.js"></script>
	<script src="js/animation.velocity.min.js"></script>
	<script src="js/jquery.mixitup.min.js"></script>
	<script src="js/lightbox/js/lightbox.min.js"></script>
	<script src="js/jquery.countTo.js"></script>
	
	<!--custom javascript file	-->
	<script src="js/main.js"></script>
  </body>
</html>