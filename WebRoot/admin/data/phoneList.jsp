<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>手机型号管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var sortBy;
	var pageNo;
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
		  $("#sortByRefCount").text("注册次数↓");
		}
	});
	
	function delete_(id) {
		var url = "managePhone.do?action=delete&phoneId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function edit_(id) {
		var url = "managePhone.do?action=edit&phoneId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function onSettingManage(id) {
	  var url = "managePhoneSetting.do?phoneId=" + id;
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
     <td width="93%"><span class="title red">手机型号管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" class="blue" onclick="history.back()">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="managePhone" method="post">
    <s:hidden name="action" id="action" value="index"/>
    <s:hidden name="sortBy" id="sortBy"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td height="25" >
          <div align="center"> 品牌:
            <input type="text" name="brand" id="user" value="${brand }"/>
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
	      <div align="left"><input type="submit" value="查询" /></div>
	    </td>
      </tr>
    </table>
    
    <br>

    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr>
        <td><input name="checkbox" type="checkbox" class="input " value="checkbox"  id="check_all"/></td>
        <td height="25"><div align="center"><a id="sortByName" href="javascript:sortBy_('name')">手机码</a></div></td>
        <td height="25"><div align="center"><a id="sortByBrand" href="javascript:sortBy_('brand')">手机品牌</a></div></td>
        <td height="25"><div align="center"><a id="sortByModel" href="javascript:sortBy_('model')">手机型号</a></div></td>
        <td height="25"><div align="center"><a id="sortByManufacture" href="javascript:sortBy_('manufacture')">制造厂商</a></div></td>
        <td height="25"><div align="center"><a id="sortByHasIR" href="javascript:sortBy_('hasIR')">有无红外</a></div></td>
        <td height="25"><div align="center"><a id="sortByScreen" href="javascript:sortBy_('screen')">分辨率</a></div></td>
        <td height="25"><div align="center"><a id="sortByUploadUser" href="javascript:sortBy_('uploadUser')">首次上传者</a></div></td>
        <td height="25"><div align="center"><a id="sortByUploadTime" href="javascript:sortBy_('uploadTime')">首次上传时间</a></div></td>
        <td height="25"><div align="center"><a id="sortByStatus" href="javascript:sortBy_('status')">状态</a></div></td>
        <td height="25"><div align="center"><a id="sortByRefCount" href="javascript:sortBy_('refCount')">注册次数</a></div></td>
        <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center">${rs.name}</div></td>
        <td height="25" ><div align="center">${rs.brand}</div></td>
        <td height="25" ><div align="center">${rs.model}</div></td>
        <td height="25" ><div align="center">${rs.manufacture}</div></td>
        <td height="25" ><div align="center">${rs.hasIR}</div></td>
        <td height="25" ><div align="center">${rs.screen}</div></td>
        <td height="25" ><div align="center">${rs.uploadUser}</div></td>
        <td height="25" ><div align="center"><s:date name="#rs.uploadTime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
        <td height="25" ><div align="center">${rs.status}</div></td>
        <td height="25" ><div align="center">${rs.refCount}</div></td>
        <td height="25" >
          <div align="center">
            <a href="javascript:edit_(${rs.id})">编辑</a> |
            <a href="javascript:onSettingManage(${rs.id})">配置管理</a> |
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
