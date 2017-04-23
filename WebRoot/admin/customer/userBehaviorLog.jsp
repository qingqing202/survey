<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>移动用户管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<link href="../styles/base.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var phoneUserId;
    $("document").ready(function() {  
      $("#phoneUserId").val("${phoneUserId}");
	});
</script>
</head>
<body>

<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">移动用户管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
     </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" method="post">
    <s:hidden name="action" id="action" value="viewBehaviorLog"/>
    <s:hidden name="phoneUserId" id="phoneUserId"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td height="25" >
          <div align="center">查询第1-10次行为追踪:
            <input type="text" name="index" value="${index }"/>
          </div>
        </td>
        <td  height="25" bgcolor="#ffffff">
          <div align="left"><input type="submit" value="查询" onclick="subm()"/></div>
        </td>
      </tr>
    </table>
  </s:form>
  
  <table width="90%" align="center" cellspacing="1" class="table table_all">
    <tr class="td_bg">
      <th colspan="2" class="redbold">第${index}次行为追踪 -- ${phoneUser.uid }</th>
    </tr>
    <s:iterator value="steps" id="rs">
      <tr class="td_bg">
        <td id="logtd" width="40%" align="center" class="red"><s:property/></td>
        <td id="pictd" align="center"><img width="50%" src="managePhoneUser.do?action=display&step=${rs}" /></td>
      </tr>
    </s:iterator>
  </table>
</div>

</body>
