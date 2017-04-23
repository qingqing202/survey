<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>设备型号添加/编辑</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var deviceType;
    var deviceBrand;
    $("document").ready(function() {
	  deviceType = "${deviceTree.type}";
	  if (deviceType != "") {
	    $("#deviceType").attr("readonly","readonly");
	  }
	  deviceBrand = "${deviceTree.brand}";
	  if (deviceBrand != "") {
	    //$("#deviceBrand").attr("readonly","readonly");
	  }
	});
	
</script>
</head>
<body>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">设备树-参数修改</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" class="blue" onclick="history.back()">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="manageRemoterTree" method="post">
    <s:hidden name="action" id="action" value="save"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">设备树编辑
        <c:if test="${fn:length(errMsg)>0}">+++错误：${errMsg}</c:if>
        </th>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备类型：</td>
        <td width="80%" >
          <input name="deviceId" type="hidden" value="${deviceTree.id}"/>
	      <input name="type" type="text" id="deviceType" value="${type}" size="20" maxlength="16" class="input" 
	             onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
	       可填写的值有{TV,  STB,  Projector,  MusicPlayer,  AirConditional}。 (*必须填写*)
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">设备品牌：</td>
        <td width="80%" >
          <input name="brand" type="text" id="deviceBrand" value="${brand}" size="35" maxlength="25" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
           若该项为空，则对所有品牌做修改
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">按键顺序：</td>
        <td width="80%" >
          <textarea name="btnSeqInfo" cols="30" rows="20" id="deviceButtons" class="input">${btnSeqInfo}</textarea>
            修改保存之后会更新相应的树结构
        </td>
      </tr>
    </table>
    
    <table height="75" border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
      <tr>
        <td align="center"> <input name="Submit2" type="submit" value="保 存" class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" />　
          <input name="Submit22" type="button" value="取 消"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="history.back()"/>　
        </td>
      </tr>
  </table>
  
  </s:form>
</div>
</body>
