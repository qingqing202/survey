<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>节目列表管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
	function subm() {
		$("#form1").submit();
	}
	
	var pageNo;
	$("document").ready(function() {
		pageNo = "${pageNo}";
		$("#check_all").toggle(function(){
			$("[name='id']").attr("checked",'true');
		},
		function(){
			$("[name='id']").removeAttr("checked");
		});
	});
	
	function delete_(id) {
		var url = "manageTvProgram.do?action=delete&tvProgramId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function edit_(id) {
      var url = "manageTvProgram.do?action=edit&tvProgramId=" + id;
	  if(pageNo != "") {
		url += "&pageNo=" + pageNo;
	  }
	  this.location.href = url;
	}
	
	function add_() {
      var url = "manageTvProgram.do?action=edit";
	  if(pageNo != "") {
		url += "&pageNo=" + pageNo;
	  }
	  this.location.href = url;
	}
	
	function fetchData_() {
	  var url = "manageTvProgram.do?action=fetchData";
	  if(pageNo != "") {
		url += "&pageNo=" + pageNo;
	  }
	  this.location.href = url;
	}
	
	function clearOldData_() {
	  var url = "manageTvProgram.do?action=clearOldData";
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
     <td width="93%"><span class="title red">节目列表管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="javascript:add_()" class="blue">添加节目</a> |
      <a href="javascript:fetchData_()" class="blue">抓取数据</a> |
      <a href="javascript:clearOldData_()" class="blue">清除过时数据</a> |
      <a href="" class="blue" onclick="history.back()">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="manageTvProgram" method="post">
    <s:hidden name="action" id="action" value="index"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td height="25" >
          <div align="center"> 频 道:
            <input type="text" name="channel" id="user" value="${channel }"/>
          </div>
        </td>
        <td height="25" >
          <div align="center"> 节 目:
            <input type="text" name="name" id="user" value="${name }"/>
          </div>
        </td>
        <!-- <td>
          <div align="center">时间段：
            <input type="text" name="time" value="<s:date name="time" format="yyyy-MM-dd HH:mm:ss"/>" onClick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',readOnly:true});"/>
          </div>
        </td> -->
	    <td  height="25" bgcolor="#ffffff">
	      <div align="left"><input type="submit" value="查询" onclick="subm()"/></div>
	    </td>
      </tr>
    </table>
    
    <br>

    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr>
        <td><input name="checkbox" type="checkbox" class="input " value="checkbox"  id="check_all"/></td>
        <td height="25"><div align="center">频道名称</div></td>
        <td height="25"><div align="center">节目名称</div></td>
        <td height="25"><div align="center">开始时间</div></td>
        <td height="25"><div align="center">结束时间</div></td>
        <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center">${rs.channel}</div></td>
        <td height="25" ><div align="center">${rs.name}</div></td>
        <td height="25" ><div align="center"><s:date name="#rs.startTime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
        <td height="25" ><div align="center"><s:date name="#rs.endTime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
        <td height="25" >
          <div align="center">
            <a href="javascript:edit_(${rs.id})">编辑</a> |
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
