/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ReviewLog;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.TreeSet;

/**
 *
 * @author Nitesh-PC
 */
public class ReviewCount {
        TreeSet arr = new TreeSet();
    

    public int countReview(String path) {
        try {
            String f1_line, f2_line;
            int count = 0;
            BufferedReader br = new BufferedReader(new FileReader("E:\\Lars\\PosNeg\\pos.txt"));
            BufferedReader br1 = new BufferedReader(new FileReader(path));
            while ((f1_line = br.readLine()) != null) {
                while ((f2_line = br1.readLine()) != null) {
                    String[] str1 = f1_line.split(" ");
                    String[] str2 = f2_line.split(" ");
                    for (int i = 0; i < str1.length; i++) {
                        if (str1[i].endsWith(".")) {
                            str1[i] = str1[i].substring(0, str1[i].length() - 1);
                        }
                        for (int j = 0; j < str2.length; j++) {
                            if (str1[i].equals(str2[j])) {
                                count++;
                            }
                        }
                    }
                }
            }
        return count;
        } catch (Exception er) {

        }
       return 0;
    }
    
  public ArrayList<String> getAllReview(String userName) {
         ArrayList<String> arr=null;
         try {
            arr = new ArrayList();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReview");
            BasicDBObject bo= new BasicDBObject();
            bo.append("uname",userName);
            DBCursor cursor = collection.find(bo);
            
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("hreview").toString());
                
            }
            return arr;
            
            
        } catch (Exception er) {
        }
        return arr;
    }
  
  
  
  
  
  
   public TreeSet getAllHotelbyReview(int rev) {
         TreeSet arr=null;
         try {
            arr = new TreeSet();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReviewCount");
            BasicDBObject bo= new BasicDBObject();
            bo.append("tasteCount",rev);
            DBCursor cursor = collection.find(bo);
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("HotelName").toString());
                
            }
            return arr;
            
            
        } catch (Exception er) {
        }
        return arr;
    }
  
   
   
   
   
   
    public TreeSet getAllHotelbyService(int rev) {
         TreeSet arr=null;
         try {
            arr = new TreeSet();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReviewCount");
            BasicDBObject bo= new BasicDBObject();
            bo.append("serviceCount",rev);
            DBCursor cursor = collection.find(bo);
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("HotelName").toString());
                
            }
            return arr;
            
            
        } catch (Exception er) {
        }
        return arr;
    }
  
   
   
   
   
   
   
   
   
   
   
   public TreeSet getAllHotelbyAmbinace(int rev) {
         TreeSet arr=null;
         try {
            arr = new TreeSet();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReviewCount");
            BasicDBObject bo= new BasicDBObject();
            bo.append("ambinceCount",rev);
            DBCursor cursor = collection.find(bo);
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("HotelName").toString());
                
            }
            return arr;
            
            
        } catch (Exception er) {
        }
        return arr;
    }
   
   
   
   
   
   
   
   
   public TreeSet getAllHotelbyPrice(int rev) {
         TreeSet arr=null;
         try {
            arr = new TreeSet();
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReviewCount");
            BasicDBObject bo= new BasicDBObject();
            bo.append("cost",rev);
            DBCursor cursor = collection.find(bo);
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(obj.get("HotelName").toString());
                
            }
            return arr;
            
            
        } catch (Exception er) {
        }
        return arr;
    }
   
   
   
   
   
   
   public ArrayList getUserReviewCount(String uname) {
         ArrayList arr=null;
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
            return arr;
            
            
        } catch (Exception er) {
        }
        return arr;
    }
   
   
   
   
   
   
   
   
   
   
   
   
    public TreeSet<Integer> getAllReviewTasteCountByHotel() {
        TreeSet<Integer> arr = new TreeSet();
        try {
    
           
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReviewCount");

            DBCursor cursor = collection.find();
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                //arr.add(obj.get("tasteCount").toString());
                arr.add(Integer.parseInt(obj.get("tasteCount").toString()));
            }
        } catch (Exception er) {
        }
        return arr;
    }
   
    
    
    
    
    
    
    
    public TreeSet<Integer> getAllReviewServiceCountByHotel() {
        TreeSet<Integer> arr = new TreeSet();
        try {
    
           
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReviewCount");

            DBCursor cursor = collection.find();
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(Integer.parseInt(obj.get("serviceCount").toString()));
            }
        } catch (Exception er) {
        }
        return arr;
    }
   
    
   
   public TreeSet<Integer> getAllReviewAmbiCountByHotel()
   {
	   TreeSet<Integer> arr = new TreeSet();
        try {
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReviewCount");

            DBCursor cursor = collection.find();
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(Integer.parseInt(obj.get("ambinceCount").toString()));
            }
        } catch (Exception er) {
        }
        return arr;
       
       
   }

   
   
   
   
   
   
   public TreeSet<Integer> getAllReviewCostCountByHotel()
   {
        TreeSet<Integer> arr = new TreeSet();
        try {
    
           
            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("HotelReviewCount");

            DBCursor cursor = collection.find();
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                arr.add(Integer.parseInt(obj.get("cost").toString()));
            }
        } catch (Exception er) {
        }
        return arr;
       
       
   }
   
}
   
  












  



