package com.nimbus.task;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class Task1 implements ApplicationListener {
  protected Logger logger = LoggerFactory.getLogger(this.getClass());
  protected boolean start = false;
  
  
  public void onApplicationEvent(ApplicationEvent event) {
    if (event instanceof ContextRefreshedEvent && !start) {
      logger.info("nimbus Task1 start ...");
      new TimerManager(this);
      start = true;
    }
  }
  
  void doTask() {
    
  }
  
  public class TimerManager {
    private static final long PERIOD_DAY = 24 * 60 * 60 * 1000;
    private final Task1 task;
    public TimerManager(Task1 task_) {
      Calendar calendar = Calendar.getInstance();
      // every day in 14:00 
      calendar.set(Calendar.HOUR_OF_DAY, 14);
      calendar.set(Calendar.MINUTE, 0);
      calendar.set(Calendar.SECOND, 0);
      task = task_;
      Date date = calendar.getTime();
      if (date.before(new Date())) {
        date = this.addDay(date, 1);
      }
      
      Timer timer = new Timer();
      timer.schedule(new TimerTask() {
        public void run() {          
          try {
            // TODO
            task.doTask();
          } catch(Exception e) {
            logger.error("=====>Task1 : " + e.getMessage());
          }
        }
      }, date, PERIOD_DAY);
    }
    
    public Date addDay(Date date, int num) {
      Calendar startDT = Calendar.getInstance();
      startDT.setTime(date);
      startDT.add(Calendar.DAY_OF_MONTH, num);
      return startDT.getTime();
    }
  }
}


