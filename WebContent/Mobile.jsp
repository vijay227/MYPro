<%-- 
    Document   : index
    Created on : Feb 17, 2016, 3:06:03 PM
    Author     : Nitesh-PC
--%>
<%@page import="Classes.Retrive"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@include file="UserM.jsp" %>

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
  		
  		
  		<%
		String rname=request.getParameter("Gautami");
		Retrive r=new Retrive();
		ArrayList<String> arr=r.getSelectedHotelsDetails(rname);
		//out.println(arr.size());
		
%>
		<div style="margin-top:8%; margin-left:5%; height:30%; width:40%;">
		<h3>Welcome to <%= rname.toUpperCase() %></h3>
		<img src="images/<%=rname%>.jpeg" alt="class-header-css3" width="550" height="250" class="alignnone size-full wp-image-172" />
		</div>
		<div style="margin-left:50%; margin-top:-13%; height:30%; width:40%; background-color: rgba:(100,100,100,.2);">
	
		<table class="table">
			<tr><td>Hotel Name :</td><td><%= arr.get(0) %></td></tr>
			<tr><td>Address :</td><td><%= arr.get(1) %></td></tr>
			<tr><td>Area :</td><td><%= arr.get(2) %></td></tr>
			<tr><td>City :</td><td><%= arr.get(3) %></td></tr>
			<tr><td>Corner :</td><td><%= arr.get(4) %></td></tr>
			<tr><td>Email :</td><td><%= arr.get(5) %></td></tr>
			<tr><td>Phone :</td><td><%= arr.get(6) %></td></tr>
		</table>
		</div>	
		
		 <div style="margin-left: 5%;margin-top:5%;  width: 400;">
            <form name="uploadreview" method="post" action="">
                <table>
                    <tr><td>
                            <textarea cols="94" rows="10" name="review" ></textarea></td></tr><tr><td>
                        <input type="submit" name="upload" value="Upload Review" style="width: 150px;"/></td>
                    </tr>
                </table>
            </form>
                </div>
                
                
                <%
 				String hname=arr.get(0);            
            	ArrayList<String> review=r.getSelectedHotelCount(hname);
            	ArrayList<String> userReviews=r.getSelectedHotelReviews(hname);
            	
            	float taste=Integer.parseInt(review.get(0)),
            			service=Integer.parseInt(review.get(1)),
            			amb=Integer.parseInt(review.get(2)),
            			cost=Integer.parseInt(review.get(3));
            	Float f= taste + service + amb + cost;
            	//out.println("total"+ f);
            	float t=(taste/f)*100;
            	float s=(service/f)*100;
            	float a=(amb/f)*100;
            	float c=(cost/f)*100;
            	
                %>
                
                
<div style="margin-top:-15%; margin-left:51%; height:30%; width:100%;">
	<div>Taste : </div><div style="width:20%; background-color:rgba(100,100,100,.2); height:20px;"><div id="progress" style="height:20px; background-color: #808000; width:<%= (int)t %>%;" ><%= (int)t %>%</div></div><div style="height:5px;"></div>
	<div>Service : </div><div style="width:20%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color:	#808000; width:<%= (int)s %>%;" ><%= (int)s %>%</div></div><div style="height:5px;"></div>
	<div>Ambiance : </div><div style="width:20%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color: #808000; width:<%= (int)a %>%;" ><%= (int)a %>%</div></div><div style="height:5px;"></div>
	<div>Cost : </div><div style="width:20%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color: #808000; width:<%= (int)c %>%;" ><%= (int)c %>%</div></div><div style="height:5px;"></div>
</div>

<div style=" margin-left:5%; height:auto; width:80%;">
<h3>Previous Reviews...</h3>
<table class="table">
<tr><td style="width:10%;">User Name :</td><td>Reviews :</td></tr>
	<%for(int i=0;i<userReviews.size();i++){ %>	
	<tr><td><%= userReviews.get(i) %></td>
	<td><%= userReviews.get(++i) %></td></tr>
	<% }%>
	</table>
</div>		
</body>

<%    
        if (request.getParameter("upload") != null) {
        request.getParameter("review");
        if(session.getAttribute("userName")==null){
          response.sendRedirect("UserLogin.jsp");
        }else{
        //String home=System.getProperty("user.home");
        
        File reviews = new File("E:\\Lars\\" + session.getAttribute("Show_Detail") + ".txt");
        if (!reviews.exists()) {
            reviews.mkdirs();
        }
        FileOutputStream fout = new FileOutputStream(reviews, true);
        PrintStream ps = new PrintStream(fout);
        ps.append(request.getParameter("review").toString()+" ");
        Classes.Retrive rt= new Classes.Retrive();
        boolean save=rt.isSaveReview(hname,session.getAttribute("userName").toString(),request.getParameter("review"));
        out.println(hname);
            out.println(session.getAttribute("userName").toString());
            out.println(request.getParameter("review"));
        if(save)
        {
            
            out.println("Review saved successfully...!");
        }
        else{
            out.println("Not saved");
        }
        
        //ps.println();
        }

%>
<%    }
%>       
  		
  		
  		
			
		
        
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