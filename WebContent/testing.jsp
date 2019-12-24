<%-- 
    Document   : testing
    Created on : Mar 3, 2016, 7:05:12 PM
    Author     : Nitesh-PC
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Classes.Retrive"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.ArrayList"%>
<%@include  file="AdminM.jsp" %>
<%@page import="java.io.FileReader"%>
<%@page import="sentiment.SentimentAnalysis"%>
<%@page import="sentiment.Classification"%>
<%@page import="sentiment.SentenceSeperator"%>
<%@page import="sentiment.Tocken"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="HotelCSS.css" rel="stylesheet" type="text/stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
 		<link rel="stylesheet" type="text/css" href="fontawesome/css/font-awesome.min.css" />
  		<link rel="stylesheet" type="text/css" href="js/lightbox/css/lightbox.min.css">
  		<link href="css/style.css" rel="stylesheet" type="text/css">
        <title>Segregation</title>
    </head>
    
   <body>
         
       <div class="container" style="margin-top:15%; height:70%; width:60%">
       <div class="table-responsive" style="background-color: rgba(150,160,100,.2);">
        <%
              conn.Connect cn=conn.Connect.getInstance();
              Retrive rt= new Retrive();
              TreeSet ts=cn.getOverAllHotels();
              Iterator it=ts.iterator();
            
              TreeSet ts1=cn.getOverAllUser();
              Iterator it1=ts1.iterator();
            
            
            
            %>
        
        <div class="table-responsive" style=" height:70%;"> 
            <form name="calculate" method="get">
            <table class="table" style="margin-left:20%;  width:25%;">
            <tr><td>Calculate Hotel Reviews : <td></tr>
                <tr><td><select name="hotel">
                    <option>--Select Hotel--</option>
                    <%while(it.hasNext()){%>
                    <option><%=it.next()%></option>
                    <%}%>
                </select></td></tr>
                <tr><td><input type="submit" name="sub" value="Calculate Reviews"></td></tr>
                <tr><td><input type="submit" name="hotelReviewCount" value="CountReview"></td></tr>
                </table>
                <table class="table" style="margin-left:45%; margin-top:-23%; width:25%;">
                <tr><td>Calculate Hotel Reviews : <td></tr>
               <tr><td> <select name="username">
                     <option>--Select User--</option>
                     <%while(it1.hasNext()){%>
                    <option><%=it1.next()%></option>
                    <%}%>
                </select></td></tr>
              <tr><td>  <input type="submit" name="user" value="UserReviewCalculate"></td></tr>
                <tr><td><input type="submit" name="userCount" value="UserReviewCount"></td></tr>
                </table>
            </form>
        </div>
       

        <%
            if (request.getParameter("sub") != null) {
                try {
                String hname=request.getParameter("hotel");
                if(!(hname.equals("--Select Hotel--")))
                {
                BufferedReader br = new BufferedReader(new FileReader("E:\\Lars\\"+hname+".txt"));
                
                    String line = "", str = "";
                    while ((line = br.readLine()) != null) {
                        str = line;
                        Tocken tk = new Tocken();
                        String tokendata = tk.tocken(str);
                        out.println(tokendata);
                        SentenceSeperator sep = new SentenceSeperator();
                        String sd = sep.seperate(str);
                        out.println(sd);
                        Classification cl = new Classification();
                        cl.classify(str);
                        SentimentAnalysis st = new SentimentAnalysis();
                        st.sentiment(str);
                    }
               
                } else{
                    %>
                    <script>
                    alert("Select Hotel First..!");
                    </script>
               <%  }
                
                }catch (Exception ex) {
                }
            }
                

            if (request.getParameter("user") != null) {
                
                String name=request.getParameter("username");
                ReviewLog.ReviewCount rc = new ReviewLog.ReviewCount();
                ArrayList<String> reviews = cn.getAllReview(name);
                
                BufferedWriter br1 = new BufferedWriter(new FileWriter("E:\\Lars\\PosNeg\\user.txt"));
                for (int i = 0; i < reviews.size(); i++) {
                	br1.write(" "+reviews.get(i));
                	out.println("Reviews: "+reviews.get(i));
                }
                br1.close();
                out.print(reviews.size());
                try {
                	BufferedReader br = new BufferedReader(new FileReader("E:\\Lars\\PosNeg\\user.txt"));
                    
                    String line = "", str = "";
                    while ((line = br.readLine()) != null) {
                        str = line;
                        Tocken tk = new Tocken();
                        String tokendata = tk.tocken(str);
                        out.println(tokendata);
                        SentenceSeperator sep = new SentenceSeperator();
                        String sd = sep.seperate(str);
                        out.println(sd);
                        Classification cl = new Classification();
                        cl.classify(str);
                        SentimentAnalysis st = new SentimentAnalysis();
                        st.sentiment(str);
                    }
               
                } catch (Exception ex) {
                }
            }

            if (request.getParameter("hotelReviewCount") != null) {
                try {
                    String path = "E:\\Lars\\RecWord\\foodpos.txt";
                    ReviewLog.ReviewCount rc = new ReviewLog.ReviewCount();
                    int taste = rc.countReview(path);
                    out.println("Taste : " + taste);

                    String path1 = "E:\\Lars\\RecWord\\servpos.txt";
                    int service = rc.countReview(path1);
                    out.println("Service: " + service);

                    String path2 = "E:\\Lars\\RecWord\\posamb.txt";
                    int amb = rc.countReview(path2);
                    out.println("Ambience:" + amb);

                    String path3 = "E:\\Lars\\RecWord\\poscost.txt";
                    int cost = rc.countReview(path3);
                    out.println("Cost:" + cost);
                    String hotelName = request.getParameter("hotel");
                    ReviewLog.HotelReviewCount rev = new ReviewLog.HotelReviewCount();
                    boolean check = cn.isHotelReviewUpdate(hotelName, taste, service, amb, cost);
                    if (check) {
        %>
        <script>
            alert("Review Added Success.");
        </script>
        <%
                    }

                } catch (Exception er) {
                    System.out.println(er);
                }
            }

            if (request.getParameter("userCount") != null) {
                try {
                    String path = "E:\\Lars\\RecWord\\foodpos.txt";
                    ReviewLog.ReviewCount rc = new ReviewLog.ReviewCount();
                    int taste = rc.countReview(path);
                    out.println("Taste : " + taste);

                    String path1 = "E:\\Lars\\RecWord\\servpos.txt";
                    int service = rc.countReview(path1);
                    out.println("Service: " + service);

                    String path2 = "E:\\Lars\\RecWord\\posamb.txt";
                    int amb = rc.countReview(path2);
                    out.println("Ambience:" + amb);

                    String path3 = "E:\\Lars\\RecWord\\poscost.txt";
                    int cost = rc.countReview(path3);
                    out.println("Cost:" + cost);
                    String userName = request.getParameter("username");
                    ReviewLog.HotelReviewCount rev = new ReviewLog.HotelReviewCount();

                    boolean check = cn.isUserReviewUpdate(userName, taste, service, amb, cost);
                    if (check) {
        %>
        <script>
            alert("Review Added Success.");
        </script>
        <%
                    }

                } catch (Exception er) {
                    System.out.println(er);
                }
            }


        %>
         </div>
        </div>
    </body>
</html>
