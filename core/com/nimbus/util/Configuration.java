package com.nimbus.util;

import java.util.ResourceBundle;

public class Configuration {
  private static Object lock = new Object();
  private static Configuration SLEF;
  private ResourceBundle rb;
  private static final String CONFIG_FILE = "config";

  private Configuration() {
    rb = ResourceBundle.getBundle(CONFIG_FILE);
  }

  public static Configuration getInstance() {
    synchronized (lock) {
      if (null == SLEF) {
        SLEF = new Configuration();
      }
    }
    return SLEF;
  }

  public String getValue(String key) {
    return rb.getString(key);
  }
}
