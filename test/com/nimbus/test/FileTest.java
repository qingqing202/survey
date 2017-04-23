package com.nimbus.test;

import java.io.File;

public class FileTest {
  public static void main(String[] args) {
    try {
      File file = new File("/data/web/trial/lizuowei/logfiles");
      if (file.exists()) {
        System.out.println("delete file " + file.getName());
        if (!file.delete()) {
          System.out.println("Sorry, delete  failed!");
        }
      } else {
        System.out.println("Sorry, file not exist!");
      }
    } catch (Exception e) {
      System.out.println("Error when delete ");
    }
  }
}
