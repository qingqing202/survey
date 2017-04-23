<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>按键编辑</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var btnNameTexts = new Array();
    var btnNameValues = new Array();
    var remoterId;
    var buttonId;
    var pageNo;
    $("document").ready(function() {
        remoterId = "${remoter.id}";
		buttonId = "${button.id}";
		pageNo = "${pageNo}";
		if (remoterId != "") $("#remoterId").val(remoterId);
		if (buttonId != "") $("#buttonId").val(buttonId);
		if (pageNo != "") $("#pageNo").val(pageNo);
		
		var buttonName = "${name}";
		if (buttonName != "") {
		    //alert(buttonName);
			$("#buttonName option").each(
			  function() {
			    if ($(this).val() == buttonName) {
			      $(this).attr("selected", "selected");
			    }
			  }
	        );
        }
        // store all btn names
        var index = 0;
        $("#buttonName option").each(
		  function() {
		    btnNameTexts[index] = $(this).text();
		    btnNameValues[index] = $(this).val();
		    index++;
		  }
        );
	});
	
	function filterButtons(val) {
	  var displayBtnNameTexts;
	  var displayBtnNameValues;
	  if (val != "") {
	    var index = 0;
	    displayBtnNameTexts = new Array();
	    displayBtnNameValues = new Array();
	    
	    displayBtnNameTexts[0] = btnNameTexts[0];
	    displayBtnNameValues[0] = btnNameValues[0];
	    for (var i = 0; i < btnNameTexts.length; i++) {
	      if (btnNameTexts[i].indexOf(val) >= 0) {
	        displayBtnNameTexts[index] = btnNameTexts[i];
	        displayBtnNameValues[index] = btnNameValues[i];
	        index++;
	      }
	    }
	  } else {
	    displayBtnNameTexts = btnNameTexts;
	    displayBtnNameValues = btnNameValues;
	  }
	  
	  $("#buttonName").empty();
	  for (var i = 0; i < displayBtnNameTexts.length; i++) {
	    var tt = displayBtnNameTexts[i];
	    var vv = displayBtnNameValues[i];
	    var option = $("<option>").val(vv).text(tt);
        $("#buttonName").append(option);
	  }
	}
</script>
</head>
<body>
<body>
<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">按键添加/编辑</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
      </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"></td></tr>
  </table>
  
  <s:form id="form1" action="manageRemoterButton" method="post">
    <s:hidden name="action" id="action" value="save"/>
    <s:hidden name="buttonId" id="buttonId"/>
    <s:hidden name="remoterId" id="remoterId"/>
    <s:hidden name="pageNo" id="pageNo"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">设备按键编辑-${remoter.id }
        <c:if test="${fn:length(errMsg)>0}">+++错误：${errMsg}</c:if>
        </th>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">按键名称：</td>
        <td width="80%" >
	      <!-- <input name="name" type="text" id="buttonName" value="${name}" size="20" maxlength="16" class="input" 
	             onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/> -->
	      <select id="buttonName" name="name">
            <option selected="selected" value="">请选择...</option>
	        <s:iterator value="keys" id="key">
		      <option value="${key.name}" display="none">${key.nameZH}</option>
            </s:iterator>
          </select>
	      <label class="redbold">不能为空, 在后面输入框内输入名字进行过滤</label>
	      <input type="text" size="15" maxlength="25" class="input" onChange="filterButtons(this.value)"
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
          <label class="redbold">注意：输入后点击空白地方生效</label>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">编码格式：</td>
        <td width="80%" >
          <input name="format" type="text" id="format" value="${format}" size="35" maxlength="25" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
          <label class="redbold">不能为空</label>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">系统码：</td>
        <td width="80%" >
          <input name="systemCode" type="text" id="systemCode" value="${systemCode}" size="35" maxlength="35" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
          <label class="redbold">不能为空</label>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">数据码：</td>
        <td width="80%" >
          <input name="dataCode" type="text" id="dataCode" value="${dataCode}" size="35" maxlength="35" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
          <label class="redbold">不能为空</label>
        </td>
      </tr>
      <tr onmouseover="over()" onclick="change()" onmouseout="out()" class="td_bg">
        <td width="20%"  align="center">脉冲：</td>
        <td width="80%" >
          <input name="pulse" type="text" id="pulse" value="${pulse}" size="120" class="input" 
                 onClick="this.className='focus'" onmouseover="this.className='hover'" onmouseout="this.className='input'"/>
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
