<%-- 
    Document   : AllHotesls
    Created on : 24-Jan-2016, 23:22:41
    Author     : bidkar
--%>

<%@page import="conn.Connect"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>
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
        <link href="css/newcss.css" rel="stylesheet" type="text/css">
    </head>
    <body>

    

        <div style="margin-top:100px; margin-left: 10%; background-color: rgba(150,160,100,.2); height: 550px; width: 80%;">

            <form  method="post" style="margin-top: 50px; margin-left: 100px;" action="UploadReview.jsp">
                     <center><h2>All Hotel Details</h2></center>
                    <table border="4" align="center"  style="margin-left: -3%;width:90%; height: auto;">
                        <tr>                            
                            <td>Restaurant Name</td>
                            <td>Address</td>
                            <td>City</td>
                            <td>Area</td>
                            <td>Corner</td>
                            <td>Click here to Show Details </td>
                        </tr>
                

                    <%

                        ArrayList<String> hotels = null;
                   		ArrayList<String> hotelCat=null;
                        Classes.Retrive r = new Classes.Retrive();
                        conn.Connect cn=conn.Connect.getInstance();
                        String rname = request.getParameter("hotel");
                        String area = request.getParameter("area");
						String category=request.getParameter("category");	
                        
						if (category!=null) {
							ArrayList<String> arr=r.getSelectedHotelsByCategory(category);
						//	out.println(arr);
							hotelCat=r.getHotelsDetailsByCategory(arr);
							//out.println(hotelCat);
					        int m = 0;
                            for (int j = 0; j< hotelCat.size(); j++) {

                        %>
                        <tr>
                            <td><%=hotelCat.get(j)%> </td>
                            <td><%=hotelCat.get(++j)%></td>
                            <td><%=hotelCat.get(++j)%></td>
                            <td><%=hotelCat.get(++j)%></td>
                            <td><%=hotelCat.get(++j)%></td>
                             <td><input type="submit" name="Show_Detail" value="<%=hotelCat.get(m)%>"id="see<%=m%>"></td>                  
                        </tr>
                        <% 
                        m += 5;
                            }
                         		
                        }

						
						if (rname!=null) {
                            hotels = cn.getAllHotelsByRname(rname);

                        }
                      //  out.println(rname);
                        if (request.getParameter("go") != null) {
                            hotels = cn.getAllHotelsByArea(area);

                        }
                        if (area.equals("--Select Area--") && request.getParameter("go") != null) {
                            //out.println("show by only city");
                            String city = session.getAttribute("city").toString();
                            hotels = cn.getAllHotelsByCity(city);
                        }

                    %>            
               
                        <%                    int k = 0;
                            for (int i = 0; i < hotels.size(); i++) {

                        %>
                        <tr>
                            <td><%=hotels.get(i)%> </td>
                            <td><%=hotels.get(++i)%></td>
                            <td><%=hotels.get(++i)%></td>
                            <td><%=hotels.get(++i)%></td>
                            <td><%=hotels.get(++i)%></td>
                           
                           
                            <td><input type="submit" name="Show_Detail" value="<%=hotels.get(k)%>"id="see<%=k%>"></td>                   
                        </tr>
                        <%  
                        k += 5;
                            }
                        %>
                    </table>
            </form>
        </div>
</html>
