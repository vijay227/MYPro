/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import java.net.UnknownHostException;

/**
 *
 * @author Nitesh-PC
 */
public class NewClass {
    public static void main(String arg[]) throws UnknownHostException{
        Mongo mg = new Mongo("localhost", 27017);
DB db = mg.getDB("lars");
DBCollection collection = db.getCollection("HotelReview");
BasicDBObject me = new BasicDBObject(); 
me.put("hname","Sandip");
me.put("uname","More");
me.put("hreview","Prajakta");


 }   
}
