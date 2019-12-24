<%-- 
    Document   : SearchHotels
    Created on : Feb 24, 2016, 3:02:52 PM
    Author     : Nitesh-PC
    userindex page from lars
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

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
<body style="background-image: url('images/bg1.jpg');">
       <center>
       <h3>Search Hotels</h3>
        <div class="container">
        <div class="table-responsive">
            <form name="city" method="post"> 

                    <%
                        try {
                            Classes.Retrive rt = new Classes.Retrive();
                             TreeSet<String> arr = rt.getAllCity();
                             Iterator it=arr.iterator();
                            //out.println(arr.size());
%>
                    <div>Select City </div>
                
                    <%                    if (session.getAttribute("city") != null) {
                            session.setAttribute("city", request.getParameter("city"));
                        }
                    %>
                    <div>
                        <select name="city" value="" placeholder="select city" Style="width:200px;" onchange="document.city.submit();">
						
                            <%
                                String c = request.getParameter("city");
                                session.setAttribute("city", c);
                                if (c != null) {
                            %>
                             
                            <option><%= c%></option>
                            <%
                                }
                                else{
                                	%>
                                	<option>--Select City--</option>
                                	<%
                                }

                                   while(it.hasNext()){
                                    String temp=it.next().toString();
                                    if (temp.equals(c)) {
                                        continue;
                                    }

                            %>
                            <option><%=temp %></option>
                            <%
                                }
                            %>
                        </select>

                    </div> 
                </div>
            </form>

            <%
                session.setAttribute("city", c);
            %>
            <form name="area" method="get" action="AllHotelsMob.jsp">

                <%
                    String city = request.getParameter("city");
                    TreeSet arr1 = rt.getAllAreaCity(city);
                    Iterator it1= arr1.iterator();


                %>

                <div class="table-responsive">
                    Select Area:
                </div>
                <div class="table-responsive">
                    <select name="area" value="" Style="width:200px;">
                        <option>--Select Area--</option>
                        <%                                while(it1.hasNext()) {
                        %>
                        <option><%=it1.next()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                 <div class="table-responsive"><input type="submit" name="go" value="Show" onclick="" style="width:100px;"/></div>
              
                <div class="table-responsive"><input type="text" name="hotel" id="hotel" placeholder="Enter hotel name" Style="width:200px;" /></div>
                <div class="table-responsive">  <input type="submit" name="show" value="Show Details" style="width:100px;"/></div>
                   
                  
                    <div>
                  
                    <select name="category" Style="width:200px;">
                    <option>--Select Category--</option>
                    <option>Breakfast</option>
                    <option>Meal</option>
                    <option>Pizza/Burger</option>
                    <option>Street Food</option>
                    <option>Chinese</option>
                    <option>Dessert</option>
                    <option>Cafe & Drink</option>
                    <option>Sea Food</option>
                    </select>
                   
                    </div>
   <div class="table-responsive"> </div>
                   <input type="submit" name="searchCategory" value="Search" style="width:100px;">
                    
 
            </form>

            <%
                    if (request.getParameter("go") != null) {

                        session.setAttribute("userName", "");   
                        response.sendRedirect("AllHotelsMob.jsp");
                 
                    }
            
            
            		if(request.getParameter("searchCategory")!=null)
            		{
            			response.sendRedirect("AllHotelsMob.jsp");
            		}
            

                } catch (Exception er) {
                    out.println("" + er);
                }

            %>
     
        </div>
        </center> 
    </body>
</html>
