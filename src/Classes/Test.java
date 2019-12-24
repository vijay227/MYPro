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

/**
 *
 * @author bidkar
 */
public class Test{
    public static void main(String arg[]){
        try {

            MongoClient mg = new MongoClient("localhost", 27017);
          // Now connect to your databases
            DB db = mg.getDB("Test");
            DBCollection collection = db.getCollection("TestDemo");
            //BasicDBObject newDocument = new BasicDBObject();
            //newDocument.put("name","Shivaji");
           // newDocument.put("city","Parbhani");
           /* BasicDBObject newDocument1 = new BasicDBObject();
           //newDocument.append("$set",new BasicDBObject().append("rname",rst.getName()));
            newDocument.append("$set",new BasicDBObject().append("address","Shivaji Nagar"));
            newDocument1.append("$set",new BasicDBObject().append("city","Nagar"));
          /*newDocument.append("$set",new BasicDBObject().append("area","Kothrud Manpa"));
               newDocument.append("$set",new BasicDBObject().append("corner","Kothrud"));
            BasicDBObject searchQuery= new BasicDBObject().append("rname","Pavitra");*/
          /*  BasicDBObject newDocument1=new BasicDBObject().append("name","Sandip");
            collection.update(newDocument1, newDocument);
            System.out.println("Updated");*/
            
            
                        BasicDBObject me = new BasicDBObject();

                        me.put("name","Sandip"); 
                        me.put("city", "Pune");
                        collection.insert(me);
            
        } catch (Exception er) {           
        }
        
    }
    
}
