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
import java.util.ArrayList;

/**
 *
 * @author bidkar
 */
public class UpdateData {    
     public boolean isUpdateRestaurant(Pojo.Restaurant rst) {
        try {

            MongoClient mg = new MongoClient("localhost", 27017);
            // Now connect to your databases
            DB db = mg.getDB("lars");
            DBCollection collection = db.getCollection("AddRestaurant");
            BasicDBObject newDocument = new BasicDBObject();
            //newDocument.append("$set",new BasicDBObject().append("rname",rst.getName()));
            newDocument.append("$set",new BasicDBObject().append("address",rst.getAddress()));
            newDocument.append("$set",new BasicDBObject().append("city",rst.getCity()));
            newDocument.append("$set",new BasicDBObject().append("area",rst.getArea()));
            newDocument.append("$set",new BasicDBObject().append("corner",rst.getCorner()));
            BasicDBObject searchQuery= new BasicDBObject().append("rname",rst.getName());
            collection.update(searchQuery, newDocument);
            return true;
        } catch (Exception er) {
            return false;
        }
    }
    
    
}
