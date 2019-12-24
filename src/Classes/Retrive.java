/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.TreeSet;
import java.util.Iterator;

/**
 *
 * @author Nitesh
 */
public class Retrive {

    ArrayList<String> arr = null;


    public ArrayList<String> getAllHotelDetails() {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            BasicDBObject bo= new BasicDBObject();
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("rname").toString());
                arr.add(obj.get("address").toString());
                arr.add(obj.get("area").toString());
                arr.add(obj.get("city").toString());             
                arr.add(obj.get("corner").toString());
                arr.add(obj.get("email").toString());
                arr.add(obj.get("phone").toString());
                
            }
        } catch (Exception er) {
        }
        return arr;
    }
    
    
    
    
    public TreeSet getAllCity() {
        TreeSet arr = new TreeSet();
        try {

            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");

            DBCursor cursor = collection.find();
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("city").toString());
            }
        } catch (Exception er) {
        }
        return arr;
    }

    public ArrayList<String> getAllArea() {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");

            DBCursor cursor = collection.find();
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("area").toString());
            }
        } catch (Exception er) {
        }
        return arr;
    }

    public ArrayList<String> getAllCorner() {
        try {
            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            DBCursor cursor = collection.find();
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("corner").toString());
            }
        } catch (Exception er) {
        }
        return arr;
    }
    
    
    public ArrayList<String> getAllHotels(String city) {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            BasicDBObject bo= new BasicDBObject();
            bo.append("city",city);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("rname").toString());
                arr.add(obj.get("address").toString());
                arr.add(obj.get("city").toString());
                arr.add(obj.get("area").toString());
                arr.add(obj.get("corner").toString());
            }
        } catch (Exception er) {
        }
        return arr;
    }
    
    
    
    
    public ArrayList<String> getAllHotelsByArea(String area) {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            BasicDBObject bo= new BasicDBObject();
            bo.append("area",area);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("rname").toString());
                arr.add(obj.get("address").toString());
                arr.add(obj.get("city").toString());
                arr.add(obj.get("area").toString());
                arr.add(obj.get("corner").toString());
            }
        } catch (Exception er) {
        }
        return arr;
    }

    
    
    
    
    
 public ArrayList<String> getAllHotelsByCity(String city) {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            BasicDBObject bo= new BasicDBObject();
            bo.append("city",city);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("rname").toString());
                arr.add(obj.get("address").toString());
                arr.add(obj.get("city").toString());
                arr.add(obj.get("area").toString());
                arr.add(obj.get("corner").toString());
            }
        } catch (Exception er) {
        }
        return arr;
    }

    
  public TreeSet getAllAreaCity(String city) {
                TreeSet arr=new TreeSet();  
      try {

            
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            BasicDBObject bo= new BasicDBObject();
            bo.append("city",city);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                
                arr.add(obj.get("area").toString());
                
            }
        } catch (Exception er) {
        }
        return arr;
    }  
    
    

   
    
    
    
    public ArrayList<String> getAllRestaurant(String rname) {
        try {

            arr = new ArrayList();
            
            
            
          /*  MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            BasicDBObject bo= new BasicDBObject();
            bo.append("rname",rname);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("rname").toString());
                arr.add(obj.get("address").toString());
                arr.add(obj.get("city").toString());
                arr.add(obj.get("area").toString());
                arr.add(obj.get("corner").toString());
                arr.add(obj.get("email").toString());
                arr.add(obj.get("phone").toString());
            }*/
        } catch (Exception er) {
        }
        return arr;
    }
    
    
    public ArrayList<String> getHotelsDetailsByCategory(ArrayList arr) {
    	  ArrayList<String> arr1 = new ArrayList() ;
    	try {

         
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            BasicDBObject bo= new BasicDBObject();
            Iterator it=arr.iterator();
            while(it.hasNext())
            {
            bo.append("rname",it.next());
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr1.add(obj.get("rname").toString());
                arr1.add(obj.get("address").toString());
                arr1.add(obj.get("city").toString());
                arr1.add(obj.get("area").toString());
                arr1.add(obj.get("corner").toString());
            }
            }
        } catch (Exception er) {
        }
        return arr1;
    }
    
    
    
    
    
    
    
    public ArrayList<String> getAllHotelsByRname(String rname) {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            BasicDBObject bo= new BasicDBObject();
            bo.append("rname",rname);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("rname").toString());
                arr.add(obj.get("address").toString());
                arr.add(obj.get("city").toString());
                arr.add(obj.get("area").toString());
                arr.add(obj.get("corner").toString());
            }
        } catch (Exception er) {
        }
        return arr;
    }

    
    
    public ArrayList<String> getSelectedHotelsDetails(String rname) {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            BasicDBObject bo= new BasicDBObject();
            bo.append("rname",rname);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("rname").toString());
                arr.add(obj.get("address").toString());
                arr.add(obj.get("city").toString());
                arr.add(obj.get("area").toString());
                arr.add(obj.get("corner").toString());
                arr.add(obj.get("email").toString());
                arr.add(obj.get("phone").toString());
               
            }
        } catch (Exception er) {
        }
        return arr;
    }
    
    
    public ArrayList<String> getUserDetails(String uname) {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("Registration");
            BasicDBObject bo= new BasicDBObject();
            bo.append("uname",uname);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("email").toString());
                arr.add(obj.get("gender").toString());
                arr.add(obj.get("phone").toString());
               
            }
        } catch (Exception er) {
        }
        return arr;
    }
    
    
    public ArrayList<String> getSelectedUserCount(String uname) {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("UserReviewCount");
            BasicDBObject bo= new BasicDBObject();
            bo.append("UserName",uname);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("tasteCount").toString());
                arr.add(obj.get("serviceCount").toString());
                arr.add(obj.get("ambinceCount").toString());
                arr.add(obj.get("cost").toString());
               
            }
        } catch (Exception er) {
        }
        return arr;
    }
    
    
    public ArrayList<String> getSelectedHotelCount(String hname) {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReviewCount");
            BasicDBObject bo= new BasicDBObject();
            bo.append("HotelName",hname);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("tasteCount").toString());
                arr.add(obj.get("serviceCount").toString());
                arr.add(obj.get("ambinceCount").toString());
                arr.add(obj.get("cost").toString());
               
            }
        } catch (Exception er) {
        }
        return arr;
    }
    
    

    public ArrayList<String> getSelectedHotelReviews(String hname) {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReview");
            BasicDBObject bo= new BasicDBObject();
            bo.append("hname",hname);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("uname").toString());
                arr.add(obj.get("hreview").toString());
               
            }
        } catch (Exception er) {
        }
        return arr;
    }
    
    
    
    
    
    
    
    
    
    public ArrayList<String> getSelectedUserReviews(String uname) {
        try {

            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReview");
            BasicDBObject bo= new BasicDBObject();
            bo.append("uname",uname);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("hname").toString());
                arr.add(obj.get("hreview").toString());
               
            }
        } catch (Exception er) {
        }
        return arr;
    }
    
    
    public ArrayList<String> getSelectedHotelsByCategory(String category) {
    		
    	try {
    		arr=new ArrayList();
            
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddCategory");
            BasicDBObject bo= new BasicDBObject();
            bo.append(category,"true");
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("rname").toString());
            }
        } catch (Exception er) {
        }
         return arr;
    }
    
    
    
    
    
    
    
    
    
    
    
    
public boolean isSaveReview(String hotelName, String userName, String review ) throws UnknownHostException
{
 try{
Mongo mg = new Mongo("localhost", 27017);
DB db = mg.getDB("lars");
DBCollection collection = db.getCollection("HotelReview");
BasicDBObject me = new BasicDBObject(); 
me.put("hname",hotelName);
me.put("uname",userName);
me.put("hreview",review);
collection.insert(me);
return true;
 }
catch(Exception er)
        {
        return false;
        }
}   





public boolean isPhotoMenuSave(String hotelName, String path) throws UnknownHostException
{
 try{
Mongo mg = new Mongo("localhost", 27017);
DB db = mg.getDB("lars");
DBCollection collection = db.getCollection("HotelPhotoMenu");
BasicDBObject me = new BasicDBObject(); 
me.put("hname",hotelName);
me.put("uname",path);

collection.insert(me);
return true;
 }
catch(Exception er)
        {
        return false;
        }
}   






































public TreeSet<String> getOverAllHotels() {
         TreeSet arr1 = new TreeSet();   
     try {
            
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            DBCursor cursor = collection.find();
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr1.add(obj.get("rname").toString());
            }
        } catch (Exception er) {
        }
        return arr1;
    }



public TreeSet<String> getOverAllUser() {
         TreeSet arr1 = new TreeSet();   
     try {
            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("Registration");
            DBCursor cursor = collection.find();
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr1.add(obj.get("uname").toString());
            }
        } catch (Exception er) {
        }
        return arr1;
    }



public String isUserLoginValidate(String uname) {
	String pass=null;
    try {
        MongoClient mg = new MongoClient("localhost", 27017);
        // Now connect to your databases
        DB db = mg.getDB("lars");
        DBCollection collection = db.getCollection("Registration");
        BasicDBObject bo= new BasicDBObject();
        bo.append("uname",uname);
        DBCursor cursor = collection.find(bo);
        
        while (cursor.hasNext()) {
            DBObject obj = cursor.next();
           pass= obj.get("pwd").toString();
           
        }
    } catch (Exception er) {
    }
    return pass;
}

 }
























