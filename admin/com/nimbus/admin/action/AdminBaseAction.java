package com.nimbus.admin.action;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.nimbus.entity.admin.AdminUser;
import com.nimbus.service.admin.AdminUserService;
import com.nimbus.web.action.BaseAction;

@SuppressWarnings("serial")
public class AdminBaseAction extends BaseAction
{
    private String permit;

    @Autowired
    private AdminUserService userService;

    public static final String SESSION_ADMINUSER_KEY = "adminUser";
    public static final String SESSION_PERMITURL_KEY = "permitUrl";

    @SuppressWarnings("unchecked")
    public Map<String, Object> getMapUrl()
    {
        Map<String, Object> mapUrl = (Map<String, Object>) getSession().get(
                SESSION_PERMITURL_KEY);
        if (null != mapUrl) {
            saveMapUrl(mapUrl);
        }
        return mapUrl;
    }

    protected void saveMapUrl(Map<String, Object> mapUrl)
    {
        getSession().put(SESSION_PERMITURL_KEY, mapUrl);
    }

    public AdminUser getCurAdminUser()
    {
        AdminUser adminUser = (AdminUser) getSession().get(
                SESSION_ADMINUSER_KEY);
        if (null != adminUser) {
            adminUser = userService.findById(adminUser.getId());
            saveCurAdminUser(adminUser);
        }
        return adminUser;
    }

    protected void saveCurAdminUser(AdminUser adminUser)
    {
        getSession().put(SESSION_ADMINUSER_KEY, adminUser);
    }

    public String getPermit()
    {
        return permit;
    }

    public void setPermit(String permit)
    {
        this.permit = permit;
    }

}
