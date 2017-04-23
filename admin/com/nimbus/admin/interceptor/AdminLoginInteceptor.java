package com.nimbus.admin.interceptor;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nimbus.admin.action.AdminBaseAction;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class AdminLoginInteceptor extends AbstractInterceptor {
  protected Logger logger = LoggerFactory.getLogger(this.getClass());

  @Override
  public String intercept(ActionInvocation invocation) throws Exception {
    AdminBaseAction action = (AdminBaseAction) invocation.getAction();
    invocation.getProxy().getActionName();
    if (null == action.getCurAdminUser()) {
      return "admLogin";
    } else {
      Map<String, Object> mapUrl = action.getMapUrl();
      //System.out.println(mapUrl);
      if (!invocation.getProxy().getActionName().equals("adminTunnel") && 
          mapUrl != null && 
          (Long) mapUrl.get(invocation.getProxy().getActionName()) == null) {
        action.addActionMessage("Forbidden");
        return "forbid";
      }
    }
    
    return invocation.invoke();
  }
}
