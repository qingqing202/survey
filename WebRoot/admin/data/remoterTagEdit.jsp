<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>遥控器Tag编辑</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var remoterId;
    var tagId;
    $("document").ready(function() {
		remoterId = "${remoter.id}";
		tagId = "${tag.id}";
		if (remoterId != "") $("#remoterId").val(remoterId);
		if (tagId != "") $("#tagId").val(tagId);
	});
</script>
</head>
<body>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">设备配置添加/编辑</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="manageRemoterTag" method="post">
    <s:hidden name="action" id="action" value="save"/>
    <s:hidden name="tagId" id="tagId"/>
    <s:hidden name="remoterId" id="remoterId"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">遥控器-Tag编辑-${remoter.id }
        <c:if test="${fn:length(errMsg)>0}">+++错误：${errMsg}</c:if>
        </th>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">Tag值：</td>
        <td width="80%" >
	      <input name="tagValue" type="text" id="settingName" value="${tagValue}" size="20" maxlength="16" class="input" 
	             onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
	             <label class="redbold">不能为空</label>
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
