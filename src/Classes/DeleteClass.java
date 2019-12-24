/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;


public class DeleteClass {
    public boolean isDelete(String name){
        
    try{ 
             MongoClient mg = new MongoClient( "localhost" , 27017 );
			
         // Now connect to your databases
         DB db = mg.getDB("lars");
         DBCollection collection = db.getCollection("AddRestaurant");
         System.out.println("Connect to database successfully");
         BasicDBObject document= new BasicDBObject();
         document.put("rname",name);
         collection.remove(document);
         return true;       
    }
        catch(Exception er){
              
        }
         
 return false;   
}
}
