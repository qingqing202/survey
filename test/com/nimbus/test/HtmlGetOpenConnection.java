package com.nimbus.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class HtmlGetOpenConnection {

  private static String webAddress = "http://live.tv.sohu.com/weekMenu/";
  private static String webType = ".html";

  public static void main(String[] args) {
    // TODO Auto-generated method stub
    try {
      URL url = new URL("http://live.tv.sohu.com/weekMenu/16.html");
      URLConnection URLconnection = url.openConnection();
      HttpURLConnection httpConnection = (HttpURLConnection) URLconnection;
      int responseCode = httpConnection.getResponseCode();
      if (responseCode == HttpURLConnection.HTTP_OK) {
        System.err.println("³É¹¦");
        InputStream in = (InputStream) httpConnection.getInputStream();
        InputStreamReader isr = new InputStreamReader(in, "UTF-8");
        BufferedReader bufr = new BufferedReader(isr);
        // String str;
        int c;
        File fileOutput = new File("D:\\zuowei\\channelInfo.txt");
        if (!fileOutput.exists()) {
          fileOutput.createNewFile();
        }
        FileWriter fileWriter = new FileWriter(fileOutput);
        while ((c = bufr.read()) != -1) {
          fileWriter.write(c);
        }
        // while ((str = bufr.readLine()) != null) {
        // fileWriter.write(str);
        // }
        bufr.close();
        fileWriter.close();
      } else {
        System.err.println("Ê§°Ü");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    try {
      getChannelUrls();
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    TimeSheet sheet = new TimeSheet();
    try {
      sheet.setTimeSheet();
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    sheet.getTimeSheet();
  }

  private static void getChannelUrls() throws Exception {
    FileInputStream infile = new FileInputStream("D:\\zuowei\\channelInfo.txt");
    InputStreamReader in = new InputStreamReader(infile);
    BufferedReader bufr = new BufferedReader(in);
    FileOutputStream outfile = new FileOutputStream("D:\\zuowei\\channelUrls.txt");
    OutputStreamWriter out = new OutputStreamWriter(outfile);
    String str;
    while ((str = bufr.readLine()) != null) {
      int index = str.indexOf("tvId");
      if(index != -1){
        String[] newStr = str.split(",");
        for(int i=0;i<newStr.length;i++){
          String strInNum = newStr[i];
          int indexInIdTV = strInNum.indexOf("tvId");
          int indexInArea = strInNum.indexOf("areaId");
          int indexInName = strInNum.indexOf("name");
          if(indexInIdTV != -1){
            out.write("Url:"+webAddress+strInNum.substring(indexInIdTV+6)+webType+"\t");
          }
          else if(indexInArea != -1)
            out.write("AreaId:" + strInNum.substring(indexInArea+8)+"\t"); 
          if(indexInName != -1){
            String[] proStr = strInNum.substring(indexInName+7).split("\"");
            out.write("Name:" + proStr[0]+"\r\n");
          }
        }
        break;
      }
    }
    bufr.close();
    out.close();
  }
}
