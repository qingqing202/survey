package com.nimbus.util;

public class Validate {
  public static boolean isName(String name) {
    try {
      if (name.matches("^[A-Za-z0-9\\u4E00-\\u9FA5\\uF900-\\uFA2D]+")
          && name.getBytes("GBK").length >= 4
          && name.getBytes("GBK").length <= 16)
        return true;
    } catch (Exception e) {
      return false;
    }
    return false;
  }

  public static boolean isRealName(String name) {
    return name.matches("^[A-Za-z0-9\\u4E00-\\u9FA5\\uF900-\\uFA2D]+");
  }

  public static boolean isPassword(String password) {
    return password.matches("^[A-Za-z0-9]{6,15}");
  }

  public static boolean isCredentNo(String credent_number) {
    return credent_number.matches("^\\d{17}(\\d|x)");
  }

  public static boolean isPhone(String phone_number) {

    return phone_number.matches("^(13|15|18)[0-9]{9}");
  }

  public static boolean isEmail(String email) {

    return email.matches("^[0-9a-zA-Z_\\.\\-]+@\\w+\\.\\w+\\.?\\w+");
  }
}
