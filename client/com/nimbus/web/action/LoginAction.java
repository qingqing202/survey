package com.nimbus.web.action;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.providers.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;

import com.nimbus.service.client.CustomerService;
import com.nimbus.util.Md5Util;
import com.nimbus.web.action.json.JsonMsgBean;
import com.nimbus.web.security.jcaptcha.CaptchaServiceSingleton;
import com.nimbus.entity.client.Customer;

@Scope("prototype")
@Controller("loginAction")
@SuppressWarnings({ "unused", "serial", "static-access" })
public class LoginAction extends ClientBaseAction {
  @Autowired
  private CustomerService customerService;
  
  private String username;
  private String password;
  private Customer customer;
 
  private String uid;
  private String uidType;

  private String nickName;

  public String index() {
    return login();
  }

  public String logout() {
    this.releaseSession();
    return AJAXJSON;
  }

  public String login() {
    if (username == null || username.isEmpty())
      return AJAXJSON;
     
    if (password == null || password.isEmpty())
      return AJAXJSON;
    
    Map<String, String> map = new HashMap<String, String>();
    try {
      customer = customerService.getCustomerByName(username);
      if (customer != null) {
        if (Md5Util.getMD5ofStr(password).equals(customer.getPassword())) {
          saveCurCustomer(customer);
          saveCurPasswd(password);
          map.put("UserId", customer.getId().toString());
          map.put("Username", customer.getName());
          map.put("Status", "Success");
        } else {
          map.put("Status", "Error username or password!");
        }
      } else {
        map.put("Status", "Error username or password!");
      }
    } catch (Exception e) {
      map.put("Status", "Error:"+e.getMessage());
    }
    
    setJsonString(JsonMsgBean.MapToJsonString(map));
    return AJAXJSON;
  }
  
  public String loginBy() {
    if (uid == null || uid.isEmpty())
      return AJAXJSON;
     
    if (uidType == null || uidType.isEmpty())
      return AJAXJSON;
    
    Map<String, String> map = new HashMap<String, String>();
    try {
      customer = customerService.getCustomerByUid(uid, uidType);
      if (customer != null) {
        saveCurCustomer(customer);
        
        boolean update = false;
        if (nickName != null && !nickName.isEmpty()) {
          customer.setNickName(nickName);
        }
        
        // reset password
        String password = genRandomPassword();
        customer.setPassword(password);
        customerService.save(customer);
        
        map.put("UserId", customer.getId().toString());
        map.put("Username", customer.getName());
        map.put("Password", password);
        map.put("Status", "Success");
      } else {
        // create account
        String password = genRandomPassword();
        customer = new Customer();
        customer.setPassword(password);
        customer.setRegisterTime(Calendar.getInstance());
        String name = "";
        if (uidType.equalsIgnoreCase("qq")) {
          customer.setUidQQ(uid);
          name += "+QQ";
        } else if (uidType.equalsIgnoreCase("weixin")) {
          customer.setUidWeixin(uid);
          name += "+WX";
        } else if (uidType.equalsIgnoreCase("weibo")) {
          customer.setUidWeibo(uid);
          name += "+WB";
        }
       
        if (nickName != null && !nickName.isEmpty()) {
          customer.setNickName(nickName);
        }
        
        synchronized(this) {
          name += System.currentTimeMillis();
          customer.setName(name);
          customerService.save(customer);
        }
        
        map.put("Status", "Success");
        map.put("UserId", customer.getId().toString());
        map.put("Username", customer.getName());
        map.put("Password", password);
        
        saveCurCustomer(customer);
      }
    } catch (Exception e) {
      map.put("Status", "Error:"+e.getMessage());
    }
    
    setJsonString(JsonMsgBean.MapToJsonString(map));
    return AJAXJSON;
  }
  
  public String genRandomPassword() {
    final int maxNum = 62;
    int count = 0; // 生成的密码的长度
    char[] str = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
        'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
        'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

    StringBuffer pwd = new StringBuffer("");
    Random r = new Random();
    int len = Math.abs(r.nextInt(2)) + 6;
    while (count < len) {
      int i = Math.abs(r.nextInt(maxNum));
      if (i >= 0 && i < str.length) {
        pwd.append(str[i]);
        count++;
      }
    }
    
    return pwd.toString();
  }
  
  public void setPassword(String password) {
    this.password = password;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }

  public void setUidType(String uidType) {
    this.uidType = uidType;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }
}
