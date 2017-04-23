package com.nimbus.entity.admin;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.nimbus.entity.BaseObject;
import com.nimbus.util.Md5Util;

@SuppressWarnings("serial")
@Entity
@Table(name = "admin_user")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "S_AdminUser", allocationSize = 1, initialValue = 1, sequenceName = "S_AdminUser")
public class AdminUser extends BaseObject {
  @Id
  @GeneratedValue
  private Long id;

  /** 管理员账号 */
  private String adminName;

  /** 管理员账号密码 */
  private String password;

  /** 管理员邮箱 */
  private String email;

  /** 上次登陆IP */
  private String lastLoginIp;

  /** 上次登陆时间 */
  private Calendar lastLoginTime;

  /** 登陆次数 */
  private Integer loginTimes;

  /** 是否允许多人同时登陆 */
  private Integer enableMultiLogin;

  /** 注册时间 */
  private Calendar regtime;

  /** 审核标识 */
  private Integer ipass;

  /** 类型ID */
  @ManyToOne
  @JoinColumn(name = "role_id")
  private AdminRole role;

  /** 站点ID */
  private String siteIdArr;

  @Override
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getAdminName() {
    return adminName;
  }

  public void setAdminName(String adminName) {
    this.adminName = adminName;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = Md5Util.getMD5ofStr(password);
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getLastLoginIp() {
    return lastLoginIp;
  }

  public void setLastLoginIp(String lastLoginIp) {
    this.lastLoginIp = lastLoginIp;
  }

  public Calendar getLastLoginTime() {
    return lastLoginTime;
  }

  public void setLastLoginTime(Calendar lastLoginTime) {
    this.lastLoginTime = lastLoginTime;
  }

  public Integer getLoginTimes() {
    return loginTimes;
  }

  public void setLoginTimes(Integer loginTimes) {
    this.loginTimes = loginTimes;
  }

  public Integer getEnableMultiLogin() {
    return enableMultiLogin;
  }

  public void setEnableMultiLogin(Integer enableMultiLogin) {
    this.enableMultiLogin = enableMultiLogin;
  }

  public Calendar getRegtime() {
    return regtime;
  }

  public void setRegtime(Calendar regtime) {
    this.regtime = regtime;
  }

  public Integer getIpass() {
    return ipass;
  }

  public void setIpass(Integer ipass) {
    this.ipass = ipass;
  }

  public AdminRole getRole() {
    return role;
  }

  public void setRole(AdminRole role) {
    this.role = role;
  }

  public String getSiteIdArr() {
    return siteIdArr;
  }

  public void setSiteIdArr(String siteIdArr) {
    this.siteIdArr = siteIdArr;
  }
}
