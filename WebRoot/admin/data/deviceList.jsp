<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>设备型号管理</title>
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
		
		var sortBy = "${sortBy}";
		if (sortBy == "type") {
		  $("#sortByType").attr("class", 'red');
		  $("#sortByType").text("类型↓");
		} else if (sortBy == "brand.name") {
		  $("#sortByBrand").attr("class", 'red');
		  $("#sortByBrand").text("品牌↓");
		} else if (sortBy == "brand.nameZH") {
		  $("#sortByBrandZH").attr("class", 'red');
		  $("#sortByBrandZH").text("品牌(ZH)↓");
		} else if (sortBy == "model") {
		  $("#sortByModel").attr("class", 'red');
		  $("#sortByModel").text("型号↓");

		} else if (sortBy == "remoter.id") {
		  $("#sortByRemoteId").attr("class", 'red');
		  $("#sortByRemoteId").text("遥控器ID↓");
		} else if (sortBy == "uploadUser") {
		  $("#sortByUploadUser").attr("class", 'red');
		  $("#sortByUploadUser").text("首次上传者↓");
		} else if (sortBy == "uploadTime") {
		  $("#sortByUploadTime").attr("class", 'red');
		  $("#sortByUploadTime").text("首次上传时间↓");
		} else if (sortBy == "refCount") {
		  $("#sortByRefCount").attr("class", 'red');
		  $("#sortByRefCount").text("下载次数↓");
		} 
	});
	
	function sortBy_(column) {
	  $("#sortBy").val(column);
	  $("#form1").submit();
	}
	
	function copy_(id) {
		var url = "manageDevice.do?action=copy&deviceId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function edit_(id) {
		var url = "manageDevice.do?action=edit&deviceId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function golden_(id) {
      $("#action").val("golden");
	  $("#deviceId").val(id);
	  // pageNo in page.jsp
	  if(pageNo != "") $("#pageNo").val(pageNo); 
	  $("#form1").submit();
	}
	
	function delete_(id) {
      $("#action").val("delete");
	  $("#deviceId").val(id);
	  // pageNo in page.jsp
	  if(pageNo != "") $("#pageNo").val(pageNo); 
	  $("#form1").submit();
	}
	
	function onRemoterManage(id) {
	  var url = "manageRemoter.do?remoterId=" + id;
	  this.location.href = url;
	}
</script>
</head>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">设备管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="manageDevice.do?action=add&chnId=${chnId}" class="blue">添加一个设备</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="manageDevice" method="post">
    <s:hidden name="action" id="action" value="index"/>
    <s:hidden name="sortBy" id="sortBy"/>
    <s:hidden name="deviceId" id="deviceId"/>
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

        <td height="25" >
          <div align="center">型号:
            <input type="text" name="model" value="${model }"/>
          </div>
        </td>
        
        <td height="25" >
          <div align="center">遥控器id:
            <input type="text" name="remoterId" value="${remoter.id }"/>
          </div>
        </td>        
        
        <td height="25" >
          <div align="center"> 来源:
            <input type="text" name="user" id="user" value="${user }"/>
          </div>
        </td>
        <td>上传时间
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
        <td height="25"><div align="center"><a id="sortByType" href="javascript:sortBy_('type')">类型</a></div></td>
        <td height="25"><div align="center"><a id="sortByBrand" href="javascript:sortBy_('brand.name')">品牌</a></div></td>
        <td height="25"><div align="center"><a id="sortByBrandZH" href="javascript:sortBy_('brand.nameZH')">品牌(ZH)</a></div></td>
        <td height="25"><div align="center"><a id="sortByModel" href="javascript:sortBy_('model')">型号</a></div></td>
        <td height="25"><div align="center"><a id="sortByRemoteId" href="javascript:sortBy_('remoter.id')">遥控器ID</a></div></td>
        <td height="25"><div align="center">金牌?</div></td>
        <td height="25"><div align="center"><a id="sortByUploadUser" href="javascript:sortBy_('uploadUser')">首次上传用户</a></div></td>
        <td height="25"><div align="center"><a id="sortByUploadTime" href="javascript:sortBy_('uploadTime')">首次上传时间</a></div></td>
        <td height="25"><div align="center"><a id="sortByRefCount" href="javascript:sortBy_('refCount')">下载次数</a></div></td>
        <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center">${rs.type}</div></td>
        <td height="25" ><div align="center">${rs.brand.name}</div></td>
        <td height="25" ><div align="center">${rs.brand.nameZH}</div></td>
        <td height="25" ><div align="center">${rs.model}</div></td>
        <td height="25" ><div align="center"><a href="javascript:onRemoterManage(${rs.remoter.id})">${rs.remoter.id}</a></div></td>
        <td height="25" ><div align="center">${rs.golden}</div></td>
        <td height="25" ><div align="center">${rs.uploadUser}</div></td>
        <td height="25" ><div align="center"><s:date name="#rs.uploadTime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
        <td height="25" ><div align="center">${rs.refCount}</div></td>
        <td height="25" >
          <div align="center">
            <a href="javascript:edit_(${rs.id})">编辑</a> |
            <a href="javascript:copy_(${rs.id})">拷贝</a> |
            <a href="javascript:onRemoterManage(${rs.remoter.id})">遥控器管理</a> |
            <a href="javascript:golden_(${rs.id})">金牌</a> |
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
