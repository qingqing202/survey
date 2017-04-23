package com.nimbus.test.xmlrpc;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.Hashtable;
import java.util.Vector;

import org.apache.xmlrpc.XmlRpcClient;
import org.apache.xmlrpc.XmlRpcException;

@SuppressWarnings("rawtypes")
public class TestXmlRpcClient {
	public static void main(String[] args) {
		try {
			XmlRpcClient xmlrpc = new XmlRpcClient(
					new URL("http://192.168.62.128:8557/RPC2"));
			
      Vector params = new Vector();
      Hashtable param = new Hashtable();
      param.put("filepath", "test.jpg");
      param.put("label", 0);
      params.add(param);
      
      String result = xmlrpc.execute("trainOne", params).toString();
      System.out.println(result);
		} catch (XmlRpcException e) {
			System.out.println(e.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
