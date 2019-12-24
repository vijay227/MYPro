<%-- 
    Document   : AllHotesls
    Created on : 24-Jan-2016, 23:22:41
    Author     : bidkar
--%>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>

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
   <body style="background-image: url('images/bg1.jpg');">
       <div class="container">
        <div class="table-responsive">
            <form  method="post" action="UploadReviewMob.jsp">
                  <center>  <h3>All Hotel Details</h3></center>
                    <table class="table" >
                        
                

                    <%

                        ArrayList<String> hotels = null;
                   		ArrayList<String> hotelCat=null;
                        Classes.Retrive r = new Classes.Retrive();
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
                            <tr><td>Restaurant Name : </td>
                            <td><%=hotelCat.get(j)%> </td></tr>
                            <tr><td>Address : </td>
                            <td><%=hotelCat.get(++j)%></td></tr>
                            <tr><td>City : </td>
                            <td><%=hotelCat.get(++j)%></td></tr>
                            <tr><td>Area : </td>
                            <td><%=hotelCat.get(++j)%></td></tr>
                            <tr><td>Corner : </td>
                            <td><%=hotelCat.get(++j)%></td></tr>
                            <tr><td>Click here to Show Details : </td> 
                    		 <tr><td><input type="submit" name="Show_Detail" value="<%=hotelCat.get(m)%>"id="see<%=m%>"></td> </tr>                 
                       
                        <% 
                        m += 5;
                            }
                         		
                        }

						
						if (rname!=null) {
                            hotels = r.getAllHotelsByRname(rname);

                        }
                      //  out.println(rname);
                        if (request.getParameter("go") != null) {
                            hotels = r.getAllHotelsByArea(area);

                        }
                        if (area.equals("--Select Area--") && request.getParameter("go") != null) {
                            //out.println("show by only city");
                            String city = session.getAttribute("city").toString();
                            hotels = r.getAllHotelsByCity(city);
                        }

                    %>            
               
                        <%                    int k = 0;
                            for (int i = 0; i < hotels.size(); i++) {

                        %>
                  
                        <tr><td>Restaurant Name : </td>
                           <td><%=hotels.get(i)%> </td></tr>
                          <tr><td>Address : </td>
                            <td><%=hotels.get(++i)%></td></tr>
                            <tr><td>City : </td>
                            <td><%=hotels.get(++i)%></td></tr>
                             <tr><td>Area : </td>
                           <td><%=hotels.get(++i)%></td></tr>
                              <tr><td>Corner : </td>
                            <td><%=hotels.get(++i)%></td></tr>
                            <tr><td>Click here to Show Details : </td></tr>
                           <tr> <td><input type="submit" name="Show_Detail" value="<%=hotels.get(k)%>"id="see<%=k%>"></td> </tr>                   
                       
                        <%  
                        k += 5;
                            }
                        %>
                    </table>
                  
            </form>
        </div>
        </div>
</html>
