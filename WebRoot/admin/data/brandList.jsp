<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>品牌管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
	var pageNo;
	var sortBy;
	$("document").ready(function() {
		pageNo = "${pageNo}";
		$("#check_all").toggle(function(){
			$("[name='id']").attr("checked",'true');
		},
		function(){
			$("[name='id']").removeAttr("checked");
		});
		
		sortBy = "${sortBy}";
		if (sortBy == "refCount") {
		  $("#sortByRefCount").attr("class", "red");
		  $("#sortByRefCount").text("下载次数↓");
		}
	});
	
	function delete_(id) {
		var url = "manageBrand.do?action=delete&brandId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function edit_(id) {
		var url = "manageBrand.do?action=edit&brandId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function add_() {
	  var url = "manageBrand.do?action=add";
	  if(pageNo != "") {
			url += "&pageNo=" + pageNo;
	  }
	  this.location.href = url;
	}
	
	function sortBy_(column) {
	  $("#sortBy").val(column);
	  $("#form1").submit();
	}
</script>
</head>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">品牌管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="javascript:add_()" class="blue">添加一个品牌</a> |
      <a href="" class="blue" onclick="history.back()">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="manageBrand" method="post">
    <s:hidden name="action" id="action" value="index"/>
    <s:hidden name="sortBy" id="sortBy"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td height="25" >
          <div align="center"> 品牌:
            <input type="text" name="name" id="name" value="${name }"/>
          </div>
        </td>
        <td height="25" >
          <div align="center"> 品牌(EN):
            <input type="text" name="nameEN" id="name" value="${nameEN }"/>
          </div>
        </td>
        <td height="25" >
          <div align="center"> 品牌(ZH):
            <input type="text" name="nameZH" id="name" value="${nameZH }"/>
          </div>
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
        <td height="25"><div align="center">品牌名称</div></td>
        <td height="25"><div align="center">品牌(ZH)</div></td>
        <td height="25"><div align="center">品牌(EN)</div></td>
        <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center">${rs.name}</div></td>
        <td height="25" ><div align="center">${rs.nameZH}</div></td>
        <td height="25" ><div align="center">${rs.nameEN}</div></td>
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
