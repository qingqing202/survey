package com.nimbus.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

public class MyThread extends Thread {
  private int id = 0;
  
  public MyThread(int id) {
    this.id = id;
  }
  
  @Override
  public void run() {
    try {
      URL url = new URL("http://www.baidu.com");
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
        File fileOutput = new File("C:\\Users\\zuowei\\work\\gsj\\channel" + id + ".txt");
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
    } catch (MalformedURLException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  public static void main(String[] args)  {
    
    int n = 10;
    List<MyThread> threads = new ArrayList<MyThread>();
    for (int i = 0; i < n; i++) {
      MyThread thread = new MyThread(i);
      threads.add(thread);
    }

    try {
      for (int i = 0; i < n; i++) {
        threads.get(i).start();
      }
      
      for (int i = 0; i < n; i++) {
        threads.get(i).join();
      }
      
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
  } 
}
