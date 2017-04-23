package com.nimbus.task;

import java.util.concurrent.LinkedBlockingQueue;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.nimbus.entity.client.Customer;
import com.nimbus.main.CommonScheduledThreadPoolExecutor;
import com.nimbus.service.client.CustomerService;
import com.nimbus.util.Configuration;
import com.nimbus.util.EmailUtil;
import com.nimbus.util.Md5Util;

@Component
public class EmailTask implements ApplicationListener {
  @Autowired
  private CustomerService customerService;
  
  protected Logger logger = LoggerFactory.getLogger(this.getClass());
  protected boolean start = false;

  protected LinkedBlockingQueue<ResetPwdTask> resetPwdTaskQueue = 
    new LinkedBlockingQueue<ResetPwdTask>();
  
  public void onApplicationEvent(ApplicationEvent event) {
    if (event instanceof ContextRefreshedEvent && !start) {
      logger.info("nimbus email notifying system start ...");
      CommonScheduledThreadPoolExecutor.getInstance().execute(
          createResetPwdNotificationTask());
      start = true;
    }
  }
  
  public void addNotifyResetPwd(Long id, String newPwd) {
    ResetPwdTask task = new ResetPwdTask();
    task.customId = id;
    task.password = newPwd;
    resetPwdTaskQueue.offer(task);
  }
  
  private Runnable createResetPwdNotificationTask() {
    return new Runnable() {
      public void run() {
        while (true) {
          try {
            ResetPwdTask task = resetPwdTaskQueue.take();
            notifyResetPwd(task);
          }
          catch (Exception e) {
            // FIXME
          }
        }
      }
    };
  }
  
  private void notifyResetPwd(ResetPwdTask task) {
    try {
      Long id = task.customId;
      if (id == null) 
        return;
      Customer customer = customerService.findById(id);
      if (customer == null)
        return;
      
      String title = "Yipai - Reset your account password!";
      String content = customer.getName() + "<br/><br/>&emsp;Your new password : ";
      content += task.password;
      content += "<br><br>&emsp;Remeber it!<br/>";
      
      EmailUtil.sendEmail(customer.getEmail(), title, content);
      
      customer.setPassword(task.password);
      customerService.save(customer);
    }
    catch(Exception e) {
      logger.info("Email get exception : " + e.getMessage());
    }
  }
  
  class ResetPwdTask {
    public Long customId;
    public String password;
  }
}
