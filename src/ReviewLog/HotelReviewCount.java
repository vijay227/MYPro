/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ReviewLog;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import java.net.UnknownHostException;

/**
 *
 * @author Nitesh-PC
 */
public class HotelReviewCount {
    
   /*public boolean isAddReviewCount(String hotelName,int taste, int service, int ambiance, int cost) throws UnknownHostException
   {
       
                Mongo mg = new Mongo("localhost", 27017);
                DB db = mg.getDB("lars");
                DBCollection collection = db.getCollection("HotelReviewCount");
                BasicDBObject me = new BasicDBObject();
                 me.put("HotelName", hotelName);
                me.put("tasteCount", taste);
                me.put("serviceCount",service);
                me.put("ambinceCount", ambiance);
                me.put("cost", cost);
                collection.insert(me);
                if (collection != null) {
                  return true;
                }
                return false;
   }*/
   
  /*  public boolean isUserReviewCount(String UserName,int taste, int service, int ambiance, int cost) throws UnknownHostException
   {
       
                Mongo mg = new Mongo("localhost", 27017);
                DB db = mg.getDB("lars");
                DBCollection collection = db.getCollection("UserReviewCount");
                BasicDBObject me = new BasicDBObject();
                 me.put("UserName", UserName);
                me.put("tasteCount", taste);
                me.put("serviceCount",service);
                me.put("ambinceCount", ambiance);
                me.put("cost", cost);
                collection.insert(me);
                if (collection != null) {
                  return true;
                }
                return false;
   }
   */
   
    public boolean isUserReviewUpdate(String UserName,int taste, int service, int ambiance, int cost) throws UnknownHostException
   {
       
                Mongo mg = new Mongo("localhost", 27017);
                DB db = mg.getDB("lars");
                DBCollection collection = db.getCollection("UserReviewCount");
               
                BasicDBObject me = new BasicDBObject();
                
                
                 me.put("UserName", UserName);
                me.put("tasteCount", taste);
                me.put("serviceCount",service);
                me.put("ambinceCount", ambiance);
                me.put("cost", cost);
                BasicDBObject search = new BasicDBObject().append("UserName",UserName);
                 collection.update(search, me);
                if (collection != null) {
                  return true;
                }
                return false;
   }
   
   public boolean isHotelReviewUpdate(String Hname,int taste, int service, int ambiance, int cost) throws UnknownHostException
   {
       
                Mongo mg = new Mongo("localhost", 27017);
                DB db = mg.getDB("lars");
                DBCollection collection = db.getCollection("HotelReviewCount");
               
                BasicDBObject me = new BasicDBObject();
                
                
                 me.put("HotelName", Hname);
                me.put("tasteCount", taste);
                me.put("serviceCount",service);
                me.put("ambinceCount", ambiance);
                me.put("cost", cost);
                BasicDBObject search = new BasicDBObject().append("HotelName",Hname);
                 collection.update(search, me);
                if (collection != null) {
                  return true;
                }
                return false;
   }
    
   
   public boolean isRestaurantUpdate(String Hname,String address,String area,String city,  String corner, String email, String phone) throws UnknownHostException
   {
       
                Mongo mg = new Mongo("localhost", 27017);
                DB db = mg.getDB("lars");
                DBCollection collection = db.getCollection("AddRestaurant");
               
                BasicDBObject me = new BasicDBObject();
                
                
                me.put("rname", Hname);
                me.put("address",address);
                me.put("area", area);
                me.put("city", city);
                me.put("corner", corner);
                me.put("email",email);
                me.put("phone",phone);
                BasicDBObject search = new BasicDBObject().append("rname",Hname);
                 collection.update(search, me);
                if (collection != null) {
                  return true;
                }
                 return false;
   } 
    
    
   
   
   
    
}