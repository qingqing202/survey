package com.nimbus.web.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nimbus.web.action.BaseAction;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class BindUrlInteceptor extends AbstractInterceptor {
  protected Logger logger = LoggerFactory.getLogger(this.getClass());
  
  @Override
  public String intercept(ActionInvocation invocation) throws Exception {
    try {
      HttpServletRequest request = ServletActionContext.getRequest();
      String remoteIp = "";
      try {
        remoteIp = request.getHeader("Cdn-Src-Ip");
        if (remoteIp == null) {
          remoteIp = request.getHeader("x-forwarded-for");
          if (remoteIp == null) {
            remoteIp = request.getRemoteAddr();
          } else {
            remoteIp = remoteIp.split("\\,")[0];
          }
        }
      } catch (Exception e) {
        e.printStackTrace();
        remoteIp = request.getRemoteAddr();
      }
      logger.info("IP:" + remoteIp + " ==> requestURI: "
                  + request.getRequestURI());
      ((BaseAction) invocation.getAction()).setRemoteIp(remoteIp);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return invocation.invoke();
  }
}
