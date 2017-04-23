package com.nimbus.test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;


public class TimeSheet {

  private List<String> timeSheet;
  
  public void setTimeSheet() throws Exception{
    
    String time = null;
    String name = null;
    List<String> timeSheet = new ArrayList<String>();
    boolean timeFlag = false;
    boolean nameFlag = false;
    
    
    FileInputStream infile = new FileInputStream("D:\\zuowei\\channelUrls.txt");
    InputStreamReader in = new InputStreamReader(infile);
    BufferedReader bufr = new BufferedReader(in);
    String str;
    while ((str = bufr.readLine()) != null) {
      String[] strDiv = str.split("\t");
      int indexUrl = strDiv[0].indexOf("Url:");
      int indexName = strDiv[1].indexOf("Name:");
      if (indexUrl != -1 && indexName != -1) {
        String address = strDiv[0].substring(indexUrl + 4);
        String channelName = strDiv[1].substring(indexName + 5);
//        FileOutputStream outfile = new FileOutputStream(
//            "e:\\TimeSheet\\TimeSheet_" + channelName + ".txt");
//        OutputStreamWriter out = new OutputStreamWriter(outfile);
        URL url = new URL(address);
        URLConnection URLconnection = url.openConnection();
        HttpURLConnection httpConnection = (HttpURLConnection) URLconnection;
        int responseCode = httpConnection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
          InputStream inWeb = (InputStream) httpConnection.getInputStream();
          InputStreamReader isr = new InputStreamReader(inWeb, "UTF-8");
          BufferedReader bufrWeb = new BufferedReader(isr);
          String strWeb;
          while ((strWeb = bufrWeb.readLine()) != null) {
            int indexTime = strWeb.indexOf("time");
            if (indexTime != -1) {
              String newStrWeb[] = strWeb.split(",");
              for (int i = 0; i < newStrWeb.length; i++) {
                String strInNum = newStrWeb[i];
                int indexIntime = strInNum.indexOf("time");
                int indexInName = strInNum.indexOf("name");
                if (indexIntime != -1) {
                  time = strInNum.substring(indexIntime + 7).replace("\"","");       
                  nameFlag = true;
                }
                if(indexInName != -1 && nameFlag) {
                  name = strInNum.substring(indexInName + 7).replace("\"", "").replace("}", "");
                  timeFlag = true;
                }
                if(nameFlag && timeFlag){
                  nameFlag = false;
                  timeFlag = false;
                  timeSheet.add(channelName+","+time+","+name);
                  System.out.println(channelName+","+time+","+name);
                }
              }
            }
          }
          bufrWeb.close();
        }
//        out.close();
      }

    }
    bufr.close();
    
    System.out.println("Done!"+timeSheet.size());
    
  }
  
  public List<String> getTimeSheet(){
    return timeSheet;
  }
}
