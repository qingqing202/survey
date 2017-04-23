package com.nimbus.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.script.Compilable;
import javax.script.CompiledScript;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpClientParams;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class NetWorkUtil {
  private static Logger logger = LoggerFactory.getLogger(NetWorkUtil.class);

  public static String requestNet(String url) throws Exception {
    return requestNet(url, "utf-8", 0, 15);
  }

  public static String requestNet(String url, int maxWait) throws Exception {
    return requestNet(url, "utf-8", 0, maxWait);
  }

  public static String requestNet(String url, String code, int maxWait)
      throws Exception {
    return requestNet(url, code, 0, maxWait);
  }

  public static String requestNet(String url, String code, int retryCount,
      int maxWait) throws Exception {
    HttpClientParams clientParams = new HttpClientParams();
    clientParams.setParameter(HttpClientParams.HTTP_CONTENT_CHARSET, code);
    clientParams.setSoTimeout(maxWait * 1000);
    HttpClient client = new HttpClient(clientParams);
    GetMethod getMethod = new GetMethod(url);
    String data = null;
    try {
      client.executeMethod(getMethod);
      data = getMethod.getResponseBodyAsString();
    } catch (Exception e) {
      if (retryCount > 0) {
        retryCount--;
        logger.info("Failed to connect " + url + 
                    "! try again in 2 seconds, remain " + 
                    retryCount + " times");
        Thread.sleep(2000);
        return requestNet(url, code, retryCount, maxWait);
      }
      throw e;
    } finally {
      getMethod.releaseConnection();
    }
    return data;
  }

  public static void ParseJsToJava(String data, String parsejs,
                                   Object parseClass) 
                                   throws ScriptException {
    ScriptEngineManager scriptEngineMgr = new ScriptEngineManager();
    ScriptEngine jsEngine = scriptEngineMgr.getEngineByName("JavaScript");

    jsEngine.put("result", parseClass);
    Compilable compilable = (Compilable) jsEngine;
    CompiledScript compiledScript = compilable.compile(data);
    compiledScript.eval();

    jsEngine.eval(parsejs);
  }

  static public String getHttpUrl(String urlString, 
                                  String param,
                                  String charCode) {
    charCode = StringUtils.isBlank(charCode) ? "UTF-8" : charCode;
    URL url = null;
    HttpURLConnection con = null;
    BufferedReader in = null;
    StringBuffer result = new StringBuffer();
    try {
      url = new URL(urlString);
      con = (HttpURLConnection) url.openConnection();
      con.setUseCaches(false);
      con.setDoOutput(true);
      con.setRequestMethod("POST");
      byte[] b = param.getBytes();
      con.getOutputStream().write(b, 0, b.length);
      con.getOutputStream().flush();
      con.getOutputStream().close();
      in = new BufferedReader(new InputStreamReader(con.getInputStream(),
          charCode));
      while (true) {
        String line = in.readLine();
        if (line == null) {
          break;
        } else {
          result.append(line);
        }
      }
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      try {
        if (in != null) {
          in.close();
        }
        if (con != null) {
          con.disconnect();
        }
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    return result.toString();
  }

  public static String getHttpUrlByGetMethod(String url, String param) {
    String result = "";
    BufferedReader in = null;
    try {
      String urlName = url + "?" + param;
      URL realUrl = new URL(urlName);
      HttpURLConnection conn = (HttpURLConnection) realUrl.openConnection();
      conn.connect();
      in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      String line;
      while ((line = in.readLine()) != null) {
        result += "/n" + line;
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if (in != null) {
          in.close();
        }
      } catch (IOException ex) {
        ex.printStackTrace();
      }
    }
    return result;
  }
  
  // test
  public static void main(String[] args) {
    try {
      String str = NetWorkUtil.requestNet(
          "http://www.zhcw.com/data-js/nowdata50.js", "gbk", 5);
      System.out.println(str);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
