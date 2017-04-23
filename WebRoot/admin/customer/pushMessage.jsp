<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>用户信息</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var brandId;
    $("document").ready(function() {
		brandId = "${brand.id}";
		if (brandId != "") $("#brandId").val(brandId);
	});
	
</script>
</head>
<body>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">推送消息</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="pushMessage" method="post">
    <s:hidden name="action" id="action" value="push"/>
    <s:hidden name="pictureId" id="pictureId"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">推送消息状态
        <c:if test="${fn:length(errMsg)>0}"> ：${errMsg}</c:if>
        </th>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">title</td>
        <td width="80%" ><input type="text" name="title" value="${title }" size="50"/></td>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">text</td>
        <td width="80%" ><input type="text" name="text" value="${text }" size="50"/></td>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">content</td>
        <td width="80%" ><input type="text" name="content" value="${content }" size="100"/>不要瞎填这里，请咨询技术人员</td> 
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">clientID</td>
        <td width="80%" ><input type="text" name="clientId" value="${clientId }" size="35"/></td>
      </tr>
    </table>
  	
  	<table height="75" border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
      <tr>
        <td align="center"> 
          <input name="Submit2" type="submit" value="发 送" class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" />　
          <input name="Submit22" type="button" value="取 消"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="history.back()"/>　
        </td>
      </tr>
  </table>
  </s:form>
</div>
</body>
