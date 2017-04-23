package com.nimbus.service.client;

import java.util.Calendar;

import org.springside.modules.orm.hibernate.Page;

import com.nimbus.entity.client.Customer;
import com.nimbus.service.BaseService;

public interface CustomerService extends BaseService<Customer> {
  public Page<Customer> getCustomers(Page<Customer> page, String name, String email,
      Calendar beginTime, Calendar endTime);
  public Customer getCustomerByName(String username);
  public Customer getCustomerByEmail(String email);
  public Customer getCustomerByPhoneNumber(String phoneNumber);
  public Customer getCustomerByUid(String uid, String uidType);

  public boolean isUserExisted(String username);
  public boolean isEmailExisted(String email);
  public boolean isPhoneExisted(String phoneNumber);
}
