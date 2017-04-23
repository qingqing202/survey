package com.nimbus.web.cache;

import java.util.HashMap;
import java.util.Map;

public class BaseCache {
  private static Map<String, Object> appData = null;
  
  public static Map<String, Object> getAppData() {
    if (appData == null) 
      appData = new HashMap<String, Object>();
    return appData;
  }
}
