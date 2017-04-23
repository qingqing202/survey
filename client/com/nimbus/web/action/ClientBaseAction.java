package com.nimbus.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.nimbus.entity.client.Customer;
import com.nimbus.service.client.CustomerService;
import com.nimbus.web.action.BaseAction;

@SuppressWarnings("serial")
public class ClientBaseAction extends BaseAction {
  public final String SESSION_CUSTOMER_KEY = "customer";
  public final String SESSION_PASSWORD_KEY = "password";

  @Autowired
  @Qualifier("customerService")
  private CustomerService customerService;

  protected int navIndex;

  public Customer getCurCustomer() {
    Customer customer = (Customer) getSession().get(SESSION_CUSTOMER_KEY);
    if (null != customer) {
      customer = customerService.findById(customer.getId());
      saveCurCustomer(customer);
    }
    return customer;
  }

  protected void saveCurCustomer(Customer customer) {
    getSession().put(SESSION_CUSTOMER_KEY, customer);
  }
  
  protected void saveCurPasswd(String password) {
    getSession().put(SESSION_PASSWORD_KEY, password);
  }
  
  protected String getCurPasswd() {
    String passwd = (String) getSession().get(SESSION_PASSWORD_KEY);
    if (passwd == null) return "";
    return passwd;
  }
  
  protected void releaseSession() {
    saveCurCustomer(null);
    saveCurPasswd(null);
  }
  
  public int getNavIndex() {
    return navIndex;
  }

  public void setNavIndex(int navIndex) {
    this.navIndex = navIndex;
  }
}
