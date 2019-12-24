package conn;

import java.net.UnknownHostException;
import java.sql.DriverManager;
import com.mysql.jdbc.Connection;

import java.sql.*;
import java.util.ArrayList;
import java.util.TreeSet;


public class Connect {

	public static Connect connect;
	public Connection conn;
	public PreparedStatement stmt;
	public ResultSet rs;
	private Connect()
	{
	
	 try {
         Class.forName("com.mysql.jdbc.Driver");
         conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelrecomendation", "root", "root");
         System.out.println("Connected conn");
	 } catch (Exception e) {
         System.out.println("There is problem to establish connection" + e.toString());
       
     }
 }

 public static Connect getInstance() throws Exception {
     if (connect == null) {
         connect = new Connect();
     }
     return connect;
 }

 public Connection getConn() throws Exception {
     return conn;
 }
 /*
 public static void main(String arg[]) throws Exception
 {
	
	 Connection conn=null;
	 Connect  cnt;
	 cnt=Connect.getInstance();
	 conn=cnt.getConn();
	 
	 
 }*/

 
 public boolean isRegister(String uname,String email, String pwd, String gender, String mob)throws Exception
 {
	
	 Connect  cnt=Connect.getInstance();
	 conn=cnt.getConn();
	 
	 stmt=conn.prepareStatement("insert into registration values(0,?,?,?,?,?)");
	 
	 stmt.setString(1, uname);
	 stmt.setString(2, email);
	 stmt.setString(3, pwd);
	 stmt.setString(4, gender);
	 stmt.setString(5, mob);
	 int status=stmt.executeUpdate();
	 if(status>0)
	 {
	 return true;
	 }
	 return false;
 }

 public boolean isDefaultHotelReviewCount(String hname)throws Exception
 {
	
	 Connect  cnt=Connect.getInstance();
	 conn=cnt.getConn();
	 
	 stmt=conn.prepareStatement("insert into hotelreviewcount values(0,?,?,?,?,?)");
	 
	 stmt.setString(1, hname);
	 stmt.setInt(2, 0);
	 stmt.setInt(3, 0);
	 stmt.setInt(4, 0);
	 stmt.setInt(5, 0);
	 int status=stmt.executeUpdate();
	 if(status>0)
	 {
	 return true;
	 }
	 return false;
 }

 
 public boolean isValidateLogin(String uname,String pass)throws Exception
 {
	 stmt=conn.prepareStatement("select * from registration where uname=? and password=?");
	 stmt.setString(1, uname);
	 stmt.setString(2, pass);
	 rs=stmt.executeQuery();
	 if(rs.next())
	 {
		 return true;
	 }
	 
	 return false;
 }
 
 
 public boolean isAddRestaurnat(String rname,String address, String area, String city, String corner, String email, String phone)throws Exception
 {
	
	 Connect  cnt=Connect.getInstance();
	 conn=cnt.getConn();
	 
	 stmt=conn.prepareStatement("insert into addrestaurant values(0,?,?,?,?,?,?,?)");
	 stmt.setString(1, rname);
	 stmt.setString(2, address);
	 stmt.setString(3, area);
	 stmt.setString(4, city);
	 stmt.setString(5, corner);
	 stmt.setString(6, email);
	 stmt.setString(7, phone);
	 int status=stmt.executeUpdate();
	 if(status>0)
	 {
	 return true;
	 }
	 return false;
 }
 
 
 public boolean isAddCategory(String query)throws Exception
 {
	
	 Connect  cnt=Connect.getInstance();
	 conn=cnt.getConn();
	  stmt=conn.prepareStatement(query);
	// stmt.setString(1,"true");
	 //stmt.setString(2,"Gautami");
      int status=stmt.executeUpdate();
	 if(status>0)
	 return true;
	 
	 return false;
	
 }
 
 public TreeSet<String> isGetAllCities()throws Exception
 {
	 TreeSet<String> ts=new TreeSet();
	 stmt=conn.prepareStatement("select city from addrestaurant");
	 rs=stmt.executeQuery();
	 while(rs.next())
	 {
		 ts.add(rs.getString(1));
		 
	 }
	 return ts;

 }
 
 public TreeSet<String> isGetCitiAllArea(String city)throws Exception
 {
	 TreeSet<String> ts=new TreeSet();
	 stmt=conn.prepareStatement("select area from addrestaurant where city=?");
	 stmt.setString(1, city);
	 rs=stmt.executeQuery();
	 while(rs.next())
	 {
		 ts.add(rs.getString(1));
		 
	 }
	 return ts;

 }
 
 
 public ArrayList<String> getAllHotelsByRname(String rname)throws Exception
 {
	 ArrayList <String> arr=new ArrayList();
	 stmt=conn.prepareStatement("select * from addrestaurant where rname=?");
	 stmt.setString(1, rname);
	 rs=stmt.executeQuery();
	 while(rs.next())
	 {
		 arr.add(rs.getString(2));
		 arr.add(rs.getString(3));
		 arr.add(rs.getString(4));
		 arr.add(rs.getString(5));
		 arr.add(rs.getString(6)); 
	 }
	 return arr;

 }
 
 
 
 
 public ArrayList<String> getSelectedHotelsByCategory(String category)throws Exception
 {
	 ArrayList <String> arr=new ArrayList();
	 stmt=conn.prepareStatement("select rname from addcategory where '"+category+"'=?");
	 stmt.setString(1,"true");
	 rs=stmt.executeQuery();
	 while(rs.next())
	 {
		 arr.add(rs.getString(2));
		 arr.add(rs.getString(3));
		 arr.add(rs.getString(4));
		 arr.add(rs.getString(5));
		 arr.add(rs.getString(6)); 
	 }
	 return arr;

 }
 
 
 
 
 
 
 
 
 public ArrayList<String> getAllHotelsByCity(String city)throws Exception
 {
	 ArrayList <String> arr=new ArrayList();
	 stmt=conn.prepareStatement("select * from addrestaurant where city=?");
	 stmt.setString(1, city);
	 rs=stmt.executeQuery();
	 while(rs.next())
	 {
		 arr.add(rs.getString(2));
		 arr.add(rs.getString(3));
		 arr.add(rs.getString(4));
		 arr.add(rs.getString(5));
		 arr.add(rs.getString(6));
		


		 
	 }
	 return arr;

 }
  
 
 
 public ArrayList<String> getAllHotelsByArea(String area)throws Exception
 {
	 ArrayList <String> arr=new ArrayList();
	 stmt=conn.prepareStatement("select * from addrestaurant where area=?");
	 stmt.setString(1, area);
	 rs=stmt.executeQuery();
	 while(rs.next())
	 {
		 arr.add(rs.getString(2));
		 arr.add(rs.getString(3));
		 arr.add(rs.getString(4));
		 arr.add(rs.getString(5));
		 arr.add(rs.getString(6));
		
	 }
	 return arr;

 }
 
 
 public ArrayList<String> getHotelDetails(String area)throws Exception
 {
	 ArrayList <String> arr=new ArrayList<String>();
	 stmt=conn.prepareStatement("select * from addrestaurant where area=?");
	 stmt.setString(1, area);
	 rs=stmt.executeQuery();
	 while(rs.next())
	 {
		 arr.add(rs.getString(2));
		 arr.add(rs.getString(3));
		 arr.add(rs.getString(4));
		 arr.add(rs.getString(5));
		 arr.add(rs.getString(6));
		 arr.add(rs.getString(7));
		 arr.add(rs.getString(8));
		
	 }
	 return arr;

 }
 
 
 
 public ArrayList<String> getHotelDetailsByHotel(String rname)throws Exception

 {
	 ArrayList <String> arr=new ArrayList<String>();
	 stmt=conn.prepareStatement("select * from addrestaurant where rname=?");
	 stmt.setString(1, rname);
	 rs=stmt.executeQuery();
	 while(rs.next())
	 {
		 arr.add(rs.getString(2));
		 arr.add(rs.getString(3));
		 arr.add(rs.getString(4));
		 arr.add(rs.getString(5));
		 arr.add(rs.getString(6));
		 arr.add(rs.getString(7));
		 arr.add(rs.getString(8));
		
	 }
	 return arr;

 }
 
 
 
 
 
 
 
 

 public ArrayList<Integer> getSelectedHotelCount(String rname)throws Exception
 {
	 ArrayList<Integer> arr=new ArrayList();
	 stmt=conn.prepareStatement("select * from hotelreviewcount where hname=?");
	 stmt.setString(1, rname);
	 rs=stmt.executeQuery();
	 if(rs.next())
	 {
		 arr.add(rs.getInt(3));
		 arr.add(rs.getInt(4));
		 arr.add(rs.getInt(5));
		 arr.add(rs.getInt(6));
		
		
	 }
	 return arr;

 }
 

 public ArrayList<String> getSelectedHotelReviews(String rname)throws Exception

 {
	 ArrayList<String> arr=new ArrayList<String>();
	 stmt=conn.prepareStatement("select * from hotelreview where hname=?");
	 stmt.setString(1, rname);
	 rs=stmt.executeQuery();
	 while(rs.next())
	 {
		 arr.add(rs.getString(2));
		 arr.add(rs.getString(3));
		 
		
	 }
	 return arr;

 }
 
 
 
 public boolean isDelete(String name){
     
	    try{ 
	    	 stmt=conn.prepareStatement("delete from addrestaurant where rname=?");
	    	 stmt.setString(1, name);
	    	 int status=stmt.executeUpdate();
	    	 if(status>0)
	    	 {
	    		 return true;
	    	 }
	    	
	    }
	    catch(Exception er)
	    {
	    	
	    }
	    return false;
 }
 
 
 
 
 


public TreeSet<String> getOverAllHotels() {
         TreeSet arr1 = new TreeSet();   
     try {
            
            stmt=conn.prepareStatement("select * from addrestaurant");
       	 rs=stmt.executeQuery();
       	 while(rs.next())
       	 {
       		 arr1.add(rs.getString(2));
       		 
       		 
       		
       	 }
            
        } catch (Exception er) {
        }
        return arr1;
    }


public TreeSet<String> getOverAllUser() {
    TreeSet arr1 = new TreeSet();   
try {
       
       stmt=conn.prepareStatement("select * from login_table");
  	 rs=stmt.executeQuery();
  	 while(rs.next())
  	 {
  		 arr1.add(rs.getString(2));
  		 
  		 
  		
  	 }
       
   } catch (Exception er) {
   }
   return arr1;
}


 public boolean isRestaurantUpdate(String hotel, String address, String area, String city, String  corner, String email, String phone){
     
	    try{ 
	    	 stmt=conn.prepareStatement("update addrestaurant set rname=?,address=?,area=?,city=?, corner=?,email=?,phone=? where rname='"+hotel+"'");
	    	 stmt.setString(1,hotel);
	    	 stmt.setString(2,address);
	    	 stmt.setString(3,area);
	    	 stmt.setString(4,city);
	    	 stmt.setString(5,corner);
	    	 stmt.setString(6,email);
	    	 stmt.setString(7,phone);
	    	 int status=stmt.executeUpdate();
	    	 if(status>0)
	    	 {
	    		 return true;
	    	 }
	    	
	    }
	    catch(Exception er)
	    {
	    	
	    }
	    return false;
 }
 
 
 
 public ArrayList<String> getAllHotelDetails()throws Exception

 {
	 ArrayList<String> arr=new ArrayList<String>();
	 stmt=conn.prepareStatement("select * from addrestaurant");
	 rs=stmt.executeQuery();
	 while(rs.next())
	 {
		 arr.add(rs.getString(2));
		 arr.add(rs.getString(3));
		 arr.add(rs.getString(4));
		 arr.add(rs.getString(5));
		 arr.add(rs.getString(6));
		 arr.add(rs.getString(7));
		 arr.add(rs.getString(8));
		 
		
	 }
	 return arr;

 }

 
 
 
 
 public boolean isSaveReview(String hotelName, String userName, String review ) throws UnknownHostException
 {
  try{
 
	  
	     Connect  cnt=Connect.getInstance();
		 conn=cnt.getConn();
		 
		 stmt=conn.prepareStatement("insert into hotelreview values(?,?,?)");
		 
		 stmt.setString(1, hotelName);
		 stmt.setString(2, userName);
		 stmt.setString(3, review);
		 																																																														
		 int status=stmt.executeUpdate();
		 if(status>0)
		 {
		 return true;
		 }
		 return false;
 
 
 
  }catch(Exception er)
  {
	  
  }
  return false;
 }
 
 
 
 
 public ArrayList getUserReviewCount(String uname) {
	 ArrayList<String> arr=new ArrayList<String>();
     try {
    	  stmt=conn.prepareStatement("select * from userreviewcount"); 
    	 rs=stmt.executeQuery();
    	 while(rs.next())
    	 {
    		 arr.add(rs.getString(2));
    		 arr.add(rs.getString(3));
    		 arr.add(rs.getString(4));
    		 arr.add(rs.getString(5));
    		
    	 }
    	 return arr;
    	 
    } catch (Exception er) {
    }
    return null;
}

 
// ------------------------------------------------------------------------
 
 public TreeSet<Integer> getAllReviewTasteCountByHotel() {
     TreeSet<Integer> arr = new TreeSet();
     try {
 
    	 stmt=conn.prepareStatement("select tasteCount from hotelreviewcount"); 
    	 rs=stmt.executeQuery();
    	 while(rs.next())
    	 {
    		 arr.add(rs.getInt(1));
    		
    	 }
    	 return arr;
    	      } catch (Exception er) {
     }
     return arr;
 }
 

 public TreeSet getAllHotelbyReview(int count) {
       TreeSet arr=null;
       try {
          arr = new TreeSet();
          stmt=conn.prepareStatement("select hname from hotelreviewcount where tasteCount='"+count+"'"); 
     	 rs=stmt.executeQuery();
     	 while(rs.next())
     	 {
     		 arr.add(rs.getString(1));
     		
     	 }
     	 return arr;
      } catch (Exception er) {
      }
      return arr;
  }

//-----------------------------------------------Service Counter----------------------------------------------------------------------------- 
 
 public TreeSet getAllHotelbyService(int service) {
     TreeSet arr=null;
     try {
        arr = new TreeSet();
        stmt=conn.prepareStatement("select hname from hotelreviewcount where tasteCount='"+service+"'"); 
   	 rs=stmt.executeQuery();
   	 while(rs.next())
   	 {
   		 arr.add(rs.getInt(1));
   		
   	 }
   	 return arr;
    } catch (Exception er) {
    }
    return arr;
}

 
 
 
 
 
 
 public TreeSet<Integer> getAllReviewServiceCountByHotel() {
     TreeSet<Integer> arr = new TreeSet();
     try {
 
    	 stmt=conn.prepareStatement("select serviceCount from hotelreviewcount"); 
    	 rs=stmt.executeQuery();
    	 while(rs.next())
    	 {
    		 arr.add(rs.getInt(1));
    		
    	 }
    	 return arr;
    	      } catch (Exception er) {
     }
     return arr;
 }

 
 
 
 //---------------------------------------------Ambiance Counter------------------------------------------------------------------------------------
 
 
 
 
 public TreeSet<Integer> getAllReviewambCountByHotel() {
     TreeSet<Integer> arr = new TreeSet();
     try {
 
    	 stmt=conn.prepareStatement("select ambianceCount from hotelreviewcount"); 
    	 rs=stmt.executeQuery();
    	 while(rs.next())
    	 {
    		 arr.add(rs.getInt(1));
    		
    	 }
    	 return arr;
    	      } catch (Exception er) {
     }
     return arr;
 }

 
 
 
 
 
 
 
 public TreeSet getAllHotelByAmbiCount(int ambiance) {
     TreeSet arr=null;
     try {
        arr = new TreeSet();
        stmt=conn.prepareStatement("select ambianceCounter from hotelreviewcount where ambianceCount='"+ambiance+"'"); 
   	 rs=stmt.executeQuery();
   	 while(rs.next())
   	 {
   		 arr.add(rs.getInt(1));
   		
   	 }
   	 return arr;
    } catch (Exception er) {
    }
    return arr;
}
 
 
 
 //----------------------------------------Cost Counter----------------------------------------------
 
 
 
 

 public String getAllReviewCostCountByHotel(int cost) {
     TreeSet arr=null;
     try {
    	 arr = new TreeSet();
         stmt=conn.prepareStatement("select hname from hotelreviewCount where costCount='"+cost+"'"); 
    	 rs=stmt.executeQuery();
    	 while(rs.next())
    	 {
    		return rs.getString(1).toString();
    		
    	 }
     
    } catch (Exception er) {
    }
     return null;
}
 
 
 
 

 public TreeSet getAllHotelbyPrice() {
     TreeSet arr=null;
     try {
        arr = new TreeSet();
        stmt=conn.prepareStatement("select costCount from hotelreviewcount"); 
   	 rs=stmt.executeQuery();
   	 while(rs.next())
   	 {
   		 arr.add(rs.getInt(1));
   		
   	 }
   	 return arr;
    } catch (Exception er) {
    }
    return arr;
}
 
 
 //====================================================================================================================================
 
 
 public ArrayList<String> getUserDetails(String uname) {
	 ArrayList arr=null;
     try {
    	 
         arr = new ArrayList();
         stmt=conn.prepareStatement("select email,gender,phone from registration where uname='"+uname+"'"); 
       	 rs=stmt.executeQuery();
       	 while(rs.next())
       	 {
       		 arr.add(rs.getString(1).toString());
       		 arr.add(rs.getString(2).toString());
       		 arr.add(rs.getString(3).toString());
       		 	
       		
       	 }
       	 return arr;
    
     } catch (Exception er) {
     }
     return arr;
 }
 
 
 
 
 
 
 public ArrayList<Integer> getSelectedUserCount(String uname) {
	 ArrayList arr=null;
     try {
         arr = new ArrayList();
         stmt=conn.prepareStatement("select * from userreviewcount where uname='"+uname+"'"); 
       	 rs=stmt.executeQuery();
       	 while(rs.next())
       	 {
       		 arr.add(rs.getInt(2));
       		 arr.add(rs.getInt(3));
       		 arr.add(rs.getInt(4));
       		 arr.add(rs.getInt(5));
       		 
       		
       	 }
       	 return arr;
       
     } catch (Exception er) {
     }
     return arr;
 }
 
 
 public ArrayList<String> getSelectedUserReviews(String uname) {
	 ArrayList arr=null;
     try {

         arr = new ArrayList();
         stmt=conn.prepareStatement("select * from HotelReview where uname='"+uname+"'"); 
       	 rs=stmt.executeQuery();
       	 while(rs.next())
       	 {
       		 arr.add(rs.getString(1));
       		 arr.add(rs.getString(3));

       	 }
     } catch (Exception er) {
     }
     return arr;
 }
 

 
 //===========================================================Hotel Profile==========================================================
 
 
 public ArrayList<String> getSelectedHotelsDetails(String rname) {
	 ArrayList arr=null;
 
     try {

         arr = new ArrayList();
         
         stmt=conn.prepareStatement("select * from AddRestaurant where rname='"+rname+"'"); 
       	 rs=stmt.executeQuery();
       	 while(rs.next())
       	 {
       		 
       		 arr.add(rs.getString(2));
       		 arr.add(rs.getString(3));
       		 arr.add(rs.getString(4));
       		 arr.add(rs.getString(5));
       		 arr.add(rs.getString(6));
       		 arr.add(rs.getString(7));
       		arr.add(rs.getString(8));
         
  }
       	 return arr;
     } catch (Exception er) {
     }
     return arr;
 }

//=====================================================================Review Upload============================================================== 
 
 public boolean isHotelReviewUpdate(String Hname,int taste, int service, int ambiance, int cost) throws UnknownHostException
 {
     try{
	 Connect  cnt=Connect.getInstance();
	 conn=cnt.getConn();
	 
	 stmt=conn.prepareStatement("update hotelreviewcount set tasteCount=?, serviceCount=?, ambianceCount=?, costCount=? where hname='"+Hname+"'");
	 
	 
	 stmt.setInt(1,taste);
	 stmt.setInt(2, service);
	 stmt.setInt(3, ambiance);
	 stmt.setInt(4, cost);
	 int status=stmt.executeUpdate();
	 if(status>0)
	 {
	 return true;
	 }
     }catch(Exception er){}
	 return false;
 
	
 }
 
 
 public boolean isUserReviewUpdate(String UserName,int taste, int service, int ambiance, int cost) throws UnknownHostException
 {
	 
try{
	 Connect  cnt=Connect.getInstance();
	 conn=cnt.getConn();
	 
	 stmt=conn.prepareStatement("update userreviewcount set tasteCount=?, serviceCount=?, ambianceCount=?, costCount=? where uname='"+UserName+"'");
	 stmt.setInt(1,taste);
	 stmt.setInt(2, service);
	 stmt.setInt(3, ambiance);
	 stmt.setInt(4, cost);
	 int status=stmt.executeUpdate();
	 if(status>0)
	 {
	 return true;
	 }
	}catch(Exception er){
	
}
	 return false;
 
	 }
 
 
 public ArrayList<String> getAllReview(String userName) {
     ArrayList<String> arr=null;
     try {
    	 
    	 
        arr = new ArrayList();
        
        arr = new ArrayList();
        stmt=conn.prepareStatement("select hreview from HotelReview where uname='"+userName+"'"); 
      	 rs=stmt.executeQuery();
      	 while(rs.next())
      	 {
      		 arr.add(rs.getString(1));
      		 
      		
      	 }
      	 return arr;
      	 
      	
        
        
    } catch (Exception er) {
    }
    return arr;
}

 
 
}