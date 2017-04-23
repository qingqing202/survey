package com.nimbus.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MathUtil {
  public static final String getRandomPassword(int m) {
    String code = "";
    for (int i = 0; i < m; i++) {
      code += "0";
    }
    DecimalFormat df = new DecimalFormat(code);
    double temp = Math.random() * Math.pow(10, m);
    return df.format(temp);
  }

  /**
   * getSerialNumber , length ~ (12, 26)
   */
  public static final String getSerialNumber(int m) {
    m = m > 12 ? m : 12;
    m = m < 26 ? m : 26;
    String q[] = new SimpleDateFormat("yy HHmmss").format(new Date())
        .split(" ");
    StringBuilder stru = new StringBuilder();
    stru.append(q[0]).append((int) (Math.random() * Math.pow(10, 4)));
    stru.append(q[1]).append((int) (Math.random() * Math.pow(10, m - 12)));
    if (stru.length() < m) {
      return getSerialNumber(m);
    }
    return stru.toString();
  }
}
