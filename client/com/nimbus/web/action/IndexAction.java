package com.nimbus.web.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("IndexAction")
public class IndexAction extends ClientBaseAction {
  public String index() {
    return SUCCESS;
  }
}
