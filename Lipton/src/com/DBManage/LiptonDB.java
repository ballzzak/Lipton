package com.DBManage;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;

import com.mongodb.BasicDBObject;
import com.mongodb.CommandResult;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;

public class LiptonDB {
	
	private ServerAddress serverAddress = new ServerAddress("localhost", 27017);
	private MongoCredential credential = MongoCredential.createCredential("root", "admin", "1234".toCharArray());
	private MongoClient mc = new MongoClient(serverAddress, Arrays.asList(credential));
	private DB db = mc.getDB("Lipton");
	private DBCollection coll = null;
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public LiptonDB(String collectionName) {
		coll = db.getCollection(collectionName);
	}
	
	public void insert(String insertJson) {
		BasicDBObject insertDoc = CommandResult.parse(insertJson);
		insertDoc.put("registdate", dateFormat.format(new Date()));
		coll.insert(insertDoc);
	}
	
	public ArrayList<DBObject> find() {
		ArrayList<DBObject> result = new ArrayList<DBObject>();
		Iterator<DBObject> iter = coll.find().iterator();
		while (iter.hasNext()) result.add(iter.next());
		return result;
	}
	
	public ArrayList<DBObject> find(String findJson) {
		ArrayList<DBObject> result = new ArrayList<DBObject>();
		BasicDBObject findQuery = CommandResult.parse(findJson);
		Iterator<DBObject> iter = coll.find(findQuery).iterator();
		while (iter.hasNext()) result.add(iter.next());
		return result;
	}
	
	public ArrayList<DBObject> find(String findQuery, String projection) {
		ArrayList<DBObject> result = new ArrayList<DBObject>();
		Iterator<DBObject> iter = coll.find(CommandResult.parse(findQuery), CommandResult.parse(projection)).iterator();
		while (iter.hasNext()) result.add(iter.next());
		return result;
	}
	
	public void update(String findQuery, String updateJson) {
		BasicDBObject updateDoc = CommandResult.parse(updateJson);
		coll.update(CommandResult.parse(findQuery), updateDoc);
	}
	
	public void remove(String findQuery) {
		coll.remove(CommandResult.parse(findQuery));
	}
	
}
