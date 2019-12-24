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
import com.mongodb.MongoClient;

/**
 *
 * @author bidkar
 */
public class SelectRecord {
    public static void main( String args[] ) {
	   
         try{   
		
         // To connect to mongodb server
         MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
			
         // Now connect to your databases
         DB db = mongoClient.getDB( "lars" );
         System.out.println("Connect to database successfully");
			
        // boolean auth = db.authenticate(myUserName, myPassword);
         //System.out.println("Authentication: "+auth);         
	String name=null;		
        DBCollection coll = db.getCollection("AddRestaurant");
        //DBCollection coll = db.getCollection("mycol");
         System.out.println("Collection Registration selected successfully");
	BasicDBObject fields = new BasicDBObject();
        BasicDBObject allQuery = new BasicDBObject();
	fields.put("address", 1);	
	DBCursor cursor = coll.find(allQuery, fields);		
         //DBCursor cursor = coll.find();
        int i = 1;		
         while (cursor.hasNext()) { 
            System.out.println("Inserted Document: "+i); 
            //System.out.println(cursor.next());
            DBObject obj= cursor.next();
            name=obj.get("address").toString();
             System.out.println(name);
             //name=cursor.next().toString();
             
           
           //i++;
         }
        
         }catch(Exception er){
             
         }
          
        
}
}
