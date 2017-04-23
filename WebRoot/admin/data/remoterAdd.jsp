<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>遥控器添加</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var codeId;
    $("document").ready(function() {
		
	});
	
	function back_() {
		var url = "manageRemoter.do?pageNo=${pageNo}";
		this.location.href = url;
	}
</script>
</head>
<body>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">遥控器管理-添加</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="javascript:back_()" class="blue">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="manageRemoter" method="post">
    <s:hidden name="action" id="action" value="saveNew"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">添加一个遥控器
        <c:if test="${fn:length(errMsg)>0}">---错误：${errMsg}</c:if>
        </th>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备类型：</td>
        <td width="80%" >
	      <input name="deviceType" type="text" id="deviceType" value="${deviceType}" size="20" maxlength="16" class="input" 
	             onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
	       可填写的值有{TV,  STB,  PROJ ...}。
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">频率：</td>
        <td width="80%" >
	      <input name="frequency" type="text" id="frequency" value="${frequency}" size="20" maxlength="16" class="input" 
	             onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"
	             onkeyup="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
	              数字
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">编码信息：</td>
        <td width="80%" >
          <textarea name="buttons" cols="60" rows="15" id="remoterButtons" style="font-size:16px;font-family:Arial" spellcheck="false" class="input">${buttons }</textarea>
                    可以不填
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">Tags信息：</td>
        <td width="80%" >
          <textarea name="tags" cols="60" rows="7" id="remoterTags" style="font-size:16px;font-family:Arial" spellcheck="false" class="input">${tags }</textarea>
                    可以不填
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">配置信息：</td>
        <td width="80%" >
          <textarea name="settings" cols="60" rows="8" id="remoterSettings" style="font-size:16px;font-family:Arial" spellcheck="false" class="input">${settings }</textarea>
                    可以不填
        </td>
      </tr>
    </table>
    
    <table height="75" border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
      <tr>
        <td align="center"> <input name="Submit2" type="submit" value="保 存" class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" />　
          <input name="Submit22" type="button" value="取 消"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="history.back()"/>　
        </td>
      </tr>
  </table>
  
  </s:form>
</div>
</body>
