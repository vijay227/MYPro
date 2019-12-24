<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="Classes.Retrive"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>

<html>
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
        <link href="css/newcss.css" rel="stylesheet" type="text/css">
    </head>
   <body style="background-image: url('images/bg1.jpg');">
       <div class="container">
        <div class="table-responsive"> 
<%
	String uname=session.getAttribute("userName").toString();
	Retrive r=new Retrive();
	ArrayList<String> arr=r.getUserDetails(uname);
	ArrayList<String> review=r.getSelectedUserCount(uname);
	ArrayList<String> userReviews=r.getSelectedUserReviews(uname);
%>
<div  style="height:43%; width:100%;">
<h3>Welcome <%=uname %></h3>
<table class="table">
	<tr><td>User Name :</td><td><%= uname%></td></tr>
	<tr><td>E-mail :</td><td><%= arr.get(0) %></td></tr>
	<tr><td>Gender :</td><td><%= arr.get(1) %></td></tr>
	<tr><td>Contact :</td><td><%= arr.get(2) %></td></tr>
	</table>
</div>	

	<%
	//float taste=Integer.parseInt(review.get(0)),service=Integer.parseInt(review.get(1)), amb=Integer.parseInt(review.get(2)),cost=Integer.parseInt(review.get(3));
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
<!-- 	<table class="table">
	
	<tr><td>Taste :</td><td><%= (int)t %></td></tr>
	<tr><td>Service :</td><td><%= (int)s %></td></tr>
	<tr><td>Ambiance :</td><td><%= (int)a %></td></tr>
	<tr><td>Cost :</td><td><%= (int)c %></td></tr>
	</table> 
	-->

<div style="width:100%;">
<h3><%=uname %> your liking...</h3>

<div style="width:100%;">
	<div>Taste : </div><div style="width:100%; background-color:rgba(100,100,100,.2); height:20px;"><div id="progress" style="height:20px; background-color: #808000; width:<%= (int)t %>%;" ><%= (int)t %>%</div></div><div style="height:5px;"></div>
	<div>Service : </div><div style="width:100%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color:	#808000; width:<%= (int)s %>%;" ><%= (int)s %>%</div></div><div style="height:5px;"></div>
	<div>Ambiance : </div><div style="width:100%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color: #808000; width:<%= (int)a %>%;" ><%= (int)a %>%</div></div><div style="height:5px;"></div>
	<div>Cost : </div><div style="width:100%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color: #808000; width:<%= (int)c %>%;" ><%= (int)c %>%</div></div><div style="height:5px;"></div>
</div>
</div>

<div style=" margin-left:5%; height:auto; width:80%;">
<h3>Previous Reviews...</h3>
<table class="table">
<tr><td style="width:10%;">Hotel Name :</td><td>Reviews :</td></tr>
	<%for(int i=0;i<userReviews.size();i++){ %>
	
	<tr><td><%= userReviews.get(i) %></td>
	<td><%= userReviews.get(++i) %></td></tr>
	<% }%>
	</table>
</div>	


</body>
</html>