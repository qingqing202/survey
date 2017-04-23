<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>频道列表管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var pageNo;
	$("document").ready(function() {
      pageNo = "${pageNo}";
	});
	
	function delete_(id) {
      var url = "manageChannelList.do?action=delete&channelListId=" + id;
      if(pageNo != "") {
        url += "&pageNo=" + pageNo;
      }
      this.location.href = url;
	}
	
	function edit_(id) {
	  var url = "manageChannelList.do?action=edit&channelListId=" + id;
      if(pageNo != "") {
        url += "&pageNo=" + pageNo;
      }
      this.location.href = url;
	}
	
	function add_() {
	  var url = "manageChannelList.do?action=add";
	  if(pageNo != "") {
        url += "&pageNo=" + pageNo;
      }
      this.location.href = url;
	}
</script>
</head>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">频道列表管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
        <a href="javascript:add_()" class="blue">添加</a> |
        <a href="" class="blue" onclick="history.back()">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="manageChannelList" method="post">
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr>
        <td><input name="checkbox" type="checkbox" class="input " value="checkbox"  id="check_all"/></td>
        <td height="25"><div align="center">所属地区</div></td>
        <td height="25"><div align="center">列表名称<div></td>
        <td height="25"><div align="center">列表名称(EN)<div></td>
        <td height="25"><div align="center">列表名称(ZH)<div></td>
        <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center">${rs.region}</div></td>
        <td height="25" ><div align="center">${rs.name}</div></td>
        <td height="25" ><div align="center">${rs.nameEN}</div></td>
        <td height="25" ><div align="center">${rs.nameZH}</div></td>
        <td height="25" >
          <div align="center">
            <a href="javascript:edit_(${rs.id})">编辑</a>
            <a href="javascript:delete_(${rs.id})">删除</a>
          </div>
        </td>
      </tr>
      </s:iterator>
    </table>
    
    <table width="90%" border="0" align="center">
      <tr>
        <td><jsp:include page="../../util/page.jsp"></jsp:include></td>
      </tr>
    </table>
  </s:form>
</div>

</body>
