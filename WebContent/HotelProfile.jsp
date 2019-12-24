<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="conn.Connect"%>
<%@page import="Classes.Retrive"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@include file="UserM.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Hotel Profile</title>
</head>
<body>
<%
		conn.Connect cn=conn.Connect.getInstance();
		String rname=request.getParameter("HotelName");
		//out.println(rname);
		//Retrive r=new Retrive();
		ArrayList<String> arr=cn.getSelectedHotelsDetails(rname);
		//out.println(arr.size());
		
%>
		<div style="margin-top:8%; margin-left:5%; height:30%; width:40%;">
		<h3>Welcome to <%= rname %></h3>
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
		
		 <div style="margin-left: 5%;margin-top:6%;  width: 400;">
            <form name="uploadreview" method="post" action="">
                <table>
                    <tr><td>
                            <textarea cols="75" rows="10" name="review" ></textarea></td></tr><tr><td>
                        <input type="submit" name="upload" value="Upload Review" style="width: 150px;"/></td>
                    </tr>
                </table>
            </form>
                </div>
                
              
<%
 String hname=arr.get(0);        
out.println(rname);
ArrayList<Integer> review=cn.getSelectedHotelCount(rname);
ArrayList<String> userReviews=cn.getSelectedHotelReviews(rname);
//out.println(review);

/*float taste=Integer.parseInt(review.get(0)),
		service=Integer.parseInt(review.get(1)),
		amb=Integer.parseInt(review.get(2)),
		cost=Integer.parseInt(review.get(3));
Float f= taste + service + amb + cost;
//out.println("total"+ f);
float t=(taste/f)*100;
float s=(service/f)*100;
float a=(amb/f)*100;
float c=(cost/f)*100;
*/

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
        
        File reviews = new File("E:\\Lars\\" + rname + ".txt");
        if (!reviews.exists()) {
            reviews.mkdirs();
        }
        FileOutputStream fout = new FileOutputStream(reviews, true);
        PrintStream ps = new PrintStream(fout);
        ps.append(request.getParameter("review").toString()+" ");
        //Classes.Retrive rt= new Classes.Retrive();
        boolean save=cn.isSaveReview(hname,session.getAttribute("userName").toString(),request.getParameter("review"));
            out.println(hname +" : ");
            out.println(session.getAttribute("userName").toString()+" : ");
            out.println(request.getParameter("review"));
        if(save)
        {
            
            out.println("Review saved successfully...!");
     		
     		%>
     		<script>location.href('HotelProfile.jsp');</script>
     		<%
     		
     		
        }
        else{
            out.println("Not saved");
        }
        
        //ps.println();
        }

%>
<%    }
%>       


</html>