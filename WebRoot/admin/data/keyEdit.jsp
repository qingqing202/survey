<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>按键名称编辑</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var keyId;
    $("document").ready(function() {
		keyId = "${key.id}";
		if (keyId != "") $("#keyId").val(keyId);
	});
	
</script>
</head>
<body>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">按键名称管理-编辑</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="manageKey" method="post">
    <s:hidden name="action" id="action" value="save"/>
    <s:hidden name="keyId" id="keyId"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">按键名称编辑
        <c:if test="${fn:length(errMsg)>0}">+++错误：${errMsg}</c:if>
        </th>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%" align="center">按键名称：</td>
        <td width="80%" >
	      <input name="name" type="text" id="name" value="${name}" size="20" maxlength="64" class="input"
	             onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">名称(EN)：</td>
        <td width="80%" >
          <input name="nameEN" type="text" id="nameEN" value="${nameEN}" size="35" maxlength="64" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">名称(ZH)：</td>
        <td width="80%" >
          <input name="nameZH" type="text" id="nameZH" value="${nameZH}" size="35" maxlength="64" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
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
