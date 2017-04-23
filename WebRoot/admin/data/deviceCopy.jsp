<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>设备型号编辑</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var deviceId;
    var pageNo;
    $("document").ready(function() {
		deviceId = "${device.id}";
		pageNo = "${pageNo}";
		if (deviceId != "") $("#deviceId").val(deviceId);
		if (pageNo != "") $("#pageNo").val(pageNo);
	});
	
	function subm() {
	  if ($("#copy_remoter").attr("checked")) {
	    $("#copyMode").val("new");
	  }
	  $("#form1").submit();
	}
</script>
</head>
<body>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">设备复制</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="manageDevice" method="post">
    <s:hidden name="action" id="action" value="saveCopy"/>
    <s:hidden name="deviceId" id="deviceId"/>
    <s:hidden name="copyMode" id="copyMode" value="keep"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">设备复制
        <c:if test="${fn:length(errMsg)>0}">+++[错误：${errMsg}]</c:if>
        </th>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备类型：</td>
        <td width="80%" >${device.type}</td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备品牌：</td>
        <td width="80%" >${device.brand.name}</td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备型号：</td>
        <td width="80%" >${device.model}</td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">新设备型号：</td>
        <td width="80%" >
          <input name="newModel" type="text" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" 
                 onmouseout="this.className='input'"/>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">遥控器选项：</td>
        <td width="80%" >
          <div>
            <input type="radio" name="copy_or_not" id="not_copy_remoter" checked="checked">沿用该设备的遥控器</input>
          </div>
          <div>
            <input type="radio" name="copy_or_not" id="copy_remoter">复制该设备的遥控器</input>
          </div>
        </td>
      </tr>
    </table>
    
    <table height="75" border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
      <tr>
        <td align="center"> <input name="Submit2" type="button" value="保 存" class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="subm()"/>　
          <input name="Submit22" type="button" value="取 消"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="history.back()"/>　
        </td>
      </tr>
  </table>
  
  </s:form>
</div>
</body>
