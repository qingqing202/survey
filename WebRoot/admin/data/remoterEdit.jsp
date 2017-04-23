<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>遥控器编辑</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var remoterId;
    var pageNo;
    $("document").ready(function() {
		remoterId = "${remoter.id}";
		pageNo = "${pageNo}";
		if (remoterId != "") $("#remoterId").val(remoterId);
		if (pageNo != "") $("#pageNo").val(pageNo);
	});
	
	function onBtnManage() {
	  if (remoterId == "") {
	    alert("获取remoter id出错...");
	    return;
	  }
	  var url = "manageRemoterButton.do?remoterId=" + remoterId;
	  this.location.href = url;
	}
	
	function onSettingManage() {
	  if (deviceId == "") {
	    alert("获取device id出错...");
	    return;
	  }
	  var url = "manageDeviceSetting.do?deviceId=" + deviceId;
	  this.location.href = url;
	}
	
	function onDupDevice() {
	  if (deviceId == "") {
	    alert("获取device id出错...");
	    return;
	  }
	  var url = "manageDevice.do?action=dupDevice&deviceId=" + deviceId;
	  this.location.href = url;
	}
</script>
</head>
<body>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">遥控器管理-编辑</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="manageDevice" method="post">
    <s:hidden name="action" id="action" value="save"/>
    <s:hidden name="remoterId" id="remoterId"/>
    <s:hidden name="pageNo" id="pageNo"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">遥控器编辑
        <c:if test="${fn:length(errMsg)>0}">+++[错误：${errMsg}]</c:if>
        </th>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">遥控器ID：</td>
        <td width="80%" >
	      ${remoter.id }
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备类型：</td>
        <td width="80%" >
	      <input name="deviceType" type="text" id="deviceType" value="${deviceType}" size="20" maxlength="16" class="input" 
	             onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
	       可填写的值有{TV,  STB,  PROJ,  CABLE, ...}。
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">频率：</td>
        <td width="80%" >
	      <input name="frequency" type="text" id="frequency" value="${frequency}" size="20" maxlength="16" class="input" 
	             onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
	            数字
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">下载次数：</td>
        <td width="80%" >
	      ${remoter.refCount }
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
