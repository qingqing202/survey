<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>手机型号编辑</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var phoneId;
    $("document").ready(function() {
		phoneId = "${phone.id}";
		if (phoneId != "") $("#phoneId").val(phoneId);
	});
	
	function onSettingManage() {
	  if (phoneId == "") {
	    alert("获取phoneId id出错...");
	    return;
	  }
	  var url = "managePhoneSetting.do?phoneId=" + phoneId;
	  this.location.href = url;
	}
</script>
</head>
<body>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">手机管理-编辑</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="managePhone" method="post">
    <s:hidden name="action" id="action" value="save"/>
    <s:hidden name="phoneId" id="phoneId"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">手机型号编辑</th>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%" align="center">手机码：</td>
        <td width="80%" >
	      <input name="name" type="text" id="phoneName" value="${name}" size="20" maxlength="16" class="input" readonly="true"
	             onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
	       不能编辑
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">手机品牌：</td>
        <td width="80%" >
          <input name="brand" type="text" id="phoneBrand" value="${brand}" size="35" maxlength="25" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">手机型号：</td>
        <td width="80%" >
          <input name="model" type="text" id="phoneModel" value="${model}" size="35" maxlength="35" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">手机厂商：</td>
        <td width="80%" >
          <input name="manufacture" type="text" id="phoneManu" value="${manufacture}" size="35" maxlength="35" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">状态：</td>
        <td width="80%" >
          <input name="status" type="text" id="phoneStatus" value="${status}" size="20" maxlength="20" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
                 暂时没用
        </td>
        
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">手机配置：</td>
        <td width="80%" >
          <a href="javascript:onSettingManage()" class="blue">配置管理</a>
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
