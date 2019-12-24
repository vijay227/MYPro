<%-- 
     Document   : SearchHotels
    Created on : Feb 25, 2016, 3:02:52 PM
    Author     : Nitesh-PC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.PrintStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@page import="conn.Connect" %>
<%
if(session.getAttribute("AdminLogin")!=null){
	%>
	<%@include file="AdminM.jsp" %>
	<%
}
else if(session.getAttribute("userName")!=null){
	%>
	<%@include file="UserM.jsp" %>
	<%
}
else{
	%>
	<%@include file="DefaultMaster.jsp" %>
	<%
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

    </head>
    <body>
    
    
          
            <form>
                <%
                    ArrayList<String> hotels = null;
                    //out.println(request.getParameter("Pavitra"));
                   
                    
                    conn.Connect cn=conn.Connect.getInstance();
                    
                    try {

                        String cname = request.getParameter("Show_Detail");
                        if (cname != null) {
                            session.setAttribute("Show_Detail", cname);
                        }
                        ArrayList al = (ArrayList) session.getAttribute("h");
                        if (al == null) {
                            hotels = cn.getHotelDetails(session.getAttribute("Show_Detail").toString());
                            // out.println(hotels.size());
                            session.setAttribute("h", hotels);
                        }
                        if (al != null) {
                            hotels = cn.getHotelDetailsByHotel(session.getAttribute("Show_Detail").toString());
                            //out.println(hotels.size());
                            session.setAttribute("h", hotels);
                        }
                    } catch (Exception e) {
                        hotels = cn.getHotelDetailsByHotel(request.getParameter("Show_Detail"));
                        out.println(hotels.size());
                        //session.setAttribute("h",hotels);    

                        out.println("Error is " + e);
                    }
                %>  
                
				<div style="margin-top:9%; margin-left:5%; height:30%; width:40%;">
				<h3>Welcome to <%= hotels.get(0).toString()%></h3>
				<img src="images/<%=hotels.get(0).toString()%>.jpeg" alt="class-header-css3" width="550" height="250" class="alignnone size-full wp-image-172" />
				</div>
		                
                <div style="margin-left:50%; margin-top:-18%; height:30%; width:40%; background-color: rgba:(100,100,100,.2);">  
                
                <table class="table">
                    <%
                        for (int i = 0; i < hotels.size(); i++) {

                    %>
                    
                   
			<tr><td>Hotel Name :</td><td><%= hotels.get(i) %></td></tr>
			<tr><td>Address :</td><td><%= hotels.get(++i) %></td></tr>
			<tr><td>Area :</td><td><%= hotels.get(++i) %></td></tr>
			<tr><td>City :</td><td><%= hotels.get(++i) %></td></tr>
			<tr><td>Corner :</td><td><%= hotels.get(++i) %></td></tr>
			<tr><td>Email :</td><td><%= hotels.get(++i) %></td></tr>
			<tr><td>Phone :</td><td><%= hotels.get(++i) %></td></tr>
                    <%
                        }
                    %>
                </table>
                </div>
            </form>
                
                <div style="margin-left: 5%;margin-top:1%;  width: 400;">
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
 				String hname=hotels.get(0).toString();             
            	ArrayList<Integer> review=cn.getSelectedHotelCount(hname);
            	ArrayList<String> userReviews=cn.getSelectedHotelReviews(hname);
            	
                float taste=review.get(0);
            	float service=review.get(1);
                float amb=review.get(2);
            	float cost=review.get(3);
            	Float f= taste + service + amb + cost;
            	//out.println("total"+ f);
            	float t=(taste/f)*100;
            	float s=(service/f)*100;
            	float a=(amb/f)*100;
            	float c=(cost/f)*100;
            	
                %>
                
                
<div style="margin-top:-15%; margin-left:50%; height:30%; width:100%;">
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
          response.sendRedirect("Login.jsp");
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
        boolean save=cn.isSaveReview(hotels.get(0),session.getAttribute("userName").toString(),request.getParameter("review"));
        out.println(hotels.get(0));
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
<script type="text/javascript">
    location.href = 'UploadReview.jsp';
</script>
<%    }
%>       
</html>
