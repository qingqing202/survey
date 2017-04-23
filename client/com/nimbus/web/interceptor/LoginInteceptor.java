package com.nimbus.web.interceptor;

import com.nimbus.web.action.ClientBaseAction;
import com.nimbus.web.action.json.AjaxResultStatusType;
import com.nimbus.web.action.json.JsonMsgBean;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class LoginInteceptor extends AbstractInterceptor {
  private String isAjax = "false";

  @Override
  public String intercept(ActionInvocation invocation) throws Exception {
    ClientBaseAction action = (ClientBaseAction) invocation
        .getAction();
    if (null == action.getCurCustomer()) {
      if (Boolean.valueOf(isAjax)) {
        action.setJsonString(JsonMsgBean
            .getResultStatusJsonStrByType(AjaxResultStatusType._00000));
        return ClientBaseAction.AJAXJSON;
      } else {
        return ClientBaseAction.LOGIN;
      }
    }
    return invocation.invoke();
  }

  public void setIsAjax(String isAjax) {
    this.isAjax = isAjax;
  }
}
