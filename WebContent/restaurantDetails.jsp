<%@page import="java.io.File"%>
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
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <title>Restaurant Details</title>
        <meta charset="UTF-8">
       
        
    </head>
    <body>      
        <div style="margin-top: 100px;margin-left: 50px"> <!-- start of contents --> 
            <center><h2><span>Restaurant Details </span></h2></center>
            <div id="menus">

                <%

                    //Classes.Retrive data = new Classes.Retrive();
                     conn.Connect cn=conn.Connect.getInstance();
                    ArrayList<String> detail = cn.getAllHotelDetails();
					//out.println(" "+detail);
                %>

                <form action="" method="post" name="select">
                    <table border="4" id="table1" width="900px" height="auto" >
                        <tr>
                            <td>Select Restaurant</td>
                            <td>Restaurant Name</td>
                            <td>Address</td>
                            <td>Area</td>
                            <td>City</td>
                            <td>Corner</td>
                            <td>Email</td>
                            <td>Phone</td>
                        </tr>
                        <%       
                             //out.println(detail.size());
                    int k=0;
                            for (int i = 0; i < detail.size(); i++) {
                            	//out.println(" "+detail.get(i));
                   %>		
						 <tr>
                            <td><input type="checkbox" name="check<%=k %>" value="<%=detail.get(i)%>" /></td>
                            <td><input type="text" name="rname<%=k %>" value="<%=detail.get(i)%>" id="rname" readonly=""> </td>
                            <td><input type="text" name="address<%=k %>" value="<%=detail.get(++i)%>" id="address"> </td>
                            <td><input type="text" name="area<%=k %>" value="<%=detail.get(++i)%>" id="area"> </td>
                            <td><input type="text" name="city<%=k %>" value="<%=detail.get(++i)%>" id="city"> </td>                               
                            <td><input type="text" name="corner<%=k %>" value="<%=detail.get(++i)%>" id="corner"> </td>
                            <td><input type="text" name="email<%=k %>" value="<%=detail.get(++i)%>" id="email"> </td>
                            <td><input type="text" name="phone<%=k %>" value="<%=detail.get(++i)%>" id="phone"> </td>
                       </tr>
                        <%
                        k++;
                            }
                        %>
                        <tr><td colspan="4"><input type="submit" name="delete" value="Delete"/></td>
                            <td colspan="4"><input type="submit" name="update" value="Update"/></td></tr>
                    </table>

                </form>	
                      <%  
                            
                      //Classes.DeleteClass dc= new Classes.DeleteClass();
                      if(request.getParameter("update")!=null){
                 		int k1=0;	
                          for(int i=0;i<detail.size();i++){
                          if(request.getParameter("check"+i)!=null){
						//out.println("Value : " +i);	                    	
                         String hotel=request.getParameter("rname"+i);
                         String address=request.getParameter("address"+i);
                         String area=request.getParameter("area"+i);
                         String city=request.getParameter("city"+i);
                         String corner=request.getParameter("corner"+i);                        
                         String email=request.getParameter("email"+i);
                         String phone=request.getParameter("phone"+i);
                         k1++;
                        // ReviewLog.HotelReviewCount rev = new ReviewLog.HotelReviewCount();
                     //    out.println(hotel+" "+address+" "+ area+" "+city+" "+corner+"  "+ email+" "+phone);
                        boolean check = cn.isRestaurantUpdate(hotel, address, area, city, corner, email, phone);
                         if (check) {
            				 %>
           				  <script>
                 			alert("Details updated Successfully...!");
                 			location.href("restaurantDetails.jsp");
            			 	</script>
             				<%
                         }
                         
                         
                          }
                          }
                      }
                            if(request.getParameter("delete")!=null){
                                for(int i=0;i<detail.size();i++){
                                if(request.getParameter("check"+i)!=null){
                                   //out.println(request.getParameter("check"+i));
                                   boolean check=cn.isDelete(request.getParameter("check"+i));
                                  if(check){
                                  String filname=request.getParameter("check"+i);
                                  File f=new File("D:\\"+filname+".txt");
                                  f.delete();
                                      %>
                                      <script type="text/javascript">
                                          alert("Record Deleted");
                                          location.href='restaurantDetails.jsp';
                                      </script>
                                      <%
                                  }
                                  
                                //out.println(request.getParameter("check"+i));                                  
                                }
                                    
                            }
                          
                            }
                          
                          %>
            </div>
        </div> <!-- end of footer -->
    </body>
</html>