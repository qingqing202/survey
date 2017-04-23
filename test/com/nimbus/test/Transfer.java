package com.nimbus.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Transfer {
  public static void transfer(String path, String outpath) {
    try {
      FileOutputStream fout = new FileOutputStream(outpath);
      BufferedWriter outbr = new BufferedWriter(
          new OutputStreamWriter(fout));
      
      
      FileInputStream fin = new FileInputStream(path);
      BufferedReader br = new BufferedReader(
          new InputStreamReader(fin));
      String line = null;
      while((line = br.readLine()) != null) {
        line = line.trim();
        if (line.isEmpty()) 
          continue;
        
        if (line.startsWith("#"))
          continue;
        //System.out.println(line);
        
        String newline = "";
        int pos = 0;
        while (pos < line.length()) {
          char c1 = line.charAt(pos);
          char c2 = 0;
          if (pos + 1 < line.length()) c2 = line.charAt(pos+1);
          if (c1 == '"' && c2 == '{') {
            //newline += c1;
            newline += c2;
            
            int count = 1;
            int i = pos + 2;
            for (; i < line.length(); i++) {
              char c11 = line.charAt(i);
              char c21 = 0;
              if (i + 1 < line.length()) c21 = line.charAt(i+1);
              if (c11 == '"' && c21 == '{') {
                count++;
              } else if (c11 == '}' && c21 == '"') {
                count--;
                if (count == 0) {
                  newline += c11;
                  //newline += c21;
                  i++;
                  break;
                }
              }
              newline += c11;
            }
            pos = i+1;
          } else if (c1 == ',') {
            newline += '~';
            pos++;
          } else {
            newline += c1;
            pos++;
          }
        }
        
        newline = newline.replaceAll("\"\"", "\"");
        System.out.println(newline);
        
        outbr.write(newline);
        outbr.newLine();
      }
      br.close();
      outbr.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  
  public static void main(String[] args) {
    String path = "C:\\Users\\zuowei\\work\\Comp.csv";
    String outpath = "C:\\Users\\zuowei\\work\\Comp.txt";
    transfer(path, outpath);
  }
  
  
}
