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
		String rname=request.getParameter("HotelName");
		Retrive r=new Retrive();
		ArrayList<String> arr=r.getSelectedHotelsDetails(rname);
		//out.println(arr.size());
		
%>
		<div>
		<h3>Welcome to <%= rname.toUpperCase() %></h3>
		<img src="images/<%=rname%>.jpeg" alt="class-header-css3" width="100%" height="200" class="alignnone size-full wp-image-172" />
		</div>
		<div style="background-color: rgba:(100,100,100,.2);">
	
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
		
		   <div>
            <form name="uploadreview" method="post" action="">
                <table>
                    <tr><td>
                            <textarea cols="35" rows="5" name="review" ></textarea></td></tr><tr><td>
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
                
                
<div style="width:100%;">
	<div>Taste : </div><div style="width:100%; background-color:rgba(100,100,100,.2); height:20px;"><div id="progress" style="height:20px; background-color: #808000; width:<%= (int)t %>%;" ><%= (int)t %>%</div></div><div style="height:5px;"></div>
	<div>Service : </div><div style="width:100%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color:	#808000; width:<%= (int)s %>%;" ><%= (int)s %>%</div></div><div style="height:5px;"></div>
	<div>Ambiance : </div><div style="width:100%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color: #808000; width:<%= (int)a %>%;" ><%= (int)a %>%</div></div><div style="height:5px;"></div>
	<div>Cost : </div><div style="width:100%; background-color:rgba(100,100,100,.2); height:20px;"><div style="height:20px; background-color: #808000; width:<%= (int)c %>%;" ><%= (int)c %>%</div></div><div style="height:5px;"></div>
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
        Classes.Retrive rt= new Classes.Retrive();
        boolean save=rt.isSaveReview(hname,session.getAttribute("userName").toString(),request.getParameter("review"));
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