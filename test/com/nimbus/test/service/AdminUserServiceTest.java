package com.nimbus.test.service;

import java.util.Calendar;
import org.junit.Test;
import com.nimbus.entity.admin.AdminUser;
import com.nimbus.junitTest.tools.SuperTest;
import com.nimbus.service.admin.AdminUserService;
import com.nimbus.util.Md5Util;

public class AdminUserServiceTest extends SuperTest {
  @Test
  public void save() {
    try {
      AdminUserService userService = (AdminUserService) springContext
          .getBean("adminUserService");
      AdminUser user = new AdminUser();
      user.setAdminName("admin");
      user.setPassword("admin");
      user.setRegtime(Calendar.getInstance());
      userService.save(user);
    } catch(Exception e) {
      System.out.println(e.getMessage());
    }
  }
  
  public static void main(String argv[]) {
    System.out.println(Md5Util.getMD5ofStr("admin"));
  }
}
