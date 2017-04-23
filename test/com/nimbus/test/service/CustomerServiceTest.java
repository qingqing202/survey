package com.nimbus.test.service;

import java.util.Calendar;
import org.junit.Test;
import com.nimbus.entity.client.Customer;
import com.nimbus.junitTest.tools.SuperTest;
import com.nimbus.service.client.CustomerService;
import com.nimbus.util.Md5Util;

public class CustomerServiceTest extends SuperTest {
  @Test
  public void save() {
    try {
      CustomerService customerService = (CustomerService) springContext
          .getBean("customerService");
      Customer customer = new Customer();
      customer.setName("test");
      customer.setPassword("test");
      customer.setRegisterTime(Calendar.getInstance());
      customerService.save(customer);
    } catch(Exception e) {
      System.out.println(e.getMessage());
    }
  }
  
  public static void main(String argv[]) {
    System.out.println(Md5Util.getMD5ofStr("admin"));
  }
}
