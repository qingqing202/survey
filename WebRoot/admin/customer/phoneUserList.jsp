<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>移动用户管理</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
	var pageNo;
	var sortBy;
	$("document").ready(function(){
		pageNo = "${pageNo}";
		sortBy = "${sortBy}";
		
		$("#check_all").toggle(function(){
			$("[name='id']").attr("checked",'true');
		},
		function(){
			$("[name='id']").removeAttr("checked");
		}); 

		$("a[name='hasIr']").each(function(index, item) {
		  markIr(item);
	    });
	    
		if (sortBy == "checkInTime") {
		  $("#sortByCheckInTime").attr("class", "red");
		  $("#sortByCheckInTime").text("登记时间↓");
		} else if (sortBy == "useTimes") {
		  $("#sortByUseTimes").attr("class", "red");
		  $("#sortByUseTimes").text("使用次数↓");
		}
		
	});
	
	function markIr(item) {
	  var status = $(item).text();
	  if (status == "true") {
	    $(item).removeClass().addClass('green');
	  } 
	}
	
	
	function delete_(id) {
		var url = "managePhoneUser.do?action=delete&phoneUserId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function viewBehaviorLog_(id) {
	    var url = "managePhoneUser.do?action=viewBehaviorLog&phoneUserId=" + id;
		if(pageNo != "") {
			url += "&pageNo=" + pageNo;
		}
		this.location.href = url;
	}
	
	function picIdentify_(uid) {
	    var user = uid.replace(/\+/g, '%2B');
	    var url = "/admin/picture/managePicture.do?user=" + user;
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
     <td width="93%"><span class="title red">移动用户管理</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" class="blue">无</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>

  <s:form id="form1" action="managePhoneUser" method="post">
    <s:hidden name="action" id="action" value="index"/>
    <s:hidden name="sortBy" id="sortBy"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td height="25" >
          <div align="center"> UID:
            <input type="text" name="uid" id="uid" value="${uid }"/>
          </div>
        </td>
        <td height="25" >
          <div align="center"> 地区:
            <input type="text" name="region" id="region" value="${region }"/>
          </div>
        </td>
        <td>登记时间
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
        <td height="25"><div align="center"><a id="sortByUID" href="javascript:sortBy_('uid')">UID</a></div></td>
        <td height="25"><div align="center"><a id="sortBrand" href="javascript:sortBy_('rs.phone.brand')">手机品牌</a></div></td>
        <td height="25"><div align="center"><a id="sortByModel" href="javascript:sortBy_('phone.model')">手机码/名</a></div></td>
        <td height="25"><div align="center"><a id="sortByIr" href="javascript:sortBy_('phone.hasIR')">红外</a></div></td>
        <td height="25"><div align="center"><a id="sortByResolution" href="javascript:sortBy_('phone.screen')">屏幕分辨率</a></div></td>
	    <td height="25"><div align="center"><a id="sortByVersion" href="javascript:sortBy_('system')">系统版本</a></div></td>
	    <td height="25"><div align="center"><a id="sortByArea" href="javascript:sortBy_('region')">登记地区</a></div></td>
	    <td height="25"><div align="center"><a id="sortBySource" href="javascript:sortBy_('channel')">来源</a></div></td>
	    <td height="25"><div align="center"><a id="sortByCheckInTime" href="javascript:sortBy_('checkInTime')">首次登记时间</a></div></td>
	    <td height="25"><div align="center"><a id="sortByLastCheckInTime" href="javascript:sortBy_('lastCheckInTime')">最近登记时间</a></div></td>
	    <td height="25"><div align="center"><a id="sortByCheckInTimes" href="javascript:sortBy_('checkInTimes')">登记次数</a></div></td>
	    <td height="25"><div align="center"><a id="sortByUseTimes" href="javascript:sortBy_('useTimes')">使用次数</a></div></td>
	    <td height="25"><div align="center">操作</div></td>
      </tr>
      
      <s:iterator id="rs" value="page.result">
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td><input name="id" type="checkbox" id="id"/></td>
        <td height="25" ><div align="center" class="blue">${rs.uid}</div></td>
	    <td height="25" ><div align="center">${rs.phone.brand}</div></td>
	    <!-- <td height="25" ><div align="center">${rs.phone.name}</div></td> -->
	    <td height="25" ><div align="center">
	      <s:if test="#rs.phone.model!=null">${rs.phone.model}</s:if><s:else>${rs.phone.name}</s:else></div>
	    </td>
	    <td height="25" ><div align="center"><a name="hasIr">${rs.phone.hasIR}</a></div></td>
	    <td height="25" ><div align="center">${rs.phone.screen}</div></td>
	    <td height="25" ><div align="center">${rs.system}</div></td>
	    <td height="25" ><div align="center">${rs.region}</div></td>
	    <td height="25" ><div align="center">${rs.channel}</div></td>
	    <td height="25" ><div align="center"><s:date name="#rs.checkInTime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
	    <td height="25" ><div align="center"><s:date name="#rs.lastCheckInTime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
	    <td height="25" ><div align="center">${rs.checkInTimes}</div></td>
	    <td height="25" ><div align="center">${rs.useTimes}</div></td>
	    <td height="25" >
	      <div align="center">
	        <a href="javascript:viewBehaviorLog_(${rs.id})">行为日志</a> | 
	        <a href="javascript:picIdentify_('${rs.uid}')">图片识别</a> | 
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
