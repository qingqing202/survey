<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>遥控器配置管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var remoterId;
    var pageNo;
	$("document").ready(function() {
      remoterId = "${remoterId}";
      pageNo = "${pageNo}";
      if (remoterId != "") $("#remoterId").val(remoterId);
	});
	
	function delete_(id) {
		var url = "manageRemoterSetting.do?action=delete&settingId=" + id;
		if(remoterId != "") {
          url += "&remoterId=" + remoterId;
        }
		if(pageNo != "") {
		  url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function edit_(id) {
	  var url = "manageRemoterSetting.do?action=edit&settingId=" + id;
	  if(remoterId != "") {
        url += "&remoterId=" + remoterId;
      }
      if(pageNo != "") {
        url += "&pageNo=" + pageNo;
      }
      this.location.href = url;
	}
	
	function add_() {
	  if (remoterId == "") {
	    alert("remoter id error");
	    return;
	  }
	  
	  var url = "manageRemoterSetting.do?action=add";
      url += "&remoterId=" + remoterId;
      
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
     <td width="93%">
       <span class="title red">遥控器配置管理-${remoter.id}
       <c:if test="${fn:length(errMsg)>0}">+++错误：${errMsg}</c:if>
       </span>
     </td>
     <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
       <a href="javascript:add_()" class="blue">增加配置项</a>
       <a href="" class="blue" onclick="history.back()">返回</a>
     </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="manageRemoterSetting" method="post">
    <s:hidden name="remoterId" id="remoterId"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr>
        <td><input name="checkbox" type="checkbox" class="input " value="checkbox"  id="check_all"/></td>
        <td height="25"><div align="center">配置项</div></td>
        <td height="25"><div align="center">配置值</div></td>
        <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center">${rs.name}</div></td>
        <td height="25" ><div align="center">${rs.value}</div></td>
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
