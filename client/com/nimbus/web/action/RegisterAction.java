package com.nimbus.web.action;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.security.providers.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;

import com.nimbus.service.client.CustomerService;
import com.nimbus.util.EmailUtil;
import com.nimbus.util.Md5Util;
import com.nimbus.entity.client.Customer;

@Scope("prototype")
@Controller("registerAction")
@SuppressWarnings({ "unused", "serial"})
public class RegisterAction extends ClientBaseAction {
  @Autowired
  private CustomerService customerService;
  
  
  private String username;
  private String password;
  private String email;
  private String phoneNumber;
  
  private String from;
  private Customer customer;
  
  public String index() {
    String message = "";
    if (username == null) {
      message = "Username should not be null!";
      setJsonString(message);
      return AJAXJSON;
    }
    
    username = username.trim();
    
    if (!validName(username.trim())) {
      message = "Username invalid!";
      setJsonString(message);
      return AJAXJSON;
    }
    
    if (password == null) {
      message = "Password should not be null!";
      setJsonString(message);
      return AJAXJSON;
    }
    
    if (email == null) {
      message = "Email should not be null!";
      setJsonString(message);
      return AJAXJSON;
    }
    
    if (phoneNumber == null) {
      message = "PhoneNumber should not be null!";
      setJsonString(message);
      return AJAXJSON;
    }
    
    try {
      if (customerService.isUserExisted(username)) {
        message = "Username was already registrated!";
        setJsonString(message);
        return AJAXJSON;
      }
      
      if (customerService.isEmailExisted(email)) {
        message = "Email was already registrated!";
        setJsonString(message);
        return AJAXJSON;
      }
      
      if (customerService.isPhoneExisted(phoneNumber)) {
        message = "Email was already registrated!";
        setJsonString(message);
        return AJAXJSON;
      }
    
      customer = new Customer();
      customer.setName(username);
      customer.setPassword(password);
      customer.setEmail(email);
      customer.setPhoneNumber(phoneNumber);
      customer.setRegisterTime(Calendar.getInstance());
      
      //saveCurCustomer(customer);
      //saveCurPasswd(password);
      customerService.save(customer);
      
      message = "Success";
    } catch (Exception e) {
      message = e.getMessage();
    }
    
    setJsonString(message);
    return AJAXJSON;
  }
  
  private boolean validName(String name) {
    if (name.length() < 4  || name.length() > 16) {
      return false;
    }
    return true;
  }
  
  public void setPassword(String password) {
    this.password = password;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setFrom(String from) {
    this.from = from;
  }

  public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }
}
