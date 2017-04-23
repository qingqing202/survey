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
     <td width="93%"><span class="title red">注册用户信息</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="manageBrand" method="post">
    <s:hidden name="action" id="action" value="save"/>
    <s:hidden name="brandId" id="brandId"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">注册用户信息
        <c:if test="${fn:length(errMsg)>0}">+++错误：${errMsg}</c:if>
        </th>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">PID：</td>
        <td width="80%" >${customer.id+10000 }</td>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">用户名：</td>
        <td width="80%" >${customer.name }</td>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">昵称：</td>
        <td width="80%" >${customer.nickName }</td>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">邮箱：</td>
        <td width="80%" >${customer.email }</td>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">QQ_UID：</td>
        <td width="80%" >${customer.uidQQ }</td>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">WX_UID：</td>
        <td width="80%" >${customer.uidWeixin }</td>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">WB_UID：</td>
        <td width="80%" >${customer.uidWeibo }</td>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">注册时间：</td>
        <td width="80%" ><s:date name="customer.registerTime" format="yyyy-MM-dd HH:mm:ss"/></td>
      </tr>
      <tr class="td_bg">
        <td width="20%" align="center">绑定手机Key：</td>
        <td width="80%" >${customer.bindAddress }</td>
      </tr>
    </table>
  
  </s:form>
</div>
</body>
