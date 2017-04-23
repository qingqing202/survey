package com.nimbus.web.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileFilter implements Filter {

  @Override
  public void destroy() {
    // TODO Auto-generated method stub
    
  }

  @Override
  public void doFilter(ServletRequest arg0, ServletResponse arg1,
      FilterChain chain) throws IOException, ServletException {
    // TODO Auto-generated method stub
    HttpServletRequest request = (HttpServletRequest) arg0;
    HttpServletResponse response = (HttpServletResponse) arg1;
    String uri = request.getRequestURI();
    int index = uri.lastIndexOf('.');
    if (index > 0) {
      String suffix = uri.substring(index + 1);
      if (suffix.equals("jsp") || suffix.equals("js")) {
        response.sendRedirect("/404.html");
        return;
      }
    }
    
    chain.doFilter(arg0, arg1);
  }

  @Override
  public void init(FilterConfig arg0) throws ServletException {
    // TODO Auto-generated method stub
    
  }

}
