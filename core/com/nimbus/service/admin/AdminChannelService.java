package com.nimbus.service.admin;

import java.util.List;

import com.nimbus.entity.admin.AdminChannel;
import com.nimbus.entity.admin.AdminChannelMode;
import com.nimbus.service.BaseService;

public interface AdminChannelService extends BaseService<AdminChannel> {
  public List<AdminChannel> getAdminChannelDepthDesc(Long parentId);
  public List<AdminChannel> getAdminChannelDepthAsc(Long parentId);
  public List<AdminChannelMode> getModeList(Long chnId);
  public void saveMode(AdminChannelMode mode);
  public void delMode(AdminChannelMode entity);
  public AdminChannelMode getMode(Long modeId);
}
