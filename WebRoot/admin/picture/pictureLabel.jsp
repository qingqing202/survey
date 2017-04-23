<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../skin/02/taglib.jsp" %>
<head>
<title>图片识别</title>
<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
<link href="../styles/base.css" rel="stylesheet" type="text/css">
<script src="../skin/01/js/jquery-1.3.2.js" type=text/javascript></script>
<script src="../skin/01/js/My97DatePicker/WdatePicker.js" type=text/javascript></script>
<script>
    var pictureId;
    var label;
    $("document").ready(function() {
        pictureId = "${picture.id}";
        label = "${picture.label}";
        if (label != "") {
          var labelVal = parseInt(label);
          labels(labelVal);
        }
	});
	
	function labels(label) {
	  var bit = label & 0x00000001;
	  if (bit != 0) {
	    $("#label_has").attr("checked", true);
	  } else {
	    $("#label_not_has").attr("checked", true);
	    return;
	  }
	  
	  bit = label & 0x00000002;
	  if (bit != 0) {
	    $("#label_not_full").attr("checked", true);
	  }
	  
	  bit = label & 0x00000004;
	  if (bit != 0) {
	    $("#label_not_clear").attr("checked", true);
	  }
	  
	  bit = label & 0x00000008;
	  if (bit != 0) {
	    $("#label_plastic").attr("checked", true);
	  }
	}
	
	function getLabel() {
	  if ($("#label_not_has").attr("checked")) {
	    return 0;
	  } else {
	    var bit = 1;
	    if ($("#label_has").attr("checked")) {
	      if ($("#label_not_full").attr("checked")) bit += 2;
	      if ($("#label_not_clear").attr("checked")) bit += 4;
	      if ($("#label_plastic").attr("checked")) bit += 8;
	      return bit;
	    }
	  }
	  return -1;
	}
	
	function deletePic(picId) {
	  var url = "managePicture.do?action=deleteAndViewNextLabel&pictureId=" + picId;
	  this.location.href = url;
	}
	
	function nextPic(picId) {
	  var url = "managePicture.do?action=viewNextLabel&pictureId=" + picId;
	  this.location.href = url;
	}
	
	function subm() {
	  var label = getLabel();
	  //alert(label);
	  if (label >= 0)
	    $("#label").val(label); 
	  $("#form1").submit();
	}
	
</script>
</head>
<body>

<div id="edit">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="red_xx table_all">
    <tr>
     <td width="93%"><span class="title red">图片标签</span></td>
      <td width="7%" align="right"  nowrap class="operation"><span class="hui">管理导航</span><span class="red"> - </span> 
      <a href="" onclick="history.back()" class="blue">返回</a>
     </td>
    </tr>
  </table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
    <tr><td height="10"><br></td></tr>
  </table>
  
  <s:form id="form1" action="managePicture" method="post">
    <s:hidden name="action" id="action" value="saveLabel"/>
    <s:hidden name="pictureId" id="pictureId"/>
    <s:hidden name="label" id="label"/>
    <s:hidden name="pageNo" id="pageNo"/>
    <table width="90%" align="center" cellspacing="1" class="table table_all">
      <tr class="td_bg">
        <th colspan="2" class="redbold">图片标签管理
        <c:if test="${fn:length(errMsg)>0}">+++[错误：${errMsg}]</c:if>
        </th>
      </tr>
      <tr class="td_bg">
        <td width="20%"  align="center">图片名称：</td>
        <td width="80%">${picture.name }</td>
      </tr>
      <tr class="td_bg">
        <td width="20%"  align="center">上传时间：</td>
        <td width="80%"><s:date name="picture.uploadTime" format="yyyy-MM-dd HH:mm:ss"/></td>
      </tr>
      <tr class="td_bg">
        <td width="20%"  align="center">图片：</td>
	    <td bgcolor="#ffffff">
	      <div align="center"><img width="100%" src="managePicture.do?action=display&pictureId=${pictureId}" /></div>
	    </td>
      </tr>
      <tr class="td_bg">
        <td width="20%"  align="center">标签：</td>
        <td width="80%">
          <div>
            <input type="radio" name="has_or_not" id="label_has">有遥控器</input>
            <input type="checkbox" id="label_not_full">不完整</input>
            <input type="checkbox" id="label_not_clear">不清晰</input>
            <input type="checkbox" id="label_plastic">有朔料套</input>
          </div>
          <div>
            <input type="radio" name="has_or_not" id="label_not_has">无遥控器</input>
          </div>
        </td>
      </tr>
    </table>
    
    <table height="75" border="0" align="center" cellpadding="0" cellspacing="0" class="table_all">
      <tr>
        <td align="center"> 
          <input name="Submit2" type="button" value="保 存" class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="subm()"/>　
          <input name="Submit11" type="button" value="删 除"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="deletePic(${pictureId})"/>
          <input name="Submit12" type="button" value="下一张"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="nextPic(${pictureId})"/>　　
          <input name="Submit22" type="button" value="取 消"  class="button" onmouseover="this.className='button1'" onmouseout="this.className='button'" onclick="history.back()"/>　
        </td>
      </tr>
  </table>
  
  </s:form>
</div>

</body>
