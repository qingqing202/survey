package com.nimbus.web.cache;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.nimbus.main.ApplicationDataCache;

public class DeviceCache extends BaseCache {
  public static final String kDeviceTypes = "DEVICE_TYPES";
  public static final String kDeviceTypeBrands = "DEVICE_TYPE_BRANDS";
  
  private static ApplicationDataCache data = null;
  
  public static ApplicationDataCache getInstance() {
    if (data == null)
      data = new ApplicationDataCache();
    return data;
  }
  
  @SuppressWarnings("unchecked")
  public List<String> getDeviceTypes() {
    Map<String, Object> appData = getAppData();
    return (List<String>)appData.get(kDeviceTypes);
  }
  
  public void setDeviceTypes(List<String> types) {
    Map<String, Object> appData = getAppData();
    appData.put(kDeviceTypes, types);
  }
  
  public void refreshDeviceTypes() {
    
  }
  
  @SuppressWarnings("unchecked")
  public List<String> getDeviceBrands(String type) {
    Map<String, Object> appData = getAppData();
    Map<String, List<String>> brandsMap = 
      (Map<String, List<String>>)appData.get(kDeviceTypeBrands);
    if (brandsMap == null)
      return null;
    return brandsMap.get(type);
  }
  
  @SuppressWarnings("unchecked")
  public void setDeviceBrands(String type, List<String> brands) {
    Map<String, Object> appData = getAppData();
    Map<String, List<String>> brandsMap = 
      (Map<String, List<String>>)appData.get(kDeviceTypeBrands);
    if (brandsMap == null) {
      brandsMap = new HashMap<String, List<String>>();
      brandsMap.put(type, brands);
      appData.put(kDeviceTypeBrands, brandsMap);
    } else {
      brandsMap.put(type, brands);
    }
  }
  
  public void refreshDeviceBrands(String type) {
    
  }
}
