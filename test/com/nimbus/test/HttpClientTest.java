package com.nimbus.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.zip.GZIPInputStream;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;

//-195922^-111017^782907^697037
//-11^0^586994^586020

public class HttpClientTest {
  public static void main(String[] argv) {
    HttpClient http = new HttpClient();
    String url = "http://58.215.221.220/rpc_design.do?appId=48";
    url += "&action=viewDesign";
    url += "&designName=/TestA_1/TestA_1/layout";
    url += "&viewLeft=0";
    url += "&viewBottom=0";
    url += "&viewRight=-1";
    url += "&viewTop=0";
    url += "&windowWidth=800";
    url += "&windowHeight=600";
    GetMethod get = new GetMethod(url);
    try {
     System.out.println("fetching url : "+ url);
     get.addRequestHeader("accept-encoding", "gzip,deflate");
     int er = http.executeMethod(get);
     if(er == 200) {
      System.out.println(get.getResponseContentLength());
      if (get.getResponseHeader("Content-Encoding") != null && 
          get.getResponseHeader("Content-Encoding").getValue().equals("gzip")) {
        BufferedReader br = new BufferedReader(new InputStreamReader(
            new GZIPInputStream(get.getResponseBodyAsStream()), "GBK"));
        String line = null;
        while ((line = br.readLine()) != null) { 
          System.out.println(line); 
        } 
      } else { 
        System.out.println(get.getResponseBodyAsString()); 
        }
    }
    } catch (HttpException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } 
    finally{
     get.releaseConnection();
    }
  }
}
