package com.nimbus.web.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class ExceptionInteceptor extends AbstractInterceptor
{
    @Override
    public String intercept(ActionInvocation invocation) throws Exception
    {
        try {
            return invocation.invoke();
        }
        catch (Exception e) {
            return ActionSupport.ERROR;
        }
    }
}
