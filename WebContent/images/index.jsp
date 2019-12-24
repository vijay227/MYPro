<%-- 
    Document   : index
    Created on : Feb 17, 2016, 3:06:03 PM
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
  <!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.--><script>var __adobewebfontsappname__="dreamweaver"</script><script src="http://use.edgefonts.net/open-sans:n3,n4:default.js" type="text/javascript"></script>
</head>
  <body>
  <nav class="navbar navbar-fixed-top">
  	<div class="container">
  		<!-- Brand and toggle get grouped for better mobile display -->
  		<div class="navbar-header">
  			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#topFixedNavbar1" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
  			<a class="navbar-brand text-uppercase" href="#">Love For Food</a>
  		</div>
  		<!-- Collect the nav links, forms, and other content for toggling -->
  		
  		
  		<%
  		if(session.getAttribute("AdminLogin")!=null && session.getAttribute("userName")==null  ){
  			%>
  			<div class="collapse navbar-collapse" id="topFixedNavbar1">
  			<ul class="nav navbar-nav navbar-right text-uppercase">
                            <li><a href="index.jsp" onmousemove="HideModalWindow()">home</a></li>
                                <li><a href="AddRestaurant.jsp" onclick="ShowNewPage()" >Add Restaurant</a></li>
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
			<img src="images/Slider1.jpg" alt="First slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				<p><strong>see features</strong></p>
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
  		<div class="item">
			<img src="images/Slider2.jpg" alt="Second slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				<p><strong>see features</strong></p>
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
  		<div class="item">
			<img src="images/Slider3.jpg" alt="Third slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				<p><strong>see features</strong></p>
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
                <div class="item">
			<img src="images/Slider4.jpg" alt="Third slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				<p><strong>see features</strong></p>
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
                <div class="item">
			<img src="images/Slider5.jpg" alt="Third slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				<p><strong>see features</strong></p>
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
                <div class="item">
			<img src="images/Slider6.jpg" alt="Third slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				<p><strong>see features</strong></p>
				<a href="#features"><i class="fa fa-angle-double-down"></i></a>
			</div>
			<!-- / carousel-caption -->
		</div>
		<!--/ item-->
                <div class="item">
			<img src="images/Slider7.jpg" alt="Third slide image" class="center-block">
  			<div class="carousel-caption">
  				<h3>Love For Food</h3>
  				<p><span>Your complete food guide</span></p>
				<p><strong>see features</strong></p>
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
 
 <!--features-->
  <section class="container section" id="features">
  	<h1 class="text-uppercase section-title text-center">features</h1>
  	<div class="row">
  		
		<div class="col-md-4">
  			<h3 class="text-uppercase">Responsive design</h3>
			<p>Eligendi nesciunt maxime necessitatibus alias repudiandae sit. Cum, nulla reiciendis voluptatem a impedit aperiam asperiores in ut. Cupiditate aperiam earum dolor error.</p>
  			<i class="fa fa-desktop"></i>
		</div>
  		
		<div class="col-md-4">
  			<h3 class="text-uppercase">awesome scroll animations</h3>
			<p>Eligendi nesciunt maxime necessitatibus alias repudiandae sit. Cum, nulla reiciendis voluptatem a impedit aperiam asperiores in ut. Cupiditate aperiam earum dolor error.</p>
  			<i class="fa fa-trophy"></i>
		</div>
  		
		<div class="col-md-4">
  			<h3 class="text-uppercase">modern design</h3>
			<p>Eligendi nesciunt maxime necessitatibus alias repudiandae sit. Cum, nulla reiciendis voluptatem a impedit aperiam asperiores in ut. Cupiditate aperiam earum dolor error.</p>
  			<i class="fa fa-bolt"></i>
		</div>
		
		<div class="col-md-4">
  			<h3 class="text-uppercase">built on bootstrap</h3>
			<p>Eligendi nesciunt maxime necessitatibus alias repudiandae sit. Cum, nulla reiciendis voluptatem a impedit aperiam asperiores in ut. Cupiditate aperiam earum dolor error.</p>
  			<i class="fa fa-fighter-jet"></i>
		</div>
  		
		<div class="col-md-4">
  			<h3 class="text-uppercase">easily customizable</h3>
			<p>Eligendi nesciunt maxime necessitatibus alias repudiandae sit. Cum, nulla reiciendis voluptatem a impedit aperiam asperiores in ut. Cupiditate aperiam earum dolor error.</p>
  			<i class="fa fa-scissors"></i>
		</div>
  		
		<div class="col-md-4">
  			<h3 class="text-uppercase">free and always will be</h3>
			<p>Eligendi nesciunt maxime necessitatibus alias repudiandae sit. Cum, nulla reiciendis voluptatem a impedit aperiam asperiores in ut. Cupiditate aperiam earum dolor error.</p>
  			<i class="fa fa-money"></i>
		</div>
</div>
<!-- / row -->
  </section>
  
  
  <section class="container section" id="contact">
	<h1 class="text-center text-uppercase section-title">contact us</h1>
	<div class="row">
		<div class="col-md-6">
			
			<form id="form1" name="form1" method="post">
				<p>If you have any question or suggestions please feel free to contact us at any time </p>
				<label for="Username">Username :</label>
				<input type="text" name="Username" id="Username">
				<label for="email">Email :</label>
				<input type="email" name="email" id="email">
				<label for="Subject">Subject :</label>
				<input type="text" name="Subject" id="Subject">
				<label for="Message">Message :</label>
				<textarea name="Message" id="Message"></textarea>
				<input type="submit" name="submit" id="submit" value="Submit">
				
			</form>
		</div>
		<div class="col-md-6 contact-info">
			<h3>Contact info</h3>
			<p><strong class="text-uppercase">email :</strong>no-reply@ayathemes.com</p>
			<p><strong class="text-uppercase">Phone :</strong>00-00000-0000</p>
			<p><strong class="text-uppercase">Address :</strong>03, Home sweet home, myLovelyCity</p>
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