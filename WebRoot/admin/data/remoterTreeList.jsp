<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>设备树管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var pageNo;
    $("document").ready(function() {
        pageNo = "${pageNo}";
	});
	
	function update_(id) {
	  var url = "manageRemoterTree.do?action=update&remoterTreeId=" + id;
	  if(pageNo != "") {
		url += "&pageNo=" + pageNo;
	  }
	  this.location.href = url;
	}
	
	function edit_(id) {
	  var url = "manageRemoterTree.do?action=edit&remoterTreeId=" + id;
	  if(pageNo != "") {
		url += "&pageNo=" + pageNo;
	  }
	  this.location.href = url;
	}
	
	function view_(id) {
	  var url = "manageRemoterTree.do?action=view&remoterTreeId=" + id;
	  if(pageNo != "") {
		url += "&pageNo=" + pageNo;
	  }
	  this.location.href = url;
	}
	
	function delete_(id) {
	  $("#action").val("delete");
	  $("#remoterTreeId").val(id);
	  if(pageNo != "") $("#pageNo").val(pageNo);
	  $("#form1").submit();
	}
	
	function updateAll_() { 
	  if (confirm("该操作可能会很耗时，确定继续吗？")) {
	    var url = "manageRemoterTree.do?action=updateAll";
	    if(pageNo != "") {
		  url += "&pageNo=" + pageNo;
	    }
	    this.location.href = url;
	  }
	}
	
	function editOrAdd_() {
	  var url = "manageRemoterTree.do?action=edit";
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
     <td width="93%"><span class="title red">设备树管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="javascript:editOrAdd_()" class="blue">修改或添加按钮序列</a>
      <a href="javascript:updateAll_()" class="blue">更新所有</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="manageRemoterTree" method="post">
    <s:hidden name="action" id="action" value="index"/>
    <s:hidden name="remoterTreeId" id="remoterTreeId"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td height="25" >
          <div align="center">设备类型:
            <input type="text" name="type" value="${type }"/>
          </div>
        </td>
        <td height="25" >
          <div align="center">品牌:
            <input type="text" name="brand" value="${brand }"/>
          </div>
        </td>
        <td>最后更新时间
          <input type="text" name="beginTime" value="<s:date name="beginTime" format="yyyy-MM-dd HH:mm:ss"/>" onClick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',readOnly:true});"/>-
          <input type="text" name="endTime" value="<s:date name="endTime" format="yyyy-MM-dd HH:mm:ss"/>"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true});"/>
        </td>
	    <td  height="25" bgcolor="#ffffff">
	      <div align="left"><input type="submit" value="查询" onclick="subm()"/></div>
	    </td>
      </tr>
    </table>
    
    <br>

    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr>
        <td><input name="checkbox" type="checkbox" class="input " value="checkbox"  id="check_all"/></td>
        <td height="25"><div align="center">类型</div></td>
        <td height="25"><div align="center">品牌</div></td>
        <td height="25"><div align="center">节点数</div></td>
        <td height="25"><div align="center">按钮序列</div></td>
        <td height="25"><div align="center">最后更新时间</div></td>
        <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center">${rs.type}</div></td>
        <td height="25" ><div align="center">${rs.brand}</div></td>
        <td height="25" ><div align="center">${rs.nodeCount}</div></td>
        <td height="25"><div align="center">${rs.btnSequence}</div></td>
        <td height="25" ><div align="center"><s:date name="#rs.latestBuildTime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
        <td height="25" >
          <div align="center">
            <a href="javascript:edit_(${rs.id})">编辑</a> | 
            <a href="javascript:update_(${rs.id})">更新</a> | 
            <a href="javascript:view_(${rs.id})">查看</a> | 
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
