<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="Classes.Retrive"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@include file="UserM.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>User Profile</title>
<script type="text/javascript">

$("#progress").bind('progressbarchange') {
    var selector = "#" + this.id + " > div";
    var value = $('.progress').width();
    var value = this.getAttribute( "aria-valuenow" );
    if (value < 10){
        $(selector).css({ 'background': 'black' });
    } else if (value < 30){
        $(selector).css({ 'background': 'Orange' });
    } else if (value < 50){
        $(selector).css({ 'background': 'Yellow' });
    } else{
        $(selector).css({ 'background': 'LightGreen' });
    } 
};

</script>
</head>
<body>
<%
   try{
	conn.Connect cn=conn.Connect.getInstance();
	String uname=session.getAttribute("userName").toString();
	//Retrive r=new Retrive();
	ArrayList<String> arr=cn.getUserDetails(uname);
	ArrayList<Integer> review=cn.getSelectedUserCount(uname);
	ArrayList<String> userReviews=cn.getSelectedUserReviews(uname);
%>
<div style="margin-top:8%; margin-left:5%; height:30%; width:40%;">
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
	 float taste=review.get(0);
	float service=review.get(1);
	 float amb=review.get(2);
    float  cost=review.get(3);
	Float f= taste + service + amb + cost;
	//out.println("total"+ f);
	float t=(taste/f)*100;
	float s=(service/f)*100;
	float a=(amb/f)*100;
	float c=(cost/f)*100;

	%>
<!-- 	<table class="table">
	
	<tr><td>Taste :</td><td><%= t %></td></tr>
	<tr><td>Service :</td><td><%= s %></td></tr>
	<tr><td>Ambiance :</td><td><%= a %></td></tr>
	<tr><td>Cost :</td><td><%= c %></td></tr>
	</table> 
	-->

<div style="margin-top:-15%; margin-left:50%; height:30%; width:100%;">
<h2><%=uname %> your liking...</h2>

<div>Service : </div><div style="width:20%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color:	#808000; width:<%= (int)t %>%;" ><%= (int)t %>%</div></div><div style="height:5px;"></div>
<div>Service : </div><div style="width:20%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color:	#808000; width:<%= (int)s %>%;" ><%= (int)s %>%</div></div><div style="height:5px;"></div>
<div>Ambiance : </div><div style="width:20%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color: #808000; width:<%= (int)a %>%;" ><%=(int)a %>%</div></div><div style="height:5px;"></div>
<div>Cost : </div><div style="width:20%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color: #808000; width:<%=(int) c %>%;" ><%=(int) c %>%</div></div><div style="height:5px;"></div>

</div>
	
<div style=" margin-left:5%; height:auto; width:80%;">
<h3>Previous Reviews...</h3>
<table class="table">
<tr><td style="width:10%;">Hotel Name :</td><td>Reviews :</td></tr>
	<%for(int i=0;i<userReviews.size();i++){ %>
	
	<tr><td><%= userReviews.get(i) %></td>
	<td><%= userReviews.get(++i) %></td></tr>
	
	
	<% 
	}
	}
	catch(Exception er)
	{
		out.println(er);
		
		
	}
	
	
	%>
	</table>
</div>	


</body>
</html>