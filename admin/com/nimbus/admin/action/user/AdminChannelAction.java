package com.nimbus.admin.action.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nimbus.admin.action.AdminBaseAction;
import com.nimbus.entity.admin.AdminChannel;
import com.nimbus.entity.admin.AdminRoleFunction;
import com.nimbus.entity.admin.AdminUser;
import com.nimbus.service.admin.AdminUserService;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("admChannel")
public class AdminChannelAction extends AdminBaseAction {
  @Autowired
  private AdminUserService userService;

  private List<AdminChannel> parentChannelList;

  private List<AdminChannel> depthList;

  private List<AdminChannel> chnTreeList;

  private AdminChannel channel;

  private Long depth;
  private Long chnId;

  public List<AdminChannel> getChnTreeList() {
    return chnTreeList;
  }

  public String index() {
    return SUCCESS;
  }

  public String left() {
    parentChannelList = new ArrayList<AdminChannel>();
    AdminUser adminUser = (AdminUser) getSession().get(SESSION_ADMINUSER_KEY);
    List<AdminRoleFunction> roleFunction = new ArrayList<AdminRoleFunction>();
    if (depth == null) {
      roleFunction = userService.getRoleFunctionList(adminUser.getRole().getId());
    } else {
      roleFunction = userService.getRoleFunctionList(adminUser.getRole().getId(), depth);
    }
    if (roleFunction != null) {
      for (AdminRoleFunction rf : roleFunction) {
        AdminChannel ac = new AdminChannel();
        ac = rf.getChannel();
        parentChannelList.add(ac);
      }
    }
    return "left";
  }

  public String head() {
    depthList = new ArrayList<AdminChannel>();
    AdminUser adminUser = (AdminUser) getSession().get(SESSION_ADMINUSER_KEY);
    List<AdminRoleFunction> roleFunction = userService.getRoleFunctionList(
        adminUser.getRole().getId(), 0l);
    for (AdminRoleFunction rf : roleFunction) {
      AdminChannel ac = new AdminChannel();
      ac = rf.getChannel();
      depthList.add(ac);
    }
    return "head";
  }

  public List<AdminChannel> getParentChannelList() {
    return parentChannelList;
  }

  public Long getDepth() {
    return depth;
  }

  public void setDepth(Long depth) {
    this.depth = depth;
  }

  public List<AdminChannel> getDepthList() {
    return depthList;
  }

  public AdminChannel getChannel() {
    return channel;
  }

  public void setChannel(AdminChannel channel) {
    this.channel = channel;
  }

  public Long getChnId() {
    return chnId;
  }

  public void setChnId(Long chnId) {
    this.chnId = chnId;
  }

  public void setUserService(AdminUserService userService) {
    this.userService = userService;
  }

}
