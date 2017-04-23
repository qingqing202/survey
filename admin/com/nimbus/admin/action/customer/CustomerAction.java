package com.nimbus.admin.action.customer;

import java.util.Calendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springside.modules.orm.hibernate.Page;
import com.nimbus.admin.action.AdminBaseAction;
import com.nimbus.entity.client.Customer;
import com.nimbus.service.client.CustomerService;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("Admin.customer")
public class CustomerAction extends AdminBaseAction {
  @Autowired
  private CustomerService customerService;
  
  private Long customerId;
  private Customer customer;
  
  private Page<Customer> page;
  private int pageNo = 1;
  private int pageSize = 10;

  private Calendar beginTime;
  private Calendar endTime;
  private String email;
  private String name;

  public String index() {
    page = new Page<Customer>();
    page.setPageNo(pageNo);
    page.setPageSize(pageSize);
    page.setAutoCount(true);
    page = customerService.getCustomers(page, name, email, beginTime, endTime);
    return "list";
  }
  
  public String view() {
    try {
      customer = customerService.findById(customerId);
      
    } catch (Exception e) {
      // e.printStackTrace();
    }
    
    return "view";
  }
  
  public String delete() {
    try {
      customer = customerService.findById(customerId);
      if (customer != null) {
        customerService.delete(customer);
      }
    } catch (Exception e) {
      // e.printStackTrace();
    }
    
    return index();
  }
  
  public Long getCustomerId() {
    return customerId;
  }

  public void setCustomerId(Long customerId) {
    this.customerId = customerId;
  }

  public int getPageNo() {
    return pageNo;
  }

  public void setPageNo(int pageNo) {
    this.pageNo = pageNo;
  }

  public int getPageSize() {
    return pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public Calendar getBeginTime() {
    return beginTime;
  }

  public void setBeginTime(Calendar beginTime) {
    this.beginTime = beginTime;
  }

  public Calendar getEndTime() {
    return endTime;
  }

  public void setEndTime(Calendar endTime) {
    this.endTime = endTime;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Customer getCustomer() {
    return customer;
  }

  public Page<Customer> getPage() {
    return page;
  }
}
