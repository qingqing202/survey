package com.nimbus.web.action.json;

public enum AjaxResultStatusType {
  _0000("success"),
  _0001("failed"),
  _00000("login"),
  _10000("exception");

  private String value;

  private AjaxResultStatusType(String val) {
    this.value = val;
  }

  public String getValue() {
    return value;
  }
}
