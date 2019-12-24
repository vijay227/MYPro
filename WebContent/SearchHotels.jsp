<%-- 
    Document   : SearchHotels
    Created on : Feb 24, 2016, 3:02:52 PM
    Author     : Nitesh-PC
    userindex page from lars
--%>

<%@page import="conn.Connect"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <div style="margin-top:120px; margin-left: 100px; background-color: rgba(150,160,100,.2); height: 500px; width: 550px;">
            <form name="city" method="post"> 
                <br>
                <div>

                    <%
                        try {
                           // Classes.Retrive rt = new Classes.Retrive();
                            conn.Connect cn=conn.Connect.getInstance();
                             TreeSet<String> arr = cn.isGetAllCities();
                             Iterator it=arr.iterator();
                            //out.println(arr.size());
%>
                    <div style="margin-top:50px; width: 150px; margin-left: 100px;" >Select City </div>
                
                    <%                    if (session.getAttribute("city") != null) {
                            session.setAttribute("city", request.getParameter("city"));
                        }
                    %>
                    <div style="margin-top:20px; width: 150px; margin-left: 100px;">
                        <select name="city" value="" placeholder="select city" width="200px" onchange="document.city.submit();">
						
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
            <form name="area" method="get" action="AllHotesls.jsp">

                <%
                    String city = request.getParameter("city");
                    TreeSet<String> arr1 = cn.isGetCitiAllArea(city);
                    Iterator it1= arr1.iterator();


                %>

                <div style="margin-top:30px; width: 150px; margin-left: 100px;">
                    Select Area:
                </div>
                <div style="margin-top:30px; width: 150px; margin-left: 100px;">
                    <select name="area" value="" width="100px">
                        <option>--Select Area--</option>
                        <%                                while(it1.hasNext()) {
                        %>
                        <option><%=it1.next()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                        <div style="margin-top:10px; width: 150px; margin-left: 370px;"></div>
                <div style="margin-top:-170px; width: 150px; margin-left: 370px;"><input type="text" name="hotel" id="hotel" placeholder="Enter hotel name" />
                    <div style="margin-top:170px; width: 150px; margin-left: -250px;"><input type="submit" name="go" value="Show" onclick="" width="50px"/></div>
                  
                    <div >
                  
                    <select name="category">
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
                    <input type="submit" name="searchCategory" value="Search">
                    </div>
   
                  
                    <div style="margin-top:-190px; width: 150px; margin-left: px;">  <input type="submit" name="show" value="Show Details" width="100px"/></div>
   </div></div>
            </form>

            <%
                    if (request.getParameter("go") != null) {

                        session.setAttribute("userName", "");   
                        response.sendRedirect("AllHotesls.jsp");
                 
                    }
            
            
            		if(request.getParameter("searchCategory")!=null)
            		{
            			response.sendRedirect("AllHotels.jsp");
            		}
            

                } catch (Exception er) {
                    out.println("" + er);
                }

            %>
     
        </div> 
    </body>
</html>
