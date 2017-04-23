package com.nimbus.web.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("keepAliveAction")
public class KeepAliveAction extends ClientBaseAction {
  public String index() {
    return null;
  }
}
