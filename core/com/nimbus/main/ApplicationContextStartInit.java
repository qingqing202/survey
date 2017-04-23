package com.nimbus.main;

import java.util.Calendar;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * global initialization
 */

@Component
@SuppressWarnings("unused")
public class ApplicationContextStartInit implements ApplicationListener {
  public ApplicationContextStartInit() {
    
  }
  
  // initialize
  public void onApplicationEvent(ApplicationEvent event) {
    if (event instanceof ContextRefreshedEvent) {
      // initialize thread pool
      CommonScheduledThreadPoolExecutor.getInstance(20);
      System.out.println("====> Nimbus web server start [init data] ...");
      
      // TODO init cache data
      
    }
  }
}
