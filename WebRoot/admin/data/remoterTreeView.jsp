<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>设备树查看</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var deviceTreeId;
    $("document").ready(function() {
	
	});
	
	function back_() {
		var url = "manageRemoterTree.do?pageNo=${pageNo}";
		this.location.href = url;
	}
</script>
</head>
<body>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">设备树查看</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="javascript:back_()" class="blue">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <table width="90%" align="center" cellspacing="1" class="table table_all">
    <tr class="td_bg">
      <th colspan="2" class="redbold">设备树结构</th>
    </tr>
    <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
      <td width="20%"  align="center">按键序列：</td>
      <td width="80%" > ${deviceTree.btnSequence} </td>
    </tr>
    <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
      <td width="20%"  align="center">树结构：</td>
      <td width="80%" > ${treeInfo} </td>
    </tr>
  </table>
</div>
</body>
