package com.nimbus.util;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
  /**
   * replace all ' to ''
   */
  public static String strSql(String sql) {
    if (sql == null) {
      return "";
    }
    return sql.replaceAll("'", "''");
  }

  public static boolean isEmpty(String str) {
    if (null == str) {
      return true;
    }
    if ("".equals(str.trim())) {
      return true;
    }
    return false;
  }

  /**
   *  get text from HTML
   */
  public static String escapeHTMLTags(String input) {
    if (StringUtil.isEmpty(input)) {
      return input;
    }

    input = RegexPattern("<script.*?</script>", "", input);
    input = RegexPattern("<style.*?</style>", "", input);
    input = RegexPattern("<!--.*?-->", "", input);
    input = RegexPattern("<[^>]+()>", "", input);
    input = input.replaceAll("&nbsp;", " ");
    input = input.replaceAll("<br>", " ");
    input = input.replaceAll("<br/>", " ");
    input = input.replaceAll("<br />", " ");
    return input.trim();
  }

  /**
   * replace pattern by str specified
   */
  public static String RegexPattern(String pattern, String str, String content) {
    if (pattern != null && !pattern.equals("")) {
      Pattern p = Pattern.compile(pattern, Pattern.MULTILINE | Pattern.DOTALL
          | Pattern.CASE_INSENSITIVE);
      Matcher m = p.matcher(content);
      content = m.replaceAll(str);
    }
    return content;
  }

  /**
   * 
   * @param original
   * @return
   */
  public static String escapeDollarBackslash(String original) {
    StringBuffer buffer = new StringBuffer(original.length());
    for (int i = 0; i < original.length(); i++) {
      char c = original.charAt(i);
      if (c == '\\' || c == '$' || c == '.' || c == '*' || c == '?' || c == '('
          || c == ')' || c == '+' || c == '|' || c == '{' || c == '['
          || c == '^') {
        buffer.append("\\").append(c);
      } else {
        buffer.append(c);
      }
    }
    return buffer.toString();
  }

  /**
   * generate string by current time
   */
  public static String currentTimeMillis() {
    return String.valueOf(System.currentTimeMillis());
  }

  /**
   * sub string
   */
  public static String biteOffString(String source, int len, String symbol) {
    int counterOfDoubleByte = 0;
    byte b[];
    String temp = "";

    try {
      b = source.getBytes("GBK");
      if (b.length <= len)
        return source;
      for (int i = 0; i < len; i++) {
        if (b[i] < 0)
          counterOfDoubleByte++;
      }
      if (counterOfDoubleByte % 2 == 0)
        temp = new String(b, 0, len, "GBK") + symbol;
      else
        temp = new String(b, 0, len - 1, "GBK") + symbol;
    } catch (UnsupportedEncodingException e) {
      ;
    }
    return temp;
  }

  public static String getExtendNameOfFile(String filename) {
    String ext = "";
    final String invaild = "gif,bmp,jpg,png";
    int i = filename.lastIndexOf('.');
    if (i != -1) {
      ext = filename.substring(i + 1, filename.length()).toLowerCase();
      if (invaild.indexOf(ext) == -1) {
        return "";
      }
      else {
        return ext;
      }
    }
    return ext;
  }

  public static String urlEncode(String url, String encode) {
    String temp = "";
    try {
      temp = URLEncoder.encode(url, encode);
    } catch (UnsupportedEncodingException e) {
    }
    return temp;
  }

  public static String urlDecode(String url, String encode) {
    String temp = "";
    try {
      temp = URLDecoder.decode(url, encode);
    } catch (UnsupportedEncodingException e) {
    }
    return temp;
  }

  /**
   * format a big decimal
   */
  public static String format(BigDecimal d) {
    DecimalFormat nf = new DecimalFormat("###,###");
    try {
      return nf.format(d);
    } catch (Exception e) {
      return String.valueOf(d);
    }
  }
}