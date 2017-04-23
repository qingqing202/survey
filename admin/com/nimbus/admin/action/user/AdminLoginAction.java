package com.nimbus.admin.action.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nimbus.admin.action.AdminBaseAction;
import com.nimbus.entity.admin.AdminPermissions;
import com.nimbus.entity.admin.AdminUser;
import com.nimbus.service.admin.AdminUserService;
import com.nimbus.util.Md5Util;
import com.nimbus.web.security.jcaptcha.CaptchaServiceSingleton;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("admLogin")
public class AdminLoginAction extends AdminBaseAction {
  @Autowired
  private AdminUserService userService;
  private String username;
  private String password;
  private String captcha;
  private String message;

  private AdminUser adminUser;

  public String index() {
    if (username != null && !username.trim().equals("")) {
      adminUser = userService.getAdminUser(username);
      if (adminUser != null) {
        if (Md5Util.getMD5ofStr(password).equals(adminUser.getPassword())) {
          if (captcha == null) {
            message = "need captcha";
            return "input";
          }
          try {
            if (!CaptchaServiceSingleton.getInstance().validateResponseForID(
                getRequest().getSession().getId(), captcha)) {
              message = "error captcha!";
              return "input";
            }
          } catch (Exception e) {
            message = "error captcha!";
            return "input";
          }
          getSession().put(SESSION_ADMINUSER_KEY, adminUser);
          Map<String, Object> mapUrl = new HashMap<String, Object>();
          List<AdminPermissions> permissions = userService
              .getPermissionsList(adminUser.getRole().getId());

          if (permissions != null) {
            for (AdminPermissions ap : permissions) {
              String[] str = ap.getChannel().getRighturl().split("\\.");
              if (str[0].lastIndexOf("/") > 0) {
                str[0] = str[0].substring(str[0].lastIndexOf("/") + 1);
              }
              mapUrl.put(str[0], ap.getChannel().getId());
            }
            getSession().put(SESSION_PERMITURL_KEY, mapUrl);
          }
        } else {
          message = "error username or password!";
          return "input";
        }
      } else {
        message = "error username or password!";
        return "input";
      }
      if (getSession().get(SESSION_ADMINUSER_KEY) != null) {
        return "succes";
      }
    }
    return "login";
  }

  public String index2() {
    return "login";
  }

  public String exit() {
    getSession().remove(SESSION_ADMINUSER_KEY);
    getSession().remove(SESSION_PERMITURL_KEY);
    return "login";
  }

  public String revise() {
    return "revise";
  }

  public String savepass() {
    AdminUser adminUser = (AdminUser) getSession().get(SESSION_ADMINUSER_KEY);
    adminUser.setPassword(password);
    userService.save(adminUser);
    message = "change password success!";
    return "pass";
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }
  
  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getCaptcha() {
    return captcha;
  }

  public void setCaptcha(String captcha) {
    this.captcha = captcha;
  }
  
  public String getMessage() {
    return message;
  }
}
