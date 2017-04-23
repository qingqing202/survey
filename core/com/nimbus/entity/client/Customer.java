package com.nimbus.entity.client;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import com.nimbus.entity.BaseObject;
import com.nimbus.util.Md5Util;

@SuppressWarnings("serial")
@Entity
@Table(name = "client_customer")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Customer extends BaseObject {
  @Id
  @GeneratedValue
  private Long id;

  @Column(length = 32, nullable = false)
  private String name;

  @Column(nullable = false, length = 64)
  private String password;

  @Column
  private String uidQQ; // bind QQ
  
  @Column 
  private String uidWeibo; // bind Weibo
  
  @Column
  private String uidWeixin; // bind Weixin
  
  @Column(length = 32)
  private String nickName;
  
  @Column(length = 32)
  private String email;
  
  @Column(length = 32)
  private String phoneNumber;

  @Column(nullable = false)
  private Calendar registerTime;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = Md5Util.getMD5ofStr(password);
  }

  public Calendar getRegisterTime() {
    return registerTime;
  }

  public void setRegisterTime(Calendar registerTime) {
    this.registerTime = registerTime;
  }

  public Long getId() {
    return id;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getNickName() {
    return nickName;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }

  public String getUidQQ() {
    return uidQQ;
  }

  public void setUidQQ(String uidQQ) {
    this.uidQQ = uidQQ;
  }

  public String getUidWeibo() {
    return uidWeibo;
  }

  public void setUidWeibo(String uidWeibo) {
    this.uidWeibo = uidWeibo;
  }

  public String getUidWeixin() {
    return uidWeixin;
  }

  public void setUidWeixin(String uidWeixin) {
    this.uidWeixin = uidWeixin;
  }

  public String getPhoneNumber() {
    return phoneNumber;
  }

  public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }
}
