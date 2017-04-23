package com.nimbus.web.action;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nimbus.entity.client.Customer;
import com.nimbus.service.client.CustomerService;
import com.nimbus.task.EmailTask;
import com.nimbus.util.EmailUtil;
import com.nimbus.util.Md5Util;
import com.nimbus.web.security.jcaptcha.CaptchaServiceSingleton;

@Scope("prototype")
@Controller("customer.findPwd")
@SuppressWarnings({ "unused", "serial" })
public class FindPassword extends ClientBaseAction {
  @Autowired
  private CustomerService customerService;
  
  @Autowired
  private EmailTask EmailTask;
  
  private String email;
  private Customer customer;
 
  public String index() {
    String message;
    
    if(email == null || email.isEmpty()) {
      message = "Empty email!";
      setJsonString(message);
      return AJAXJSON;
    }
    
    try {
      customer = customerService.getCustomerByEmail(email);
      if (customer == null) {
        message = "Invalid email!";
        setJsonString(message);
        return AJAXJSON;
      }
      
      String newPwd = genRandomNum();
      EmailTask.addNotifyResetPwd(customer.getId(), newPwd);
      message = "Success";
    } catch (Exception e) {
      //e.printStackTrace();
      message = "Send email failed!";
    }
    
    setJsonString(message);
    return AJAXJSON;
  }
  
  public String genRandomNum() {
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

  public void setEmail(String email) {
    this.email = email;
  }
}
