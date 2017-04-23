package com.nimbus.test.xmlrpc;

import org.apache.xmlrpc.XmlRpcServer;


public class TestXmlRpcserver {
	public static void main(String[] args) {
		try {
			XmlRpcServer xmlrpc = new XmlRpcServer();
			xmlrpc.addHandler("myhandler", new TestModel());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
