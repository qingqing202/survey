<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>遥控器管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
	var pageNo;
	var type;
	var sortBy;
	$("document").ready(function() {
		pageNo = "${pageNo}";
		type = "${type}";
		$("#check_all").toggle(function(){
			$("[name='id']").attr("checked",'true');
		},
		function(){
			$("[name='id']").removeAttr("checked");
		});
	});
	
	function sortBy_(column) {
	  $("#sortBy").val(column);
	  $("#form1").submit();
	}
	
	function edit_(id) {
		var url = "manageRemoter.do?action=edit&remoterId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function delete_(id) {
      $("#action").val("delete");
	  $("#remoterId").val(id);
	  // pageNo in page.jsp
	  if(pageNo != "") $("#pageNo").val(pageNo); 
	  $("#form1").submit();
	}
	
	function onRemoterButtonManage(id) {
	  var url = "manageRemoterButton.do?remoterId=" + id;
	  this.location.href = url;
	}
	function onRemoterTagManage(id) {
	  var url = "manageRemoterTag.do?remoterId=" + id;
	  this.location.href = url;
	}
	function onRemoterSettingManage(id) {
	  var url = "manageRemoterSetting.do?remoterId=" + id;
	  this.location.href = url;
	}
</script>
</head>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">遥控器管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="manageRemoter.do?action=add&chnId=${chnId}" class="blue">添加一个遥控器</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="manageRemoter" method="post">
    <s:hidden name="action" id="action" value="index"/>
    <s:hidden name="sortBy" id="sortBy"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td height="25" >
          <div align="center">遥控器Id:
            <input type="text" id="remoterId" name="remoterId" value="${remoterId }" onkeyup="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
          </div>
        </td>
        <td height="25" >
          <div align="center">设备类型:
            <input type="text" name="deviceType" value="${deviceType }"/>
          </div>
        </td>
        <td>创建时间
          <input type="text" name="beginTime" value="<s:date name="beginTime" format="yyyy-MM-dd HH:mm:ss"/>" onClick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',readOnly:true});"/>-
          <input type="text" name="endTime" value="<s:date name="endTime" format="yyyy-MM-dd HH:mm:ss"/>"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true});"/>
        </td>
	    <td  height="25" bgcolor="#ffffff">
	      <div align="left"><input type="submit" value="查询"/></div>
	    </td>
      </tr>
    </table>
    
    <br>

    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr>
        <td><input name="checkbox" type="checkbox" class="input " value="checkbox"  id="check_all"/></td>
        <td height="25"><div align="center"><a id="sortByRemoteID" href="javascript:sortBy_('id')">遥控器ID</a></div></td>
        <td height="25"><div align="center"><a id="sortByDeviceType" href="javascript:sortBy_('deviceType')">类型</a></div></td>
        <td height="25"><div align="center"><a id="sortByFrequency" href="javascript:sortBy_('frequency')">频率</a></div></td>
        <!-- <td height="25"><div align="center"><a id="sortByCreateTime" href="javascript:sortBy_('createTime')">创建时间</a></div></td>  -->
        <td height="25"><div align="center"><a id="sortByRefCount" href="javascript:sortBy_('refCount')">下载次数</a></div></td>
        <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center">${rs.id}</div></td>
        <td height="25" ><div align="center">${rs.deviceType}</div></td>
        <td height="25" ><div align="center">${rs.frequency}</div></td>
        <!-- <td height="25" ><div align="center"><s:date name="#rs.createTime" format="yyyy-MM-dd HH:mm:ss"/></div></td> -->
        <td height="25" ><div align="center">${rs.refCount}</div></td>
        <td height="25" >
          <div align="center">
            <a href="javascript:edit_(${rs.id})">编辑</a> |
            <a href="javascript:onRemoterButtonManage(${rs.id})">按键管理</a> |
            <a href="javascript:onRemoterTagManage(${rs.id})">Tags管理</a> |
            <a href="javascript:onRemoterSettingManage(${rs.id})">配置管理</a> |
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
