package com.nimbus.web.action.client;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nimbus.entity.client.Customer;
import com.nimbus.service.client.CustomerService;
import com.nimbus.web.action.ClientBaseAction;
import com.nimbus.web.action.json.JsonMsgBean;


@SuppressWarnings("serial")
@Scope("prototype")
@Controller("customer.infoAction")
public class ClientInfoAction extends ClientBaseAction {
  @Autowired
  private CustomerService customerService;
  
  private String username;
  
  private String email;
  private String phoneNumber;
  private String nickName;
  
  public String index() {
    Customer customer = this.getCurCustomer();
    Map<String, Object> map = new HashMap<String, Object>();
    if (customer == null) {
      map.put("Status", "offline");
      setJsonString(JsonMsgBean.MapToJsonString(map));
      return AJAXJSON;
    }
    
    username = customer.getName();
    
    email = customer.getEmail();
    phoneNumber = customer.getPhoneNumber();
    nickName = customer.getNickName();
    
    if (email != null)
      map.put("Email", email);
    if (phoneNumber != null)
      map.put("PhoneNumber", email);
    if (nickName != null)
      map.put("NickName", nickName);
    
    map.put("Status", "online");
    map.put("Username", username);
    map.put("PID", customer.getId() + 10000);
    String json = JsonMsgBean.MapToJsonString(map);
    setJsonString(json);
    return AJAXJSON;
  }
  
  public String update() {
    String message = "";
    Customer customer = this.getCurCustomer();
    if (customer == null) {
      message = "Logout";
      setJsonString(message);
      return AJAXJSON;
    }
    
    try {
      if (username != null && !username.isEmpty() && 
          customer.getName().startsWith("+")) {
        if (username.startsWith("+")) {
          message = "Invalid Username!";
          setJsonString(message);
          return AJAXJSON;
        }
        
        Customer existCustomer = customerService.getCustomerByName(username);
        if (existCustomer != null &&
            existCustomer.getId() != customer.getId()) {
          message = "Username was already registrated!";
          setJsonString(message);
          return AJAXJSON;
        }
         
        customer.setName(username);
      }
      
      if (email != null && !email.isEmpty()) {
        Customer existCustomer = customerService.getCustomerByEmail(email);
        if (existCustomer != null &&
            existCustomer.getId() != customer.getId()) {
          message = "Email was already registrated!";
          setJsonString(message);
          return AJAXJSON;
        }
        customer.setEmail(email);
      }
      
      if (phoneNumber != null && !phoneNumber.isEmpty()) {
        Customer existCustomer = customerService.getCustomerByPhoneNumber(phoneNumber);
        if (existCustomer != null &&
            existCustomer.getId() != customer.getId()) {
          message = "PhoneNumber was already registrated!";
          setJsonString(message);
          return AJAXJSON;
        }
        customer.setEmail(email);
      }
      
      if (nickName != null && !nickName.isEmpty())
        customer.setNickName(nickName);
      
      customerService.save(customer);
      message = "Success";
    } catch (Exception e) {
      message = e.getMessage();
    }
    
    setJsonString(message);
    return AJAXJSON;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }
}
