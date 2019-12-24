<%-- 
    Document   : userProfile
    Created on : Mar 6, 2016, 3:43:23 PM
    Author     : Nitesh-PC
--%>

<%@page import="java.util.NavigableSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="ReviewLog.ReviewCount"%>
<%@page import="java.util.TreeSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
        <link href="SlideShow.css" rel="stylesheet" type="text/css">
         <link href="Shapes.css" rel="stylesheet" type="text/css">
    </head>
   <body style="background-image: url('images/bg1.jpg');">
       <div class="container">
        <div class="table-responsive">
        
        <div class="css-slideshow">
            <%
              String uname=session.getAttribute("userName").toString();
              //Test  Recommendataion ...
                //1 Test , 2 Service. 3 Ambiance, 4 Cost
                String recomendHotel = "";
                ReviewCount rc = new ReviewCount();
                ArrayList arr1 = rc.getUserReviewCount(uname);
                //ArrayList arr1 = rc.getUserReviewCount("Nitesh");
                int temp = 0;
               // out.println(arr1);
                int max = 0;
                for (int i = 0; i < arr1.size(); i++) {
                    if (Integer.parseInt(arr1.get(i).toString()) > max) {
                        max = Integer.parseInt(arr1.get(i).toString());
                        temp = i;
                    }

                }

               // out.println("Max:" + max + "Pos:" + temp);
                TreeSet hname = new TreeSet();
                TreeSet ts = new TreeSet();
                Iterator it=null;
                
                
                if (temp == 0) {
                    TreeSet<Integer> ts1 = rc.getAllReviewTasteCountByHotel();
                    NavigableSet n=ts1.descendingSet();
                   // out.println("Taste Count : "+n);
                    Iterator tit = n.iterator();
                    while (tit.hasNext()) {
                        // out.println(al.get(4));
                        ReviewCount r = new ReviewCount();
                        ts = r.getAllHotelbyReview(Integer.parseInt(tit.next().toString()));
                        it=ts.iterator();
                        while(it.hasNext()){
                        String hotelname=it.next().toString();
                         %>  
                
                       <div class="text" style="margin-left:35%;">Recommended<span class="arrow"></span>
						</div><div style=" height:40px; width:22%; background-color: rgba(100,100,100,0.2);"><center><h2><%= hotelname%></h2></center></div>  
                         <figure style="margin-left: 35%;">
                    		<a href="HotelProfile.jsp?HotelName=<%=hotelname%>"><img src="images/<%=hotelname%>.jpeg" alt="class-header-css3" width="550" height="250" class="alignnone size-full wp-image-172" />
                    		</a>
                		</figure>
                    <br>
                <%
                        }
                    }
                

                }
                
                if (temp == 1) {
                	
                	TreeSet<Integer> ts2 = rc.getAllReviewServiceCountByHotel();
                	NavigableSet n=ts2.descendingSet();
                    //out.println("Service Count : "+n);
                    Iterator tit = n.iterator();
                    while (tit.hasNext()) {
                    	//out.println(tit.next());
                        // out.println(al.get(4));
                        ReviewCount r = new ReviewCount();
                        ts = r.getAllHotelbyService(Integer.parseInt(tit.next().toString()));
                        it=ts.iterator();
                        while(it.hasNext()){
                        String hotelname=it.next().toString();
                         %>  
                
                      <div> <div class="text">Recommended<span class="arrow"></span>
						</div><div style=" margin-left:20%;height:20px; width:50%; background-color: rgba(100,100,100,0.2);"><center><h3><%= hotelname%></h3></center></div></div>  
                         <figure>
                    		<a href="HotelProfileMob.jsp?HotelName=<%=hotelname%>"><img src="images/<%=hotelname%>.jpeg" alt="class-header-css3" width="100%" height="200" class="alignnone size-full wp-image-172" />
                    		</a>
                		</figure>
                    <br>
                <%
                    }
                    }
                    //out.println(hname);

                }
                
                
                
                if (temp == 2) {
                    
                     TreeSet<Integer> ts1 = rc.getAllReviewAmbiCountByHotel();
                       NavigableSet n=ts1.descendingSet();
                      // out.println("Ambaince Count : "+n);
                   
                    Iterator tit = n.iterator();
                    while (tit.hasNext()) {
                        // out.println(al.get(4));
                        ReviewCount r = new ReviewCount();
                        ts = r.getAllHotelbyAmbinace(Integer.parseInt(tit.next().toString()));
                       //out.println(ts);
                        it=ts.iterator();
                        while(it.hasNext()){
                        String hotelname=it.next().toString();
                         %>  
                       
                   <div class="text" style="margin-left:35%;">Recommended<span class="arrow"></span>
						</div><div style="margin-left:55%; margin-top:-15px; height:40px; width:22%; background-color: rgba(100,100,100,0.2);"><center><h2><%= hotelname%></h2></center></div>  
                         <figure style="margin-left: 35%;">
                    		<a href="HotelProfile.jsp?HotelName=<%=hotelname%>"><img src="images/<%=hotelname%>.jpeg" alt="class-header-css3" width="550" height="250" class="alignnone size-full wp-image-172" />
                    		</a>
                		</figure>
                    <br>
                <%
                        }
                    }

                }
                
                
                
                
                if (temp == 3) {

                    
                    TreeSet<Integer> ts1 = rc.getAllReviewCostCountByHotel();
                     NavigableSet n=ts1.descendingSet();
                     //out.println("Cost Count : "+n);
                    Iterator tit = n.iterator();
                    while (tit.hasNext()) {
                        // out.println(al.get(4));
                        ReviewCount r = new ReviewCount();
                        ts = r.getAllHotelbyPrice(Integer.parseInt(tit.next().toString()));
                       //out.println(ts);
                        it=ts.iterator();
                        while(it.hasNext()){
                        String hotelname=it.next().toString();
                         %>
                       <div class="text" style="margin-left:35%;">Recommended<span class="arrow"></span>
						</div><div style="margin-left:55%; margin-top:-15px; height:40px; width:22%; background-color: rgba(100,100,100,0.2);"><center><h2><%= hotelname%></h2></center></div>  
                         <figure style="margin-left: 35%;">
                    		<a href="HotelProfile.jsp?HotelName=<%=hotelname%>"><img src="images/<%=hotelname%>.jpeg" alt="class-header-css3" width="550" height="250" class="alignnone size-full wp-image-172" />
                    		</a>
                		</figure>
                    <br>
                <%
                        }
                    }
                    //out.println(hname);
                }
                
            %>
   
        </div>  


    </body>
</html>
s