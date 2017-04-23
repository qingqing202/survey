package com.nimbus.test.xmlrpc;

import java.util.Hashtable;

public class TestModel {
	
	public String sayhello(String str) {
		return "hello," + str;
	}
	
	public Hashtable getPerson(String arg){
		Hashtable result = new Hashtable();
		result.put("name", arg);
		result.put("sex", "man");
		
		return result;
	}
}
